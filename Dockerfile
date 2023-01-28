# base image  
FROM python:3.8-alpine

# Following th eprinciple of least privilege, created user named python
# -S or --system is for system user
ARG APP_USER=mm_dev
RUN addgroup -S ${APP_USER} && adduser -S ${APP_USER} ${APP_USER}

# setup environment variable  
ENV DockerHOME=/home/app/demoApp  

# set work directory  
RUN mkdir -p $DockerHOME  

# where your code lives  
WORKDIR $DockerHOME  

# install dependencies
RUN apk add --update --virtual .tmp gcc libc-dev linux-headers
RUN apk add mariadb-dev tk
RUN apk add pcre-dev
RUN apk add --update 
RUN apk add libffi-dev musl-dev --virtual .cryptography 
RUN apk add openssl-dev
RUN apk add python3-dev build-base jpeg-dev zlib-dev libjpeg

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY . $DockerHOME  

# run this command to install all dependencies  
RUN pip install uwsgi
RUN pip install -r requirements.txt

# port where the Django app runs  
EXPOSE 8000

# start server  
CMD ["uwsgi", "--ini", "/home/app/demoApp/uwsgi.ini"]

# CMD python manage.py runserver 0.0.0.0:8000