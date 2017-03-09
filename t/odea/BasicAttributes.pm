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


1;
