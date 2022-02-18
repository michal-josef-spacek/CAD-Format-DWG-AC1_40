use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_line')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_LINE.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, -1, 'Get entity type (-1).');
my $line1_data = $entity1->data;
is($line1_data->layer, 1, 'Line layer (1).');
is($line1_data->x1, 0, 'Line x1 (0).');
is($line1_data->y1, 0, 'Line y1 (0).');
is($line1_data->x2, 1, 'Line x2 (1).');
is($line1_data->y2, 1, 'Line y2 (1).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
