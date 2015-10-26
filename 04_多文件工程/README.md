# 第四节：多文件工程

## 多文件

在写一些大型的C/C++程序的时候，
我们通常会把代码归门别类，放在多个文件中。
这样既方便查找，又方便阅读。

那么，gcc能否处理多个文件的情况呢？

答案是能，不过有一些需要注意的地方。

## 举个例子

比如我们现在有两个文件，sum.cpp和main.cpp。

其中sum.cpp中定义了一个sum函数，
main.cpp使用这个函数计算两个整数的和。

sum.cpp代码如下：

    int sum(int a, int b)
    {
        return a + b;
    }

main.cpp代码如下：

    #include <iostream>

    using namespace std;

    int sum(int a, int b);

    int main(){
        cout << sum(4, 7) << endl;
        return 0;
    }

## 怎么编译呢？

错误方法：

    g++ -o main main.cpp

如果您这样编译的话，会得到错误：

    /tmp/xxxx.o: In function `main':
    main.cpp:(.text+0xf): undefined reference to `sum(int, int)'
    collect2: ld returned 1 exit status

很明显，从错误信息的第三行可以看出来（ld），是链接时错误。

造成这个错误的原因也很简单，main.cpp里面没有sum函数的定义，所以链接器（ld）会报怨，找不到sum函数的定义。

## 目标文件

C/C++是靠目标文件（扩展名为.o的文件）来实现多文件工程的。

首先、编译器将源文件编译成目标文件。
然后、链接器将多个目标文件链接成一个可执行文件。

那么，我们用gcc该如何做呢？

### 第一步，将源文件编译成目标文件

gcc使用-c参数来指定，
我要编译的是目标文件，
不是直接生成可执行文件。

这里用到了我们上一节课讲的-o参数，
它的含义，相信您一定记得。

    g++ -c -o main.o main.cpp
    g++ -c -o sum.o sum.cpp

### 第二步，将所有的目标文件链接起来，生成可执行文件

这没有新的参数，
和最初的编译方法一样。

    g++ -o main main.o sum.o

### 执行一下试试？

    ./main

输出：

    11

## 本节完
