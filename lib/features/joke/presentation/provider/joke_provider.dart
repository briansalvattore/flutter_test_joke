import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/domain/providers/joke_domain_providers.dart';
import 'package:guild_test_joke/features/joke/presentation/provider/state/joke_notifier.dart';
import 'package:guild_test_joke/features/joke/presentation/provider/state/joke_state.dart';

final jokeStateNotifierProvider =
    StateNotifierProvider<JokeNotifier, JokeState>((ref) {
  final repository = ref.watch(jokeRepositoryProvider);

  return JokeNotifier(
    jokeRepository: repository,
  )..callNewJoke();
});
