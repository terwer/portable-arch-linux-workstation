#!/bin/sh

# =========================
# 初始化
# =========================
# init
source /scripts/init.sh

# =========================
# 启动应用
# =========================
# vncserver
source /scripts/start_vncserver.sh

echo "arch linux with latest version is successfully started"
echo "back to shell=>"
cd ~
pwd
zsh