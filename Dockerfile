FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1
ENV PORT=8000

RUN apt-get update && apt-get install -y \
    wget curl gnupg unzip \
    libglib2.0-0 libnss3 libfontconfig1 \
    libx11-6 libxcb1 libxcomposite1 libxcursor1 \
    libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 \
    libxrender1 libxss1 libxtst6 ca-certificates \
    libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libcups2 libdbus-1-3 libdrm2 libgbm1 libgtk-3-0 libnspr4 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY patch_botasaurus.py .
RUN python patch_botasaurus.py

COPY . /app

EXPOSE ${PORT}
CMD ["python", "run.py"]
