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
is($entity1->entity_type, -11, 'Get entity type (-11).');
my $solid1_data = $entity1->data;
is($solid1_data->layer, 1, 'Solid layer (1).');
is($solid1_data->from_x, 0, 'Solid from x (0).');
is($solid1_data->from_y, 0, 'Solid from y (0).');
is($solid1_data->from_and_x, 1, 'Solid from and x (1).');
is($solid1_data->from_and_y, 1, 'Solid from and y (1).');
is($solid1_data->to_x, 2, 'Solid to x (2).');
is($solid1_data->to_y, 1, 'Solid to y (1).');
is($solid1_data->to_and_x, 4, 'Solid to and x (4).');
is($solid1_data->to_and_y, 0, 'Solid to and y (0).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
