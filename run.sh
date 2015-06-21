#!/bin/bash
require_env=(
REDIS_PORT_6379_TCP_ADDR
REDIS_PORT_6379_TCP_PORT
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
confFile=$GOPATH/src/github.com/dinp/gorouter/config/router.yml
sed -i "s/{REDIS_HOST}/${REDIS_PORT_6379_TCP_ADDR}/g" $confFile \
&& sed -i "s/{REDIS_PORT}/${REDIS_PORT_6379_TCP_PORT}/g" $confFile 

cd $GOPATH/src/github.com/dinp/gorouter/
./router
