>作者:李忠林
>
>github: https://github.com/Leezhonglin
>
>日期: 2018年5月15日



# git构建安装



### 安装步骤

1、下载git

wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz

2、解归档

tar zxvf git-2.9.5.tar.gz

3、安装

cd git-2.9.5

./configure

make

make install



### 安装过程中出现报错，以及解决办法

#### 错误一：

usr/bin/perl Makefile.PL PREFIX='/usr/local/git' INSTALL_BASE='' --localedir='/usr/local/git/share/locale'

　　Can't locate ExtUtils/MakeMaker.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 　　/usr/share/perl5 .) at Makefile.PL line 3.

　　BEGIN failed--compilation aborted at Makefile.PL line 3.

　　make[1]: *** [perl.mak] Error 2

　　make: *** [perl/perl.mak] Error 2

#### 解决办法：

yum install perl-ExtUtils-MakeMaker package



#### 错误二：

/bin/sh: msgfmt: command not found

#### 解决办法：

yum install gettext-devel



#### 错误三：

make时出现：Can't locate ExtUtils/MakeMaker.pm in @INC

#### 解决办法：

yum -y install perl-devel perl-CPAN



#### 错误四：

make时出现：tclsh failed; using unoptimized loading

MSGFMT    po/bg.msg make[1]: *** [po/bg.msg] 错误 127

#### 解决办法：

yum install tcl  build-essential tk gettext



#### 错误五：

error： zlib.h:no such file or directory

#### 解决办法：

构建安装zlib

wget https://netix.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz

tar -vxf lib-1.2.11.tar.gz

/usr/local/src/zlib-1.2.11

构建静态库

./configure

make test

make install

构建共享库

make clean

 ./configure --shared

 make test

make install

cp zutil.h /usr/local/include

cp zutil.c /usr/local/include



#### 错误六：

configure: error: in `/root/msmtp-1.4.20':
**configure: error: no acceptable C compiler found in $PATH**See `config.log' for more details.

#### 解决办法

yum install gcc



