import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/service/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> types = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  void getJokeTypes() async {
    ApiService.getJokeTypes().then((res) {
      setState(() {
        types = List<String>.from(jsonDecode(res.body));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("211198",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.question_mark_rounded),
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: types.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
            onTap: () => {
              Navigator.pushNamed(context, '/type', arguments: types[index])
            },
            child: ListTile(
              title: Text(types[index]),
              leading: const Icon(Icons.tag),
            ),
          ));
        },
      ),
      backgroundColor: Colors.white70,
    );
  }
}
