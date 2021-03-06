//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget
{
  final String title;
  final IconData icon;
  final Function navpage;

  CustomCard({this.icon,this.title, this.navpage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        color: Colors.redAccent,
        child: ListTile(contentPadding: EdgeInsets.all(10),
          leading: Icon(
            icon,
            color: Colors.white,
            size: 60,
          ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: navpage,
        ),
      ),
    );
  }

}