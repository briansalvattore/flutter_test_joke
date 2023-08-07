import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/l10n/localization_provider.dart';

class NextJokeButton extends ConsumerWidget {
  const NextJokeButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(appLocalizationsProvider);

    return TextButton.icon(
      key: const ValueKey('next_button'),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 18.0,
        ),
      ),
      onPressed: onPressed,
      label: const Icon(Icons.arrow_forward),
      icon: Text(translate.button_next_joke),
    );
  }
}
