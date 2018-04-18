#!/usr/bin/env bash
osType=$(uname)
case "$osType" in
    "Darwin")
       sudo route add -net 10.244.0.0/16 192.168.50.6
     ;;
    *)
       sudo route add -net 10.244.0.0/16 gw 192.168.50.6
    ;;
esac
