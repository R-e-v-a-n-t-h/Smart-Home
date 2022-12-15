import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/rooms.dart';
import 'pages/items.dart';
import 'pages/products/ac.dart';
import 'pages/products/charger.dart';
import 'pages/products/coffeemachine.dart';
import 'pages/products/kettle.dart';
import 'pages/products/lamp.dart';
import 'pages/products/vacuumcleaner.dart';
import 'pages/products/washingmachine.dart';
import 'pages/products/waterheater.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // );
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/home',
      routes:{
        '/home': (context)=>Home(),
        '/rooms': (context)=>Rooms(),
        '/items':(context)=>Items(),
        '/product/ac': (context)=>Ac(),
        '/product/charger': (context)=>Charger(),
        '/product/coffeemachine': (context)=>CoffeeMachine(),
        '/product/kettle': (context)=>Kettle(),
        '/product/lamp': (context)=>Lamp(),
        '/product/vacuumcleaner': (context)=>VacuumCleaner(),
        '/product/washingmachine': (context)=>WashingMachine(),
        '/product/waterheater': (context)=>WaterHeater(),


      }
    );
  }
}

