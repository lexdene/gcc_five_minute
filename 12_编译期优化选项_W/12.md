# 《gcc五分钟系列》第十三节：编译期优化选项（四）——W

## 优秀的程序员不应该忽略任何的warning

先看第一段代码：

    int fun(){
    }
    int main(){
        fun();
    }

很简单，对吧？

有错误吗？事实上是没有的。

编译一下：`g++ return-type.cpp`。
也没有任何问题。

可是事实上，fun函数没有return语句。

这很有可能是程序员的疏忽造成的。
而且，很多严重的问题可能就是由一些很幼小的疏忽造成的。

我们希望，gcc在遇见这类问题的时候，能够给我们一个提示。

## -W选项

还好，gcc提供了一个-W选项。
我们使用这样的命令来编译：

    g++ -Wreturn-type return-type.cpp

它仍然能够正常编译，生成可执行文件，
但是，它会输出一句warning：

    return-type.cpp: In function ‘int fun()’:
    return-type.cpp:3:1: warning: no return statement in function returning non-void

不错吧？


解释一下，-W是打开警告输出，后面接的是警告的种类。
gcc将警告分为好多种（将近一百种）。
return-type只是检查返回值类型。

## 再来一个

    //uninitialized.cpp
    int fun(){
        int a;
        return a;
    }
    int main(){
        fun();
    }

按照正常方式编译：g++ uninitialized.cpp。没有任何问题。

我们打开uninitialized种类的警告，这样编译：

    g++ -Wuninitialized uninitialized.cpp

它输出的warning是这样的：

    uninitialized.cpp: In function ‘int fun()’:
    uninitialized.cpp:4:12: warning: ‘a’ is used uninitialized in this function

## 开启全部警告

但是，种类那么多，一个一个加会不会很麻烦？

哈哈！gcc的-W选项有个种类叫all。
猜是什么意思？

打开所有种类的警告。

很方便吧？

## 强制不许忽略警告

上面只是在可能出现问题的地方输出了警告，
但是警告并不影响正常编译。

有没有办法要求必须处理掉所有的警告呢？

有。

gcc有个选项，叫-Werror。
它会把所有的警告当成错误进行处理。

## 本节完。
