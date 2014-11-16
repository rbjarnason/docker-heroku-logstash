# Logstash Dockerfile

A Dockerfile that produces a Docker Image for [Logstash](http://logstash.net/).

## Usage

### Build the image

To create the image `yrpri/heroku-logstash`, execute the following command on the `docker-logstash` folder:

```
$ docker build -t yrpri/heroku-logstash .
```

### Run the image

To run the image and bind to host ports 514, 9200 and 9300:

```
$ docker run -d -p 1572:1572 -e "ES_IP=xx.xx.xx.xx" yrpri/heroku-logstash
```
