#!/bin/sh

# =======================
# 备份配置文件
# =======================
# 备份用户相关配置文件
rm -rf /mytemp/hometemp
cp -r /home /mytemp/hometemp
echo "backup home forder to /mytemp/hometemp/home ended"
cp -r /root /mytemp/hometemp
echo "backup root forder to /mytemp/hometemp/root ended"

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