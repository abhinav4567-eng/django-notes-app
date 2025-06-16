FROM python:3.9-alpine

# Set working directory
WORKDIR /app/backend

# Install dependencies
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    mysql-client \
    mariadb-connector-c-dev \
    build-base \
    python3-dev \
    py3-pip

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set the default command
CMD ["python", "app.py"]
