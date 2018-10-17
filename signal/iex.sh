#! /bin/bash
result=${PWD##*/}

rsync -a --delete --exclude={deps/,_build/,.elixir_ls/,mix.lock.host,mix.lock.rpi} ./ ~/dev_build/elixir/$result
cd ~/dev_build/elixir/$result
mix compile
iex --name host@0.0.0.0 --cookie myCookie -S mix
