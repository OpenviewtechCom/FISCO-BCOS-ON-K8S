Version=v3.1.0

all: gateway rpc node maxNode executor

gateway:
	./build.sh BcosGatewayService ${Version} fisco-bcos-gateway

rpc:
	./build.sh BcosRpcService ${Version} fisco-bcos-rpc

node:
	./build.sh BcosNodeService ${Version} fisco-bcos-node

maxNode:
	./build.sh BcosMaxNodeService ${Version} fisco-bcos-max-node

executor:
	./build.sh BcosExecutorService ${Version} fisco-bcos-executor
