#!/bin/bash

# 删除旧版docker
yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-selinux \
           docker-engine-selinux \
           docker-engine

# 安装依赖包
yum install yum-utils \
    device-mapper-persistent-data \
    lvm2

# 添加国内镜像源
yum-config-manager add-repo https://mirrors.ustc.edu.cn/docker-ce/linux/centos/docker-ce.repo

# 更新软件源缓存以及安装docker-ce
yum makecache safe
yum install docker-ce

# 查看docker版本
echo "docker的版本"
docker -v

# docker运行命令
if [ $1 == 'start' ]; then
    echo "docker start";
    systemctl start docker;
elif [ $1 = 'always' ]; then
  echo "docker start always";
  systemctl start docker;
  systemctl enable docker;
fi

    echo "Failed"
fi