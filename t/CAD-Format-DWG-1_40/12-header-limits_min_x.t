use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Data::IEEE754 qw(unpack_double_be);
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/limits')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM1.DWG')->s,
);
my $rev_limits_min_x = reverse $obj->header->limits_min_x;
my $limits_min_x = unpack_double_be($rev_limits_min_x);
is($limits_min_x, -123456789.1234, 'Limits min x (-123456789.1234).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
$rev_limits_min_x = reverse $obj->header->limits_min_x;
$limits_min_x = unpack_double_be($rev_limits_min_x);
is($limits_min_x, 0, 'Limits min x (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
$rev_limits_min_x = reverse $obj->header->limits_min_x;
$limits_min_x = unpack_double_be($rev_limits_min_x);
is($limits_min_x, -1, 'Limits min x (-1).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
$rev_limits_min_x = reverse $obj->header->limits_min_x;
$limits_min_x = unpack_double_be($rev_limits_min_x);
is($limits_min_x, -1, 'Limits min x (-1).');
