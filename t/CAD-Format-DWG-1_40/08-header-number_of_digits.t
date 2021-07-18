use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/units')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC0.DWG')->s,
);
is($obj->header->number_of_digits, 0, 'Number of digits is 0.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC1.DWG')->s,
);
is($obj->header->number_of_digits, 1, 'Number of digits is 1.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DEC8.DWG')->s,
);
is($obj->header->number_of_digits, 8, 'Number of digits is 8.');
