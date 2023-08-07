import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:guild_test_joke/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:guild_test_joke/features/joke/domain/repositories/joke_repository.dart';
import 'package:guild_test_joke/shared/domain/providers/http_provider.dart';
import 'package:http/http.dart' as http;

final jokeSourceRemoteProvider =
    Provider.family<JokeRemoteDataSource, http.Client>(
  (_, service) => JokeRemoteDataSource(service),
);

final jokeRepositoryProvider = Provider<JokeRepository>((ref) {
  final httpService = ref.watch(httpProvider);
  final remoteDataSource = ref.watch(jokeSourceRemoteProvider(httpService));

  return JokeRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
});
