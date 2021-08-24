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
is($entity1->entity_type, 12, 'Get entity type (12).');
my $block_begin1_data = $entity1->data;
is($block_begin1_data->layer, 1, 'Block begin layer (1).');
my $size = $block_begin1_data->size;
is($size, 5, 'Block begin name size (5).');
my $value = $block_begin1_data->value;
is($value, 'POINT', 'Block begin name (POINT).');
my $x = unpack 'd<', $block_begin1_data->x;
is($x, 1, 'Block begin x (1).');
my $y = unpack 'd<', $block_begin1_data->y;
is($y, 1, 'Block begin y (1).');
my $entities = @{$obj->entities};
is($entities, 3, 'Number of entities (3).');
