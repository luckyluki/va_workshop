#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
OS_DIR=$SCRIPT_DIR/os

if [ ! -d $OS_DIR ]; then
    mkdir $OS_DIR
fi

pushd $OS_DIR
wget http://de.releases.ubuntu.com/16.04/ubuntu-16.04-server-amd64.iso
popd
