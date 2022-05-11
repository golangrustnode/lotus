#!/bin/zsh
#clearn environment
export LIBRARY_PATH=/opt/homebrew/lib
export FFI_BUILD_FROM_SOURCE=1
cd ..
set -x
rm -rf ~/.lotusminerDevnet
rm -rf ~/.lotusDevnet
rm -rf ~/.lotusminer
rm -rf ~/.lotus
rm lotus
rm localnet.json lotus lotus-gateway lotus-genesis.log lotus-miner lotus-seed lotus-shed lotus-wallet lotus-worker lotus.log

git checkout build/params_2k.go
rm -rf ~/.genesis-sectors
pkill -9 lotus
#build environment
export CGO_CFLAGS_ALLOW="-D__BLST_PORTABLE__"
export CGO_CFLAGS="-D__BLST_PORTABLE__"
export LOTUS_PATH=~/.lotusDevnet
export LOTUS_MINER_PATH=~/.lotusminerDevnet
make 2k
#git submodule update --init --recursive
export LOTUS_SKIP_GENESIS_CHECK=_yes_
./lotus fetch-params 2048
./lotus-seed pre-seal --sector-size 2KiB --num-sectors 2
./lotus-seed genesis new localnet.json
./lotus-seed genesis add-miner localnet.json ~/.genesis-sectors/pre-seal-t01000.json
nohup ./lotus daemon --lotus-make-genesis=devgen.car --genesis-template=localnet.json --bootstrap=false > lotus-genesis.log 2>&1 &
sleep 10
./lotus wallet import --as-default ~/.genesis-sectors/pre-seal-t01000.key
./lotus-miner init --genesis-miner --actor=t01000 --sector-size=2KiB --pre-sealed-sectors=~/.genesis-sectors --pre-sealed-metadata=~/.genesis-sectors/pre-seal-t01000.json --nosync
nohup ./lotus-miner run --nosync > miner-genesis.log 2>&1 &

