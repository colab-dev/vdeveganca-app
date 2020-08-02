import 'package:flutter/material.dart';

import './searchBar.dart';
import './searchResult.dart';

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
  var items = [
    {
      'name': 'Toddy',
      'image': 'https://static.paodeacucar.com/img/uploads/1/400/615400.png',
      'description': 'Achocolatado da Pepsico',
      'test': '1'
    },
    {
      'name': 'Nescau',
      'image': 'https://static.paodeacucar.com/img/uploads/1/250/637250.png',
      'description': 'Achocolatado Vegano muito melhor que o toddy',
      'test': '2'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SearchBar(),
          ...this.items.map((item) {
            return SearchResult(item);
          }).toList(),
        ],
      ),
    );
  }
}
