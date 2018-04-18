#!/usr/bin/env bash

deployment_vars_file=~/workspace/diego-team/bosh-lite-bosh-deployment/cf-deployments-vars.yml
cf login -a api.bosh-lite.com --skip-ssl-validation -u admin -p $(bosh int ${deployment_vars_file} --path /cf_admin_password)
