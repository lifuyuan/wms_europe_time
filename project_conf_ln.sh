#/bin/bash
# 此脚本需在 工程当前目录下执行

# 函数需在调用前 进行申明
# 判断源文件是否存在,存在则备份目标文件并进行软连接
# $1 - 源文件, 需使用路径
function cpAndBak()
{
        if [ -f $1 ];then
                mv $2 $2.ln.bak
                ln -s $1 $2
        else
                echo "no file $1"
        fi
}

# 获取前缀目录
if [ ! -n "$1" ] ;then
        pre_dir=`pwd`/../project_config
else
        pre_dir=$1
fi

# 工程暂无配置文件
