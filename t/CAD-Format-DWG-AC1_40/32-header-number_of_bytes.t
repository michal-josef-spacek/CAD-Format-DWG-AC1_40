use strict;
use warnings;

use CAD::Format::DWG::AC1_40;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/number_of_bytes')->set;

# Test.
my $obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('NOB1.DWG')->s,
);
is($obj->header->number_of_bytes, 514, 'Number of bytes (514 - blank file).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('NOB2.DWG')->s,
);
is($obj->header->number_of_bytes, 550, 'Number of bytes (550 - 514+36 - one line).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('NOB3.DWG')->s,
);
is($obj->header->number_of_bytes, 542, 'Number of bytes (542 - 514+28 - one circle).');

# Test.
$obj = CAD::Format::DWG::AC1_40->from_file(
	$data_dir->file('NOB4.DWG')->s,
);
is($obj->header->number_of_bytes, 217954, 'Number of bytes (217954 - Many lines).');
