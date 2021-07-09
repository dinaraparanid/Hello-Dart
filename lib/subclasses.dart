import 'dart:math';

/// ------------------------ НАСЛЕДОВАНИЕ ------------------------

class Person {
  final String _name;
  final String _family;
  final int _age;

  Person(this._name, this._family, this._age);

  int get age => _age;
  String get family => _family;
  String get name => _name;

  @override
  String toString() => 'Person $_name $_family, $_age years old';

  void sayHello() => print('$this is saying "Hello!"');
  void sayGoodbye() => print('$this is saying "Goodbye!"');
}

class Student extends Person {
  Student(final String name, final String family, final int age)
      : assert(name.isNotEmpty && family.isNotEmpty && age >= 0),
        super(name, family, age);

  void study() => print('$this is studying');

  @override
  String toString() => 'Student $_name $_family, $_age years old';

  @override
  void sayGoodbye() => print('$this is saying "Goodbye!"');
}

/// ------------------------ ПОЛИМОРФИЗМ и Mixin ------------------------

abstract class Animal {
  void say();
}

abstract class Bird {
  void fly() => print('$this is flying');
  void flapWings() => print("$this is flapping it's wings");
}

mixin BugEater {
  void eatBugs() => print('$this is eating bugs');
}

mixin EggLayer {
  void layEgg() => print('$this is laying egg');
}

mixin Hunter {
  void hunt() => print('$this is hunting');
}

enum HappinessStatus { HAPPY, SAD }

extension on HappinessStatus {
  String status() => this == HappinessStatus.HAPPY ? "I'm happy :)" : "I'm sad :(";
}

class Harrier extends Bird with Hunter, EggLayer, BugEater implements Animal {
  final _happinessStatus = Random().nextBool() ? HappinessStatus.HAPPY : HappinessStatus.SAD;

  Harrier();

  @override
  void say() => print('$this said "tweet-tweet"');

  @override
  String toString() => 'Harrier';

  void checkStatus() => print(_happinessStatus.status());
}

extension Flock on Harrier {
  void joinNewFlock() => print('$this is joined new ${5.randomFlockName}');
}

extension on int {
  String get randomFlockName => '${
      Iterable
          .generate(this, (_) => String.fromCharCode(Random().nextInt(255)))
          .fold('', (previousValue, element) => '$previousValue$element')
  } flock';
}
