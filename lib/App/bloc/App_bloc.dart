// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:bubbles/App/bloc/App_Event.dart';
// import 'package:bubbles/App/bloc/App_State.dart';
// import 'package:bubbles/core/theme/theme_constants.dart';
// import 'package:flutter/material.dart';
//
//
// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc(ThemeState initialState) : super(initialState);
//   MyTheme themee =MyTheme();
//   @override
//   ThemeState get initialState =>
//       // Everything is accessible from the appThemeData Map.
//   ThemeState(themeData: themee.darkTheme);
//
//   @override
//   Stream<ThemeState> mapEventToState(
//       ThemeEvent event,
//       ) async* {
//     if (event is ThemeChanged) {
//       print(state.themeData);
//       yield ThemeState(themeData: event.theme);
//       print(state.themeData);
//     }
//   }
// }
//
//
// enum AppTheme {
//   GreenLight,
//   GreenDark,
//   BlueLight,
//   BlueDark,
// }
//
// final appThemeData = {
//   AppTheme.GreenLight: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.green,
//   ),
//   AppTheme.GreenDark: ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.green[700],
//   ),
//   AppTheme.BlueLight: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.blue,
//   ),
//   AppTheme.BlueDark: ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.blue[700],
//   ),
// };