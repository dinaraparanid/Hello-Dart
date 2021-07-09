import 'dart:math';

class Example<T extends num> {
  final publicImmutableDynamic;
  var publicMutableDynamic;

  static const staticConstProperty = 3;
  static const _privateStaticConstProperty = 5;

  final _privateImmutableDynamic;
  var _privateMutableDynamic;

  final T publicImmutable;
  T publicMutable;

  final T _privateImmutable;
  T _privateMutable;

  // ленивая инициализация
  late final lateinitVar = _initLateinitVar(Random().nextInt(1000));

  /// Long-form constructor
  ///
  /// ```Dart
  ///
  ///   Example(
  ///       this.publicImmutable,   // final не может быть инициализированна в конструкторе
  ///       final T publicMutable,  // здесь не final => может
  ///       this._privateImmutable, // final не может быть инициализированна в конструкторе
  ///       final T privateMutable, // здесь не final => может
  ///       [this.publicImmutableDynamic,   // null
  ///       final publicMutableDynamic,     // null
  ///       this._privateImmutableDynamic,  // null
  ///       final privateMutableDynamic]    // null
  ///       ) {
  ///     this.publicMutable = publicMutable;
  ///     _privateMutable = privateMutable;
  ///     this.publicMutableDynamic = publicMutableDynamic;
  ///     _privateMutableDynamic = privateMutableDynamic;
  ///   }
  ///
  ///   ```

  /// Short-form constructor
  Example(this.publicImmutable, this.publicMutable, this._privateImmutable,
      this._privateMutable,
      [this.publicImmutableDynamic,   // null
      this.publicMutableDynamic,      // null
      this._privateImmutableDynamic,  // null
      this._privateMutableDynamic]    // null
      );

  /// Named constructor 1
  Example.instance1(final T publicImmutable, final T publicMutable,
      final T privateImmutable, final T privateMutable)
      : this(publicImmutable, publicMutable, privateImmutable, privateMutable);

  /// Named constructor 2
  Example.instance2(final T publicImmutable, final T publicMutable,
      final T privateImmutable, final T privateMutable)
      : assert(publicImmutable is int),
        assert(publicMutable > 0),
        assert(
            privateImmutable is int && privateImmutable.isEven), // smart cast
        assert(privateMutable is double),
        publicImmutable = publicImmutable,
        publicMutable = publicMutable,
        publicImmutableDynamic = null,
        _privateImmutable = privateImmutable,
        _privateMutable = privateMutable,
        _privateImmutableDynamic = null;

  /// Factory constructor
  factory Example.factory(final T publicImmutable, final T publicMutable,
          final T privateImmutable, final T privateMutable) =>
      Example(publicImmutable, publicMutable, privateImmutable, privateMutable);

  int _initLateinitVar(final int init) => init;

  num get fieldSum =>
      publicImmutable +
      publicMutable +
      _privateImmutable +
      _privateMutable +
      (publicImmutableDynamic is num ? publicImmutableDynamic : 0) +
      (publicMutableDynamic is num ? publicMutableDynamic : 0) +
      (_privateImmutableDynamic is num ? _privateImmutableDynamic : 0) +
      (_privateMutableDynamic is num ? _privateMutableDynamic : 0);

  T get privateImmutable => _privateImmutable;
  dynamic get privateImmutableDynamic => _privateImmutableDynamic;

  T get privateMutable => _privateMutable;
  dynamic get privateMutableDynamic => _privateMutableDynamic;

  static int get privateStaticConstProperty => _privateStaticConstProperty;

  set privateMutableDynamic(final value) => _privateMutableDynamic = value;
  set privateMutable(final T value) => _privateMutable = value;

  @override
  String toString() => '''
  Example № $lateinitVar
  publicImmutableDynamic: $publicImmutableDynamic
  publicMutableDynamic: $publicMutableDynamic
  privateImmutableDynamic: $_privateImmutableDynamic
  privateMutableDynamic: $_privateMutableDynamic
  publicImmutable: $publicImmutable
  publicMutable: $publicMutable
  privateImmutable: $_privateImmutable
  privateMutable: $_privateMutable
  fieldSum: $fieldSum
  ''';
}
