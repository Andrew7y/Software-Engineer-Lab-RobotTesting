from __future__ import print_function

from os import chdir
from os.path import abspath, dirname, join

try:
    from SocketServer import ThreadingMixIn
    from BaseHTTPServer import HTTPServer
    from SimpleHTTPServer import SimpleHTTPRequestHandler
except ImportError:
    from socketserver import ThreadingMixIn
    from http.server import SimpleHTTPRequestHandler, HTTPServer

PORT = 7272

class DemoServer(ThreadingMixIn, HTTPServer):
    allow_reuse_address = True

    def __init__(self, port=PORT):
        super().__init__(('localhost', int(port)), SimpleHTTPRequestHandler)

    def serve(self):
        print('Web server starting on port %d.' % self.server_address[1])
        try:
            self.serve_forever()
        except KeyboardInterrupt:
            self.server_close()
        print('Demo server stopped.')


if __name__ == '__main__':
    import sys

    try:
        server = DemoServer(*sys.argv[1:])
    except (TypeError, ValueError):
        print(__doc__)
    else:
        server.serve()
