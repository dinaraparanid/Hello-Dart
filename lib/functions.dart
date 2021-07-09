int test1(int start, [ int add = 0, int sub = 0, int mul = 1, int div = 1 ]) {
  return (start + add - sub) * mul ~/ div;
}

int test2({ required int start, int add = 0, int sub = 0, int mul = 1, int div = 1 }) =>
    (start + add - sub) * mul ~/ div;

// ignore: always_declare_return_types
/* dynamic */ test3(start, [ add = 0, sub = 0, mul = 1, div = 1 ]) =>
    (start + add - sub) * mul ~/ div;

var concat = (a, b) => '$a$b';