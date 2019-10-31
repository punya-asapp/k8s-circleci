# kind-example

[![CircleCI](https://circleci.com/gh/punya-asapp/kind-example.svg?style=svg)](https://circleci.com/gh/punya-asapp/kind-example)

Demo of running component-level tests using:
* [CircleCI Docker executor](https://circleci.com/docs/2.0/executor-types/#using-docker) to run Docker under CircleCI
* [Kind](https://kind.sigs.k8s.io/) to run Kubernetes under Docker
* [Newman](https://github.com/postmanlabs/newman) to run REST API integration tests

See `.circleci/config.yml` for more details.
