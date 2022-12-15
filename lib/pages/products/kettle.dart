import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class Kettle extends StatefulWidget {
  const Kettle({Key? key}) : super(key: key);

  @override
  State<Kettle> createState() => _KettleState();
}

class _KettleState extends State<Kettle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.png"),
              ),

            ],
            centerTitle: false,
            backgroundColor: Color(0xFF2A4365)
        ),
        backgroundColor:Color(0xFFEBF8FF),

        body:SafeArea(child:Text("Kettle")
        )
    );
  }
}
