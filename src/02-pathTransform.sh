#!/bin/bash
# 将基于一个路径的相对路径转化为基于另一个路径的相当路径


# 从文件中读取字符
paths=""

while read line
do
    paths="$paths""$line"
done<$2

# IFS是内部域分隔符，一种set变量.
oldIFS=$IFS
IFS=";"

for path in $paths
do
    cd $1
    absolute_path=$(readlink -f $path)
    result_path=$(realpath --relative-to=$absolute_path $3)

    echo "$result_path$IFS">> 02-output.txt
done

IFS=$oldIFS
exit
