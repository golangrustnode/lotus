#!/bin/zsh
export MINER_API_INFO=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBbGxvdyI6WyJyZWFkIiwid3JpdGUiLCJzaWduIiwiYWRtaW4iXX0.yZYKLoJ0Od9tvHxbAu6ecO-8TI1ZC7tatcEYT9Ws4Ss:/ip4/127.0.0.1/tcp/22345
nohup ./lotus-worker run > worker.log 2>&1 &