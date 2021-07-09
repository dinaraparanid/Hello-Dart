class ImmutableExample<T extends num> {
  final int _num;
  final T publicImmutable;
  final T _privateImmutable;
  // late final lateinitVar; not allowed

  const ImmutableExample(this._num, this.publicImmutable, this._privateImmutable);

  int get num => _num;
  T get privateImmutable => _privateImmutable;

  @override
  String toString() => '''
  Example № $_num
  publicImmutable: $publicImmutable
  privateImmutable: $_privateImmutable
  ''';
}