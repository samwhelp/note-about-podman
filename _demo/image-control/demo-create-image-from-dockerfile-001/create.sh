#!/usr/bin/env bash




##
## ## create info.txt
##

echo 'test' > info.txt




##
## ## create Dockerfile
##

cat << __EOL__ > Dockerfile
From alpine

COPY info.txt /info.txt

CMD cat /info.txt
__EOL__
