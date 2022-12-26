


configToYaml(){
	inDir=$1
	filename=$2
	app=$3
	server=$4
	seq=$5
	outDir=$6
	configName=`head /dev/urandom |cksum |md5sum |cut -c 1-32`

	mkdir -p $outDir
	cp "templates/config.yaml" "$outDir/$filename.yaml"

	list='
	filename
	app
	server
	seq
	configName
	'

	for item in $list;
	do
		sed -i ''  "s/_${item}_/`eval echo '$'$item`/" "$outDir/$filename.yaml"
	done

	cat $inDir/$filename | sed 's/^/  /' >> "$outDir/$filename.yaml"
}

configDirToYaml(){
	inDir=$1
	app=$2
	server=$3
	seq=$4
	outDir=$5

	list=`ls $inDir`

	for item in $list;
	do
		echo "configToYaml $inDir $item $app $server $seq $outDir"
		configToYaml $inDir $item $app $server $seq $outDir
	done
}


copyServer(){
	inputfile=$1
	outputfile=$2
	app=$3
	cp $inputfile $outputfile

	sed -i "" "s/_app_/$app/" $outputfile
}


rpcConfig(){
    inDir=$1
    outDir=$2
    chainId=$3
    agencyName=$4

    configDir="$inDir/rpc/$chainId/${agencyName}BcosRpcService/127.0.0.1"
    yamlDir="$outDir/$agencyName/rpc"

    configToYaml $configDir "config.ini" "$agencyName" "BcosRpcService" "m" "$yamlDir"
	sed -i "" "s/$chainId.$agencyName/$agencyName./"  "$outDir/config.ini.yaml"


    configDirToYaml "$configDir/ssl" "$agencyName" "BcosRpcService" "m" "$yamlDir"

	copyServer templates/server-rpc.yaml "$yamlDir/server-rpc.yaml" "$agencyName"
}

gatewayConfig(){
    inDir=$1
    outDir=$2
    chainId=$3
    agencyName=$4
	

    configDir="$inDir/gateway/$chainId/${agencyName}BcosGatewayService/127.0.0.1"
    yamlDir="$outDir/$agencyName/gateway"

    configToYaml $configDir "config.ini" "$agencyName" "BcosGatewayService" "m" "$yamlDir"
	sed -i "" "s/$chainId.$agencyName/$agencyName./"  "$outDir/config.ini.yaml"

	configToYaml $configDir "nodes.json" "$agencyName" "BcosGatewayService" "m" "$yamlDir"


    configDirToYaml "$configDir/ssl" "$agencyName" "BcosGatewayService" "m" "$yamlDir"

	copyServer templates/server-gateway.yaml "$yamlDir/server-gateway.yaml" "$agencyName"
}

nodeConfig(){
    inDir=$1
    outDir=$2
    chainId=$3
    agencyName=$4
	groupId=$5
	nodeId=$6
	

    configDir="$inDir/$chainId/$groupId/${agencyName}${groupId}${nodeId}BcosNodeService"
    yamlDir="$outDir/$agencyName/$groupId/$nodeId"

    configDirToYaml "$configDir" "$agencyName" "BcosNodeService" "m" "$yamlDir"
	sed -i "" "s/$chainId.$agencyName/$agencyName./"  "$outDir/config.ini.yaml"

	copyServer templates/server-node.yaml "$yamlDir/server-node.yaml" "$agencyName"
}