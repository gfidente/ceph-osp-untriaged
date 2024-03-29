<!doctype html>
<html lang=en>
  <head>
    <meta charset=utf-8>
    <title>Open Ceph bugs known to affect OSP</title>
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
    <link rel="stylesheet" href="//cdn.rawgit.com/necolas/normalize.css/master/normalize.css">
    <link rel="stylesheet" href="//cdn.rawgit.com/milligram/milligram/master/dist/milligram.min.css">
    <style>
      div {
          padding: 2%;
      }
    </style>
  </head>
  <body>
    <div>
    <h1>Open Ceph bugs known to affect OSP</h1>
    <hr />
    <dl>
    % for tracker_bug in results.keys():
      <dt><strong>{{tracker_bug.target_release[0]}} - {{tracker_bug.summary}} - <a href="https://bugzilla.redhat.com/{{tracker_bug.id}}">{{tracker_bug.id}}</a></strong></dt>
      <dl>
        <dt><strong>Untriaged</strong></dt>
        % for bug in results[tracker_bug]:
        % if "*" in bug.target_release[0]:
        <dd><a href="https://bugzilla.redhat.com/{{bug.id}}">https://bugzilla.redhat.com/{{bug.id}}</a> - {{bug.status}} - {{bug.target_release[0]}} - {{bug.severity}} - {{bug.summary}}</dd>
        % end
        % end
      </dl>
      <dl>
        <dt><strong>In progress</strong></dt>
        % for bug in results[tracker_bug]:
        % if "*" not in bug.target_release[0]:
        <dd><a href="https://bugzilla.redhat.com/{{bug.id}}">https://bugzilla.redhat.com/{{bug.id}}</a> - {{bug.status}} - {{bug.target_release[0]}} - {{bug.severity}} - {{bug.summary}}</dd>
        % end
        % end
      </dl>
    % end
    </dl>
    </div>
  </body>
</html>
