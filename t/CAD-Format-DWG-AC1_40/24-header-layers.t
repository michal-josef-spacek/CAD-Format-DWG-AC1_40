use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/layer')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('COLOR1.DWG')->s,
);
my $ret_ar = $obj->header->layers;
my $right_ret_ar = [0, 1, (255) x 126];
is_deeply($ret_ar, $right_ret_ar, '128 layer colors (second 1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('COLOR127.DWG')->s,
);
$ret_ar = $obj->header->layers;
$right_ret_ar = [0, 127, (255) x 126];
is_deeply($ret_ar, $right_ret_ar, '128 layer colors (second 127).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LAYER1.DWG')->s,
);
$ret_ar = $obj->header->layers;
$right_ret_ar = [0, 15, 15, 15, (255) x 124];
is_deeply($ret_ar, $right_ret_ar, '128 layer colors (second to fifth 15).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LAYER3.DWG')->s,
);
$ret_ar = $obj->header->layers;
$right_ret_ar = [128, 15, (255) x 126];
is_deeply($ret_ar, $right_ret_ar, '128 layer colors (first 128, second 15).');
