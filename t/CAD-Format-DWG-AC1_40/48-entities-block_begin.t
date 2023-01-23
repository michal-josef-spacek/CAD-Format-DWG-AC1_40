use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/block')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $block_begin1_common = $entity1->entity_common;
is($block_begin1_common->entity_type, 12, 'Get entity type (12).');
is($block_begin1_common->layer, 1, 'Block begin layer (1).');
my $block_begin1_data = $entity1->data;
my $size = $block_begin1_data->name_size;
is($size, 5, 'Block begin name size (5).');
my $value = $block_begin1_data->name;
is($value, 'POINT', 'Block begin name (POINT).');
is($block_begin1_data->x, 1, 'Block begin x (1).');
is($block_begin1_data->y, 1, 'Block begin y (1).');
my $entities = @{$obj->entities};
is($entities, 3, 'Number of entities (3).');
