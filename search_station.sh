#!/bin/sh
# option check
if [ $# -lt 2 ]
then
  echo "usage: $0 <dabman-url> <search-string>"
  exit 1
fi
echo "Search $2"
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' "http://$1/searchstn?str=$2"
curl -H 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' "http://$1/gochild?id=100"
curl -sH 'Authorization: Basic c3UzZzRnbzZzazc6amkzOTQ1NHh1L14=' "http://$1/list?id=100&start=1&count=100" | xml2
