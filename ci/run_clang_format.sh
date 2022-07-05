#!/usr/bin/env bash
#
# Run clang-format over all C/C++ source files
#

# clang-format 
#   .c .h files
echo "clang-format formating:"
if ! command -v clang-format &> /dev/null
then
    echo "Error: clang-format is not installed"
    exit 1
else
    git ls-files *.c *.h *.cpp *.hpp \
        | xargs clang-format -style=file -fallback-style=none -i -verbose
    echo "clang-format complete"
fi

echo "clang-format run complete"
exit 0
