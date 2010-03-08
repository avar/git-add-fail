#!/bin/bash

# help = <<EOF
#  git bisect start
#  git bisect bad
#  git bisect good v1.6.3
#  git bisect run ~/g/git-add-fail/bisect.sh
# EOF

git clean -dxf > /dev/null

make prefix=/usr all > /dev/null 2>&1

GIT=/home/avar/git/git prove ~/g/git-add-fail/add-fail.t | grep ^Result
ret=$?

git clean -dxf > /dev/null

exit $ret
