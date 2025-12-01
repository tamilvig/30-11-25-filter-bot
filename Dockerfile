FROM python:3.12-slim

# Install system dependencies required for tgcrypto and bot packages
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    gcc \
    g++ \
    libssl-dev \
    libffi-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

CMD ["python", "bot.py"]

