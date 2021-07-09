import 'dart:io';
import 'dart:math';

import 'package:fun/class.dart';

void nullTest() {
  // if-null operator
  stdin.readLineSync() ?? 'input';

  // null-aware assignment operator
  int? awareAssignment;
  awareAssignment ??= 20;

  // null-aware access operator
  stdin
      .readLineSync()
      ?.trim()
      .split(' ')
      .map(int.parse)
      .forEach(print);

  // null assertion operator
  int.parse(stdin.readLineSync()!);

  // null-aware cascade operator
  () => Random().nextBool() ? Example<int>(1, 1, 1, 1) : null
    ?..publicMutable = 2
    ..publicMutableDynamic = 4;

  // null-aware index operator
  final list = Random().nextBool() ?
    stdin.readLineSync()?.trim().split(' ').map(int.parse).toList() :
    null;

  list?[0];

  // spread operator
  final ints = Random().nextBool() ?
    stdin.readLineSync()?.trim().split(' ').map(int.parse).toList() :
    null;

  final doubles = Random().nextBool() ?
  stdin.readLineSync()?.trim().split(' ').map(double.parse).toList() :
  null;

  [1, 1.5, ...?ints, ...?doubles]; // конкантенация
}