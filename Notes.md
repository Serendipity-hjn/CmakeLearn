
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
* 这里的可执行程序的名称和`project`的项目名称没有任何关系。<br>
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
<img src="/image/MakeFile.png" alt="生成MakeFile" >

因为还要通过MakeFile文件来生成对应的可执行程序

```bash
$make
```
<img src="/image/app.png" alt="可执行程序">
生成了可执行程序app

到此，一个简单的CMake工程就完成了。


# Set使用
通过上一个文件，如果我们工程比较大，在`add_executable`中添加的源文件比较多，那么我们就可以使用`set`来定义一个变量，然后通过`${}`来使用这个变量。

## 定义变量
将变量 VAR 的值设置为 VALUE
```CMake
# Set 指令语法
# [] 中的参数为可选项，如不需要可以不写
SET(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])

```
* `VAR`：变量名
* `VALUE`：变量值
`[]`中可能一般用不到，可忽略

```CMake
set(SRC_LIST add.c div.c main.c)
add_executable(app ${SRC_LIST})
```

## 指定使用C++标准
在编写C++程序的时候，可能会用到C++11、C++14、C++17等标准，可以通过`set`来指定使用哪个标准：

```CMake
set(CMAKE_CXX_STANDARD 11)
```

`CMAKE_CXX_STANDARD`是CMake内置的宏，用于指定C++标准。<br>
也可以通过cmake指令指定出这个宏的值

```CMake
cmake CMakeLists.txt文件路径 -DCMAKE_CXX_STANDARD=11 
```

## 指定输出的路径
在CMake中，也有一个宏`EXECUTABLE_OUTPUR_PATH`来指定输出路径，可以通过`set`来指定输出的路径。
```CMake
set(Home ${PROJECT_SOURCE_DIR}/v2)
set(EXECUTABLE_OUTPUT_PATH ${Home}/bin)
```
这里的示例是相对路径，`PROJECT_SOURCE_DIR`，指向的是当前项目的根目录。<br>
还有一个宏`CMAKE_SOURCE_DIR`指向的是最顶层的CMakeLists.txt文件所在的目录，通常是项目的根目录。<br>
在大多数情况下，`CMAKE_SOURCE_DIR` 和 `PROJECT_SOURCE_DIR` 指向的是同一个目录，即项目的根目录。
根据实际需要也可以选择绝对路径
```
/home/user/project/bin
```
* 如果对应路径不存在，会自动创建

# 搜索文件

在CMake中，当项目包含大量源文件时，手动列出所有文件既繁琐又不现实。因此，CMake提供了搜索文件的命令，如`aux_source_directory`和`file`命令。

## 方式1：使用 `aux_source_directory`


```cmake
aux_source_directory(<dir> <variable>)
```

- `dir`：要搜索的目录。
- `variable`：存储搜索到的源文件列表的变量。
  
`aux_source_directory`用于将从`dir`搜索到的路径存储到`variable`

示例：

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
include_directories(${PROJECT_SOURCE_DIR}/include)

# 搜索 src 目录下的源文件
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src SRC_LIST)
add_executable(app ${SRC_LIST})
```

## 方式2：使用 `file`

`file`命令不仅可以搜索文件，还可以执行其他操作。使用`GLOB`或`GLOB_RECURSE`选项可以搜索指定目录下的文件。

```cmake
file(GLOB/GLOB_RECURSE <variable> <search_path_and_file_type>)
```

- `GLOB`：搜索指定目录下的满足条件的文件，并将其存储到变量中。
- `GLOB_RECURSE`：递归搜索指定目录下的满足条件的文件，并将其存储到变量中。

示例：

```cmake
# 搜索当前目录的 src 目录下所有的源文件，并存储到变量中
file(GLOB MAIN_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB MAIN_HEAD ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h)
```
注意要指定搜索目录下的什么文件<br>
`CMAKE_CURRENT_SOURCE_DIR`宏表示当前访问的`CMakeLists.txt`文件所在的路径。搜索路径和文件类型可以加双引号，也可以不加：

```cmake
file(GLOB MAIN_HEAD "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h")
```

# 包含头文件

在编译项目源文件的时候，很多时候都需要将源文件对应的头文件路径指定出来，这样才能保证在编译过程中编译器能够找到这些头文件，并顺利通过编译。在 CMake 中设置要包含的目录也很简单，通过一个命令就可以搞定了，他就是 `include_directories`。

```cmake
include_directories(headpath)
```

## 举例说明

有源文件若干，其目录结构如下：

```plaintext
$ tree
.
├── build
├── CMakeLists.txt
├── include
│   └── head.h
└── src
    ├── add.cpp
    ├── div.cpp
    ├── main.cpp
    ├── mult.cpp
    └── sub.cpp

