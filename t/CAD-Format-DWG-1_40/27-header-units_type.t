use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/units')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS1.DWG')->s,
);
is($obj->header->units_type, 1, 'Units type is 1.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS2.DWG')->s,
);
is($obj->header->units_type, 2, 'Units type is 2.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS3.DWG')->s,
);
is($obj->header->units_type, 3, 'Units type is 3.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('UNITS4.DWG')->s,
);
is($obj->header->units_type, 4, 'Units type is 4.');
