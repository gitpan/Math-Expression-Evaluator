use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 5 }

use Math::Expression::Evaluator;

my $m = new Math::Expression::Evaluator;
ok($m, "new works");

sub e {
	return $m->parse(shift)->val();
}

is e("+2"),	2,	'Prefix + with number';
is e('+(1+2)'),	3,	'Prefix + with expression';
is e('-2'),	-2,	'Prefix - with number';
is e('-(1+2)'),	-3,	'Prefix - with expression';
