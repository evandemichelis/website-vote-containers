FROM debian:12

RUN apt-get update

RUN apt install -y lsb-release curl gpg

COPY entrypoint.sh  /app/

WORKDIR /app

RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

RUN apt-get update

RUN apt-get install -y redis redis-server

EXPOSE 6379

CMD [ "sh", "entrypoint.sh" ]