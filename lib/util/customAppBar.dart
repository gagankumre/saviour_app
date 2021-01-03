import 'package:flutter/material.dart';

Widget customAppBar(){
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 40.0,
    ),
    title: Hero(
      tag: '',
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          'SAVIOUR',
          style: TextStyle(
            letterSpacing: 2.0,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      )
    ),
    backgroundColor: Colors.orange,
    toolbarHeight: 100.0,
  );
}


