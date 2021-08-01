use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/axis')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('AXIS_ON.DWG')->s,
);
is($obj->header->axis, 1, 'Axis on.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('AXIS_OFF.DWG')->s,
);
is($obj->header->axis, 0, 'Axis off.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('AXIS_0.DWG')->s,
);
is($obj->header->axis, 1, 'Axis on.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('AXIS_1.DWG')->s,
);
is($obj->header->axis, 1, 'Axis on.');
