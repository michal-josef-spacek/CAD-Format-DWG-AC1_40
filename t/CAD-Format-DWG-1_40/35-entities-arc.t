use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 10;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/arc')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('ARC1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
is($entity1->entity_type, 8, 'Get entity type (8).');
my $arc1_data = $entity1->data;
is($arc1_data->layer, 1, 'Arc layer (1).');
my $x1 = unpack 'd<', $arc1_data->x;
is($x1, 5, 'Arc x (5).');
my $y1 = unpack 'd<', $arc1_data->y;
is($y1, 5, 'Arc y (5).');
my $radius = unpack 'd<', $arc1_data->radius;
is($radius, 5, 'Arc radius (5).');
my $angle_from = unpack 'd<', $arc1_data->angle_from;
is($angle_from, 3.78509376238308, 'Arc angle from in radians (3.78509376238308).');
my $angle_to = unpack 'd<', $arc1_data->angle_to;
is($angle_to, 1.10714871779409, 'Arc angle to in radians (1.10714871779409).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
