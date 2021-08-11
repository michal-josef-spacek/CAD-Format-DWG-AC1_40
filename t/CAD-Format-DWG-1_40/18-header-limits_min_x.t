use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/limits')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM1.DWG')->s,
);
my $limits_min_x = unpack 'd<', $obj->header->limits_min_x;
is($limits_min_x, -123456789.1234, 'Limits min x (-123456789.1234).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
$limits_min_x = unpack 'd<', $obj->header->limits_min_x;
is($limits_min_x, 0, 'Limits min x (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
$limits_min_x = unpack 'd<', $obj->header->limits_min_x;
is($limits_min_x, -1, 'Limits min x (-1).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
$limits_min_x = unpack 'd<', $obj->header->limits_min_x;
is($limits_min_x, -1, 'Limits min x (-1).');
