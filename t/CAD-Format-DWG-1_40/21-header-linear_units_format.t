use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/units')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS1.DWG')->s,
);
is($obj->header->linear_units_format, 1, 'Linear units format (1 - scientific).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS2.DWG')->s,
);
is($obj->header->linear_units_format, 2, 'Linear units format (2 - decimal).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS3.DWG')->s,
);
is($obj->header->linear_units_format, 3, 'Linear units format (3 - engineering).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS4.DWG')->s,
);
is($obj->header->linear_units_format, 4, 'Linear units format (4 - architectural).');
