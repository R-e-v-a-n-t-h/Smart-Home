import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // );
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFEBF8FF),


        appBar: AppBar(
            actions: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
            ),

        ],
        centerTitle: false,
        backgroundColor: Color(0xFF2A4365)
      ),


      body: Center(
        child: Text("Hello there")
      )
    );
  }
}
