#!/usr/bin/env bash

set -e

osType=$(uname)
case "$osType" in
    "Darwin")
       local_diego=local-diego-mac.yml
     ;;
    *)
       local_diego=local-diego.yml
    ;;
esac
args="$HOME/workspace/cf-deployment/cf-deployment.yml
-o $HOME/workspace/cf-deployment/operations/use-compiled-releases.yml
-o $HOME/workspace/cf-deployment/operations/bosh-lite.yml
-o $HOME/workspace/cf-deployment/operations/use-postgres.yml
-o $HOME/workspace/diego-team/bosh-lite-bosh-deployment/operations/set-graph-cleanup-threshold.yml
--vars-store $HOME/workspace/diego-team/bosh-lite-bosh-deployment/cf-deployments-vars.yml
-v system_domain=bosh-lite.com"

#-o $HOME/workspace/diego-team/bosh-lite-bosh-deployment/operations/local-routing-mac.yml
bosh interpolate $args --var-errs "$@" >/dev/null
bosh -n -e lite -d cf deploy $args --no-redact "$@"

if [ $? == 0 ]; then
    BOSH_LITE_SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    ${BOSH_LITE_SCRIPTS_DIR}/cf-login.sh

    cf enable-feature-flag diego_docker
fi
