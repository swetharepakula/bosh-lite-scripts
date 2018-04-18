#!/usr/bin/env bash


state_file=~/workspace/diego-team/bosh-lite-bosh-deployment/state.json
if [ $# -ne 1 ]; then
    echo "Usage: $0 suspend|resume|info"
    exit 1
fi

if [ $1 == "suspend" ]; then
    VBoxManage controlvm $(cat ${state_file} | jq -r .current_vm_cid) savestate
elif [ $1 == "resume" ]; then
    VBoxManage startvm $(cat ${state_file} | jq -r .current_vm_cid) --type headless
elif [ $1 == "info" ]; then
    VBoxManage showvminfo $(cat ${state_file} | jq -r .current_vm_cid)
fi

