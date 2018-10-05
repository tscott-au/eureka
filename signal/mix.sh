#! /bin/bash
result=${PWD##*/}

rsync -a --delete --exclude={deps/,_build/,.elixir_ls/,mix.lock.host,mix.lock.rpi} ./ ~/dev_build/elixir/$result
cd ~/dev_build/elixir/$result
export MIX_TARGET=rpi
mix $1 $2 $3 $4 $5 $6 $7 $8
