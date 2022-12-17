import 'dart:async';
import 'package:flutter/material.dart';
import 'arguments/arguments.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map homes={};
  void getData() async{
    Response response = await get(Uri.parse('http://10.0.2.2:8000/get-home'));
    homes=jsonDecode(response.body);
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/home',arguments:LoadingToHomes(homes));
  }

  @override
  void initState(){
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF90CDF4),
                  Color(0xFF2A4365),
                ],
              )
          ),
          child: Center(
            child: SpinKitWave(
              color: Color(0xFFEBF8FF),
              size: 175.0
            )
          ),
        ),
      ),
    );
  }
}
