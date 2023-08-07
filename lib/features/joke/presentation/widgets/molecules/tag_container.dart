import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_tag_model.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/atoms/tag_widget.dart';
import 'package:guild_test_joke/l10n/localization_provider.dart';

class TagContainer extends ConsumerWidget {
  const TagContainer({required this.tags, super.key});

  final List<JokeTag> tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(appLocalizationsProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Wrap(
        runSpacing: 5.0,
        spacing: 8.0,
        children: [
          for (final tag in tags) //
            TagWidget(tag: translate['tag_${tag.value}']),
        ],
      ),
    );
  }
}
