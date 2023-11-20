use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/point')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('POINT1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $point1_common = $entity1->entity_common;
is($point1_common->entity_type, 2, 'Get entity type (2).');
is($point1_common->layer, 1, 'Point layer (1).');
my $point1_data = $entity1->data;
is($point1_data->x, 3, 'Point x (3).');
is($point1_data->y, 4, 'Point y (4).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('POINT2.DWG')->s,
);
$entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
$point1_common = $entity1->entity_common;
is($point1_common->entity_type, 2, 'Get entity type (2).');
is($point1_common->layer, 2, 'Point layer (2).');
$point1_data = $entity1->data;
is($point1_data->x, 1.1234, 'Point x (1.1234).');
is($point1_data->y, 2.3456, 'Point y (2.3456).');
$entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
