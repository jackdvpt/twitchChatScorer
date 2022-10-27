# Twitch Chat Scorer

Twitch Chat Scorer is a python script that allows you to view the guesses from chat.
by default it will take every message in chat that begins with !guess and then show that in your thing.
Wait this only works for my friend who i set the thing to oh well.

## Getting Started

Make sure you have python installed (created with version 3.9.14)

Then run the following command to setup the stuff

```bash
pip install -r requirements.txt
```

You'll then need to create a config.py file to contain a twitch dev app public key and private key. 

## Usage    

- Run app.py
- then in the terminal window it should tell you an url (usually http://127.0.0.1:8080/) go to that url
- You'll see a horrible looking thing but just wait for the green tick to appear. this means your reading chat. From here any messages will appear. you can also add new people sing the top two boxes.
- If you refresh this page you will loose the current chat messages stored so just be careful.
- while the app is running /scoreboard (ie http://127.0.0.1:8080/scoreboard) will show you the active scoreboard. it will scroll down the list if there are too many and also auto refresh after a bit. you can add this into obs and hopefully it works.


## TODO
- [x] Add support for decimals
- [x] Fix wider names 
- [x] let the host disconnect from twitch
- [ ] Let the host hide the names on the scoring screen
- [ ] Add feedback so you know it worked when you clicked submit
- [ ] Add a simple scoreboard for the host  
- [ ] Random scores (ie set a min max and then give the answers a random score if you tick the box)
- [ ] Add 0 support (IE let a score of 0/empty put them onto the board with nothing)
- [ ] Add a screen to show the answers on screen
