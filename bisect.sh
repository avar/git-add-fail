#!/bin/bash

git clean -dxf

make prefix=/usr all

GIT=$PWD/git prove ~/g/git-add-fail/add-fail.t
ret=$?

git clean -dxf

exit $ret
