import 'package:fun/functions.dart';

void functionTest() {
  test1(3);                                         // 3
  test1(3, 1);                                      // 4
  test1(3, 1, 2);                                   // 2
  test1(3, 1, 2, 5);                                // 10
  test1(3, 1, 2, 5, 10);                            // 1

  test2(start: 3);                                  // 3
  test2(start: 3, add: 1);                          // 4
  test2(start: 3, add: 1, sub: 2);                  // 2
  test2(start: 3, add: 1, sub: 2, mul: 5);          // 10
  test2(start: 3, add: 1, sub: 2, mul: 5, div: 10); // 1

  dynamic t = test3(3);

  concat(1, 2);                         // 12
  concat('Hello, ', 'World!');          // Hello, World!
  concat('Today is ', DateTime.now());  // Today is 2021-07-08 22:43:10.906271
}