use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/base')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('BASE_Y.DWG')->s,
);
is($obj->header->insertion_base->y, 123456789.1234, 'Insertion base (y) (123456789.1234)');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('BASE_X.DWG')->s,
);
is($obj->header->insertion_base->y, 0, 'Insertion base (y) (0)');
