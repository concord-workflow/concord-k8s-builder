#!/bin/bash

helm install -f values.yaml --namespace concord --name concord ../../
