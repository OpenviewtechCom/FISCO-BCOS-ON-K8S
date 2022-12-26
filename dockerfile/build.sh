#! /bin/sh

ImagePrefix=degfy
Bin=$1
Version=$2
Image=$3

rm -rf bin
mkdir -p bin/back

targetUrl="https://osp-1257653870.cos.ap-guangzhou.myqcloud.com/FISCO-BCOS/FISCO-BCOS/releases/$Version/$Bin-linux-x86_64.tgz"
echo $targetUrl
curl $targetUrl -o bin/$Bin.tgz

tar -xzvf bin/$Bin.tgz -C bin/
rm -rf bin/$Bin.tgz

docker build . -t $ImagePrefix/$Image:$Version --build-arg BIN=bin/$Bin/$Bin --build-arg BaseImage=tarscloud/tars.cppbase:v1.4.0 --build-arg ServerType=cpp --progress plain
docker push $ImagePrefix/$Image:$Version

mv bin/$Bin bin/back