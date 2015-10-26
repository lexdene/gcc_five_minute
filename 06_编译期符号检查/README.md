# 第六节：编译期符号检查

上一节，我们说了从源文件到目标文件的编译过程。
这一节，我想讨论一下编译期符号检查的问题。

比如，第四节的例子中，
main.cpp文件中只有sum()函数的声明、而没有定义。

> 相信您能够分辨C/C++中声明和定义的区别。

可是将main.cpp编译成main.o的过程中，没有报任何错误。

这里，我们看下面这个例子：

我们只声明了一个结构体而没有定义这个结构体，
然后定义一个这个结构体的变量。
代码：

    struct Poo;
    int main()
    {
        Poo a;
        return 0;
    }

只编译而不链接：

    g++ -c struct1.cpp

这个时候它会报错：

    struct1.cpp: In function ‘int main()’:
    struct1.cpp:4:6: error: aggregate ‘Poo a’ has incomplete type and cannot be defined

这说明，只有声明没有定义的结构体不能够定义变量。

把代码稍微改一下，定义这个结构体的一个指针：

    struct Poo;
    int main()
    {
        Poo *a;
        return 0;
    }

只编译不链接，没有任何问题。

这说明，虽然不能定义变量，但是可以定义指针。

再把代码稍微改一下，实例化一下：

    struct Poo;
    int main()
    {
        Poo *a=new Poo;
        return 0;
    }

这个时候也会报错：

    struct1.cpp: In function ‘int main()’:
    struct1.cpp:4:13: error: invalid use of incomplete type ‘struct Poo’

总结:

编译期会不会报错。
（链接期会不会报错是另外一回事了，这里不讨论）

1. 编译期不会报错的几种情况：
    1. 调用一个只有声明没有定义的函数。
    2. 定义一个只有声明没有定义的类型的指针。
    3. 使用一个只有声明没有定义的变量。
2. 编译期会报错的几种情况：
    1. 定义一个只有声明没有定义的类型的变量。
    2. 实例化一个只有声明没有定义的类型。

变量如何只声明不定义？
`int a;`就已经是定义了。
好吧，留个悬念，大家可以自己研究一下。