3 directories, 7 files
```

`CMakeLists.txt` 文件内容如下：

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
set(CMAKE_CXX_STANDARD 11)
set(HOME /home/robin/Linux/calc)
set(EXECUTABLE_OUTPUT_PATH ${HOME}/bin/)
include_directories(${PROJECT_SOURCE_DIR}/include)
file(GLOB SRC_LIST ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
add_executable(app  ${SRC_LIST})
```

其中，第六行指定就是头文件的路径，`PROJECT_SOURCE_DIR` 宏对应的值就是我们在使用 `cmake` 命令时，后面紧跟的目录，一般是工程的根目录。

# 制作动态库或静态库

有些时候我们编写的源代码并不需要将他们编译生成可执行程序，而是生成一些静态库或动态库提供给第三方使用。下面来讲解在 CMake 中生成这两类库文件的方法。

## 制作静态库

在 CMake 中，如果要制作静态库，需要使用的命令如下：

```cmake
add_library(库名称 STATIC 源文件1 [源文件2] ...)
```

第二个参数，如果是静态库就是`STATIC`，如果是动态库则为`SHARED`。

在 Linux 中，静态库名字分为三部分：`lib + 库名字 + .a`，此处只需要指定出库的名字就可以了，另外两部分在生成该文件的时候会自动填充。

在 Windows 中虽然库名和 Linux 格式不同，但也只需指定出名字即可。

**Windows**
- **静态库**：通常以 `.lib` 结尾，例如 `mylibrary.lib`
- **动态库**：通常以 `.dll` 结尾，例如 `mylibrary.dll`

**Linux**
- **静态库**：通常以 `.a` 结尾，例如 `libmylibrary.a`
- **动态库**：通常以 `.so` 结尾，例如 `libmylibrary.so`


### 举例说明

下面有一个目录，需要将 `src` 目录中的源文件编译成静态库，然后再使用：

```plaintext
.
├── build
├── CMakeLists.txt
├── include           # 头文件目录
│   └── head.h
├── main.cpp          # 用于测试的源文件
└── src               # 源文件目录
    ├── add.cpp
    ├── div.cpp
    ├── mult.cpp
    └── sub.cpp
```

