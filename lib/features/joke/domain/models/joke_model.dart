import 'package:guild_test_joke/features/joke/domain/models/joke_tag_model.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_type_model.dart';
import 'package:guild_test_joke/shared/value_extensions.dart';

class Joke {
  Joke._({
    required this.joke,
    required this.delivery,
    required this.type,
    required this.tags,
  });

  final String joke;
  final String delivery;
  final JokeType type;
  final List<JokeTag> tags;

  // ignore: prefer_constructors_over_static_methods
  static Joke fromMap(Map<String, dynamic> map) {
    final type = JokeType.parse(map.getString('type'));
    final flags = map.getMap('flags');

    return Joke._(
      joke: map.getString(type == JokeType.single ? 'joke' : 'setup'),
      delivery: map.getString('delivery'),
      type: type,
      tags: [
        if (flags.getBool('nsfw')) JokeTag.nsfw,
        if (flags.getBool('religious')) JokeTag.religious,
        if (flags.getBool('political')) JokeTag.political,
        if (flags.getBool('racist')) JokeTag.racist,
        if (flags.getBool('sexist')) JokeTag.sexist,
      ],
    );
  }
}
