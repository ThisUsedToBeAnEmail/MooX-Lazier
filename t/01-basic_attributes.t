use Moonshine::Test qw/:all/;

package BasicAttributes;

use Moo;
use MooX::Lazier;

use Test::MockObject;
my $obj = Test::MockObject->new->set_always( echo => 'one two three' );

attributes (
    one      => [ 'rw', 10 ],    
    two      => [ 'ro', [qw/one two three/] ],    
    three    => [ 'ro', { one => 'two' } ],    
    four     => [ 'ro', 'a default value' ],
    five     => [ 'ro', $obj ],
    six      => [ 'ro', 0 ],
    seven    => [ 'ro', undef ],
    eight    => [ 'rw' ]
);

package main;

moon_test(
    name  => 'test basic attributes',
    build => {
        class => 'BasicAttributes',
    },
    instructions => [
        {
            test => 'true',
            func => 'one',
        },
        {
            test => 'ref',
            func => 'two',
            expected => [qw/one two three/],
        },
        {
            test => 'ref',
            func => 'three',
            expected =>  { one => 'two' },
        },
        {
            test => 'scalar',
            func => 'four',
            expected => 'a default value',
        },
        {
            test => 'obj',
            func => 'five',
            expected => 'Test::MockObject',
        },
        {
            test => 'false',
            func => 'six',
        },
        {
            test => 'undef',
            func => 'seven',
        },
        {
            test => 'undef',
            func => 'eight',
        },
    ],
);

sunrise();
