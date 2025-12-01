FROM python:3.10.8-slim-buster

# System dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies FIRST (for Docker cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the rest of your code
COPY . .

# Make sure your start script is executable
RUN chmod +x start.sh

# Start your bot
CMD ["bash", "start.sh"]
