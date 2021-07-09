import 'package:fun/class.dart';

void classTest() {
  Example<double> old = new Example(1.5, 1.3, 2.12, 21.232);  // new необязателен с Dart 2.0
  var named = Example.instance2(1, 2.32, 8, 22.8); // named конструктор с проверками
  var factory = Example.factory(123, 1.52, 0, 8); // factory конструктор

  var example = Example(1, 1, 1, 1)
    ..publicMutable = 2
    ..publicMutableDynamic = 4;

  example.publicMutableDynamic = 'Я строка!';
  example.privateMutableDynamic = 'Я тоже строка!';
  // example._privateMutableDynamic = 'Взлом жопы';

  print(example);
  print(Example.privateStaticConstProperty);
}

