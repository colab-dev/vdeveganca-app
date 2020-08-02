import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final item;

  SearchResult(this.item);

  @override
  Widget build(BuildContext context) {
    print(item);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            this.item['image'],
            fit: BoxFit.fill,
            width: 150,
          ),
          Column(
            children: [
              Text(this.item['name']),
              Text(this.item['description']),
            ],
          ),
        ],
      ),
    );
  }
}
