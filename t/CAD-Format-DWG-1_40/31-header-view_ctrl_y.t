use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3 ;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/view')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
my $view_ctrl_y = unpack 'd<', $obj->header->view_ctrl_y;
is($view_ctrl_y, 4.63481781376518, 'View ctrl y (4.63481781376518).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('VIEW2.DWG')->s,
);
$view_ctrl_y = unpack 'd<', $obj->header->view_ctrl_y;
is($view_ctrl_y, 95366620.9098977, 'View ctrl y (95366620.9098977).');
