import 'dart:async';
import 'package:flutter/material.dart';
import 'arguments/arguments.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {


  @override
  Widget build(BuildContext context) {
    Map details={};
    final args = ModalRoute.of(context)!.settings.arguments as ItemToProductLoading;

    void getData() async {
      DateTime nowTime =DateTime.now();
      Response response = await get(Uri.parse('http://10.0.2.2:8000/${args.Id.substring(0,2).toLowerCase()}/details/${args.Id}'));
      details = jsonDecode(response.body);

      while (details.isEmpty){
        Future.delayed(const Duration(seconds: 1));
      }

      var On= details["OnTimer"];
      var Off=details["OffTimer"];
      DateTime OnTime = new DateTime(nowTime.year,nowTime.month,nowTime.day,int.parse(On.substring(0,2)),int.parse(On.substring(3,5)),int.parse(On.substring(6,8)),nowTime.millisecond,nowTime.microsecond);
      DateTime OffTime = new DateTime(nowTime.year,nowTime.month,nowTime.day,int.parse(Off.substring(0,2)),int.parse(Off.substring(3,5)),int.parse(Off.substring(6,8)),nowTime.millisecond,nowTime.microsecond);

      Navigator.pushReplacementNamed(context, '/product/${args.Id.substring(0,2).toLowerCase()}',arguments:ProductLoadingToProduct(details,OnTime,OffTime,OffTime.difference(OnTime).inSeconds));

    }

    getData();

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
      body: Center(
        child: Container(

          child: Center(
              child: SpinKitWave(
                  color: Color(0xFF2A4365),
                  size: 40.0
              )
          ),
        ),
      ),
    );
  }
}
