#!/bin/bash
set -e

if test $# != 2; then
    echo "usage: $0 from_str to_str"
    exit 1
fi

fromStr=$1
toStr=$2

originFileNames=`ls`

for name in $originFileNames; do
    newName=${name/$fromStr/$toStr}
    test $name != $newName && mv $name $newName
done