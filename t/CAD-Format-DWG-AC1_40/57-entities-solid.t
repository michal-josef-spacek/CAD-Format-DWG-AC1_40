use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/solid')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('SOLID1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $solid1_common = $entity1->entity_common;
is($solid1_common->entity_type, 11, 'Get entity type (11).');
is($solid1_common->layer, 1, 'Solid layer (1).');
my $solid1_data = $entity1->data;
is($solid1_data->from_x, 0, 'Solid from x (0).');
is($solid1_data->from_y, 0, 'Solid from y (0).');
is($solid1_data->from_and_x, 1, 'Solid from and x (1).');
is($solid1_data->from_and_y, 1, 'Solid from and y (1).');
is($solid1_data->to_x, 2, 'Solid to x (2).');
is($solid1_data->to_y, 2, 'Solid to y (2).');
is($solid1_data->to_and_x, 2, 'Solid to and x (2).');
is($solid1_data->to_and_y, 2, 'Solid to and y (2).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
