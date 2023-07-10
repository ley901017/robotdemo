import socket
import sys
import os
import csv
import datetime


class SocketTCPServer:

    def __init__(self):
        self.fd = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.fd.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    def start_tcp_server(self):
        pid = os.fork()
        if pid > 0:
            sys.exit(0)
        else:
            self.handle()

    def handle(self):
        self.fd.bind(('192.168.211.126', 8000))
        self.fd.listen()
        sock_conn, _ = self.fd.accept()
        while True:
            data = sock_conn.recv(1024)
            tmp = data.hex(' ')
            with open('data.csv', 'w', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([datetime.datetime.strftime(datetime.datetime.now(), '%Y%m%d%H%M%S'), tmp])

if __name__ == '__main__':
    tcp_server = SocketTCPServer()
    tcp_server.start_tcp_server()