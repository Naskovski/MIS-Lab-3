import 'package:flutter/material.dart';
import 'package:lab3/models/joke.dart';
import 'package:lab3/service/persistence_service.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _isRevealed = false;
  bool _isFavourite = false;

  void _toggleFavourite() {
    if (_isFavourite){
      PersistenceService.removeFavourite(widget.joke.id);
    }else{
      PersistenceService.addFavourite(widget.joke.id);
    }

    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: const Color(0xBAFF8762),
      child: Stack(
        children: [
          InkWell(
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
                          color: Color(0xFF052032),
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(
                _isFavourite ? Icons.star : Icons.star_border,
                color: _isFavourite ? Colors.yellow : Colors.grey,
              ),
              onPressed: _toggleFavourite,
            ),
          ),
        ],
      ),
    );
  }
}
