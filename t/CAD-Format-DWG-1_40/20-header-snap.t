use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/snap')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SNAP_ON.DWG')->s,
);
is($obj->header->snap, 1, 'Snap on.');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SNAP_OFF.DWG')->s,
);
is($obj->header->snap, 0, 'Snap off.');
