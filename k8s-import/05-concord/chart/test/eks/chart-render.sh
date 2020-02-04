#!/bin/bash

rm -rf target
mkdir -p target
helm template -f values.yaml  --output-dir ./target ../../
