Report on Ceph bugs that block OSP's releases and are not triaged yet.

- Install the requirements ``pip install -r requirements.txt``
- Might optionally create a .bugzillarc file [1]

1. https://github.com/python-bugzilla/python-bugzilla/blob/v2.2.0/bugzilla/base.py#L451

Run one of:

``python find.py`` from CLI or, if you want to host it as a webapp, ``python app.py`` then go to 127.0.0.1:8080
