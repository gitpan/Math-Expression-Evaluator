use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 13 }

use Math::Expression::Evaluator;

my $m = new Math::Expression::Evaluator;
ok($m, "new works");

sub e {
	return $m->parse(shift)->val();
}

is e("1+2"), 		3, 	"infix + with two args";
is e("1+2+3"), 		6, 	"infix + with three args";
is e("2*3"), 		6, 	"* with two args";
is e("2*3*4"), 		24, 	"* with three args";
is e("3-2"), 		1, 	"infix - with two args";
is e("3-2-1"), 		0, 	"infix - with three args";
is e("4/2"), 		2,	"/ with two args";
is e("16/4/2"),		2, 	"/ with three args";
is e("4*3/2"),		6,	"* and / mixed 1";
is e("4/2*3"),		6,	"* and / mixed 1";
is e("1+2-3"),		0,	"+ and - mixed 1";
is e("1-2+3"),		2,	"+ and - mixed 1";
