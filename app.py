from bottle import route, run, template

import find


@route('/')
def index():
    results = find.main()
    return template('find', results=results)


run(host='0.0.0.0', port=8080)
