#!/bin/bash

# either comes from first argument or from /dev/stdin.
# $0 /path/file
# $0 < /path/file
# echo "my content" | $0
file_path_or_content="${1:-/dev/stdin}"
if [[ -f "${file_path_or_content}" ]]; then
cat file_path_or_content | perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' | perl -pe 's/\$(\{)?([a-zA-Z_]\w*)(?(1)\})/$ENV{$2}/g'
else 
 echo -n "${file_path_or_content}" | perl -pe 's/\$([_A-Z]+)/$ENV{$1}/g' | perl -pe 's/\$(\{)?([a-zA-Z_]\w*)(?(1)\})/$ENV{$2}/g'
fi
# Only substitute variable that are defined perl -pe 's{\$(\{)?(\w+)(?(1)\})}{$ENV{$2} // $&}ge'