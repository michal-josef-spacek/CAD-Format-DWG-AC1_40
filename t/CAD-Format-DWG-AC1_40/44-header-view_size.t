use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/view')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->header->view_size, 9.26963562753036, 'View size (9.26963562753036).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('VIEW2.DWG')->s,
);
is($obj->header->view_size, 190733241.819795, 'View size (190733241.819795).');
