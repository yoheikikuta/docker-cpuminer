# docker-cpuminer
Execute cpuminer for [BitZeny](http://bitzeny.org/) in a docker container.

## Prerequisites
- Docker (Community Edition) environment  
  https://docs.docker.com/engine/installation/

## Assumptions
- Mining BitZeny coin  
  Perhaps you can use this repository for other cryptocurrencies.
- Using a mining pool
- Using `yescrypt` algorithm  
  But you can change it by editing `mining.sh`.

## Build a docker image
```
$ git clone https://github.com/yoheikikuta/docker-cpuminer.git
$ cd docker-cpuminer
$ docker build -t [IMAGE NAME] .
```

## Run a container
You need to pass arguments about {pool url, user name, worker name, worker password}.
```
$ docker run -it --rm [IMAGE NAME] -o [POOL URL] -u [USER NAME] -w [WORKER NAME] -p [WORKER PASSWORD]
(mining will start)
```
(e.g., `docker run --rm -it cpuminer -c stratum+tcp://bitzenypool.work:19666 -u foo -w bar -p foobar` )

You can quit mining by `Ctrl + C`.
