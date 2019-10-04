#!/bin/sh

# either comes from first argument or from /dev/stdin.
# $0 /path/file
# $0 < /path/file
# echo "my content" | $0
[ $# -ge 1 -a -f "$1" ] && input="$1" || input="-"

cat ${input} | perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' | perl -pe 's/\$(\{)?([a-zA-Z_]\w*)(?(1)\})/$ENV{$2}/g'

# Only substitute variable that are defined perl -pe 's{\$(\{)?(\w+)(?(1)\})}{$ENV{$2} // $&}ge'