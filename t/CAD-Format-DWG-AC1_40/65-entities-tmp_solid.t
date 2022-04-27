use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_solid')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_SOL.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $solid1_common = $entity1->entity_common;
is($solid1_common->entity_type, -11, 'Get entity type (-11).');
is($solid1_common->layer, 1, 'Solid layer (1).');
my $solid1_data = $entity1->data;
is($solid1_data->corner1->x, 0, 'Solid corner1 x (0).');
is($solid1_data->corner1->y, 0, 'Solid corner1 y (0).');
is($solid1_data->corner2->x, 1, 'Solid corner2 x (1).');
is($solid1_data->corner2->y, 1, 'Solid corner2 y (1).');
is($solid1_data->corner3->x, 2, 'Solid corner3 x (2).');
is($solid1_data->corner3->y, 1, 'Solid corner3 y (1).');
is($solid1_data->corner4->x, 4, 'Solid corner4 x (4).');
is($solid1_data->corner4->y, 0, 'Solid corner4 y (0).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
