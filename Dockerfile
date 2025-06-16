FROM python:3.9-alpine

WORKDIR /app/backend

COPY requirements.txt /app/backend
# RUN apt-get update \
#     && apt-get upgrade -y \
#     && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
#     && rm -rf /var/lib/apt/lists/*
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    mysql-dev \
    pkgconfig



# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8004
#RUN python manage.py migrate
#RUN python manage.py makemigrations
