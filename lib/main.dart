import 'package:flutter/material.dart';
import 'package:lab2/screens/home.dart';
import 'package:lab2/screens/jokes_screen.dart';
import 'package:lab2/screens/random_joke_screen.dart';

void main() {
  runApp(const JokeApp());
}

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211198',
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/type': (context) => const JokesScreen(),
        '/random': (context) => const RandomJokeScreen(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF5C00)),
      ),
    );
  }
}