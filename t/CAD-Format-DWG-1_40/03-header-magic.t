use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('blank')->file('BLANK.DWG')->s,
);
is($obj->header->magic, 'AC1.40', 'Magic string.');
