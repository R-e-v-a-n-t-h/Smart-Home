import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class Charger extends StatefulWidget {
  const Charger({Key? key}) : super(key: key);

  @override
  State<Charger> createState() => _ChargerState();
}

class _ChargerState extends State<Charger> {
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

        body:SafeArea(child:Text("Charger")
        )
    );
  }
}
