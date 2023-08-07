import 'package:guild_test_joke/features/joke/domain/models/joke_model.dart';

mixin JokeRepository {
  Future<Joke?> getRandomJoke();
}
