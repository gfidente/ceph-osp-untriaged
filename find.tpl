<!doctype html>
<html lang=en>
  <head>
    <meta charset=utf-8>
    <title>Untriaged Ceph bugs known to affect OSP</title>
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
    <h1>Untriaged Ceph bugs known to affect OSP</h1>
    <hr />
    <dl>
    % for tracker_bug in results.keys():
    <dt><strong>{{tracker_bug.target_release[0]}} - {{tracker_bug.summary}} - {{tracker_bug.id}}</strong></dt>
    % if len(results[tracker_bug]) < 1:
    <dd>None found, congrats</dd>
    % else:
    % for bug in results[tracker_bug]:
    <dd><a href="https://bugzilla.redhat.com/{{bug.id}}">https://bugzilla.redhat.com/{{bug.id}}</a> - {{bug.status}} - {{bug.summary}}</dd>
    % end
    % end
    % end
    </div>
  </body>
</html>
