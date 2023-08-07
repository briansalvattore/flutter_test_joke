import 'dart:convert';

import 'package:guild_test_joke/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:guild_test_joke/features/joke/data/repositories/joke_repository_impl.dart';
import 'package:guild_test_joke/features/joke/domain/repositories/joke_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../data.dart';

void main() {
  late JokeRepository usRepository;
  late JokeRemoteDataSource remoteDataSource;

  setUpAll(() async {
    final client = MockClient(
      (request) async => http.Response(
        json.encode(dataTest),
        200,
        request: request,
        headers: {'content-type': 'application/json'},
      ),
    );

    remoteDataSource = JokeRemoteDataSource(client);

    usRepository = JokeRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
  });

  test('verify with fake data', () async {
    final value = await usRepository.getRandomJoke();

    expect(value, isNotNull);
  });
}
