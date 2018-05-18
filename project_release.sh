#/bin/bash
# 此脚本需在 工程当前目录下执行

# 安装Gem包
bundle install

# 获取工程相关配置文件
if [ -f "project_conf_ln.sh" ];then
        ./project_conf_ln.sh $1
fi

# 执行数据库脚本命令
rake ar:migrate
