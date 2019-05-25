import 'package:flutter/material.dart';

class CategoryRowView extends StatelessWidget {

 final String categoryName;
  CategoryRowView(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(categoryName),
      ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Text("10"),
          Text("20"),
          Text("30"),

      ],)
    ]);
  }

}