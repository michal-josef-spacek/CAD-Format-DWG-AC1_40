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
my $line1_common = $entity1->entity_common;
is($line1_common->entity_type, 1, 'Get entity type (1).');
is($line1_common->layer, 1, 'Line layer (1).');
my $line1_data = $entity1->data;
is($line1_data->x1, 0, 'Line x1 (0).');
is($line1_data->y1, 0, 'Line y1 (0).');
is($line1_data->x2, 1, 'Line x2 (1).');
is($line1_data->y2, 1, 'Line y2 (1).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LINE2.DWG')->s,
);
$entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
$line1_common = $entity1->entity_common;
is($line1_common->entity_type, 1, 'Get entity type (1).');
is($line1_common->layer, 1, 'Line layer (1).');
$line1_data = $entity1->data;
is($line1_data->x1, 1.11740890688264, 'Line x1 (1.11740890688264).');
is($line1_data->y1, 3.49797570850207, 'Line y1 (3.49797570850207).');
is($line1_data->x2, 3.69230769230774, 'Line x2 (3.69230769230774).');
is($line1_data->y2, 4.54736842105268, 'Line y2 (4.54736842105268).');
$entities = @{$obj->entities};
is($entities, 262, 'Number of entities (262).');
