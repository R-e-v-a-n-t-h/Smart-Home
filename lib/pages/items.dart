import 'dart:async';
import 'package:flutter/material.dart';
import "arguments/arguments.dart";
import 'package:http/http.dart';
import 'dart:convert';

class Items extends StatefulWidget {


  @override
  State<Items> createState() => _ItemsState();
}



class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as RoomToItems;

    List<Widget> getItemButtons(Map items){
      List<Widget> itemButtons = <Widget>[];
      List<String> itemsList = List<String>.from(items.keys);
      for (var item in itemsList) {
        itemButtons.add(Container(
            padding:EdgeInsets.fromLTRB(20, 30, 20, 10),
            child:ElevatedButton(
              onPressed: ()async{
                Navigator.pushNamed(context, '/product',arguments:ItemToProductLoading(items[item][0]));
              },
              child: Text(item,style: TextStyle(fontSize: 24,color: Color(0xFF2D3748))),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE2E8F0),
                onPrimary: Color(0xFFA1A5AA),
                shadowColor: Color(0xFFC8CCD1),
                minimumSize: const Size.fromHeight(50), // NEW
              ),
            )
        ));
      }
      return itemButtons;
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
                children:getItemButtons(args.items)

            )
        )
    );;
  }
}
