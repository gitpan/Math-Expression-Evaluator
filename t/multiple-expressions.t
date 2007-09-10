use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 4 }

use Math::Expression::Evaluator;

my $m = new Math::Expression::Evaluator;
ok($m, "new works");

sub e {
	return eval {$m->parse(shift)->val()};
}

is e('1 2'), 		2,	'space delimited expressions';
is e('1; 2'),		2,	'colon delimited expressions';
is e('(1+2) (3-8)'),	-5,	'space delimited expressions 2';
