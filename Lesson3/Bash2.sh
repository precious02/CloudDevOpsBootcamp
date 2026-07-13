#!/bin/bash
log() {
  echo "[$(date '+%H:%M:%S')] $*"
}

aws cloudformation delete-stack \
--stack-name preshstack \


log 'deletion successful'