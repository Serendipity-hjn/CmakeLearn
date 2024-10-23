cmake_minimum_required(VERSION 3.15)
project(calc)

# 搜索源文件
aux_source_directory(./ SRC)
include_directories(${HEADPATH})
set(LIBRARY_OUTPUT_PATH ${LIBPATH})
add_library(${CALCLIB} SHARED ${SRC})