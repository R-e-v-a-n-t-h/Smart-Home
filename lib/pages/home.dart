import 'dart:async';
import 'package:flutter/material.dart';
import 'arguments/arguments.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map hash={};/*{
    "Home1": {
      "Hall": {"Ac": ["Ac000001"], "Charger": ["Ch000001"], "VacuumCleaner": ["Vc000001"]},
      "Kitchen": {"Kettle": ["Kt000001"], "Microwave": ["Mw000001"], "CoffeeMachine": ["Cm000001"]},
      "Bedroom": {"Ac": ["Ac000002"], "Lamp": ["Lp000001"]},
      "Inside Bathroom": {"WaterHeater": ["Wh000001"]},
      "Outside Bathroom": {"WaterHeater": ["Wh000002"]}
    }
  };*/



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LoadingToHomes;
    hash=args.homes;

    List<Widget> getHomeButtons(Map homes){
      List<Widget> homeButtons = <Widget>[];
      List<String> homesList = List<String>.from(homes.keys);
      for (var home in homesList) {
        homeButtons.add(Container(
          padding:EdgeInsets.fromLTRB(20, 30, 20, 10),
          child:ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/rooms',arguments:HomeToRooms(homes[home]));
              },
              child: Text(home,style: TextStyle(fontSize: 24,color: Color(0xFF2D3748))),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE2E8F0),
              onPrimary: Color(0xFFA1A5AA),
              shadowColor: Color(0xFFC8CCD1),
              minimumSize: const Size.fromHeight(50), // NEW
            ),
          )
        ));
      }
      return homeButtons;
    }


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

        body:SafeArea(
          child:Column(
            children:getHomeButtons(hash)

          )
        )
    );

  }
}

