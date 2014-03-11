# 《gcc五分钟系列》第五节：稍微多说点目标文件

上一节，我们讲到目标文件。
那么目标文件究竟是什么？
为什么通过目标文件能够实现多文件编程？

说一下我个人的理解：

## 编译

编译器将源文件编译成目标文件。
它会进行基本的类型检查。

以这个代码为例说明：

    class Foo{
    public:
        int data()const{
            return this->_data;
        }
        void set_data(data){
            this->_data = data;
        }
    private:
        int _data;
    }

    int bar(Foo* foo, int data){
        int origin_data = foo->data();
        foo->set_data(data);
        return origin_data;
    }

这个代码编译是没有问题的。
（当然链接的时候会报错，说没有main函数）。

但是如果只声明Foo而没有写它的定义会怎样呢？

    class Foo;
    int bar(Foo* foo, int data){
        int origin_data = foo->data();
        foo->set_data(data);
        return origin_data;
    }

编译器会报错，说找不到`类型Foo`的定义。

为什么一定要有`Foo`的定义呢？
因为编译器需要知道：

1. Foo有没有data的set_data这两个方法。
2. data和set_data这两个方法的参数类型和返回值类型是什么。

有了这两点，编译器才能对`bar`这个函数的函数体做类型检查。

但是如果`bar`这个函数没有函数体呢？
或者说`bar`也只是一个声明，而不是定义，会怎么样呢？

    class Foo;
    int bar(Foo* foo, int data);

这个代码就不会有编译错误。

实际工程中这种做法很常用。
比如把类型的声明和函数的声明写在`a.h`里面，
把实现写在`a.cpp`里面。

如果`b.cpp`需要使用`a.h`中的类型和函数，
它只需要`#include "a.h"`一下就好了。

由于`a.h`只包含声明，
这个文件会比较短。
这样会加快`b.cpp`的编译速度。

这样的技术叫做`前向声明`。

## 链接

前面的例子，`b.cpp`会编译成目标文件`b.o`，
但是由于`b.cpp`没有`bar`函数的定义，
所以`b.o`里面会记录着：

> 我需要`bar`的定义。

那么同时，`a.cpp`也会编译成目标文件`a.o`，
它里面包含`bar`函数的定义，
所以`a.o`里面会记录着：

> 我提供`bar`的定义。

最终在链接的时候，
将`a.o`和`b.o`链接起来，
它们就幸福地生活在了一起。
