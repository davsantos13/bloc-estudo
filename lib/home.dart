import 'package:bloc_study/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String title;
  final User user;

  Home({this.title, this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(widget.user.name)),
      ),
    );
  }
}