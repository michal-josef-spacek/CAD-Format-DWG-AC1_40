use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Data::IEEE754 qw(unpack_double_be);
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/base')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BASE_Y.DWG')->s,
);
my $rev_insertion_base_y = reverse $obj->header->insertion_base_y;
my $insertion_base_y = unpack_double_be($rev_insertion_base_y);
is($insertion_base_y, 123456789.1234, 'Insertion base (y) (123456789.1234)');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BASE_X.DWG')->s,
);
$rev_insertion_base_y = reverse $obj->header->insertion_base_y;
$insertion_base_y = unpack_double_be($rev_insertion_base_y);
is($insertion_base_y, 0, 'Insertion base (y) (0)');
