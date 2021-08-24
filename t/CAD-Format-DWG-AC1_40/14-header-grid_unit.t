use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/grid')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('GRID_ON.DWG')->s,
);
my $grid_unit = unpack 'd<', $obj->header->grid_unit;
is($grid_unit, 0, 'Grid on default value (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('GRID_OFF.DWG')->s,
);
$grid_unit = unpack 'd<', $obj->header->grid_unit;
is($grid_unit, 0, 'Grid on default value (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('GRID_BIG.DWG')->s,
);
$grid_unit = unpack 'd<', $obj->header->grid_unit;
is($grid_unit, 123456789.1234, 'Grid big value (123456789.1234).');
