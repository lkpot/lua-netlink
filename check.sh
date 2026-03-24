#!/bin/sh

rm -rf build && cmake -B build && cmake --build build || r=1
luacheck examples || r=1
cppcheck --enable=all \
         --suppressions-list=CppCheckSuppressions.txt \
         --error-exitcode=2 \
	 src/*.c || r=1

exit $r
