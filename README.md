# Eureka - A system for timing events such as competition gold panning

This project provides the building blocks and reference implementation to automate the timing
of competition gold panning.

## Domain

Recording the time taken for participants to complete a task.

Assumptions:

* Participants all start the task at the same time
* Participants signal "done" once they have finished the task

## About competition gold panning

Competition gold panning turns searching for "gold" in a bucket of dirt into a sport!

The person who finds the most "gold" in the shortest amount of time wins.

## Why is timing important

In the past gold panning competitions have relied on volenteers to do timing by hand, for each competitor there is a timer person.This project removes the need of a timer person.

## Setup

You should also be using the following Elixir and Erlang versions:

* Elixir 1.7.3
* Erlang OTP 21
* Nerves "~> 0.6"

Please see the main [Nerves installation docs](https://hexdocs.pm/nerves/installation.html)

## Mix Project structure

This project does not follow an Elixir umberalla approach, this is because the
Nerves sub projects have different build requirements.


#### testing multi node:
https://medium.com/@lorenzo_sinisi/how-to-test-elixir-cluster-of-nodes-using-slaves-69e59a77ec3f

### deploying on aws:
http://engineering.pivotal.io/post/how-to-set-up-an-elixir-cluster-on-amazon-ec2/

### multi node config:
https://dockyard.com/blog/2016/01/28/running-elixir-and-phoenix-projects-on-a-cluster-of-nodes

### module attributes
https://ropig.com/blog/be-careful-when-using-elixirs-module-attributes/

### distributed service register
https://github.com/VoiceLayer/dispatch
https://hexdocs.pm/swarm/readme.html

### clustering
https://learnyousomeerlang.com/distribunomicon#setting-up-an-erlang-cluster
https://github.com/bitwalker/libcluster

## PI wlan
https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md
## can't get wifi to run
https://wiki.netbsd.org/tutorials/how_to_use_wpa_supplicant/

### alternative to nerves...
https://resinos.io/docs/raspberry-pi2/gettingstarted/#get-the-device-up-and-running



### networking...
Configured firewall to open ports (input and output):
4369, the default port for EPMD
9100-9132 - for listening...

iex --name wsl@192.168.1.102 --cookie yumyum --erl "-kernel inet_dist_listen_min 9100 -kernel inet_dist_listen_max 9131"



storm> iex --sname button2 --cookie yumyum
m2@storm: iex --sname wsl --cookie yumyum

