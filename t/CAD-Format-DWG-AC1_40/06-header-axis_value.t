use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/axis')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_ON.DWG')->s,
);
my $axis_value = unpack 'd<', $obj->header->axis_value;
is($axis_value, 0, 'Axis value (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_OFF.DWG')->s,
);
$axis_value = unpack 'd<', $obj->header->axis_value;
is($axis_value, 0, 'Axis value (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_0.DWG')->s,
);
$axis_value = unpack 'd<', $obj->header->axis_value;
is($axis_value, 0, 'Axis value (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_1.DWG')->s,
);
$axis_value = unpack 'd<', $obj->header->axis_value;
is($axis_value, 1, 'Axis value (1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_BIG.DWG')->s,
);
$axis_value = unpack 'd<', $obj->header->axis_value;
is($axis_value, 123456789.1234, 'Axis value (123456789.1234).');
