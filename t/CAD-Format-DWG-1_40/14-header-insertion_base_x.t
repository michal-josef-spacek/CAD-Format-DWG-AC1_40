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
	$data_dir->file('BASE_X.DWG')->s,
);
my $rev_insertion_base_x = reverse $obj->header->insertion_base_x;
my $insertion_base_x = unpack_double_be($rev_insertion_base_x);
is($insertion_base_x, 123456789.1234, 'Insertion base (x) (123456789.1234)');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BASE_Y.DWG')->s,
);
$rev_insertion_base_x = reverse $obj->header->insertion_base_x;
$insertion_base_x = unpack_double_be($rev_insertion_base_x);
is($insertion_base_x, 0, 'Insertion base (x) (0).');
