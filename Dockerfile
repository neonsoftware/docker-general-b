from ubuntu:wily 

# Installing installation tool that enables apt-add-repository
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository ppa:ubuntu-lxc/lxd-stable
RUN apt-get update && apt-get install -y \
    ruby-dev rubygems gcc make \    
    bats \
    golang \ 
    git \
    python \
    curl zip unzip psmisc

# Golang
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Fpm
RUN gem install fpm 
