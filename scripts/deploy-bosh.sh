#!/usr/bin/env bash
export TMPDIR=/home/pivotal/tmp
echo $TMPDIR
bosh create-env ~/workspace/bosh-deployment/bosh.yml \
     --state ~/workspace/diego-team/bosh-lite-bosh-deployment/state.json \
     -o ~/workspace/bosh-deployment/virtualbox/cpi.yml \
     -o ~/workspace/bosh-deployment/virtualbox/outbound-network.yml \
     -o ~/workspace/bosh-deployment/bosh-lite.yml \
     -o ~/workspace/bosh-deployment/local-dns.yml \
     -o ~/workspace/bosh-deployment/bosh-lite-runc.yml \
     -o ~/workspace/bosh-deployment/jumpbox-user.yml \
     -o ~/workspace/diego-team/bosh-lite-bosh-deployment/operations/4-cores.yml \
     --vars-store ~/workspace/diego-team/bosh-lite-bosh-deployment/creds.yml \
     -v director_name="Bosh Lite Director" \
     -v internal_ip=192.168.50.6 \
     -v internal_gw=192.168.50.1 \
     -v internal_cidr=192.168.50.0/24 \
     -v outbound_network_name=NatNetwork "$@"
