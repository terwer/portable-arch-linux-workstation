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