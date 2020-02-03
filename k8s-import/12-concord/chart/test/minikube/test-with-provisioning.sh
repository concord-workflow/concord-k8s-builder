#!/bin/bash

echo "Waiting for all Concord pods to be deleted..."

./chart-delete.sh

while [ "$(kubectl get pod -o name -n concord)" != "" ]
do
  printf '.'
  sleep 2
done

./chart-install.sh
./test.sh
