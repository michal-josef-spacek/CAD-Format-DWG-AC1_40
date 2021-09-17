use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('CAD::Format::DWG::AC1_40', 'CAD::Format::DWG::AC1_40 is covered.');
