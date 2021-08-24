use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/limits')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM1.DWG')->s,
);
my $limits_min_y = unpack 'd<', $obj->header->limits_min_y;
is($limits_min_y, 0, 'Limits min y (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
$limits_min_y = unpack 'd<', $obj->header->limits_min_y;
is($limits_min_y, -123456789.1234, 'Limits min y (-123456789.1234).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
$limits_min_y = unpack 'd<', $obj->header->limits_min_y;
is($limits_min_y, -1, 'Limits min y (-1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
$limits_min_y = unpack 'd<', $obj->header->limits_min_y;
is($limits_min_y, -1, 'Limits min y (-1).');
