#!/usr/bin/env perl
use 5.10.0;
use autodie qw[ :all ];
use strict;
use warnings;
use FindBin qw[$Bin];
use Test::More tests => 3;

my $git     = '/home/avar/g/git/git';
my $git_add = '/home/avar/g/git/git-add';

chdir $Bin;
system qq[rm -rf file dir];
system qq[touch file && mkdir -p dir/dir/dir && touch dir/file dir/dir/dir/file];

diag("Testing git version " . qx[ $git --version ]);

my $add_file = qx[ $git_add file 2>&1 ];
like($add_file, qr/The following paths are ignored/, "./file is ignored");

my $add_dir_file = qx[ $git_add dir/file 2>&1 ];
like($add_dir_file, qr/The following paths are ignored/, "./dir/file is ignored");

my $add_dir_dir_file = qx[ $git_add dir/dir/dir/file 2>&1 ];
like($add_dir_dir_file, qr/The following paths are ignored/, "./dir/dir/dir/file is ignored");

system qq[rm -rf file dir];
__END__
git bisect start
git bisect bad
git bisect good v1.6.3
git bisect run ~/g/git-add-fail/bisect.sh
