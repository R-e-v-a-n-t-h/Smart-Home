import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";

class VacuumCleaner extends StatefulWidget {
  const VacuumCleaner({Key? key}) : super(key: key);

  @override
  State<VacuumCleaner> createState() => _VacuumCleanerState();
}

class _VacuumCleanerState extends State<VacuumCleaner> {
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

        body:SafeArea(child:Text("Vacuum Cleaner")
        )
    );
  }
}
