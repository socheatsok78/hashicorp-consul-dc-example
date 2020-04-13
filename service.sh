#!/usr/bin/env bash

set -e

TASK=$1
shift

bootstrap () {
    docker-compose \
        --file bootstrap/docker-compose.yml \
        $@
}

start () {
    echo "Starting services...."
    bootstrap up --detach
}

stop () {
    bootstrap down
}

ps () {
    bootstrap ps
}

logs () {
    bootstrap logs
}

scale () {
    bootstrap up --scale $@ --detach
}

$TASK $@
