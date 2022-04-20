use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/trace')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TRACE1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $trace1_common = $entity1->entity_common;
is($trace1_common->entity_type, 9, 'Get entity type (9).');
is($trace1_common->layer, 1, 'Trace layer (1).');
my $trace1_data = $entity1->data;
is($trace1_data->from_x, 0.292893218813453, 'Trace from x (0.292893218813453).');
is($trace1_data->from_y, 2.70710678118655, 'Trace from y (2.70710678118655).');
is($trace1_data->from_and_x, 1.70710678118655, 'Trace from and x (1.70710678118655).');
is($trace1_data->from_and_y, 1.29289321881345, 'Trace from and y (1.29289321881345).');
is($trace1_data->to_x, 2.29289321881345, 'Trace to x (2.29289321881345).');
is($trace1_data->to_y, 4.70710678118655, 'Trace to y (4.70710678118655).');
is($trace1_data->to_and_x, 3.70710678118655, 'Trace to and x (3.70710678118655).');
is($trace1_data->to_and_y, 3.29289321881345, 'Trace to and y (3.29289321881345).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
