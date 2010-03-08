#!/bin/bash

# help = <<EOF
#  git bisect start
#  git bisect bad
#  git bisect good v1.6.3
#  git bisect run ~/g/git-add-fail/bisect.sh
# EOF

echo "Cleaning up .."
git clean -dxf > /dev/null

echo "Compiling .."
make prefix=/usr all # > /dev/null 2>&1

echo "Testing .."
prove ~/g/git-add-fail/add-fail.t
ret=$?

echo "Cleaning up again .."
git clean -dxf > /dev/null

exit $ret
