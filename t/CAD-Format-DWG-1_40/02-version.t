use strict;
use warnings;

use CAD::Format::DWG::1_40;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($CAD::Format::DWG::1_40::VERSION, undef, 'Version.');
