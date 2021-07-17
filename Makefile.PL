use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Read AutoCAD 1.40 DWG file.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'CAD-Format-DWG-1_40';
requires 'perl' => '5.8.0';
readme_from '1_40.pm';
recursive_author_tests('xt');
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/CAD-Format-DWG-1_40/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/CAD-Format-DWG-1_40';
resources 'repository' => 'git://github.com/michal-josef-spacek/CAD-Format-DWG-1_40';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0.22;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
