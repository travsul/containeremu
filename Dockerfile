FROM debian:stretch

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y build-essential \
    default-libmysqlclient-dev \
    liblua5.3-dev \
    libdb5.3-dev \
    libssl-dev \
    cmake \
    git \ 
    default-jre \ 
    dumb-init

RUN apt-get install -y 

RUN mkdir containeremu
ADD . containeremu/
WORKDIR containeremu

RUN cd Core3/MMOCoreORB && make -j8

WORKDIR "/containeremu/Core3/MMOCoreORB/bin"
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./core3"] 