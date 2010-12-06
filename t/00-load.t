#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Range::String' );
}

diag( "Testing Range::String $Range::String::VERSION, Perl $], $^X" );
