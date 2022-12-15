import 'dart:async';
import 'package:flutter/material.dart';
import 'arguments/arguments.dart';
class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as HomeToRooms;

    List<Widget> getRoomButtons(Map rooms){
      List<Widget> roomButtons = <Widget>[];
      List<String> roomsList = List<String>.from(rooms.keys);
      for (var room in roomsList) {
        roomButtons.add(Container(
            padding:EdgeInsets.fromLTRB(20, 30, 20, 10),
            child:ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/items',arguments:RoomToItems(rooms[room]));
              },
              child: Text(room,style: TextStyle(fontSize: 24,color: Color(0xFF2D3748))),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE2E8F0),
                onPrimary: Color(0xFFA1A5AA),
                shadowColor: Color(0xFFC8CCD1),
                minimumSize: const Size.fromHeight(50), // NEW
              ),
            )
        ));
      }
      return roomButtons;
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
                children:getRoomButtons(args.rooms)

            )
        )
    );;
  }
}
