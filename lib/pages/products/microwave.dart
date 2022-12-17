import 'dart:async';
import 'package:flutter/material.dart';
import "../arguments/arguments.dart";
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class MicroWave extends StatefulWidget {
  const MicroWave({Key? key}) : super(key: key);

  @override
  State<MicroWave> createState() => _MicroWaveState();
}

class _MicroWaveState extends State<MicroWave> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as ProductLoadingToProduct;
    String updateURL = 'http://10.0.2.2:8000/${args.details["Id"].substring(0,2).toLowerCase()}/update/${args.details["Id"]}';
    Map details = args.details;
    bool Status = args.details["Status"],
        TimerStatus = args.details["TimerStatus"];
    String OnTimer = args.details["OnTimer"],
        OffTimer = args.details["OffTimer"];
    int secondsDifference = args.secondsDifference;


    DateTime OnTime = args.OnTime;
    DateTime OffTime = args.OffTime;
    print(OnTimer);
    print(OffTimer);


//Function to disable/enable time text
    int setColors() {
      if (TimerStatus) {
        return 0xFF2D3748;
      }
      else {
        return 0xFF626367;
      }
    }
//Function to disable/enable time text


// Function to disable/enable set time buttons

// Function to disable/enable set time buttons


    List<Widget> getDetailsUI() {
      List<Widget> components = <Widget>[
        // ElevatedButton(
        // onPressed: (){
        // },
        // child: Text("home",style: TextStyle(fontSize: 24,color: Color(0xFF2D3748))),
        // style: ElevatedButton.styleFrom(
        // primary: Color(0xFFE2E8F0),
        // onPrimary: Color(0xFFA1A5AA),
        // shadowColor: Color(0xFFC8CCD1),
        // minimumSize: const Size.fromHeight(50), // NEW
        // ),
        // ),


//--------------------------------------------------------> On/Off Switch
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
          child: Transform.scale(scale: 2.0,
            child: Switch(
              value: Status,
              onChanged: (value) {
                setState(() {
                  details["Status"] = value;
                  Status = value;
                  args.details=details;
                  put(Uri.parse(updateURL), body: jsonEncode(details),
                      headers: { "Content-Type": "application/json"});
                });
              },
              activeTrackColor: Color(0xFF3182CE),
              activeColor: Color(0xFFFFFFFF),
            ),
          ),
        ),
//--------------------------------------------------------> On/Off Switch

//--------------------------------------------------------> Timer,switch
        Container(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 10),

          child: Row(

              children: [
                Expanded(
                    child: Text("Timer", style: TextStyle(
                        color: Color(0xFF2D3748),
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
                ),
                Expanded(
                  child: Switch(
                    value: TimerStatus,
                    onChanged: (value) {
                      setState(() {
                        details["TimerStatus"] = value;
                        TimerStatus = value;
                        args.details=details;
                        put(Uri.parse(updateURL), body: jsonEncode(details),
                            headers: { "Content-Type": "application/json"});
                      });
                    },
                    activeTrackColor: Color(0xFF3182CE),
                    activeColor: Color(0xFFFFFFFF),
                  ),
                ),
              ]
          ),
        ),
//--------------------------------------------------------> Timer,switch


//0xFF2D3748

//--------------------------------------------------------> On/Off Time and time picker
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(child: Text("On Time", style: TextStyle(
                        color: Color(setColors()),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))
                  ]),

                  Row(children: <Widget>[

                    Expanded(child: Text(OnTimer.substring(0, 5),
                        style: TextStyle(
                            color: Color(setColors()), fontSize: 50))),

                    Expanded(
                        child: ElevatedButton(
                          onPressed: TimerStatus ? () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    SizedBox(
                                      height: 180,
                                      child: CupertinoDatePicker(
                                          backgroundColor: Colors.white,
                                          initialDateTime: OnTime,
                                          onDateTimeChanged: (
                                              DateTime newTime) {
                                            setState(() {
                                              OnTime = newTime;
                                              args.OnTime = OnTime;
                                              OffTime = newTime.add(Duration(seconds: secondsDifference));
                                              args.OffTime=OffTime;
                                              OnTimer ="${OnTime.hour.toString().padLeft(2, "0")}:${OnTime.minute.toString().padLeft(2, "0")}:00";
                                              OffTimer = "${OffTime.hour.toString().padLeft(2, "0")}:${OffTime.minute.toString().padLeft(2, "0")}:${OffTime.second.toString().padLeft(2, "0")}";
                                              details["OnTimer"] = OnTimer;
                                              details["OffTimer"] = OffTimer;
                                              args.details = details;
                                              put(Uri.parse(updateURL),
                                                  body: jsonEncode(details),
                                                  headers: {
                                                    "Content-Type": "application/json"
                                                  });
                                            });
                                          },
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.time

                                      ),

                                    )
                            );
                          } : null,
                          child: Text("Set Time", style: TextStyle(
                              fontSize: 24, color: Color(setColors()))),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE2E8F0),
                            onPrimary: Color(0xFFA1A5AA),
                            shadowColor: Color(0xFFC8CCD1),
                            minimumSize: const Size.fromHeight(50), // NEW
                          ),
                        )
                    ),

                  ]),
                  SizedBox(height: 20),
                  //----------------------------------------------------------------
                  Row(children: <Widget>[
                    Expanded(child: Text("Off After", style: TextStyle(
                        color: Color(setColors()),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)))
                  ]),

                  Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[

                        ElevatedButton(
                          onPressed:TimerStatus?(){
                            if(secondsDifference>10) {
                              setState(() {
                                secondsDifference=secondsDifference-10;
                                args.secondsDifference=secondsDifference;
                                OffTime=OnTime.add(Duration(seconds:secondsDifference));
                                args.OffTime=OffTime;
                                OffTimer = "${OffTime.hour.toString().padLeft(2, "0")}:${OffTime.minute.toString().padLeft(2, "0")}:${OffTime.second.toString().padLeft(2, "0")}";
                                details["OffTimer"]=OffTimer;
                                args.details=details;
                                put(Uri.parse(updateURL),body:jsonEncode(details),headers: { "Content-Type" : "application/json"});
                              });
                            }
                          }:null,

                          child:Text("<",style: TextStyle(color:Color(0xFF2D3748),fontSize: 40)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE2E8F0),
                            onPrimary: Color(0xFFA1A5AA),
                            shadowColor: Color(0xFFC8CCD1),
                          ),
                        ),



                        Text("${secondsDifference} sec",style: TextStyle(color:Color(setColors()),fontSize: 50)),

                        ElevatedButton(
                          onPressed:TimerStatus?(){
                            if(secondsDifference<120) {
                              setState(() {
                                secondsDifference=secondsDifference+10;
                                args.secondsDifference=secondsDifference;
                                OffTime=OnTime.add(Duration(seconds:secondsDifference));
                                args.OffTime=OffTime;
                                OffTimer = "${OffTime.hour.toString().padLeft(2, "0")}:${OffTime.minute.toString().padLeft(2, "0")}:${OffTime.second.toString().padLeft(2, "0")}";
                                details["OffTimer"]=OffTimer;
                                args.details=details;
                                put(Uri.parse(updateURL),body:jsonEncode(details),headers: { "Content-Type" : "application/json"});
                              });
                            }
                          }:null,
                          child:Text(">",style: TextStyle(color:Color(0xFF2D3748),fontSize: 40)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFE2E8F0),
                            onPrimary: Color(0xFFA1A5AA),
                            shadowColor: Color(0xFFC8CCD1),
                          ),
                        )


                      ]),

                ]
            )
        ),
//--------------------------------------------------------> On/Off Time and time picker


      ];

      return components;
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
        backgroundColor: Color(0xFFEBF8FF),

        body: SafeArea(
            child: Container(
              // color:Colors.red,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getDetailsUI()


                )
            )
        )
    );
  }
}