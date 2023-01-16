## shell 编程中遇到的一些坑和知识点

#### 1：在子脚本中运行的变量，当子脚本结束时间，变量将不能使用。（管道就是一种会产生子脚本的操作)

比如下面的脚本,在子脚本中利用循环拼接字符串，循环结束后echo "final paths: $paths" 输出为空,此时循环外面和循环里面的paths变量属于两个脚步中的变量，不是同一个变量.
```
paths=""
cat $1 | while read line
do
    paths="$paths""$line"
    echo "paths: $paths"
done
echo "final paths: $paths"
```
Link:https://stackoverflow.com/questions/16854280/a-variable-modified-inside-a-while-loop-is-not-remembered