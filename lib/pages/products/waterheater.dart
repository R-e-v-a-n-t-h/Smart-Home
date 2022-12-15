import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class WaterHeater extends StatefulWidget {
  const WaterHeater({Key? key}) : super(key: key);

  @override
  State<WaterHeater> createState() => _WaterHeaterState();
}

class _WaterHeaterState extends State<WaterHeater> {
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

        body:SafeArea(child:Text("Water Heater")
        )
    );
  }
}
