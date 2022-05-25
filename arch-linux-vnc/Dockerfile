# 依赖的镜像
FROM archlinux:latest

# 镜像创建者的信息
LABEL maintainer="Terwer Green <youweics@163.com>"

# 环境变量
ENV LANG=C.UTF-8 \
    TZ=Asia/Shanghai \
    TZ=CST-8

# 用root用户操作，不设置默认也是root操作
USER root

# ==============================
# 配置系统源
# ==============================

# 替换国内源
# cat /etc/pacman.d/mirrorlist
RUN echo 'Server = https://mirrors.163.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist \
    && echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist \
    && echo 'Server = https://repo.archlinuxcn.org/$arch' >> /etc/pacman.d/mirrorlist \
    && echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.d/mirrorlist \
    && cat /etc/pacman.d/mirrorlist

# 更新仓库
# pacman使用手册
# https://archlinux.org/pacman/pacman.8.html
RUN pacman -Sy

# 更新软件
RUN pacman -Syu --debug --noconfirm

# ==============================
# 安装基本软件包
# ==============================

# 显示系统信息
RUN pacman -S neofetch --noconfirm

# 安装必备软件
RUN pacman -S vim wget rsync --noconfirm

# 安装开发工具包
# https://archlinux.org/groups/x86_64/base-devel/
RUN pacman -S git --noconfirm
RUN pacman -S base-devel --noconfirm

# 安装zsh
RUN echo $SHELL \
    && pacman -S zsh --noconfirm

# 安装vncserver
RUN pacman -S tigervnc --noconfirm

# 创建普通用户
RUN useradd --create-home --no-log-init --shell /bin/zsh -G root terwer
RUN echo 'terwer:123456' | chpasswd
# root密码
RUN echo 'root:password' | chpasswd

# ==========================
# zsh以及环境变量
# ==========================
# 给root用户安装oh-my-zsh
RUN git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && git clone https://gitee.com/playerfs/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://gitee.com/playerfs/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc \
    && chsh -s /bin/zsh

USER terwer
# 为普通用户再安装一次oh-my-zsh
RUN git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && git clone https://gitee.com/playerfs/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://gitee.com/playerfs/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc
# 添加自定义环境变量
RUN echo "source /config/my_profile.sh" >> ~/.zshrc

USER root
# =================================
# 安装大型软件包（桌面、vncserver等）
# =================================
# 安装xfce4桌面
RUN pacman -S xfce4 --noconfirm
# 安装浏览器
RUN pacman -S firefox --noconfirm

# =============================
# 安装其他软件（一般小型软件）
# =============================
# 压缩软件、浏览器等
RUN pacman -S zip unzip --noconfirm
# 解决中文乱码问题
RUN pacman -S wqy-microhei \
    wqy-microhei-lite \
    wqy-bitmapfont \
    wqy-zenhei \
    ttf-arphic-ukai \
    ttf-arphic-uming \
    adobe-source-han-sans-cn-fonts \
    adobe-source-han-serif-cn-fonts \
    noto-fonts-cjk --noconfirm
# firefox乱码问题    
RUN pacman -S firefox-i18n-zh-cn --noconfirm

# 中文语言包
# RUN pacman -S kde-l10n-zh_cn


# =================================
# 从这里开始操作不再拥有root权限
# =================================
# 切回普通用户
USER terwer

# 启动入口
COPY ./entrypoint.sh /entrypoint.sh
CMD ["zsh", "/entrypoint.sh"]