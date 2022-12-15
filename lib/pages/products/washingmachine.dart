import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class WashingMachine extends StatefulWidget {
  const WashingMachine({Key? key}) : super(key: key);

  @override
  State<WashingMachine> createState() => _WashingMachineState();
}

class _WashingMachineState extends State<WashingMachine> {
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

        body:SafeArea(child:Text("Washing Machine")
        )
    );
  }
}
