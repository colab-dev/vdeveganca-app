import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vdeveganca_app/models/ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:vdeveganca_app/widgets/search_bar.dart';
import 'package:vdeveganca_app/widgets/search_result.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Ingredient>> ingredients;

  Future<List<Ingredient>> fetchResults() async {
    final response = await http.get('http://demo6344138.mockable.io/results');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Ingredient> ingredients = body.map(
        (dynamic item) {
          return Ingredient.fromJson(item);
        },
      ).toList();
      return ingredients;
    } else {
      throw Exception('Failed to load results');
    }
  }

  @override
  void initState() {
    super.initState();
    ingredients = fetchResults();
  }

  void onSearch() {
    setState(() {
      this.ingredients = fetchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Ingredient>>(
          future: ingredients,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                SearchBar(onSearch),
                ...snapshot.data.map((item) {
                  return SearchResult(item);
                }).toList(),
              ]);
            } else {
              return Text('loading');
            }
          }),
    );
  }
}
