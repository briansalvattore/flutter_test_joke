import 'package:flutter/material.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_model.dart';
import 'package:guild_test_joke/features/joke/domain/models/joke_type_model.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/atoms/next_joke_button.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/molecules/delivery_container.dart';
import 'package:guild_test_joke/features/joke/presentation/widgets/molecules/tag_container.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    required this.joke,
    required this.onNextJoke,
    super.key,
  });

  final Joke joke;
  final VoidCallback onNextJoke;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30.0),
          Text(
            joke.joke,
            key: const ValueKey('joke_text'),
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          if (joke.type == JokeType.twoPart) DeliveryContainer(joke: joke),
          TagContainer(tags: joke.tags),
          const SizedBox(height: 20.0),
          NextJokeButton(onPressed: onNextJoke),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
