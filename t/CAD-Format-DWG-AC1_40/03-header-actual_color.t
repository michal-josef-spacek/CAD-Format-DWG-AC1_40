use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/layer')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('COLOR1.DWG')->s,
);
is($obj->header->actual_color, 1, 'Actual color 1 (minimum).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('COLOR2.DWG')->s,
);
is($obj->header->actual_color, 2, 'Actual color 2.');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('COLOR127.DWG')->s,
);
is($obj->header->actual_color, 127, 'Actual color 127 (maxium).');
