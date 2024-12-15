import 'package:flutter/cupertino.dart';
import 'package:lab2/models/joke.dart';
import 'package:lab2/widgets/joke_card.dart';

class JokeList extends StatelessWidget {
  final List<Joke> jokes;

  const JokeList({super.key, required this.jokes});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(4),
        semanticChildCount: 250,
        shrinkWrap: true,
        children: jokes
            .map((item) => JokeCard(
                joke: Joke(
                    id: item.id,
                    type: item.type,
                    setup: item.setup,
                    punchline: item.punchline)))
            .toList());
  }
}
