import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";
class CoffeeMachine extends StatefulWidget {
  const CoffeeMachine({Key? key}) : super(key: key);

  @override
  State<CoffeeMachine> createState() => _CoffeeMachineState();
}

class _CoffeeMachineState extends State<CoffeeMachine> {
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

        body:SafeArea(child:Text("Coffee Machine")
        )
    );
  }
}
