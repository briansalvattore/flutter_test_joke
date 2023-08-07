import 'dart:convert';

import 'package:guild_test_joke/features/joke/data/datasources/joke_remote_datasource.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../data.dart';

void main() {
  late JokeRemoteDataSource usRemoteDataSource;

  setUpAll(() {
    final client = MockClient(
      (request) async => http.Response(
        json.encode(dataTest),
        200,
        request: request,
        headers: {'content-type': 'application/json'},
      ),
    );

    usRemoteDataSource = JokeRemoteDataSource(client);
  });

  test('Correct field structure', () async {
    final response = await usRemoteDataSource.getJokeFromNetwork();

    expect(response, isMap);
    expect(response, containsPair('error', false));
    expect(response, containsPair('joke', isNotEmpty));
  });
}
