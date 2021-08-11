use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/drawing')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DRAWING.DWG')->s,
);
my $drawing_first_y = unpack 'd<', $obj->header->drawing_first_y;
is($drawing_first_y, 2, 'Drawing first y (2).');
