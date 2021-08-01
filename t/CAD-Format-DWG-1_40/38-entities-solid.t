use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/solid')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('SOLID1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
is($entity1->entity_type, 11, 'Get entity type (11).');
my $solid1_data = $entity1->data;
is($solid1_data->layer, 1, 'Solid layer (1).');
my $from_x = unpack 'd<', $solid1_data->from_x;
is($from_x, 0, 'Solid from x (0).');
my $from_y = unpack 'd<', $solid1_data->from_y;
is($from_y, 0, 'Solid from y (0).');
my $from_and_x = unpack 'd<', $solid1_data->from_and_x;
is($from_and_x, 1, 'Solid from and x (1).');
my $from_and_y = unpack 'd<', $solid1_data->from_and_y;
is($from_and_y, 1, 'Solid from and y (1).');
my $to_x = unpack 'd<', $solid1_data->to_x;
is($to_x, 2, 'Solid to x (2).');
my $to_y = unpack 'd<', $solid1_data->to_y;
is($to_y, 2, 'Solid to y (2).');
my $to_and_x = unpack 'd<', $solid1_data->to_and_x;
is($to_and_x, 2, 'Solid to and x (2).');
my $to_and_y = unpack 'd<', $solid1_data->to_and_y;
is($to_and_y, 2, 'Solid to and y (2).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
