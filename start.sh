#!/bin/bash

echo -e "'`hostname --long`'.\n" > ~/.hosts.erlang

if [ $# -eq 0 ]
	then
		NAME="nodeTheFirst"
	else
		NAME=$1
fi

exec erl -pa `pwd`/ebin -pa `pwd`/deps/*/ebin \
     -sname $NAME
