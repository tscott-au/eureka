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
