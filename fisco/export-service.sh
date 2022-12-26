#! /bin/sh

source ./bin/to-yaml.sh

k8sYamlDir="pro/k8s-yaml"
k8sNamespace="tars" #请根据事情情况调整

serviceYaml "$k8sYamlDir/agencyA/rpc/service.yaml" "agencyA" "BcosRpcService" "20200"
serviceYaml "$k8sYamlDir/agencyB/rpc/service.yaml" "agencyB" "BcosRpcService" "20200"
serviceYaml "$k8sYamlDir/agencyA/gateway/service.yaml" "agencyA" "BcosGatewayService" "20200"
serviceYaml "$k8sYamlDir/agencyB/gateway/service.yaml" "agencyB" "BcosGatewayService" "20200"

kubectl apply -f "$k8sYamlDir/agencyA/rpc/service.yaml" -n "$k8sNamespace" 
kubectl apply -f "$k8sYamlDir/agencyB/rpc/service.yaml" -n "$k8sNamespace" 
kubectl apply -f "$k8sYamlDir/agencyA/gateway/service.yaml" -n "$k8sNamespace" 
kubectl apply -f "$k8sYamlDir/agencyB/gateway/service.yaml" -n "$k8sNamespace" 