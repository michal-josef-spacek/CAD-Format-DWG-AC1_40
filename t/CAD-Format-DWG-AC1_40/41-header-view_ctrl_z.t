use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3 ;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/view')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->header->view_ctrl_z, 0, 'View ctrl z (0).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('VIEW2.DWG')->s,
);
is($obj->header->view_ctrl_z, 0, 'View ctrl z (0).');
