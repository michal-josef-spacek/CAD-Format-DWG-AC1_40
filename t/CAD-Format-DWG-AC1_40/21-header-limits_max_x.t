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
my $limits_max_x = unpack 'd<', $obj->header->limits_max_x;
is($limits_max_x, 12, 'Limits max x (12).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
$limits_max_x = unpack 'd<', $obj->header->limits_max_x;
is($limits_max_x, 12, 'Limits max x (12).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
$limits_max_x = unpack 'd<', $obj->header->limits_max_x;
is($limits_max_x, 123456789.1234, 'Limits max x (123456789.1234).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
$limits_max_x = unpack 'd<', $obj->header->limits_max_x;
is($limits_max_x, 0, 'Limits max x (0).');
