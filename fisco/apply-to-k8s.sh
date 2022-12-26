#! /bin/sh

k8sNamespace="tars" #请根据事情情况调整
k8sYamlDir="pro/k8s-yaml"

./bin/apply-tree.sh "$k8sNamespace" "$k8sYamlDir"