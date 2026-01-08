#!/usr/bin/env bash




##
## ## create info.txt
##

echo 'test' > info.txt




##
## ## create Dockerfile
##

cat << __EOL__ > Dockerfile
From debian

COPY info.txt /info.txt
__EOL__
