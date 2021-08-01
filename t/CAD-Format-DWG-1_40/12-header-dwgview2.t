use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3 ;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/dwgview')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DWGVIEW1.DWG')->s,
);
my $dwgview2 = unpack 'd<', $obj->header->dwgview2;
is($dwgview2, 4.63481781376518, 'Dwgview 2 (4.63481781376518).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('DWGVIEW2.DWG')->s,
);
$dwgview2 = unpack 'd<', $obj->header->dwgview2;
is($dwgview2, 95366620.9098977, 'Dwgview 2 (95366620.9098977).');
