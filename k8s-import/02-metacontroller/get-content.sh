#!/bin/sh

# This is master as of Oct 21, 2019
version="f4e9adae37e3ff24d6becd7618276d1907f83ece"

# Create metacontroller service account and role/binding.
curl -O https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/${version}/manifests/metacontroller-rbac.yaml

# Create CRDs for Metacontroller APIs, and the Metacontroller StatefulSet.
curl -O https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/${version}/manifests/metacontroller.yaml
