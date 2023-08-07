import 'package:guild_test_joke/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_model.dart';
import 'package:guild_test_joke/features/joke/domain/repositories/joke_repository.dart';

class JokeRepositoryImpl implements JokeRepository {
  JokeRepositoryImpl({
    required this.remoteDataSource,
  });

  final JokeRemoteDataSource remoteDataSource;

  @override
  Future<Joke?> getRandomJoke() async {
    final response = await remoteDataSource.getJokeFromNetwork();

    if (response == null) {
      return null;
    }

    final model = Joke.fromMap(response);

    return model;
  }
}
