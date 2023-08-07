// enum JokeTag { nsfw, religious, political, racist, sexist }

class JokeTag {
  const JokeTag._(this._value);

  final String _value;

  static const nsfw = JokeTag._('nsfw');
  static const religious = JokeTag._('religious');
  static const political = JokeTag._('political');
  static const racist = JokeTag._('racist');
  static const sexist = JokeTag._('sexist');

  static const values = [
    nsfw,
    religious,
    political,
    racist,
    sexist,
  ];

  String get value => _value;

  @override
  String toString() {
    return 'JokeTag.$_value';
  }
}
