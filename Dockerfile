FROM golang:1.4
RUN mkdir -p $GOPATH/src/github.com/smartcaas \
&& cd $GOPATH/src/github.com/smartcaas \
&& git clone https://github.com/smartcaas/gorouter.git \
&& cd gorouter \
&& mv Godeps/_workspace/src/code.google.com $GOPATH/src/ \
&& mv Godeps/_workspace/src/github.com/* $GOPATH/src/github.com/ \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/smartcaas/gorouter/
COPY router.yml $GOPATH/src/github.com/smartcaas/gorouter/config/router.yml
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8082 8888
CMD ["/run.sh"]
