FROM python:3.9-alpine

WORKDIR /app/backend

COPY requirements.txt /app/backend

RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    mysql-dev \
    pkgconfig

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
