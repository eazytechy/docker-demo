# docker-demo
A working demo project demonstrating django, docker, uwsgi and nginx.

######## Pre-requisities ##########

- You should have following installed in your machine - 
  1. Docker Engine
  2. Docker compose

- Create a .env file in docker_demo folder and keep the following variables:
  1. SECRET_KEY=__Your secret key__
  2. DB_NAME=__Your Database Name__
  3. DB_HOST=__Your Database Endpoint__
  4. DB_USER=__Your Database User__
  5. DB_PASSWORD=__Your Database Password__

Steps to run the project:
1. docker compose build
2. docker compose up

