#!/bin/sh
set -e

if [ ! -z "${AWS_DEFAULT_REGION}" ];then
  aws configure set default.region ${AWS_DEFAULT_REGION}
fi

if [ ! -z "${CLUSTER_NAME}" ];then
  aws eks update-kubeconfig --name ${CLUSTER_NAME}
fi

if [ -f /usr/bin/helm ]; then
  helm repo add stable https://kubernetes-charts.storage.googleapis.com/
  # Loop thru all env vars starts by HELM_REPO_ and parse repo name and repo link
  # .eg. HELM_REPO_stable=https://kubernetes-charts.storage.googleapis.com/
  printenv | grep HELM_REPO_ | while read -r i; do
    repo_name=$(echo ${i} | sed 's#=.*##' | sed 's/HELM_REPO_//')
    repo_link=$(echo ${i} | sed 's/^[^=]*=//g')
    helm repo add ${repo_name} ${repo_link}
  done
  if [ "${HELM_AUTO_REPO_UPDATE}" = "yes"  ]; then
    helm repo update
  fi

  printenv | grep HELM_PLUGIN_ | while read -r i; do
    plugin_name=$(echo ${i} | sed 's#=.*##' | sed 's/HELM_PLUGIN_//')
    plugin_install_command=$(echo ${i} | sed 's/^[^=]*=//g')
    helm plugin install ${plugin_install_command}
  done

  exec helm "$@"
else
  exec kubectl "$@"
fi
