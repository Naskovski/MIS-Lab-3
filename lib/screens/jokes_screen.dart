import 'package:flutter/material.dart';
import 'package:lab2/models/joke.dart';
import 'package:lab2/service/api_service.dart';
import 'package:lab2/widgets/joke_list.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {

  List<Joke> jokes = [];
  String? jokeType;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    jokeType = ModalRoute.of(context)?.settings.arguments as String?;

    if (jokeType != null) {
      getJokesFromAPI();
    }
  }

  void getJokesFromAPI() async {
    if (jokeType == null) return;
    final jokesData = await ApiService.getJokesByType(jokeType!);
    setState(() {
      jokes = jokesData.map<Joke>((json) {
        return Joke.fromJson(json);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: const Color(0xFFFFFFFF)
          ),
        title: const Text('Jokes',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: JokeList(jokes: jokes,),
      backgroundColor: Color(0xFF052032),
    );
  }
}
