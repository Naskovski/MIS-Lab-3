import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/models/joke.dart';
import 'package:lab2/service/api_service.dart';
import 'package:lab2/widgets/joke_card.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {

  late Joke joke;

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
          backgroundColor: Colors.red,
          title: const Text('Joke of the day',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: JokeCard(joke: joke),
      backgroundColor: Colors.red,
    );
  }
}
