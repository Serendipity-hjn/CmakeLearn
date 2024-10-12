
# 注释
注释用`#`，注释块用`#[[]]`

# 一些简单命令
1. `cmake_minimum_required(VERSION 3.10)`：指定CMake的最低版本要求，（可选，但一般最好加上）

2. `project`：定义工程名称
```CMake
project(<project_name>
        [VERSION <major>[.<minor>[.<patch>[.<tweak>]]]]
        [DESCRIPTION <project_description>]
        [HOMEPAGE_URL <url>]
        [LANGUAGES <language-name>...])

```
参数说明：
>`<project_name>`：项目的名称 <br>
`VERSION`：项目的版本号，可以包含主版本号、次版本号、补丁号和调整号。<br>
`DESCRIPTION`：项目的简短描述。<br>
`HOMEPAGE_URL`：项目的官方网站或文档链接。<br>
`LANGUAGES`：指定项目使用的编程语言，默认是 C 和 CXX。

3. `add_executable`：定义用于定义一个**可执行程序**
```CMake
add_executable (可执行程序 源文件)
```
* 这里的可执行程序的名称和`project`的项目名称没有任何关系。
* 源文件可以有多个，可以用空格或者`;`分开。

```bash
$tree
.
├── CMakeLists.txt
├── add.cpp
├── app
├── div.cpp
├── head.h
└── main.cpp
```

`CMakeLists.txt`
```bash
cmake_minimum_required(VERSION 3.10)

project(First)

add_executable(app add.cpp div.cpp main.cpp)
```

4. 执行CMake命令
```bash
# .表示当前文件
$cmake .
```
但是发现在当前目录下cmake，会生成一堆文件，不便于查看，所以可以新建一个文件夹，专门用来存放cmake生成的文件。

`build`：这是一个文件夹，用于存放cmake生成的文件。
```bash
$mkdir build
$cd build
# ..表示上一级
$cmake ..
```

要关注的是`MakeFile`文件
TODO 图片更换
<img src="/image/MakeFile.png" alt="示例图片" >


因为还要通过MakeFile文件来生成对应的可执行程序

```bash
$make
```
![alt text](/image/app.png)
生成了可执行程序app
