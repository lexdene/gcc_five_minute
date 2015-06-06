# 《gcc五分钟系列》第十四节：预编译期选项（一）——I

## include命令

相信大家对C/C++中的`#include`指令有所了解，
相信您能够区别引号和尖括号的作用。

简单来说:

* 引号的作用：先在当前目录下搜索文件，然后在系统目录下搜索文件
* 尖括号的作用：仅在系统目录下搜索文件。

但是，如果大家做过Qt的开发，就会发现：

* 包含一个Qt库的头文件时，需要用尖括号即可。
* Qt库的头文件并不在系统目录下。

例如，我用的是ubuntu linux maverick，使用apt-get安装qt4。

以`<QObject>`这个头文件为例，它的存放路径是`/usr/include/qt4/QtCore/QObject`。

那么Qt是如何做到的呢？

## -I选项

我们可以打开qmake生成的Makefile，看到Qt在编译参数的变量中加上了这样一句：

    -I/usr/include/qt4/QtCore

这个-I是gcc的一个选项，
它的作用是把一个路径加入到系统路径，
这样当使用include指令时，
就可以用尖括号来指定文件。

那么怎么指定多个路径呢？多写几遍就可以了！

    -I/usr/share/qt4/mkspecs/linux-g++ -I../../../dgp/othello/client -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtNetwork -I/usr/include/qt4/QtGui -I/usr/include/qt4 -I../../../dgp/Dlut-Game-Platform/api/include -I../../../dgp/roommodel/include/client -I../../../dgp/roommodel/include/common -I. -I. -I../../../dgp/othello/client -I.

可以用绝对路径、相对路径。
甚至可以把当前路径加入到系统路径中，
这样就可以用尖括号来指定当前目录下的一个文件了。

## 扩展阅读：Qt的pro文件中的 qt += network 的作用

假如我要使用Qt中的`QTcpServer`这个类，
我需要写上

    #include <QtNetwork/QTcpServer>

但是如果我在.pro文件中加上

    qt += network

之后，我的代码中只需要写

    #include <QTcpServer>

就可以了。

原理是因为在加上

    qt += network

之后，Makefile中就会多出

    -I/usr/include/qt4/QtNetwork

这样一句。
## 本节完。
