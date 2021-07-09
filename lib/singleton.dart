class Singleton {
  Singleton._(); // дефолтный конструктор приватeн
  static final _instance = Singleton._(); // никто не узнает, что это одиночка
  factory Singleton() => _instance;       // и не закидает помидорами
}