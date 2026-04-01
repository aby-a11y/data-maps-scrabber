
FROM chetan1111/botasaurus:latest

ENV PYTHONUNBUFFERED=1
ENV PORT=8000

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

COPY . /app

EXPOSE ${PORT}
CMD ["python", "run.py"]
