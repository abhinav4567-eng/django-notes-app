FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Install system dependencies
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for Docker caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your Django app
COPY . .

# Expose the port Django runs on
EXPOSE 8000

# Set the default command to run Django dev server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
