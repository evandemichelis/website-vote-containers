FROM debian:12

RUN apt-get update

RUN apt-get install -y wget

RUN rm -rf /var/lib/apt/lists/*
 
WORKDIR /app

ADD https://github.com/gohugoio/hugo/releases/download/v0.121.2/hugo_0.121.2_linux-amd64.tar.gz /app

RUN tar -xzvf hugo_0.121.2_linux-amd64.tar.gz
    
RUN rm hugo_0.121.2_linux-amd64.tar.gz

RUN mv hugo /usr/local/bin/

RUN mkdir /quickstart

COPY ./quickstart /quickstart

WORKDIR /quickstart

EXPOSE 1313

CMD ["hugo", "server", "-D",  "--bind=0.0.0.0"]

# sudo docker build -t hugo_img .
# sudo docker run -p 1313:1313 hugo_img