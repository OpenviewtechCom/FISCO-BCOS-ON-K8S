# 将 FISCO-BCOS 的服务打包成docker镜像，并上传到 https://hub.docker.com/

## 目的
该项目是为了在k8s中部署 FISCO-BCOS

## 项目地址：https://github.com/OpenviewtechCom/FISCO-BCOS-ON-K8S/tree/main/dockerfile

## 镜像创建并上传到 hub.docker.com
```shell
make all -e Version=v3.1.1
```

**上传到私有仓库：**
请修改`build.sh`中的`ImagePrefix`