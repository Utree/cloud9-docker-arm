#!/bin/sh
if [ ! -z $AUTH ]; then
  AUTH="--auth $AUTH"
fi

if [ ! -z $COLLAB ]; then
  COLLAB="--collab"
fi

if [ ! -z $GITCLONE ]; then
  git clone $GITCLONE /workspace
fi

/root/.c9/node/bin/node /home/cloud9ide/cloud9/server.js $AUTH $COLLAB --listen 0.0.0.0 --port 8080 -w /workspace
