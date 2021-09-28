use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/block')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
my $entity1 = $obj->entities->[2];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, 13, 'Get entity type (13).');
my $block_begin1_data = $entity1->data;
is($block_begin1_data->layer, 1, 'Block begin layer (1).');
my $entities = @{$obj->entities};
is($entities, 3, 'Number of entities (3).');
