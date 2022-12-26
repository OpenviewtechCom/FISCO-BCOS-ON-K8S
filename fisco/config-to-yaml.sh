#! /bin/sh

source ./bin/to-yaml.sh

originConfigDir="pro/origin-config"
k8sYamlDir="pro/k8s-yaml"

chainId="chain0"
groupId="group0"


rpcConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyA"
rpcConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyB"

gatewayConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyA"
gatewayConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyB"

nodeConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyA" "$groupId" "node0"
nodeConfig "$originConfigDir" "$k8sYamlDir" "$chainId" "agencyA" "$groupId" "node0"