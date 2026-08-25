#!/bin/bash
# 修改默认 LAN IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i "s/OpenWrt/ImmortalWrt/g" package/base-files/files/bin/config_generate
