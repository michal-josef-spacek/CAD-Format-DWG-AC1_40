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
is($obj->header->axis_value->x, 0, 'Axis value x (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_OFF.DWG')->s,
);
is($obj->header->axis_value->x, 0, 'Axis value x (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_0.DWG')->s,
);
is($obj->header->axis_value->x, 0, 'Axis value x (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_1.DWG')->s,
);
is($obj->header->axis_value->x, 1, 'Axis value x (1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('AXIS_BIG.DWG')->s,
);
is($obj->header->axis_value->x, 123456789.1234, 'Axis value x (123456789.1234).');
