use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/base')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BASE_X.DWG')->s,
);
my $insertion_base_x = unpack 'd<', $obj->header->insertion_base_x;
is($insertion_base_x, 123456789.1234, 'Insertion base (x) (123456789.1234)');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BASE_Y.DWG')->s,
);
$insertion_base_x = unpack 'd<', $obj->header->insertion_base_x;
is($insertion_base_x, 0, 'Insertion base (x) (0).');
