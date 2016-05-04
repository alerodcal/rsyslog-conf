#!/bin/bash

IP="10.0.150.72"
USER="root"


function usage() {
    echo "$0 [-a <ip_address>][-u <ssh_user>][-h]"
    exit 1
}

while getopts "a:u:h" name; do
  case $name in
    a) IP=$OPTARG;;
    u) USER=$OPTARG;;
    h) usage;;
  esac
done


echo "Uploading rsyslog server configuration..."

scp ./rsyslog.conf ${USER}@${IP}:/etc/
scp -r ./rsyslog.d/* ${USER}@${IP}:/etc/rsyslog.d/