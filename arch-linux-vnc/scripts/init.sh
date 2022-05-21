#!/bin/sh

# =========================
# 更新设置
# =========================
# 更新环境变量
cp -r /config/my_profile.sh /mytemp/.my_profile
mv /mytemp/.my_profile ~/.my_profile

# 生效最新环境变量
source ~/.zshrc
echo "custom env setup finished"

echo "inited"