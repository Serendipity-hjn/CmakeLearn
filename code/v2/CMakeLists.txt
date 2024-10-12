cmake_minimum_required(VERSION 3.10)

project(Second)

# 定义源文件变量
set(SRC ../v1/add.cpp ../v1/div.cpp ../v1/main.cpp)

# 定义输出的可执行文件的路径
# 绝对路径 
# set(HOME /home/serenNan/CMakeLearn/code/v2/build)
# 相对路径
set(HOME ${PROJECT_SOURCE_DIR}/build)
set(EXECUTABLE_OUTPUT_PATH ${HOME})

# 指定C++标准
set(CMAKE_CXX_STANDARD 11)

add_executable(app2 ${SRC})
