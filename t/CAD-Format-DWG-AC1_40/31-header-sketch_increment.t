use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/sketch_increment')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SKETCH1.DWG')->s,
);
is($obj->header->sketch_increment, 0.1, 'Sketch increment (default).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SKETCH2.DWG')->s,
);
is($obj->header->sketch_increment, 1.2345, 'Sketch increment (explicit value).');
