from tinydb import TinyDB, Query
from bottle import Bottle, template, request, redirect

app = Bottle()

from twitchAPI.twitch import Twitch

#db = TinyDB('db.json')
reseults = TinyDB('score2.json')



@app.route('/')
def index():
     
     db = TinyDB('db.json')
     """Home Page"""
     print(db.all())
     for item in db:
          Person = Query()
          if len(reseults.search(Person.name == item["name"]))< 1:
               reseults.insert({'name': item["name"], 'score':0 })
     done = []
     for user in reseults:
          Fruit = Query()
          print(user["name"],len(db.search(Fruit.name == user["name"])), db.search(Fruit.name == user["name"]))
          if len(db.search(Fruit.name == user["name"]))> 0:
               submitted = db.search(Fruit.name == user["name"])[0]["thing"]
          else:
               submitted= ""
          done.append([user["name"], user["score"], submitted])
          
     print(done)
     info = {'unpaid':db.all(), 
    'scores':reseults.all(), "done":done
            } 
     return template("names.tpl", info)

@app.route('/scoreboard')
def scoarboard():
     twitch = Twitch('73cpp4npziqzrvk69x97bu82gfpiye', 'xnbjrg4h8vxuyt8bjvsjde3dfg0src')
     twitch.authenticate_app([])
     scores = sorted(reseults.all(), key = lambda i: i['score'],reverse=True)
     for s in scores:
          if "profile" not in s:
               print(s["name"])
               user_info = twitch.get_users(logins=[s["name"]])
               print(user_info)
               Person2 = Query()
               reseults.update({'profile': user_info["data"][0]["profile_image_url"]}, Person2.name == s["name"])
     return template("score.tpl", {'scores':scores})

@app.route('/score', method="POST")
def formhandler():
     for person in reseults:
          Person2 = Query()
          cur = request.forms.get(person["name"])
          if cur == '':
               cur = 0
          
          reseults.update({'score': int(cur)+int(person["score"])}, Person2.name == person["name"])
     redirect("/")

@app.route('/add_person', method="POST")
def formhandler():  
     
     db = TinyDB('db.json')
     cur = request.forms.get("name")
     print(cur)
     if cur:
          db.insert({'name': cur, 'score': "", 'thing':""})
     redirect("/")

@app.route('/reset')
def reset():
     
     db = TinyDB('db.json')
     db.truncate()
     redirect("/")



@app.route('/newt')
def clerascores():
     
     db = TinyDB('score2.json')
     db.truncate()
     redirect("/")





if __name__ == '__main__':
    app.run()