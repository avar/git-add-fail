#!/usr/bin/env perl
use 5.10.0;
use autodie qw[ :all ];
use strict;
use warnings;
use FindBin qw[$Bin];
use Test::More tests => 3;

my $git = $ENV{GIT} // '/home/avar/git/git';

chdir $Bin;
system qq[rm -rf file dir];
system qq[touch file && mkdir -p dir/dir/dir && touch dir/file dir/dir/dir/file];

diag("Testing git version " . qx[ $git --version ]);

my $add_file = qx[ $git add file 2>&1 ];
like($add_file, qr/The following paths are ignored/, "./file is ignored");

my $add_dir_file = qx[ $git add dir/file 2>&1 ];
like($add_dir_file, qr/The following paths are ignored/, "./dir/file is ignored");

my $add_dir_dir_file = qx[ $git add dir/dir/dir/file 2>&1 ];
like($add_dir_dir_file, qr/The following paths are ignored/, "./dir/dir/dir/file is ignored");

system qq[rm -rf file dir];
