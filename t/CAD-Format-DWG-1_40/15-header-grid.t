use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('grid')->file('GRID_ON.DWG')->s,
);
is($obj->header->grid, 1, 'Grid on.');
$data_dir->up;

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('grid')->file('GRID_OFF.DWG')->s,
);
is($obj->header->grid, 0, 'Grid on.');
$data_dir->up;
