#!/bin/bash

help = <<EOF
 git bisect start
 git bisect bad
 git bisect good v1.6.3
 git bisect run ~/g/git-add-fail/bisect.sh
EOF

git clean -dxf

make prefix=/usr all

GIT=$PWD/git prove ~/g/git-add-fail/add-fail.t
ret=$?

git clean -dxf

exit $ret
