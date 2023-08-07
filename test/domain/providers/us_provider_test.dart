import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:guild_test_joke/features/joke/domain/providers/joke_domain_providers.dart';
import 'package:guild_test_joke/features/joke/domain/repositories/joke_repository.dart';
import 'package:guild_test_joke/shared/domain/providers/http_provider.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

void main() {
  final providerContainer = ProviderContainer();
  late http.Client httpService;
  late dynamic remoteDataSource;
  late dynamic jokeRepository;

  setUpAll(() {
    httpService = providerContainer.read(httpProvider);

    remoteDataSource =
        providerContainer.read(jokeSourceRemoteProvider(httpService));

    jokeRepository = providerContainer.read(jokeRepositoryProvider);
  });

  test('remoteDataSource is a JokeRemoteDataSource', () {
    expect(
      remoteDataSource,
      isA<JokeRemoteDataSource>(),
    );
  });

  test('jokeRepository is a JokeRepository', () {
    expect(
      jokeRepository,
      isA<JokeRepository>(),
    );
  });
}
