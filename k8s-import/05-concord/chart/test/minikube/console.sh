#!/bin/bash

[ -f /usr/bin/pbcopy ] && echo auBy4eDWrKWsyhiDp3AQiw | pbcopy

OPEN_CMD=open
if [ "$(uname -s)" = "Linux" ]; then
  OPEN_CMD=xdg-open
fi

URL=`minikube service concord-server --namespace concord --url | sed 's@^\* @@'`

echo "auBy4eDWrKWsyhiDp3AQiw"
$OPEN_CMD "${URL}/#/login?useApiKey=true"
