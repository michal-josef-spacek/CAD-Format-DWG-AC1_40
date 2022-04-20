use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/tmp_text')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('TMP_TEXT.DWG')->s,
);
my $entity1 = $obj->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC1_40::Entity');
my $text1_common = $entity1->entity_common;
is($text1_common->entity_type, -7, 'Get entity type (-7).');
is($text1_common->layer, 1, 'Text layer (1).');
my $text1_data = $entity1->data;
is($text1_data->x, 0, 'Text x (0).');
is($text1_data->y, 0, 'Text y (0).');
is($text1_data->height, 0.674965563859886, 'Text height (0.674965563859886).');
is($text1_data->angle, 0.785398163397448, 'Text angle in radians (0.785398163397448).');
my $size = $text1_data->size;
is($size, 3, 'Text size (3).');
my $value = $text1_data->value;
is($value, 'foo', 'Text value (foo).');
my $entities = @{$obj->entities};
is($entities, 4, 'Number of entities (4).');
