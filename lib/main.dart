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
import 'pages/products/microwave.dart';
import 'pages/products/waterheater.dart';
import 'pages/loading.dart';
import "pages/product.dart";



void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // );
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes:{
        '/': (context)=>Loading(),
        '/home': (context)=>Home(),
        '/rooms': (context)=>Rooms(),
        '/items':(context)=>Items(),
        "/product":(context)=>Product(),
        '/product/ac': (context)=>Ac(),
        '/product/ch': (context)=>Charger(),
        '/product/cm': (context)=>CoffeeMachine(),
        '/product/kt': (context)=>Kettle(),
        '/product/lp': (context)=>Lamp(),
        '/product/vc': (context)=>VacuumCleaner(),
        '/product/mw': (context)=>MicroWave(),
        '/product/wh': (context)=>WaterHeater(),


      }
    );
  }
}

