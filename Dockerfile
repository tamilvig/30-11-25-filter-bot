FROM python:3.12-slim
FROM python:3.12-slim

# Install system build tools
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    ffmpeg \
    libffi-dev \
    libnacl-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Run the bot
CMD ["python", "bot.py"]
