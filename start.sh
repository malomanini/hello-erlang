#!/bin/bash

exec erl -pa `pwd`/ebin -pa `pwd`/deps/*/ebin \
     -sname nodeTheFirst
