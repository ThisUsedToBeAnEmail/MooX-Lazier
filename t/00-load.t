#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'MooX::Lazier' ) || print "Bail out!\n";
}

diag( "Testing MooX::Lazier $MooX::Lazier::VERSION, Perl $], $^X" );
