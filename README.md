<h1 align="center">vim开发环境配置文件-类型1 manknow</h1>
miaogx@yeah.net
2016-08-07 20:15

##【版本】
----
* v0.0.1，2016-8-07，新增。发布初始版本。

<h2 name="1">1 概述</h2>
这个是我目前正在使用vim配置文件, 主要的用处如下:
* 编辑文本文件
* 进行C语言的项目开发

<h2 name="2">2 安装</h2>
我假定你已经安装好了vim, 然后安装的步骤如下:

* 首先备份你的旧的配置文件
```
$ cd ~
$ mv .vimrc vimrc_old
$ mv .vim vim_old
```
* 克隆此配置文件并将它放在正确的地方
```
$ git clone https://github.com/xiaomiao22/xiaomiao-vim01.git
$ mv xiaomiao-vim01/.vimrc ~/.vimrc 
```
* 打开vim进行插件的安装
```
$ vim
:PluginInstall
```
4. 编译ycm
```
$ cd ~/.vim/bundle/YouCompleteMe/
$ git submodule update --init --recursive
$ ./install.sh --clang-completer
```
5. 验证
编写c文件作简单验证
```
$ vim test.c
```
编写时查看是否有补全与语法检测
```
```
#include <stdio.h>
```
int main()
{
	int i;	/*这里是否有变量未使用的提示*/
	print	/*在这里按tab键看看是否有补全提示*/

	return 0;
}
```
<h2 name="3">3 更多</h2>
* 分享是快乐, 期待与你一起完善学习工作笔记, 我的邮箱: miaogx@yeah.net
