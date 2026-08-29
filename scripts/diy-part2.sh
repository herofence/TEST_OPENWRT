#!/bin/bash
# 配置修改
# 1.替换 luci-app-docker 为官方版本
if [ -d "package/feeds/luci/luci-app-docker" ]; then
    rm -rf package/feeds/luci/luci-app-docker
fi
git clone --depth 1 --branch openwrt-23.05 https://github.com/openwrt/luci.git /tmp/luci-official
cp -r /tmp/luci-official/applications/luci-app-docker package/feeds/luci/
rm -rf /tmp/luci-official

# 2. 修改默认主题
sed -i 's/luci-theme-design/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 3. 修改 feeds 中的时间格式
find feeds/luci/ -path "*/system.lua" -exec sed -i 's/os.date("%c")/os.date("%Y-%m-%d %H:%M:%S")/g' {} \; 2>/dev/null

# 4. 修改默认IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
