// ignore_for_file: file_names

library Settings_state;

import 'dart:convert';


import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:built_value/built_value.dart';


part 'Settings_state.g.dart';

abstract class SettingsState implements Built<SettingsState, SettingsStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get LOgedOUT;
  bool? get ISloadingLogout;

  LogoutModel? get Logout;


  SettingsState._();
  factory SettingsState([updates(SettingsStateBuilder b)]) = _$SettingsState;
  factory SettingsState.initail() {
    return SettingsState((b) => b
      ..error = ""
      ..isLoading = true
      ..success = true
      ..Logout =null
      ..LOgedOUT = false
      ..ISloadingLogout = false

    );
  }




}
