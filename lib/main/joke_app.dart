import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guild_test_joke/routes/app_route.dart';

class JokeApp extends StatelessWidget {
  JokeApp({super.key});

  final _appRoute = AppRoute();
  final _locale = const Locale('es');

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      title: 'Joke app',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: GoogleFonts.montserratTextTheme(textTheme),
      ),
      routerConfig: _appRoute.config(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [_locale],
      locale: _locale,
    );
  }
}
