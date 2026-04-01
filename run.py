import os
import backend.scrapers
from botasaurus_server.app import app
from bottle import run as bottle_run

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    bottle_run(app, host="0.0.0.0", port=port)
