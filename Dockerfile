FROM python:3.12-slim

# Install system build tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot files
COPY . /app/

# Run bot
CMD ["python", "bot.py"]
FROM python:3.12-slim

# Install system build tools
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot files
COPY . /app/

# Run bot
CMD ["python", "bot.py"]
