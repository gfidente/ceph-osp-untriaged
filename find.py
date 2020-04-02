#!/usr/bin/env python
from bugzilla import Bugzilla
from bugzilla.bug import Bug

import collections


BZ_URL = 'bugzilla.redhat.com'

# order will determine output order as well
OSP_TRACKERS = [
    '1820257',
    '1760354',
    '1642481',
    '1624388',
    '1594251',
    '1578729',
    '1553640',
    '1578730',
    '1548353',
    '1548354',
    ]

bzapi = Bugzilla(BZ_URL)


def search(payload):
    """
    Send a payload to the Bug.search RPC, and translate the result into
    bugzilla.bug.Bug results.
    """
    result = bzapi._proxy.Bug.search(payload)
    bugs = [Bug(bzapi, dict=r) for r in result['bugs']]
    return bugs


def query_params(tracker):
    """ Return a dict of basic Bugzilla search parameters. """
    params = {
        'include_fields': ['id', 'summary', 'status', 'target_release'],
        'f1': 'blocked',
        'o1': 'equals',
        'v1': tracker,
        'f2': 'bug_status',
        'o2': 'notequals',
        'v2': 'VERIFIED',
        'f3': 'bug_status',
        'o3': 'notequals',
        'v3': 'CLOSED'
    }
    return params.copy()


def main():
    results = collections.OrderedDict()
    for tracker in OSP_TRACKERS:
        tracker_bug = bzapi.getbug(tracker)
        payload = query_params(tracker)
        bugs = search(payload)
        results[tracker_bug] = bugs
    return results


if __name__ == '__main__':
    print("""
Open Ceph bugs known to affect OSP
==================================
""")
    results = main()
    for tracker_bug in results.keys():
        print('%s - %s - %d '
              % (tracker_bug.target_release[0],
                 tracker_bug.summary,
                 tracker_bug.id))
        if len(results[tracker_bug]) < 1:
            print('\tNone found, congrats')
        else:
            for bug in results[tracker_bug]:
                print('\thttps://bugzilla.redhat.com/%d - %s - %s - %s'
                      % (bug.id, bug.status, bug.target_release[0], bug.summary))
