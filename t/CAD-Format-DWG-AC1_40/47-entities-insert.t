use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/block')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
my $entity1 = $obj->entities->[3];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, 14, 'Get entity type (14).');
my $insert1_data = $entity1->data;
is($insert1_data->layer, 1, 'Insert layer (1).');
my $size = $insert1_data->size;
is($size, 5, 'Insert name size (5).');
my $value = $insert1_data->value;
is($value, 'POINT', 'Insert name (POINT).');
is($insert1_data->x, 4, 'Insert x (4).');
is($insert1_data->y, 4, 'Insert y (4).');
is($insert1_data->x_scale, 1, 'Insert x scale (1).');
is($insert1_data->y_scale, 1, 'Insert y scale (1).');
is($insert1_data->rotation_angle, 0, 'Insert rotation angle in radians (0).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
