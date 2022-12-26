#! /bin/sh

cd BcosBuilder/pro
python3 build_chain.py chain -o gen-config -c ../../pro/config.toml -O ../../pro/origin-config -t rpc # 生成rpc配置
python3 build_chain.py chain -o gen-config -c ../../pro/config.toml -O ../../pro/origin-config -t gateway # 生成gateway配置
python3 build_chain.py chain -o gen-config -c ../../pro/config.toml -O ../../pro/origin-config -t node # 生成node配置