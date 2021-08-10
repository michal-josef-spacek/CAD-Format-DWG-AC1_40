use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/units')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC0.DWG')->s,
);
is($obj->header->linear_units_precision, 0, 'Linear units precision (0).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC1.DWG')->s,
);
is($obj->header->linear_units_precision, 1, 'Linear units precision (1).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC8.DWG')->s,
);
is($obj->header->linear_units_precision, 8, 'Linear units precision (8).');
