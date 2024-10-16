cmake_minimum_required(VERSION 3.10)

project(calc)

# 用set定义源文件变量
#set(SRC ../v1/add.cpp ../v1/div.cpp ../v1/main.cpp)

# 文件搜索
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# 包含头文件
include_directories(${PROJECT_SOURCE_DIR}/include)

# 指定库的输出地址
#set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# 生成
#add_library(calc STATIC ${SRC})

# 链接静态库 clac是自定义库的名字，完整名字是libcalc.a
link_libraries(calc)
# 库的位置
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib1)

# 生成可执行程序
add_executable(app ${SRC})