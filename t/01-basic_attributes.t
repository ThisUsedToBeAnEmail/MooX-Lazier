use Moonshine::Test qw/:all/;

use t::odea::BasicAttributes;

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
