use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Data::IEEE754 qw(unpack_double_be);
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/snap')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SNAP_ON.DWG')->s,
);
my $rev_snap_resolution = reverse $obj->header->snap_resolution;
my $snap_resolution = unpack_double_be($rev_snap_resolution);
is($snap_resolution, 1, 'Snap on default value.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SNAP_OFF.DWG')->s,
);
$rev_snap_resolution = reverse $obj->header->snap_resolution;
$snap_resolution = unpack_double_be($rev_snap_resolution);
is($snap_resolution, 1, 'Snap off default value.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SNAP_BIG.DWG')->s,
);
$rev_snap_resolution = reverse $obj->header->snap_resolution;
$snap_resolution = unpack_double_be($rev_snap_resolution);
is($snap_resolution, 123456789.1234, 'Snap value 123456789.1234.');
