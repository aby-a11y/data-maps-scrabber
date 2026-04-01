import os
import backend.scrapers
from botasaurus_server.run import run

os.environ["DISABLE_FRONTEND"] = "true"

if __name__ == "__main__":
    run()
