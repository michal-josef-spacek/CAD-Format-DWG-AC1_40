use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/repeat')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('REPEAT1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
is($entity1->entity_type, 5, 'Get entity type (5).');
my $repeat1_data = $entity1->data;
is($repeat1_data->layer, 1, 'Repeat begin layer (1).');
my $entities = @{$obj->entities};
is($entities, 3, 'Number of entities (3).');
