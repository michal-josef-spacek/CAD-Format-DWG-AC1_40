use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_insert')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_INS.DWG')->s,
);
my $entity1 = $obj->entities->[4];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $insert1_common = $entity1->entity_common;
is($insert1_common->entity_type, -14, 'Get entity type (-14).');
is($insert1_common->layer, 1, 'Insert layer (1).');
my $insert1_data = $entity1->data;
my $size = $insert1_data->size;
is($size, 4, 'Insert name size (4).');
my $value = $insert1_data->value;
is($value, 'LINE', 'Insert name (LINE).');
is($insert1_data->x, 0, 'Insert x (0).');
is($insert1_data->y, 0, 'Insert y (0).');
is($insert1_data->x_scale, 2, 'Insert x scale (2).');
is($insert1_data->y_scale, 2, 'Insert y scale (2).');
is($insert1_data->rotation_angle, 0, 'Insert rotation angle in radians (0).');
my $entities = @{$obj->entities};
is($entities, 8, 'Number of entities (8).');
