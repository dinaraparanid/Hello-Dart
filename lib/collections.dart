import 'dart:collection';
import 'dart:io';

import 'dart:math';

void collectionsTest() {
  /// ---------------------------------------- СПИСКИ ----------------------------------------
  var absolutelyMutableList = <int>[];
  absolutelyMutableList = [1, 2, 3];

  final finalList = <int>[];
  finalList.addAll(stdin.readLineSync()!.trim().split(' ').map(int.parse));
  // finalList = [1, 2, 3]; нельзя

  const constList = [1, 2, 3];

  // Unsupported operation: Cannot modify an unmodifiable list
  constList[0] = 2; // не ловит при компиляции

  [
    1,
    2,
    3,
    if (Random().nextBool()) 4,
    for (var i = 5; i < 10; i++) i,
  ];

  /// ---------------------------------------- МНОЖЕСТВА ----------------------------------------

  // На хешах
  const emptySet = {};

  const first = { 1, 2, 3, 4, 5 };
  const second = { 3, 4, 5, 6, 7 };
  assert(first.intersection(second) == { 3, 4, 5 });
  assert(first.union(second) == { 1, 2, 3, 4, 5, 6, 7 });

  // на дереве
  assert(SplayTreeSet<int>.from([4, 1, 7, 123, 22, 3]) == { 1, 3, 4, 7, 22, 123 });

  /// ---------------------------------------- СЛОВАРИ ----------------------------------------

  // На хешах
  const emptyMap = <dynamic, dynamic>{};

  final notEmptyMap = {
    '1-st name': 'Gordon',
    '2-nd name': 'Freeman',
    'age': 25,
    'status': 'hired'
  };

  notEmptyMap['employer'] = 'GMan'; // добавили значение
  assert(notEmptyMap.containsKey('education') == false);
  assert(notEmptyMap.containsValue('GMan') == true);

  // for (var p in notEmptyMap) нельзя: The type 'Map<String, Object>'
  // used in the 'for' loop must implement Iterable

  notEmptyMap.forEach((key, value) => print('$key: $value')); // а так можно
}
