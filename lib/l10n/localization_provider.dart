import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLocalizationProvider = StateProvider<Locale>((ref) {
  return const Locale('es');
});

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  return lookupAppLocalizations(ref.watch(currentLocalizationProvider));
});

extension AppLocalizationsExtension on AppLocalizations {
  String operator [](String key) {
    switch (key) {
      case 'error_network_not_available':
        return error_network_not_available;
      case 'error_joke_not_found':
        return error_joke_not_found;

      case 'tag_nsfw':
        return tag_nsfw;
      case 'tag_religious':
        return tag_religious;
      case 'tag_political':
        return tag_political;
      case 'tag_racist':
        return tag_racist;
      case 'tag_sexist':
        return tag_sexist;
    }
    return error_default;
  }
}
