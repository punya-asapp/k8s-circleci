#!/bin/bash

set -evo pipefail

curl -sLo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind create cluster
cp "$(kind get kubeconfig-path --name="kind")" ./kubectl/kubeconfig
docker build -t kubectl kubectl

docker build -t server server
kind load docker-image server

docker build -t integration integration
kind load docker-image integration

alias kubectl=docker run --network host -it --rm kubectl
kubectl run server --image=example --port=8080 --expose
kubectl run integration --rm --attach --restart=Never --image=integration
