use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/trace')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('TRACE1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
is($entity1->entity_type, 9, 'Get entity type (9).');
my $trace1_data = $entity1->data;
is($trace1_data->layer, 1, 'Trace layer (1).');
my $from_x = unpack 'd<', $trace1_data->from_x;
is($from_x, 0.292893218813453, 'Trace from x (0.292893218813453).');
my $from_y = unpack 'd<', $trace1_data->from_y;
is($from_y, 2.70710678118655, 'Trace from y (2.70710678118655).');
my $from_and_x = unpack 'd<', $trace1_data->from_and_x;
is($from_and_x, 1.70710678118655, 'Trace from and x (1.70710678118655).');
my $from_and_y = unpack 'd<', $trace1_data->from_and_y;
is($from_and_y, 1.29289321881345, 'Trace from and y (1.29289321881345).');
my $to_x = unpack 'd<', $trace1_data->to_x;
is($to_x, 2.29289321881345, 'Trace to x (2.29289321881345).');
my $to_y = unpack 'd<', $trace1_data->to_y;
is($to_y, 4.70710678118655, 'Trace to y (4.70710678118655).');
my $to_and_x = unpack 'd<', $trace1_data->to_and_x;
is($to_and_x, 3.70710678118655, 'Trace to and x (3.70710678118655).');
my $to_and_y = unpack 'd<', $trace1_data->to_and_y;
is($to_and_y, 3.29289321881345, 'Trace to and y (3.29289321881345).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
