FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Copy requirements.txt first (for caching)
COPY requirements.txt .

# Update and install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app code
COPY . .

# Expose the port your app runs on
EXPOSE 8000

# Optional: Add a default command if using app.py
# CMD ["python", "app.py"]
