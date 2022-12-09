#!/bin/bash

echo "Hello"

zap-webswing.sh &
/zap/zap.sh -daemon -port 8002 -host 0.0.0.0 -config api.disablekey=true -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true