use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('blank')->file('BLANK.DWG')->s,
);
is($obj->header->number_of_entities, 0, 'Zero entities (blank file).');
$data_dir->up;

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('entity')->dir('line')->file('LINE1.DWG')->s,
);
is($obj->header->number_of_entities, 1, '1 entity (one line).');
$data_dir->up(2);

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->dir('entity')->dir('line')->file('LINE2.DWG')->s,
);
is($obj->header->number_of_entities, 262, '262 entities (lines).');
$data_dir->up(2);
