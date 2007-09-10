use strict;
use warnings;
use Test::More;
BEGIN { plan tests => 15 }

use Math::Expression::Evaluator;

my $m = new Math::Expression::Evaluator;
ok($m, "new works");

sub e {
    return $m->parse(shift)->val();
}

is e("1+2*3"),      7,      "* over +";
is e("1-2*3"),      -5,     "* over -";
is e("1+4/2"),      3,      "/ over +";
is e("1-4/2"),      -1,     "/ over -";
is e("3*2^4"),      48,     "^ over *";
is e("3-2^4"),      -13,    "^ over -";
is e("3+2^4"),      19,     "^ over +";
is e("16/2^3"),     2,      "^ over /";
is e("(1)"),        1,      "Parenthesis 0";
is e("(1+2)*3"),    9,      "Parenthesis 1";
is e("(1-2)*3"),    -3,     "Parenthesis 2";
is e("(1+2)^2"),    9,      "Parenthesis 3";
is e("(2)^(1+2)"),  8,      "Parenthesis 4";
is e('((1))'),      1,      'Double Parenthesis';

# vim: sw=4 ts=4 expandtab
