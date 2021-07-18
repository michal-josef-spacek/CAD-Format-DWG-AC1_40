use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/blank')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
my $right_ret = pack('xxxxx');
is($obj->header->zeros, $right_ret, 'Zeros (5 bytes).');
