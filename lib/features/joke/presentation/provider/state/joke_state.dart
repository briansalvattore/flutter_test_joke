import 'package:guild_test_joke/features/joke/domain/models/joke_model.dart';

enum JokeStatusState { initial, loading, success, failure }

class JokeState {
  const JokeState({
    this.joke,
    this.state = JokeStatusState.initial,
    this.exception = '',
  });

  const JokeState.initial({
    this.joke,
    this.state = JokeStatusState.initial,
    this.exception = '',
  });

  final Joke? joke;
  final JokeStatusState state;
  final String exception;

  JokeState copyWith({
    Joke? joke,
    JokeStatusState? state,
    String? exception,
  }) {
    return JokeState(
      joke: joke ?? this.joke,
      state: state ?? this.state,
      exception: exception ?? this.exception,
    );
  }
}
