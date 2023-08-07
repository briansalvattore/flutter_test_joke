class JokeType {
  const JokeType._(this._type);

  final String _type;

  static const single = JokeType._('single');
  static const twoPart = JokeType._('twopart');

  static const values = [
    single,
    twoPart,
  ];

  static JokeType parse(String? value) {
    switch (value) {
      case 'single':
        return JokeType.single;
      case 'twopart':
        return JokeType.twoPart;
    }

    throw UnimplementedError();
  }

  @override
  String toString() {
    return 'JokeType.$_type';
  }
}
