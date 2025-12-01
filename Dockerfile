FROM python:3.10.8-slim-buster

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Set workdir and copy requirements
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code and start script
COPY . .

# Make sure start.sh is executable and has correct line endings
RUN chmod +x start.sh && sed -i 's/\r$//' start.sh

CMD ["bash", "start.sh"]
