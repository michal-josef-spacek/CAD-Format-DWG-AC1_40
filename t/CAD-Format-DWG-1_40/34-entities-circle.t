use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/circle')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('CIRCLE1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
my $circle1_data = $entity1->data;
is($circle1_data->layer, 1, 'Circle layer (1).');
my $x1 = unpack 'd<', $circle1_data->x;
is($x1, 0, 'Circle x (0).');
my $y1 = unpack 'd<', $circle1_data->y;
is($y1, 0, 'Circle y (0).');
my $radius = unpack 'd<', $circle1_data->radius;
is($radius, 1, 'Circle radius (1).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
