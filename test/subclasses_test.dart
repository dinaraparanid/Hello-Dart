import 'package:fun/subclasses.dart';

void subclassesTest() {
  // Наследование
  final Person vasya = Student('Василий', 'Петров', 13);
  // vasya.study() нельзя, принцип единой ответственности

  (vasya as Student).study(); // Student Василий Петров, 13 years old is studying
  vasya.sayHello();           // Student Василий Петров, 13 years old is saying "Hello!"
  vasya.sayGoodbye();         // Student Василий Петров, 13 years old is saying "Goodbye!"

  // Полиморфизм и mixin
  Harrier()
    ..say()
    ..fly()
    ..flapWings()
    ..eatBugs()
    ..layEgg()
    ..hunt()
    ..joinNewFlock()
    ..checkStatus();
}