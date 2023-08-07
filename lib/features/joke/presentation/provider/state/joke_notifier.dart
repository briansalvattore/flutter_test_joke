import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/domain/repositories/joke_repository.dart';
import 'package:guild_test_joke/features/joke/presentation/provider/state/joke_state.dart';

class JokeNotifier extends StateNotifier<JokeState> {
  JokeNotifier({
    required this.jokeRepository,
  }) : super(const JokeState.initial());

  final JokeRepository jokeRepository;

  Future<void> callNewJoke() async {
    state = state.copyWith(state: JokeStatusState.loading);

    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      state = state.copyWith(
        state: JokeStatusState.failure,
        exception: 'error_network_not_available',
      );
      return;
    }

    final joke = await jokeRepository.getRandomJoke();

    if (joke == null) {
      state = state.copyWith(
        state: JokeStatusState.failure,
        exception: 'error_joke_not_found',
      );
      return;
    }

    state = state.copyWith(
      state: JokeStatusState.success,
      joke: joke,
    );
  }

  JokeState reset() {
    return state = state.copyWith(state: JokeStatusState.initial);
  }
}
