use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/layer')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LAYER1.DWG')->s,
);
is($obj->header->actual_layer, 1, 'Actual layer 1.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LAYER2.DWG')->s,
);
is($obj->header->actual_layer, 2, 'Actual layer 2.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('LAYER127.DWG')->s,
);
is($obj->header->actual_layer, 127, 'Actual layer 127.');
