#!/bin/bash

set -evo pipefail

curl -sLo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind create cluster
cp "$(kind get kubeconfig-path --name="kind")" ./kubectl/kubeconfig
docker build -t kubectl kubectl

docker build -t server:pinned server
kind load docker-image server:pinned

docker build -t integration:pinned integration
kind load docker-image integration:pinned

docker run --network host -it --rm kubectl run server --image=server:pinned --port=8080 --expose
docker run --network host -it --rm kubectl run integration --rm --attach --restart=Never --image=integration:pinned
