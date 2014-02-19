#!/bin/sh

packages="${@}";

if [ -n "$packages" ]; then
    yum -y update;
    yum install -y $packages;
fi;

exit 0;