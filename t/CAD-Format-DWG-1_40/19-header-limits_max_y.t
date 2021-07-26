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
my $rev_limits_max_y = reverse $obj->header->limits_max_y;
my $limits_max_y = unpack_double_be($rev_limits_max_y);
is($limits_max_y, 9, 'Limits max y (9).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
$rev_limits_max_y = reverse $obj->header->limits_max_y;
$limits_max_y = unpack_double_be($rev_limits_max_y);
is($limits_max_y, 9, 'Limits max y (9).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
$rev_limits_max_y = reverse $obj->header->limits_max_y;
$limits_max_y = unpack_double_be($rev_limits_max_y);
is($limits_max_y, 0, 'Limits max y (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
$rev_limits_max_y = reverse $obj->header->limits_max_y;
$limits_max_y = unpack_double_be($rev_limits_max_y);
is($limits_max_y, 123456789.1234, 'Limits max y (123456789.1234).');