use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 8;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/circle')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('CIRCLE1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $circle1_common = $entity1->entity_common;
is($circle1_common->entity_type, 3, 'Get entity type (3).');
is($circle1_common->layer, 1, 'Circle layer (1).');
my $circle1_data = $entity1->data;
is($circle1_data->x, 0, 'Circle x (0).');
is($circle1_data->y, 0, 'Circle y (0).');
is($circle1_data->radius, 1, 'Circle radius (1).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
