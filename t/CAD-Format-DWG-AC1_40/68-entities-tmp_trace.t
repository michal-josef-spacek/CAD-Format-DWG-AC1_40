use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_trace')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_TR.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $trace1_common = $entity1->entity_common;
is($trace1_common->entity_type, -9, 'Get entity type (-9).');
is($trace1_common->layer, 1, 'Trace layer (1).');
my $trace1_data = $entity1->data;
is($trace1_data->corner1->x, -3.53553390593273, 'Trace corner1 x (-3.53553390593273).');
is($trace1_data->corner1->y, 3.53553390593274, 'Trace corner1 y (3.53553390593274).');
is($trace1_data->corner2->x, 3.53553390593273, 'Trace corner2 x (3.53553390593273).');
is($trace1_data->corner2->y, -3.53553390593274, 'Trace corner2 y (-3.53553390593274).');
is($trace1_data->corner3->x, 1.46446609406727, 'Trace corner3 x (1.46446609406727).');
is($trace1_data->corner3->y, 8.53553390593274, 'Trace corner3 y (8.53553390593274).');
is($trace1_data->corner4->x, 8.53553390593273, 'Trace corner4 x (8.53553390593273).');
is($trace1_data->corner4->y, 1.46446609406726, 'Trace corner4 y (1.46446609406726).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
