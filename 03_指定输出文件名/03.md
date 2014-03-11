# 《gcc五分钟系列》第三节：指定输出文件名

上一节，我们将hello_world.cpp编译成了a.out。

可是，a.out这个名字看起来这么讨厌呢……
能不能整个别的名字呢？

答案是肯定的，方法是-o选项。

文档：（来自gcc man手册）

	-o file
           Place output in file file.  This applies regardless to whatever
           sort of output is being produced, whether it be an executable file,
           an object file, an assembler file or preprocessed C code.

           If -o is not specified, the default is to put an executable file in
           a.out, the object file for source.suffix in source.o, its assembler
           file in source.s, a precompiled header file in source.suffix.gch,
           and all preprocessed C source on standard output.

简单解释一下：

	-o选项后面得加个文件名。它能够让gcc输入到指定的文件中，无论是可执行文件、目标文件、汇编文件还是预编译C代码。

所以呢，将第二节的命令改成：

	g++ -o hello_world hello_world.cpp
	./hello_world

命令行输出同样是：

	Hello World
