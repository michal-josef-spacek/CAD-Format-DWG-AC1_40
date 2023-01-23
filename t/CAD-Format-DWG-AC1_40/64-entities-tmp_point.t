use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_point')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_PO.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $point1_common = $entity1->entity_common;
is($point1_common->entity_type, -2, 'Get entity type (-2).');
is($point1_common->layer, 1, 'Point layer (1).');
my $point1_data = $entity1->data;
is($point1_data->x, 1, 'Point x (1).');
is($point1_data->y, 1, 'Point y (1).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
