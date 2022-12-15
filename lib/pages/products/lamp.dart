import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class Lamp extends StatefulWidget {
  const Lamp({Key? key}) : super(key: key);

  @override
  State<Lamp> createState() => _LampState();
}

class _LampState extends State<Lamp> {
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

        body:SafeArea(child:Text("Lamp")
        )
    );
  }
}
