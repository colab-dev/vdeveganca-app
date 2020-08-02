import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './searchBar.dart';
import './searchResult.dart';
import './models/ingredient.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V de Veganca',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'V de Vegança'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Future<List<Ingredient>> items = List.filled(1, Ingredient);
  // items = [
  //   {
  //     'name': 'Toddy',
  //     'image': 'https://static.paodeacucar.com/img/uploads/1/400/615400.png',
  //     'description': 'Achocolatado da Pepsico',
  //   },
  //   {
  //     'name': 'Nescau',
  //     'image': 'https://static.paodeacucar.com/img/uploads/1/250/637250.png',
  //     'description': 'Achocolatado Vegano muito melhor que o toddy',
  //   },
  // ];

  void onSearch() {
    print(fetchResults());
    setState(() {
      // this.items = fetchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<Ingredient>>(
            future: fetchResults(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Ingredient> ingredients = snapshot.data;
                return Column(children: [
                  SearchBar(onSearch),

                  ...ingredients.map((item) {
                    return SearchResult(item);
                  }).toList(),

                  // ...snapshot.data.map((item) {
                  //   return SearchResult(item);
                  // }).toList(),
                ]);
              } else {
                return Text('loading');
              }
            })

        // body: Column(
        //   children: [
        //     SearchBar(onSearch),
        //     ...(this.items).map((item) {
        //       return SearchResult(item);
        //     }).toList(),
        //   ],
        // ),
        );
  }
}

Future<List<Ingredient>> fetchResults() async {
  print('Fetching API');
  final response = await http.get('http://demo6344138.mockable.io/results');

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    List<Ingredient> ingredients = body.map(
      (dynamic item) {
        return Ingredient.fromJson(item);
      },
    ).toList();
    return ingredients;

    // final parsed = json.decode(response.body).cast<List<Ingredient>>();
    // return parsed.map<Ingredient>((json) => Ingredient.fromJson(json)).toList();
    // return List<Ingredient>.fromJson();
  } else {
    throw Exception('Failed to load results');
  }
}
