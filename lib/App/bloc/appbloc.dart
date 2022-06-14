// import 'dart:async';
// import 'dart:convert';
// import 'package:bubbles/core/theme/theme_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// enum changethem {
//   light,dark
// }
// class ThemeChanger  {
//   MyTheme theme = MyTheme();
//   final _ThemeStreamcontroller = StreamController<ThemeData>();
//   StreamSink<ThemeData> get  TakeTheme => _ThemeStreamcontroller.sink;
//   Stream<ThemeData> get  Getthem => _ThemeStreamcontroller.stream;
//
//
//   final _EventStreamcontroller = StreamController<changethem>();
//   StreamSink<changethem> get  EventSink => _EventStreamcontroller.sink;
//   Stream<changethem> get  EventStream => _EventStreamcontroller.stream;
//
//
//
//
//   ThemeChanger(){
//     EventStream.listen((changethem event) {
//       print(event);
//     switch(event){
//
//       case changethem.dark:
//         TakeTheme.add(theme.darkTheme);
//         break;
//
//       case changethem.light:
//         TakeTheme.add(theme.lightTheme);
//         break;
//         default :  TakeTheme.add(theme.lightTheme);
//     }
//     });
//
//     // Getthem.listen((event) {
//     //   print(event);
//     // });
//
//
//   }
//
//
// }
