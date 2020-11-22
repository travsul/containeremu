# Create base image with dependencies
# needed by both builder and final
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

RUN mkdir git
ADD . containeremu/
WORKDIR git

RUN cd Core3/MMOCoreORB && make -j8

WORKDIR "/git/Core3/MMOCoreORB/bin"
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./core3"] 