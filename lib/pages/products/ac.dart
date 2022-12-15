import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";
class Ac extends StatefulWidget {
  const Ac({Key? key}) : super(key: key);

  @override
  State<Ac> createState() => _AcState();
}

class _AcState extends State<Ac> {
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

        body:SafeArea(child:Text("Ac")
        )
    );;
  }
}
