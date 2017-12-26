#!/bin/bash

set -x

IP=$(ip route show |grep -o src.* |cut -f2 -d" ")
NETWORK=$(echo ${IP} | cut -f3 -d.)

case "${NETWORK}" in 
  100)
    zone=1a
    color=Crimson
    ;;
  101)
    zone=1b
    color=CornflowerBlue
    ;;
  102)
    zone=1c
    color=LightGreen
    ;;
  *)
    zone=unknown
    color=Yellow
    ;;
esac

sed -i "s/Hello, World/Hello, World from ip address ${IP} in ${zone}/" /usr/src/app/app.rb

exec ruby /usr/src/app/app.rb
