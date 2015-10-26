# 第十五节：预编译期选项（二）：D

## debug版和release版

一般我们在开发项目时，都会做两个版本，一个debug版，一个release版。

通常我们在debug版本中会加入调试输出，方便查找BUG。

而在release版本中，删除这些输出，以提高执行速度并减少可执行文件的大小。

实现的方式是通过宏。

以一个简单的函数为例，这个函数仅仅输出参数的值。但在debug版本中，输出一些多余的信息，比如函数名。

## 例1

    #define __DEBUG__

    void output(int a){
    #ifdef __DEBUG__
        cerr<<"this is debug infor : "<<__FUNCTION__<<' '<<a<<endl;
    #endif
        cout<<a<<endl;
    }

如此，将#define __DEBUG__注释掉就是release版本。

但是在一个大工程中，我们将所有的#define __DEBUG__注释掉是一件非常痛苦的事情。

## 例2

gcc提供了一种简单的方法，可以在编译时添加一些宏定义。使用-D选项。

代码如下：

    void output(int a){
    #ifdef __DEBUG__
        cerr<<"this is debug infor : "<<__FUNCTION__<<' '<<a<<endl;
    #endif
        cout<<a<<endl;
    }

我们用`g++ main.cpp -D__DEBUG__`编译出来的就是debug版本，用`g++ main.cpp`编译出来的就是release版本。

## 扩展：

linux内核的部分编译配置选项就是通过-D来设置的，如此，我们不需要修改源代码，
只需要修改参数就可以编译出不同配置的linux内核。

## 本节完。
