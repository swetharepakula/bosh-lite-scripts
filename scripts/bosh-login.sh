#!/usr/bin/env bash

creds_file=~/workspace/diego-team/bosh-lite-bosh-deployment/creds.yml


bosh log-in -e 192.168.50.6 --client=admin --client-secret=$(bosh int $creds_file --path /admin_password | head) --ca-cert=<(bosh int $creds_file --path /default_ca/ca)
bosh alias-env -e 192.168.50.6 --client=admin --client-secret=$(bosh int $creds_file --path /admin_password | head) --ca-cert=<(bosh int $creds_file --path /default_ca/ca) lite
