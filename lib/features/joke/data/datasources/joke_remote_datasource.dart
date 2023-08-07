import 'dart:convert';

import 'package:http/http.dart' as http;

class JokeRemoteDataSource {
  JokeRemoteDataSource(this.client);

  final http.Client client;

  Future<Map<String, dynamic>?> getJokeFromNetwork() async {
    final request = await client.get(
      Uri.parse('https://v2.jokeapi.dev/joke/Any?lang=es'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (request.statusCode != 200) {
      return null;
    }

    final responseTxt = utf8.decode(request.bodyBytes);

    final decode = json.decode(responseTxt) as Map<dynamic, dynamic>;

    final hasError = '${decode['error']}' == 'true';
    if (hasError) {
      return null;
    }

    return Map<String, dynamic>.from(decode);
  }
}
