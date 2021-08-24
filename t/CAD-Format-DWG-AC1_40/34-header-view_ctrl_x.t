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
my $view_ctrl_x = unpack 'd<', $obj->header->view_ctrl_x;
is($view_ctrl_x, 6, 'View ctrl x (6).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('VIEW2.DWG')->s,
);
$view_ctrl_x = unpack 'd<', $obj->header->view_ctrl_x;
is($view_ctrl_x, 0, 'View ctrl x (0).');
