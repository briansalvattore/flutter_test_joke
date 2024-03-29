import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final httpProvider = Provider<http.Client>((_) {
  return http.Client();
});
