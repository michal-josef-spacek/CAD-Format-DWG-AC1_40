use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/repeat')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('REPEAT1.DWG')->s,
);
my $entity3 = $obj->entities->[2];
isa_ok($entity3, 'CAD::Format::DWG::AC1_40::Entity');
is($entity3->entity_type, 6, 'Get entity type (6).');
my $repeat1_data = $entity3->data;
is($repeat1_data->layer, 1, 'Repeat end layer (1).');
my $repeat1_columns = $repeat1_data->columns;
is($repeat1_columns, 3, 'Repeat end columns (3).');
my $repeat1_rows = $repeat1_data->rows;
is($repeat1_rows, 1, 'Repeat end rows (1).');
is($repeat1_data->column_distance, 1, 'Repeat end column distance (1).');
is($repeat1_data->row_distance, 0, 'Repeat end row distance (0).');
my $entities = @{$obj->entities};
is($entities, 3, 'Number of entities (3).');