根据上面的目录结构，可以这样编写 `CMakeLists.txt` 文件：

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
include_directories(${PROJECT_SOURCE_DIR}/include)
file(GLOB SRC_LIST "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
add_library(calc STATIC ${SRC_LIST})
```

这样最终就会生成对应的静态库文件 `libcalc.a`。

## 制作动态库

在 CMake 中，如果要制作动态库，需要使用的命令如下：

```cmake
add_library(库名称 SHARED 源文件1 [源文件2] ...)
```

在 Linux 中，动态库名字分为三部分：`lib + 库名字 + .so`，此处只需要指定出库的名字就可以了，另外两部分在生成该文件的时候会自动填充。

在 Windows 中虽然库名和 Linux 格式不同，但也只需指定出名字即可。

### 举例说明

根据上面的目录结构，可以这样编写 `CMakeLists.txt` 文件：

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
include_directories(${PROJECT_SOURCE_DIR}/include)
file(GLOB SRC_LIST "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
add_library(calc SHARED ${SRC_LIST})
```

这样最终就会生成对应的动态库文件 `libcalc.so`。



## 指定输出的路径

### 方式1 - 适用于动态库

对于生成的库文件来说和可执行程序一样都可以指定输出路径。由于在 Linux 下生成的动态库默认是有执行权限的，所以可以按照生成可执行程序的方式去指定它生成的目录：

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
include_directories(${PROJECT_SOURCE_DIR}/include)
file(GLOB SRC_LIST "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
# 设置动态库生成路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
add_library(calc SHARED ${SRC_LIST})
```

对于这种方式来说，其实就是通过 `set` 命令给 `EXECUTABLE_OUTPUT_PATH` 宏设置了一个路径，这个路径就是可执行程序生成的路径。

### 方式2 - 都适用

由于在 Linux 下生成的静态库默认不具有可执行权限，所以在指定静态库生成的路径的时候就不能使用 `EXECUTABLE_OUTPUT_PATH` 宏了，而应该使用 `LIBRARY_OUTPUT_PATH`，这个宏对应静态库文件和动态库文件都适用。

```cmake
cmake_minimum_required(VERSION 3.0)
project(CALC)
include_directories(${PROJECT_SOURCE_DIR}/include)
file(GLOB SRC_LIST "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")
# 设置动态库/静态库生成路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
# 生成动态库
#add_library(calc SHARED ${SRC_LIST})
# 生成静态库
add_library(calc STATIC ${SRC_LIST})
```

---

## 库文件的使用
要发布头文件和库文件

> 动态库和静态库本质是编译后的二进制文件，可直接供用户使用
> 所以要让别人使用时，可以只发布`include`和`lib`（预编译文件夹）目录

库文件是以二进制形式程序，有了头文件才知道调用了什么函数。<br>
在cmake中需要要使用我们的库文件，就需要链接库。

### 链接静态库

链接静态库的命令如下：
```bash
link_libraries(<static lib> [<static lib>...])
```

用于设置全局链接库，这些库会链接到之后定义的所有目标上。

- 参数1：指定出要链接的静态库的名字
  - 可以是全名 `libxxx.a`
  - 也可以是掐头（`lib`）去尾（`.a`）之后的名字 `xxx`

- 参数2-N：要链接的其它静态库的名字

如果该静态库不是系统提供的（自己制作或者使用第三方提供的静态库）可能出现静态库找不到的情况，此时可以将静态库的路径也指定出来：

```cmake
link_directories(<lib path>)
```

这样，修改之后的 `CMakeLists.txt` 文件内容如下:

```cmake
cmake_minimum_required(VERSION 3.10)

project(calc)

# 文件搜索
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# 包含头文件
include_directories(${PROJECT_SOURCE_DIR}/include)

# 链接静态库 clac是自定义库的名字，完整名字是libcalc.a
link_libraries(calc)
# 库的位置
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib1)

# 生成可执行程序
add_executable(app ${SRC})
```
> 在生成可执行程序的时候，出来要把我们的源文件指定出来，就是通过`file`搜索出来的`main.cpp`，还需要把我们生成的静态库`libcalc.a`通过`link_libraries`链接到可执行程序中。
> **如果我们使用的是静态库，那么生成可执行程序的时候，这个静态库的库文件和源文件都会被打包到可执行程序`app`，而动态库不会打包到可执行程序里面去。**
> `link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib1)`一般是自定义库，系统自带的库系统一般找得到


添加了第8行的代码，就可以根据参数指定的路径找到这个静态库了。

### 链接动态库

在程序编写过程中，除了在项目中引入静态库，好多时候也会使用一些标准的或者第三方提供的一些动态库，关于动态库的制作、使用以及在内存中的加载方式和静态库都是不同的。

在cmake中链接动态库的命令如下:

```cmake
target_link_libraries(
    <target> 
    <PRIVATE|PUBLIC|INTERFACE>
    <item> ...
)
```

用于指定一个目标（如可执行文件或库）在编译时需要链接哪些库。它支持指定库的名称、路径以及链接库的顺序。

- `target`：指定要加载的库的文件的名字
  - 该文件可能是一个源文件
  - 该文件可能是一个动态库/静态库文件
  - 该文件可能是一个可执行文件

- `PRIVATE|PUBLIC|INTERFACE`：动态库的访问权限，默认为`PUBLIC`

  - 如果各个动态库之间没有依赖关系，无需做任何设置，三者没有没有区别，**一般无需指定，使用默认的 PUBLIC 即可**。

  - **动态库的链接具有传递性**，如果动态库 A 链接了动态库B、C，动态库D链接了动态库A，此时动态库D相当于也链接了动态库B、C，并可以使用动态库B、C中定义的方法。

```Cmake
target_link_libraries(A B C)
target_link_libraries(D A)
```

- `PUBLIC`：在`public`后面的库会被`link`到前面的`target`中，并且里面的符号也会被导出，提供给第三方使用。
- `PRIVATE`：在`private`后面的库仅被`link`到前面的`target`中，并且终结掉，第三方不能感知你调了啥库
- `INTERFACE`：在`interface`后面引入的库不会被链接到前面的`target`中，只会导出符号。

### 链接系统动态库
动态库的链接和静态库是完全不同的：
- 静态库会在生成可执行程序的链接阶段被打包到可执行程序中，所以可执行程序启动，静态库就被加载到内存中了。
- 动态库在生成可执行程序的链接阶段不会被打包到可执行程序中，当可执行程序被启动并且调用了动态库中的函数的时候，动态库才会被加载到内存。

因此，在 cmake 中指定要链接的动态库的时候，**应该将命令写到生成了可执行文件之后**：

```cmake
cmake_minimum_required(VERSION 3.0)
project(TEST)
file(GLOB SRC_LIST ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
# 添加并指定最终生成的可执行程序名
add_executable(app ${SRC_LIST})
# 指定可执行程序要链接的动态库名字
target_link_libraries(app pthread)
```

在 `target_link_libraries(app pthread)` 中：
- `app`: 对应的是最终生成的可执行程序的名字
- `pthread`：这是可执行程序要加载的动态库，这个库是系统提供的线程库，全名为 `libpthread.so`，在指定的时候一般会掐头（`lib`）去尾（`.so`）。

### 链接第三方动态库
假设在测试文件 `main.cpp` 中既使用了自己制作的动态库 `libcalc.so` 又使用了系统提供的线程库，此时 `CMakeLists.txt` 文件可以这样写：

```cmake
cmake_minimum_required(VERSION 3.0)
project(TEST)
file(GLOB SRC_LIST ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
include_directories(${PROJECT_SOURCE_DIR}/include)
add_executable(app ${SRC_LIST})
target_link_libraries(app pthread calc)
```

在第六行中，`pthread`、`calc` 都是可执行程序 `app` 要链接的动态库的名字。当可执行程序 `app` 生成之后并执行该文件，会提示有如下错误信息：

```shell
$ ./app 
./app: error while loading shared libraries: libcalc.so: cannot open shared object file: No such file or directory
```

这是因为可执行程序启动之后，去加载 `calc` 这个动态库，但是不知道这个动态库被放到了什么位置解决动态库无法加载的问题，所以就加载失败了，在 CMake 中可以在生成可执行程序之前，通过命令指定出要链接的动态库的位置，指定静态库位置使用的也是这个命令：

```cmake
link_directories(path)
```

所以修改之后的 `CMakeLists.txt` 文件应该是这样的：

```cmake
cmake_minimum_required(VERSION 3.0)
project(TEST)
file(GLOB SRC_LIST ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
# 指定源文件或者动态库对应的头文件路径
include_directories(${PROJECT_SOURCE_DIR}/include)
# 指定要链接的动态库的路径
link_directories(${PROJECT_SOURCE_DIR}/lib)
# 添加并生成一个可执行程序
add_executable(app ${SRC_LIST})
# 指定要链接的动态库
target_link_libraries(app pthread calc)
```

通过 `link_directories` 指定了动态库的路径之后，在执行生成的可执行程序的时候，就不会出现找不到动态库的问题了。

### 总结
- `target_link_libraries` 是更推荐的方式，因为它允许更精确的控制和管理链接库的依赖，特别是在大型项目中，它能够避免全局设置可能带来的问题。
- `link_libraries` 虽然简单，但在复杂的项目中可能会导致意外的问题，通常适用于简单的项目或临时设置。
- 建议在 CMake 项目中优先使用 `target_link_libraries`。
```