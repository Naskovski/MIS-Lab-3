import 'package:flutter/material.dart';
import 'package:lab2/models/joke.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _isRevealed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.red,
      child: InkWell(
        onTap: () {
          setState(() {
            _isRevealed = !_isRevealed;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isRevealed ? widget.joke.punchline : widget.joke.setup,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                if (!_isRevealed)
                  const Text(
                    "Click to reveal",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
