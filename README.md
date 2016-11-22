<h1 align="center">vim开发环境配置文件-类型1 vim</h1>
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
* 可能的外部依赖程序, 你应该通过你的包管理系统进行安装
```
python
clang
llvm
ctags
cmake
```
* 克隆此配置文件并将它放在正确的地方
```
$ git clone https://github.com/xiaomiao22/xiaomiao-vim01.git
$ mv xiaomiao-vim01/.vimrc ~/.vimrc 
```
* 安装插件管理插件
```
$ mkdir ~/.vim/bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* 打开vim进行插件的安装
```
$ vim
:PluginInstall
```
* 编译ycm
```
$ cd ~/.vim/bundle/YouCompleteMe/
$ git submodule update --init --recursive
$ ./install.sh --clang-completer
```
* 验证
编写c文件作简单验证
```
$ vim test.c
```
编写时查看是否有补全与语法检测

```
#include <stdio.h>
int main()
{
	int i;	/*这里是否有变量未使用的提示*/
	print	/*在这里按tab键看看是否有补全提示*/

	return 0;
}
```

<h2 name="3">3 配置文件编写思路</h2>
本配置文件按照结构化程序设计的思想进行编写, 按照函数的调用去进行设计, 配置文件中将各个插件功能模块都放在一个函数中, 在下面的主控函数中依据文件开头的配置级别进行调用.


<h2 name="4">4 定义的快捷键汇总</h2>
本配置文件进行了快捷键的定义, 汇总如下:

* 关于视图相关的
```
<C-x>t   打开与关闭taglist
<C-x>f   打开与关闭NERDTree
<C-x>l   打开与关闭MiniBufExplorer
<C-x>b   打开与关闭Tagbar
<C-x>e   打开与关闭SrcExplToggle
<C-x>o   打开quickfix window
<C-x>c   关闭quickfix window
```
* 关于YCM相关的
```
<C-x>]
<C-x>\
```
* 关于搜索相关的
```
<C-s>s   开始当前目录下面的文件搜索
<C-s>f   开始指定目录下面的文件搜索
```


<h2 name="5">5 更多</h2>
* 分享是快乐, 期待与你一起完善学习工作笔记, 我的邮箱: miaogx@yeah.net
