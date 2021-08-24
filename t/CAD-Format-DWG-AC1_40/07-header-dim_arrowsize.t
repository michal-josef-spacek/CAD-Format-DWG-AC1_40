use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/dim_arrowsize')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('DA1.DWG')->s,
);
my $dim_arrowsize = unpack 'd<', $obj->header->dim_arrowsize;
is($dim_arrowsize, 0, 'Dimension arrow size (0 - default).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('DA2.DWG')->s,
);
$dim_arrowsize = unpack 'd<', $obj->header->dim_arrowsize;
is($dim_arrowsize, 1.2345, 'Dimension arrow size (1.2345).');
