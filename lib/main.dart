import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/rooms.dart';
import 'pages/items.dart';
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
        '/product/ac': (context)=>Items(),
        '/product/charger': (context)=>Items(),
        '/product/coffeemachine': (context)=>Items(),
        '/product/kettle': (context)=>Items(),
        '/product/lamp': (context)=>Items(),
        '/product/vacuumcleaner': (context)=>Items(),
        '/product/washingmachine': (context)=>Items(),
        '/product/waterheater': (context)=>Items(),


      }
    );
  }
}

