cmake_minimum_required(VERSION 3.10)

project(calc)

# 用set定义源文件变量
#set(SRC ../v1/add.cpp ../v1/div.cpp ../v1/main.cpp)

# 文件搜索
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# 指定库的输出地址
#set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
message("-------------------")
include_directories(${PROJECT_SOURCE_DIR}/include)
message(STATUS "111----------")
# 库的位置
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib2)
message(FATAL_ERROR "12312")
# 生成可执行程序
add_executable(app ${SRC})
message(STATUS "222----------")

target_link_libraries(app calc)