# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/serenNan/CMakeLearn/code/v3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/serenNan/CMakeLearn/code/v3/build

# Include any dependencies generated for this target.
include CMakeFiles/app3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/app3.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/app3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/app3.dir/flags.make

CMakeFiles/app3.dir/add.cpp.o: CMakeFiles/app3.dir/flags.make
CMakeFiles/app3.dir/add.cpp.o: /home/serenNan/CMakeLearn/code/v3/add.cpp
CMakeFiles/app3.dir/add.cpp.o: CMakeFiles/app3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/serenNan/CMakeLearn/code/v3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/app3.dir/add.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/app3.dir/add.cpp.o -MF CMakeFiles/app3.dir/add.cpp.o.d -o CMakeFiles/app3.dir/add.cpp.o -c /home/serenNan/CMakeLearn/code/v3/add.cpp

CMakeFiles/app3.dir/add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/app3.dir/add.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/serenNan/CMakeLearn/code/v3/add.cpp > CMakeFiles/app3.dir/add.cpp.i

CMakeFiles/app3.dir/add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/app3.dir/add.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/serenNan/CMakeLearn/code/v3/add.cpp -o CMakeFiles/app3.dir/add.cpp.s

CMakeFiles/app3.dir/div.cpp.o: CMakeFiles/app3.dir/flags.make
CMakeFiles/app3.dir/div.cpp.o: /home/serenNan/CMakeLearn/code/v3/div.cpp
CMakeFiles/app3.dir/div.cpp.o: CMakeFiles/app3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/serenNan/CMakeLearn/code/v3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/app3.dir/div.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/app3.dir/div.cpp.o -MF CMakeFiles/app3.dir/div.cpp.o.d -o CMakeFiles/app3.dir/div.cpp.o -c /home/serenNan/CMakeLearn/code/v3/div.cpp

CMakeFiles/app3.dir/div.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/app3.dir/div.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/serenNan/CMakeLearn/code/v3/div.cpp > CMakeFiles/app3.dir/div.cpp.i

CMakeFiles/app3.dir/div.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/app3.dir/div.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/serenNan/CMakeLearn/code/v3/div.cpp -o CMakeFiles/app3.dir/div.cpp.s

CMakeFiles/app3.dir/main.cpp.o: CMakeFiles/app3.dir/flags.make
CMakeFiles/app3.dir/main.cpp.o: /home/serenNan/CMakeLearn/code/v3/main.cpp
CMakeFiles/app3.dir/main.cpp.o: CMakeFiles/app3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/serenNan/CMakeLearn/code/v3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/app3.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/app3.dir/main.cpp.o -MF CMakeFiles/app3.dir/main.cpp.o.d -o CMakeFiles/app3.dir/main.cpp.o -c /home/serenNan/CMakeLearn/code/v3/main.cpp

CMakeFiles/app3.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/app3.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/serenNan/CMakeLearn/code/v3/main.cpp > CMakeFiles/app3.dir/main.cpp.i

CMakeFiles/app3.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/app3.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/serenNan/CMakeLearn/code/v3/main.cpp -o CMakeFiles/app3.dir/main.cpp.s

# Object files for target app3
app3_OBJECTS = \
"CMakeFiles/app3.dir/add.cpp.o" \
"CMakeFiles/app3.dir/div.cpp.o" \
"CMakeFiles/app3.dir/main.cpp.o"

# External object files for target app3
app3_EXTERNAL_OBJECTS =

app3: CMakeFiles/app3.dir/add.cpp.o
app3: CMakeFiles/app3.dir/div.cpp.o
app3: CMakeFiles/app3.dir/main.cpp.o
app3: CMakeFiles/app3.dir/build.make
app3: CMakeFiles/app3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/serenNan/CMakeLearn/code/v3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable app3"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/app3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/app3.dir/build: app3
.PHONY : CMakeFiles/app3.dir/build

CMakeFiles/app3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/app3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/app3.dir/clean

CMakeFiles/app3.dir/depend:
	cd /home/serenNan/CMakeLearn/code/v3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/serenNan/CMakeLearn/code/v3 /home/serenNan/CMakeLearn/code/v3 /home/serenNan/CMakeLearn/code/v3/build /home/serenNan/CMakeLearn/code/v3/build /home/serenNan/CMakeLearn/code/v3/build/CMakeFiles/app3.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/app3.dir/depend

