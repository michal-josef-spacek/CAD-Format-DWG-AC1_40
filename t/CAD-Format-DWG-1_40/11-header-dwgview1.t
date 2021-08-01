use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/dwgview')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DWGVIEW1.DWG')->s,
);
my $dwgview1 = unpack 'd<', $obj->header->dwgview1;
is($dwgview1, 6, 'Dwgview 1 (6).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DWGVIEW2.DWG')->s,
);
$dwgview1 = unpack 'd<', $obj->header->dwgview1;
is($dwgview1, 0, 'Dwgview 1 (0).');
