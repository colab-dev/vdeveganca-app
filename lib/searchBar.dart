import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
                decoration: const InputDecoration(
              hintText: 'Buscar ingrediente',
            )),
          ),
          RaisedButton(
            onPressed: null,
            child: Text('Buscar'),
          ),
        ],
      ),
    );
  }
}
