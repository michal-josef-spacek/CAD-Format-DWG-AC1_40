use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Data::IEEE754 qw(unpack_double_be);
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/drawing')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DRAWING.DWG')->s,
);
my $rev_drawing_second_y = reverse $obj->header->drawing_second_y;
my $drawing_second_y = unpack_double_be($rev_drawing_second_y);
is($drawing_second_y, 4, 'Drawing second y (4).');
