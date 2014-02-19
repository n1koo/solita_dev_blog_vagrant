#!/bin/sh

packages="${@}";

if [ -n "$packages" ]; then
    yum update;
    yum install -y $packages;
fi;

exit 0;