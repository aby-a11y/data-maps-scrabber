import backend.scrapers
from botasaurus_server.app import app
from bottle import run as bottle_run

if __name__ == "__main__":
    bottle_run(app, host="0.0.0.0", port=8000)
