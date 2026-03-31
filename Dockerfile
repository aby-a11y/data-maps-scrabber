FROM chetan1111/botasaurus:latest

ENV PYTHONUNBUFFERED=1
ENV PORT=8000

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

RUN mkdir app
WORKDIR /app
COPY . /app

# Fix: React 17 peer deps conflict
RUN cd /app/frontend && npm install --legacy-peer-deps && npm run build

RUN python run.py install

EXPOSE ${PORT}
CMD ["python", "run.py"]
