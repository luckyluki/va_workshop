#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
OS_DIR=$SCRIPT_DIR/os

if [ ! -f $OS_DIR/ubuntu-16.04-server-amd64.iso ]; then
    pushd $OS_DIR
    wget http://de.releases.ubuntu.com/16.04/ubuntu-16.04-server-amd64.iso
    popd
fi
