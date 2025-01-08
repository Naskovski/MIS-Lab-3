import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab3/models/joke.dart';
import 'package:lab3/service/api_service.dart';
import 'package:lab3/widgets/joke_card.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  Joke joke = Joke(id: 0, type: 'loading', setup: 'Please wait', punchline: 'wait a little more');

  @override
  void initState() {
    super.initState();

    ApiService.getRandomJoke().then((res) {
      setState(() {
        joke = Joke.fromJson(jsonDecode(res.body));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF5C00),
            iconTheme: const IconThemeData(
              color: const Color(0xFF052032)
            ),
          title: const Text('Joke of the day',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: JokeCard(joke: joke),
      backgroundColor: const Color(0xFFFF5C00),
    );
  }
}
