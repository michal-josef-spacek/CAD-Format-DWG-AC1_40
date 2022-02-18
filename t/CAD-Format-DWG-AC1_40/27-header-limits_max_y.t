use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/limits')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM1.DWG')->s,
);
is($obj->header->limits_max->y, 9, 'Limits max y (9).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM2.DWG')->s,
);
is($obj->header->limits_max->y, 9, 'Limits max y (9).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM3.DWG')->s,
);
is($obj->header->limits_max->y, 0, 'Limits max y (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LIM4.DWG')->s,
);
is($obj->header->limits_max->y, 123456789.1234, 'Limits max y (123456789.1234).');
