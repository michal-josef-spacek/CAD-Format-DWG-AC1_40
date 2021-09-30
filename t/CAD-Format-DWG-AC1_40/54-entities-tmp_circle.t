use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 8;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_circle')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_CIR.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, -3, 'Get entity type (-3).');
my $circle1_data = $entity1->data;
is($circle1_data->layer, 1, 'Circle layer (1).');
is($circle1_data->x, 1, 'Circle x (1).');
is($circle1_data->y, 1, 'Circle y (1).');
is($circle1_data->radius, 1, 'Circle radius (1).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
