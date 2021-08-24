use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/dim_text_outside_of_dimension')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('D1.DWG')->s,
);
is($obj->header->dim_text_outside_of_dimension, 1, 'Dimension text outside of dimension (1 - default).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('D2.DWG')->s,
);
is($obj->header->dim_text_outside_of_dimension, 0, 'Dimension text outside of dimension (0).');
