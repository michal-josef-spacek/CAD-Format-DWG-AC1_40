use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/load')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('LOAD1.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $load1_common = $entity1->entity_common;
is($load1_common->entity_type, 10, 'Get entity type (10).');
is($load1_common->layer, 1, 'Load layer (1).');
my $load1_data = $entity1->data;
my $size = $load1_data->size;
is($size, 3, 'Load size (3).');
my $value = $load1_data->value;
is($value, 'TXT', 'Load value (TXT).');
my $entities = @{$obj->entities};
is($entities, 1, 'Number of entities (1).');
