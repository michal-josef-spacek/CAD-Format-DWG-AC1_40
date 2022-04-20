use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 10;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/shape')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SHAPE1.DWG')->s,
);
my $entity2 = $obj->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC1_40::Entity');
my $shape1_common = $entity2->entity_common;
is($shape1_common->entity_type, 4, 'Get entity type (4).');
is($shape1_common->layer, 1, 'Shape layer (1).');
my $shape1_data = $entity2->data;
is($shape1_data->x, 0, 'Shape from x (0).');
is($shape1_data->y, 0, 'Shape from y (0).');
is($shape1_data->height, 2, 'Shape height (2).');
is($shape1_data->angle, 0.785398163397448, 'Shape angle in radians (0.785398163397448).');
my $item_num = $shape1_data->item_num;
is($item_num, 128, 'Shape item number (128).');
my $entities = @{$obj->entities};
is($entities, 2, 'Number of entities (2).');
