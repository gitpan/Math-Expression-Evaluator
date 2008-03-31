use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 9 }

use Math::Expression::Evaluator;

my $m = new Math::Expression::Evaluator;
ok($m, "new works");

sub e {
    return $m->parse(shift)->val();
}

sub c {
    return $m->parse(shift)->compiled->();
}

is e('a = 3'),      3,  'Assignment returns value';
is c('a = 3'),      3,  'Assignment returns value (compiled)';
is e('a'),          3,  'Variables persistent';
is c('a'),          3,  'Variables persistent (compiled)';
is e('a*a'),        9,  'Arithmetics with variables';
is c('a*a'),        9,  'Arithmetics with variables (compiled)';

$m->parse("a + b");
is $m->val({a => 1, b => 2}), 3, 'externally assigned variables';

$m->parse("a = 3; a");
is $m->val({a => 1}),   1,  'externally provided variables override internal ones';

# vim: sw=4 ts=4 expandtab syn=perl
