use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 17;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/line')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LINE1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, 1, 'Get entity type (1).');
my $line1_data = $entity1->data;
is($line1_data->layer, 1, 'Line layer (1).');
my $x1 = unpack 'd<', $line1_data->x1;
is($x1, 0, 'Line x1 (0).');
my $y1 = unpack 'd<', $line1_data->y1;
is($y1, 0, 'Line y1 (0).');
my $x2 = unpack 'd<', $line1_data->x2;
is($x2, 1, 'Line x2 (1).');
my $y2 = unpack 'd<', $line1_data->y2;
is($y2, 1, 'Line y2 (1).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LINE2.DWG')->s,
);
$entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, 1, 'Get entity type (1).');
$line1_data = $entity1->data;
is($line1_data->layer, 1, 'Line layer (1).');
$x1 = unpack 'd<', $line1_data->x1;
is($x1, 1.11740890688264, 'Line x1 (1.11740890688264).');
$y1 = unpack 'd<', $line1_data->y1;
is($y1, 3.49797570850207, 'Line y1 (3.49797570850207).');
$x2 = unpack 'd<', $line1_data->x2;
is($x2, 3.69230769230774, 'Line x2 (3.69230769230774).');
$y2 = unpack 'd<', $line1_data->y2;
is($y2, 4.54736842105268, 'Line y2 (4.54736842105268).');
$entities = @{$obj->entities};
is($entities, 262, 'Number of entities (262).');
