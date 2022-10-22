from tinydb import TinyDB, Query, where
from bottle import Bottle, template, response, request, redirect, static_file
import json
import config

app = Bottle()

from twitchAPI.twitch import Twitch

#db = TinyDB('db.json')
reseults = TinyDB('.\static\scoreboard.json')


@app.hook('after_request')
def enable_cors():
    """
    You need to add some headers to each request.
    Don't use the wildcard '*' for Access-Control-Allow-Origin in production.
    """
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers[
        'Access-Control-Allow-Methods'] = 'PUT, GET, POST, DELETE, OPTIONS'
    response.headers[
        'Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'


@app.route('/')
def inde1():
    return template("bleck.tpl")


def getAvi(name):
    twitch = Twitch(config.public_key,
                    config.private_key)
    twitch.authenticate_app([])
    print(name)
    user_info = twitch.get_users(logins=[name])
    print(user_info)
    if user_info["data"]:
        return user_info["data"][0]["profile_image_url"]
    else:
        return "https://static-cdn.jtvnw.net/user-default-pictures-uv/13e5fa74-defa-11e9-809c-784f43822e80-profile_image-300x300.png"


@app.route('/score', method=['POST', 'OPTIONS'])
def formhandler1():
    print("GOT SOMETHIGN!")
    soccer = json.load(request.body)

    print(soccer)
    for key, value in soccer.items():
        if value:
            Persons = Query()
            pep = reseults.search(Persons.name == key)
            print(pep)
            print(getAvi(key))
            if len(pep) < 1:
                reseults.insert({
                    'name': key,
                    'score': value,
                    "img": getAvi(key)
                })
            else:
                reseults.update_multiple([({
                    'score':
                    int(value) + int(pep[0]["score"])
                }, where('name') == key)])
            print(key, value)


@app.route('/scoreboard')
def scoreboard():
    return template(
        'score', {
            'scores':
            sorted(reseults.all(), key=lambda i: int(i['score']), reverse=True)
        })


@app.route('/reset')
def reset():
    print("resttting")
    reseults.truncate()
    redirect("/")


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='static')


if __name__ == '__main__':
    app.run()