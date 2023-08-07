import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_model.dart';
import 'package:guild_test_joke/l10n/localization_provider.dart';

class DeliveryContainer extends ConsumerWidget {
  DeliveryContainer({required this.joke, super.key});

  final Joke joke;

  final showDelivery = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(appLocalizationsProvider);

    showDelivery.value = false;

    return ValueListenableBuilder(
      valueListenable: showDelivery,
      builder: (context, value, child) {
        return Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(
            minHeight: 50.0,
          ),
          margin: const EdgeInsets.only(
            top: 10.0,
          ),
          child: value
              ? Text(
                  joke.delivery,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                )
              : TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    showDelivery.value = true;
                  },
                  label: const Icon(Icons.remove_red_eye),
                  icon: Text(translate.button_see_answer),
                ),
        );
      },
    );
  }
}
