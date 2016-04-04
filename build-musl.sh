#!/bin/sh

MUSLPATH=$(realpath $(dirname $0)"/musl")
[ ! -d $MUSLPATH ] || git submodule init  && git submodule update

cd $MUSLPATH
./configure
make
