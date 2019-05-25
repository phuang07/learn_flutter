import 'package:flutter/material.dart';
import 'package:startup_namer/category-row.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      
      child:   ListView(children: <Widget>[
      CategoryRowView("category 1"),
      // CategoryRowView("category 2"),
      // CategoryRowView("category 3"),
    ])
    );
  
  }

}