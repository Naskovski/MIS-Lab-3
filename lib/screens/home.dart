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
        backgroundColor: Color(0xFF052032),
        title: const Text("211198 Jokes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sentiment_very_satisfied, color: Color(
                0xFF904E55),),
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
              color: const Color(0xFFFFFFFF),
              child: InkWell(
            onTap: () => {
              Navigator.pushNamed(context, '/type', arguments: types[index])
            },
            child: ListTile(
              title: Text(types[index],
                  style: const TextStyle(color: Color(0xFF000000))),
              leading: const Icon(Icons.chevron_right, color: Color(0xFF000000),),
            ),
          ));
        },
      ),
      backgroundColor: Color(0xFF002626)
    );
  }
}
