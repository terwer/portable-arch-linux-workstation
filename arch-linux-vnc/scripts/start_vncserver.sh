#!/bin/sh

# 设置vnc配置
# 备份
# cp -r ~/.vnc /config/vnc-xfce
# cp -r ~/.vnc /config/vnc-dde

# 更新最新vnc配置
# =============================
# 设置vnc密码
# vncpasswd
# =============================

# 启动VNCServer
echo "vncserver is starting..."
vncserver -kill :1
vncserver :1
echo "vncserver is started"