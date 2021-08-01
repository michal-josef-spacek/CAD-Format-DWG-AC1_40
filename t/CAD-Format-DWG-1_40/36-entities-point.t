use strict;
use warnings;

use CAD::Format::DWG::1_40;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/point')->set;

# Test.
my $obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('POINT1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
my $point1_data = $entity1->data;
is($point1_data->layer, 1, 'Point layer (1).');
my $x = unpack 'd<', $point1_data->x;
is($x, 3, 'Point x (3).');
my $y = unpack 'd<', $point1_data->y;
is($y, 4, 'Point y (4).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::1_40->from_file(
	$data_dir->file('POINT2.DWG')->s,
);
$entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::1_40::Entity');
$point1_data = $entity1->data;
is($point1_data->layer, 2, 'Point layer (2).');
$x = unpack 'd<', $point1_data->x;
is($x, 1.1234, 'Point x (1.1234).');
$y = unpack 'd<', $point1_data->y;
is($y, 2.3456, 'Point y (2.3456).');
$entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
