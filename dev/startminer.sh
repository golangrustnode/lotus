#!/bin/zsh
set -x
export LOTUS_PATH=~/.lotus
export LOTUS_MINER_PATH=~/.lotusminer
nohup ./lotus-miner run --miner-api 22345 --nosync > miner.log 2>&1 &
