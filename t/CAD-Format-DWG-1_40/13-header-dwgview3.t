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
my $dwgview3 = unpack 'd<', $obj->header->dwgview3;
is($dwgview3, 9.26963562753036, 'Dwgview 3 (9.26963562753036).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DWGVIEW2.DWG')->s,
);
$dwgview3 = unpack 'd<', $obj->header->dwgview3;
is($dwgview3, 190733241.819795, 'Dwgview 3 (190733241.819795).');
