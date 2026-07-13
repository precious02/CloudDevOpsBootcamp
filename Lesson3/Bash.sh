#!/bin/bash
log() {
  echo "[$(date '+%H:%M:%S')] $*"
}

aws cloudformation deploy \
    --template-file Precious.yaml \
    --stack-name preshstack \


log 'deployment successful'