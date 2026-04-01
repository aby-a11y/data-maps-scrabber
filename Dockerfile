FROM chetan1111/botasaurus:latest

ENV PYTHONUNBUFFERED=1
ENV PORT=8000
ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

COPY . /app

RUN cd /app/frontend && \
    npm install --legacy-peer-deps && \
    npm install --save-exact --save-dev @types/node --legacy-peer-deps && \
    npm install @elastic/datemath moment --legacy-peer-deps && \
    npm run build

RUN cd /app/frontend && npm install --legacy-peer-deps && python run.py install

EXPOSE ${PORT}
CMD ["python", "run.py"]
