cmake_minimum_required(VERSION 3.15)
project(sort)

# 搜索源文件
aux_source_directory(./ SRC)
include_directories(${HEADPATH})
set(LIBRARY_OUTPUT_PATH ${LIBPATH})
link_directories(${LIBPATH})
add_library(${SORTLIB} STATIC ${SRC})

target_link_libraries(${SORTLIB} ${CALCLIB})
