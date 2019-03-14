#!/usr/bin/python
import SimpleHTTPServer
import SocketServer
import os
import socket
import json

# create info.json
os.chdir(os.path.dirname(os.path.realpath(__file__)) + "/public")
info = {
	"host_name": socket.gethostname(),
	"version": 1
}
with open('info.json', 'w') as outfile:
    json.dump(str(info), outfile)
    outfile.write("\n")

# configure and run the server
PORT = 9001
Handler = SimpleHTTPServer.SimpleHTTPRequestHandler
httpd = SocketServer.TCPServer(("", PORT), Handler)
httpd.serve_forever()

