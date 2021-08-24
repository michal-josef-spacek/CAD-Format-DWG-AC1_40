use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/trace_width')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TRWIDTH1.DWG')->s,
);
my $trace_width = unpack 'd<', $obj->header->trace_width;
is($trace_width, 0.05, 'Trace width is 0.05.');
