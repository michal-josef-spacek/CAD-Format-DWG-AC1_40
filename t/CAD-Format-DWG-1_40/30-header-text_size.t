use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/text_size')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('TXTSIZE.DWG')->s,
);
my $text_size = unpack 'd<', $obj->header->text_size;
is($text_size, 0.200000, 'Text size is 0.2.');
