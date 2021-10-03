use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 10;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_arc')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_ARC.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, -8, 'Get entity type (-8).');
my $arc1_data = $entity1->data;
is($arc1_data->layer, 1, 'Arc layer (1).');
is($arc1_data->x, 1.5, 'Arc x (1.5).');
is($arc1_data->y, -0.5, 'Arc y (-0.5).');
is($arc1_data->radius, 1.58113883008419, 'Arc radius (1.58113883008419).');
is($arc1_data->angle_from, 1.24904577239825, 'Arc angle from in radians (1.24904577239825).');
is($arc1_data->angle_to, 2.81984209919315, 'Arc angle to in radians (2.81984209919315).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
