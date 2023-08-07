import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guild_test_joke/features/joke/presentation/provider/joke_provider.dart';
import 'package:guild_test_joke/features/joke/presentation/provider/state/joke_state.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/atoms/logo_widget.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/atoms/next_joke_button.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/organisms/joke_card.dart';
import 'package:guild_test_joke/l10n/localization_provider.dart';

class JokePage extends ConsumerWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(appLocalizationsProvider);
    final provider = ref.watch(jokeStateNotifierProvider);

    ref.listen(jokeStateNotifierProvider.select((value) => value), (_, next) {
      if (next.state == JokeStatusState.failure) {
        Fluttertoast.showToast(
          msg: translate[next.exception],
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        // ref.read(jokeStateNotifierProvider.notifier).reset();
      }
    });

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 20.0,
            child: LogoWidget(),
          ),
          if (provider.state == JokeStatusState.loading)
            const Align(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 5.0,
              ),
            ),
          if (provider.state == JokeStatusState.success)
            Align(
              child: JokeCard(
                joke: provider.joke!,
                onNextJoke: () => callNewJoke(ref),
              ),
            ),
          if (provider.state == JokeStatusState.failure &&
              provider.exception == 'error_network_not_available') ...[
            Align(
              child: NextJokeButton(
                onPressed: () => callNewJoke(ref),
              ),
            ),
          ]
        ],
      ),
    );
  }

  void callNewJoke(WidgetRef ref) {
    ref.read(jokeStateNotifierProvider.notifier).callNewJoke();
  }
}
