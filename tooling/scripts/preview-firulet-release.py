"""Loopback-only preview including staged download ZIPs; never a deployment."""
import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT=Path(__file__).resolve().parents[2]

class Handler(SimpleHTTPRequestHandler):
    def translate_path(self,path):
        url=unquote(urlsplit(path).path)
        prefix='/downloads/firulet-map/'
        base=ROOT/'.local/release-assets/firulet-map' if url.startswith(prefix) else ROOT/'frontend'
        suffix=url[len(prefix):] if url.startswith(prefix) else url.lstrip('/')
        target=(base/suffix).resolve()
        return str(target if target.is_relative_to(base.resolve()) else base/'__blocked_preview_path__')

    def list_directory(self,path):
        self.send_error(404,'Directory listing disabled')

    def end_headers(self):
        self.send_header('Cache-Control','no-store')
        if urlsplit(self.path).path.startswith('/downloads/firulet-map/'):
            self.send_header('Content-Disposition','attachment')
        super().end_headers()

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port',type=int,default=4338)
    args=parser.parse_args()
    server=ThreadingHTTPServer(('127.0.0.1',args.port),Handler)
    print(f'Preview: http://127.0.0.1:{server.server_port}/firulet-map/',flush=True)
    server.serve_forever()
