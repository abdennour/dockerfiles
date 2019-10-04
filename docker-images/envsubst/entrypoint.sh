#!/bin/bash

# either comes from first argument or from /dev/stdin.
# $0 /path/file
# $0 < /path/file
# echo "my content" | $0
content_to_replace="${1:-/dev/stdin}"

echo -n "${content_to_replace}" | perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' | perl -pe 's/\$(\{)?([a-zA-Z_]\w*)(?(1)\})/$ENV{$2}/g'
# Only substitute variable that are defined perl -pe 's{\$(\{)?(\w+)(?(1)\})}{$ENV{$2} // $&}ge'