#!/bin/zsh
set -x
rm -rf ~/.lotus
rm -rf ~/.lotusminer
export LOTUS_PATH=~/.lotus
export LOTUS_MINER_PATH=~/.lotusminer
cp -f devgen.car  ./build/genesis/
cp -f devgen.pi ./build/bootstrap/
sed -i '' 's/const BootstrappersFile = ""/const BootstrappersFile = "devgen.pi"/g' ./build/params_2k.go
sed -i '' 's/const GenesisFile = ""/const GenesisFile = "devgen.car"/g' ./build/params_2k.go
export CGO_CFLAGS_ALLOW="-D__BLST_PORTABLE__"
export CGO_CFLAGS="-D__BLST_PORTABLE__"
make 2k
