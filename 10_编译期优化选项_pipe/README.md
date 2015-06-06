# 《gcc五分钟系列》第十节：编译期优化选项（一）——pipe

## 中间文件

上一节讲到，从源代码生成最终的可执行文件需要四个步骤，并且还会产生中间文件。

可是我们在对一个源文件编译的时候，直接执行g++ xxx.cpp能够得到可执行文件a.out。
并没有中间文件啊！中间文件在哪里？

答案是，在/tmp目录下。想看吗？跟着我做。

1. 在终端中执行g++ xxx.cpp
2. 在另外一个终端中执行`ls /tmp/cc* 2>/dev/null`

看见什么了？
什么也没有啊！
说明你太慢了。

你需要在第一个命令完成前，执行第二个命令，否则什么也看不见。
你大概只有不到0.1秒的时间。

你需要在0.1秒的时间内完成

* 切换终端
* 输入命令
* 回车

这些事情，你做得到吗？

所以，
还是写一个脚本来看吧。

    #!/bin/bash
    g++ main.cpp &
    sleep 0.05
    ls --color=auto /tmp/cc*

在我的电脑上，时间是0.05的时候可以看到如下结果：

    /tmp/cc9CD8ah.o   /tmp/ccj9uXNd.s

可以看到，有.s汇编文件，.o目录文件。

所以，实际上gcc将中间文件放在了/tmp目录下，并且在编译完成后会将其删除。

## 编译优化

不得不说，
C/C++的编译速度真是慢的出奇。

如果你曾经有编译一百万行以上C++代码的经历的话，
你会知道，
电脑开机一周只是为了编译，其实不算是过分的事情。

但是如果你认为，gcc已经放弃治疗了，
那你就太误解gcc了。

C/C++中有很多技术用来提高编译速度，
比如`前向声明`。

而且gcc也提供了一些选项来加快编译速度。

回到本文一开始的话题来。
如果编译过程中产生很多临时文件的话，
那么磁盘IO将会成为编译速度的重要瓶颈。

我们需要将上一步的结果交给下一步处理，有没有什么比较快的方法？

如果您了解linux的话，会立即想到一个牛X闪闪的东西：管道。

将上一步编译的结果通过管道传递给下一步，这不需要IO操作，全部在内存中完成，
效率上会有非常大的提高。

gcc提供了这个功能，方法是使用-pipe选项。

    g++ -pipe main.cpp

下面是gcc的man手册中关于-pipe选项的解释：

    -pipe
        Use pipes rather than temporary files for communication between the
        various stages of compilation.  This fails to work on some systems
        where the assembler is unable to read from a pipe; but the GNU
        assembler has no trouble.

## 本节完
