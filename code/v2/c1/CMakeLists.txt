cmake_minimum_required(VERSION 3.10)

project(CALC)

# 用set定义源文件变量
#set(SRC ../v1/add.cpp ../v1/div.cpp ../v1/main.cpp)

# 文件搜索
#aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

# 包含头文件
set(INCLUDE ${PROJECT_SOURCE_DIR}/include)
include_directories(${INCLUDE})

# 生成
add_library(calc SHARED ${SRC})
