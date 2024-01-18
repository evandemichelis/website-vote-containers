FROM debian:12

COPY result /app/

WORKDIR /app

RUN apt-get update

EXPOSE 4000

RUN apt-get install -y ca-certificates curl gnupg

RUN mkdir -p /etc/apt/keyrings

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN apt-get install nodejs npm -y

RUN npm ci

CMD [ "node", "server.js" ]