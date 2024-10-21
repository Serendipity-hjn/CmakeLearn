cmake_minimum_required(VERSION 3.10)

project(CALC)

# 文件搜索
#aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
message("=================")
message(${SRC})
list(REMOVE_ITEM SRC ${PROJECT_SOURCE_DIR}/src/main.cpp)
message("=================")
message(${SRC})
message("=================")

# 包含头文件
set(INCLUDE ${PROJECT_SOURCE_DIR}/include)
include_directories(${INCLUDE})

# 指定库的输出地址
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# 生成
add_library(calc STATIC ${SRC})
set(tmp hello world)
set(tmp1 ${tmp} ${SRC})
message(${tmp})
message(${tmp1})
list(APPEND tmp "xxx1" "xxx2" ${SRC})
message(${tmp})