FROM golang:1.4
RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/dinp/router.git \
&& cd router \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/router/
COPY router.yml $GOPATH/src/github.com/dinp/router/config/router.yml
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8082 8888
CMD ["/run.sh"]
