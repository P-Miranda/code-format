#!/usr/bin/env bash
#
# Run python black over all python source files
#

# python black
echo "python black formating:"
if ! command -v black &> /dev/null
then
    echo "Error: black is not installed"
    exit 1
else
    git ls-tree --full-tree -r --name-only HEAD \
        | grep "\.py$" \
        | xargs black
fi

echo "black format run complete"
exit 0
