##### git的使用

>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月6日



```
分布式版本控制系统 --社会化编程
Git/Mercurial
 
集中式的版本控制系统  --需要中央服务器
Subversion

gitlib服务器

github 最大的代码服务器

coding.net
github.com

git config --global core.quotepath false 

```

### windows

```
查看git的版本
MacBook-Pro:~ li$ git --version

变成仓库命令:
$ git init
创建好后显示:
Initialized empty Git repository in /Users/lizhonglin/Desktop/hello/.git/

把文件纳入版本控制
git add 文件名
git add .     表示把当前文件夹下面的所有文件都纳入版本控制

git commit -m '写原因'    添加文件仓库

git status   查看状态

git log   查看提交的历史版本
git log --pertty=oneline   单行显示版本

git reset --hard  927185c245d4a2c0092ec8f84c34d875539be1be       回到历史版本

git reflog   显示已经撤销的版本

git checkout --        撤回暂存区内容  (加上文件名可以撤回文件)


克隆
git clone url   
  输入用户名
  密码
  
  
  
 git push origin master    推送到远端    origin是项目原始名字  master 组分支
 
 git pull  在服务器修改了 在同步到本地
 
 
 
 
 本地仓库上传上去
 
git remote add oringin  url(如果不是远程服务器就是自己的ip或者主机名)

git push -u  origin master                 -u表示和远端的仓库对应的(第一次要添加)
 
     
```

### 流程

```
本地建仓库再托管到远端服务器
mkdir hello
cd hello
------------------------------
git init
git add .
git status
git commit -m 'xyz'
git log
git reset --hard id
git reflog
git remote add origin <url>
git push -u origin master
git pull

远端服务器项目已经存在
git clone <url>
cd hello
git add .
git checkout --
git commit -m 'abc'
git push origin master
git pull
```

### 公司的项目流程

```
添加新分支

git branch  cool—function   创建分支

git branch   查看分支

git checkout  cool—function    切换到新的cool分支

git rm 文件    删除文件


重点：
合并
切换到master
git checkout  master

git merge  cool—function    合并分支到master

git push origin master   更新


有冲突只有人为协商解决

```

```
Git日常工作流程
git clone <url>
cd <dir>
git branch <name>
git checkout <name>
----------------------
git add .
git commit -m 'xyz'
git push origin <name>
----------------------
git checkout master
git merge <name>
git push origin master
```

```
jekyll  生产静态页面
hexo    生成静态页面 （更漂亮）

```



###### error解决方法

问题:Updates were rejected because the tip of your current branch is behind

有如下几种解决方法：

1.使用强制push的方法：

$ git push -u origin master -f


这样会使远程修改丢失，一般是不可取的，尤其是多人协作开发的时候。

2.push前先将远程repository修改pull下来

$ git pull origin master

$ git push -u origin master

3.若不想merge远程和本地修改，可以先创建新的分支：

$ git branch [name]

然后push

$ git push -u origin [name]





