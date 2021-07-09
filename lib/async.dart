import 'dart:async';
import 'dart:io';

import 'dart:math';

void exitOnLess1(final int a, final int b) {
  if (a <= 0 || b <= 0) {
    print('Size must be bigger than zero');
    exit(0);
  }
}

void printMatrix(final List<List<int>> matrix) => matrix.forEach((row) {
  row.forEach((elem) => stdout.write('$elem '));
  print('');
});

List<List<int>> generateMatrix(final int n, final int m) => Iterable.generate(n,
        (_) => Iterable<int>.generate(m, (_) => Random().nextInt(1000)).toList()
).toList();

List<List<int>> matrixMultiplySync(final List<List<int>> first, final List<List<int>> second) {
  final n = first.length;
  final m = second[0].length;
  final k = second.length;
  final ans = List.filled(n, List.filled(m, 0));

  for (var i = 0; i < n; i++) {
    for (var q = 0; q < m; q++) {
      for (var r = 0; r < k; r++) {
        ans[i][q] += first[i][r] * second[r][q];
      }
    }
  }

  return ans;
}

Future<List<List<int>>> matrixMultiplyAsync(
    final List<List<int>> first,
    final List<List<int>> second,
    final int coroutinesAmount
    ) async {
  final n = first.length;
  final m = second[0].length;
  final k = second.length;
  final ans = List.filled(n, List.filled(m, 0));

  final coroutines = List.filled(coroutinesAmount, Completer<void>().future);
  final ost = n * m % coroutinesAmount;
  final cellsInCoroutines = List.filled(coroutinesAmount, n * m ~/ coroutinesAmount);

  for (var i = 0; i < ost; i++) {
    cellsInCoroutines[i]++;
  }

  var cur = 0;

  for (var i = 0; i < coroutinesAmount; cur += cellsInCoroutines[i], i++) {
    final finalI = i;
    final finalCur = cur;

    coroutines[i] = Future.delayed(
        Duration(microseconds: 2),
            () {
          for (var t = finalCur; t < finalCur + cellsInCoroutines[finalI]; t++) {
            for (var r = 0; r < k; r++) {
              ans[t ~/ n][t % n] += first[t ~/ n][r] * second[r][t % n];
            }
          }
        }
    );
  }

 return await () async {
    for (var element in coroutines) {
      await element;
    }

    return ans;
  }();
}

Future<void> asyncTest() async {
  print("First matrix's size:");

  final inp1 = stdin.readLineSync()!.trim().split(' ').map(int.parse).toList();
  final n1 = inp1[0];
  final m1 = inp1[1];

  exitOnLess1(n1, m1);

  final inp2 = stdin.readLineSync()!.trim().split(' ').map(int.parse).toList();
  final n2 = inp2[0];
  final m2 = inp2[1];

  exitOnLess1(n2, m2);

  if (m1 != n2 && m2 != n1) {
    print('Columns amount of 1-st matrix must be equal to rows amount of 2-nd matrix or vice versa');
    return;
  }

  print('Amount of parallel processes:');
  final coroutinesAmount = int.parse(stdin.readLineSync()!.trim());

  if (coroutinesAmount < 1) {
    print('Threads amount must be bigger than zero');
    return;
  }

  final matrix1 = generateMatrix(n1, m1);
  final matrix2 = generateMatrix(n2, m2);

  final start1 = DateTime.now().microsecond;
  final firstMul = matrixMultiplySync(matrix1, matrix2);
  final finish1 = DateTime.now().microsecond;

  print('Single Thread: ${max(start1, finish1) - min(start1, finish1)} microsecond');

  final start2 = DateTime.now().microsecond;
  final secondMul = await matrixMultiplyAsync(matrix1, matrix2, coroutinesAmount);
  final finish2 = DateTime.now().microsecond;

  print('Multi Thread:  ${max(start2, finish2) - min(start2, finish2)} microsecond');

  print('First multiply:');

  firstMul.forEach((row) {
    row.forEach((element) => stdout.write('$element '));
    print('');
  });

  print('Second multiply:');

  secondMul.forEach((row) {
    row.forEach((element) => stdout.write('$element '));
    print('');
  });
}