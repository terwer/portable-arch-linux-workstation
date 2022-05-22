# 构建镜像
# docker build . -t portable-mysql57:5.7.38 --force-rm --no-cache

# 运行容器
# docker run --name=portable-mysql57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 portable-mysql57:5.7.38
# docker run --name=portable-mysql57 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -d portable-mysql57:5.7.38

# 进入容器
# docker exec -it portable-mysql57 bash
# docker exec -it portable-mysql57 zsh

# 登录容器MySQL
# docker exec -it portable-mysql57 mysql -uroot -p123456
# show variables like 'character%';
# select now();

#依赖的镜像
FROM mysql/mysql-server:5.7.38

#镜像创建者的信息
MAINTAINER terwer "youweics@163.com"

# 设置编码
ENV LANG C.UTF-8

# 设置时区
# ENV TZ Asia/Shanghai
ENV TZ CST-8

# docker exec -it --user root portable-mysql57 /bin/bash
# ifconfig
# or
# docker inspect portable-mysql57-arch | grep IPAddres

# 替换配置文件
COPY ./conf/my.cnf /etc/my.cnf
# cp /var/log /mylog

CMD ["mysqld"]