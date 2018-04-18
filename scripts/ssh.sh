#!/usr/bin/env bash
tmp_private_key=$(mktemp jumpbox_ssh_key.XXXXXXXXXX) || { echo "Failed to create temp file"; exit 1; }
creds_file=~/workspace/diego-team/bosh-lite-bosh-deployment/creds.yml

bosh int ${creds_file} --path /jumpbox_ssh/private_key > ${tmp_private_key}
chmod 0600 ${tmp_private_key}

ssh-add $tmp_private_key

rm ${tmp_private_key}

ssh -t jumpbox@192.168.50.6  /bin/bash
