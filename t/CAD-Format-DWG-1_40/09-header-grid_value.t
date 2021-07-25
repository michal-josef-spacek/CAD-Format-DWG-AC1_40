use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Data::IEEE754 qw(unpack_double_be);
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/grid')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('GRID_ON.DWG')->s,
);
my $rev_grid_value = reverse $obj->header->grid_value;
my $grid_value = unpack_double_be($rev_grid_value);
is($grid_value, 0, 'Grid on default value (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('GRID_OFF.DWG')->s,
);
$rev_grid_value = reverse $obj->header->grid_value;
$grid_value = unpack_double_be($rev_grid_value);
is($grid_value, 0, 'Grid on default value (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('GRID_BIG.DWG')->s,
);
$rev_grid_value = reverse $obj->header->grid_value;
$grid_value = unpack_double_be($rev_grid_value);
is($grid_value, 123456789.1234, 'Grid big value (123456789.1234).');
