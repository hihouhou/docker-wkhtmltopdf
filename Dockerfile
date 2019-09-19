#
# wkhtmltopdf Dockerfile #
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV GOROOT /usr/local/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
 
# Update & install packages for wkhtmltopdf
RUN apt-get update && \
    apt-get install -y wkhtmltopdf wget git

# Get go
RUN wget https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz && \
    tar -xvf go1.10.linux-amd64.tar.gz && \
    mv go /usr/local

RUN go get -u github.com/msoap/shell2http && \
    ln -s $(go env GOPATH)/bin/shell2http /usr/local/bin/shell2http

EXPOSE 8080

WORKDIR /tmp/

CMD ["shell2http", "-form", "/wkhtmltopdf", "wkhtmltopdf  $v_url $v_filename"]
