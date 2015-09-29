#!/bin/bash

DASH_CONF=$HOME/.dash/dash.conf

RPCUSER=$( grep rpcuser $DASH_CONF | sed -e 's/=/ /' | awk '{print $2}')
RPCPASS=$( grep rpcpassword  $DASH_CONF | sed -e 's/=/ /' | awk '{print $2}')

CURL=`which curl` || (echo "depenency curl missing. do: sudo apt-get install curl " && exit 1)

response=$( $CURL -qq --user $RPCUSER:$RPCPASS --max-time 10 --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:9998/ 2>/dev/null )

if [[ "$response" == *"protocolversion"*  ]] ; then
    exit 0
fi

exit 1
