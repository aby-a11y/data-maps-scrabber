import backend.scrapers
from botasaurus_server.server import Server

if __name__ == "__main__":
    Server.run(port=8000, host="0.0.0.0")
