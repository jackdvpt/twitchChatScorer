import socket
import config
sock = socket.socket()
from tinydb import TinyDB, Query



def main():
    server = 'irc.chat.twitch.tv'
    port = 6667
    db = TinyDB('db.json')

    sock.connect((server, port))
    print("im here")
    sock.send(f"PASS {config.token}\n".encode('utf-8'))
    sock.send(f"NICK {config.nickname}\n".encode('utf-8'))
    sock.send(f"JOIN {config.channel}\n".encode('utf-8'))
    while True:
        resp = sock.recv(2048).decode('utf-8')
        if resp.startswith('PING'):
            sock.send("PONG\n".encode('utf-8'))
        splitted = resp.split("!")
        if "!guess" in resp:
            print(splitted[0][1:], splitted[2][6:])
            db.insert({'name': splitted[0][1:], 'thing': splitted[2][6:]})
if __name__ == "__main__":
    print("ello")
    main()
