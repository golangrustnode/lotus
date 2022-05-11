#!/bin/zsh
set -x
export LOTUS_PATH=~/.lotus
export LOTUS_MINER_PATH=~/.lotusminer
nohup ./lotus daemon > lotus.log 2>&1 &
