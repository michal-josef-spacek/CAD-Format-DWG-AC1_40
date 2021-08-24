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
is($entity2->entity_type, 4, 'Get entity type (4).');
my $shape1_data = $entity2->data;
is($shape1_data->layer, 1, 'Shape layer (1).');
my $x = unpack 'd<', $shape1_data->x;
is($x, 0, 'Shape from x (0).');
my $y = unpack 'd<', $shape1_data->y;
is($y, 0, 'Shape from y (0).');
my $height = unpack 'd<', $shape1_data->height;
is($height, 2, 'Shape height (2).');
my $angle = unpack 'd<', $shape1_data->angle;
is($angle, 0.785398163397448, 'Shape angle in radians (0.785398163397448).');
my $item_num = $shape1_data->item_num;
is($item_num, 128, 'Shape item number (128).');
my $entities = @{$obj->entities};
is($entities, 2, 'Number of entities (2).');
