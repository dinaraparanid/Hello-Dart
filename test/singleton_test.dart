import 'package:fun/singleton.dart';

void singletonTest() {
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  assert(singleton1.hashCode == singleton2.hashCode);
}