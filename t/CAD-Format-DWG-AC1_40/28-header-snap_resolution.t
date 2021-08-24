use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/snap')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SNAP_ON.DWG')->s,
);
my $snap_resolution = unpack 'd<', $obj->header->snap_resolution;
is($snap_resolution, 1, 'Snap on default value.');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SNAP_OFF.DWG')->s,
);
$snap_resolution = unpack 'd<', $obj->header->snap_resolution;
is($snap_resolution, 1, 'Snap off default value.');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SNAP_BIG.DWG')->s,
);
$snap_resolution = unpack 'd<', $obj->header->snap_resolution;
is($snap_resolution, 123456789.1234, 'Snap value 123456789.1234.');
