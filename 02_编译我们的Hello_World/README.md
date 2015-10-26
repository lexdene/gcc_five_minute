# 第二节：编译我们的Hello World

## 干点啥事都得从Hello World开始，这是谁规定的？

代码：

    #include <iostream>
    using namespace std;
    int main(){
        cout<<"Hello World"<<endl;
        return 0;
    }

将上面代码保存为hello_world.cpp，然后打开终端，输入以下内容、回车：

    g++ hello_world.cpp
    ./a.out

## 解释：

1. g++是gcc套装中专用于编译C++代码的编译器
2. g++后面参数，没有选项，只有源文件：
 1. g++会将它直接从源代码编译成可执行文件
 2. 无论源文件名是什么，可执行文件的文件名肯定是a.out
3. ./a.out执行编译得到的可执行文件

## 命令行输出：

    Hello World

## 今天就到这里
