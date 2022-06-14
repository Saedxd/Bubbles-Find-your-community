// ignore_for_file: file_names

library profile_state;

import 'dart:convert';


import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/LogoutModel/LogoutModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:built_value/built_value.dart';


part 'profile_state.g.dart';

abstract class profileState implements Built<profileState, profileStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get isLoadingAvatar;
  bool? get ISloadingLogout;
  bool? get isLoadingProfileUpdate;
  bool? get success;
  bool? get ProfileUpdated;
  bool? get LOgedOUT;
  bool? get GetprofileSuccess;
  bool? get successAvatar;
  bool? get ToggleStatus;
  bool? get GOtoFrined;

  GetAvatarsModel? get GetAvatar;
  ChangeAvatarModel? get Changeavatarr;
  UpdateBoiModel? get UpdateBoiUSERNAME;
  ProfileDateModel? get ProfileDate;
  LogoutModel? get Logout;


  profileState._();

  factory profileState([updates(profileStateBuilder b)]) = _$profileState;
  factory profileState.initail() {
    return profileState((b) => b
      ..error = ""
      ..isLoading = true
      ..isLoadingAvatar = false
      ..ISloadingLogout = false
      ..isLoadingProfileUpdate = false
      ..success = false
      ..ProfileUpdated = false
      ..LOgedOUT = false
      ..GetprofileSuccess = false
      ..successAvatar = false
        ..ToggleStatus= true
        ..GOtoFrined = false
        ..GetAvatar =null
        ..Changeavatarr =null
        ..UpdateBoiUSERNAME=null
        ..ProfileDate=null
        ..Logout =null


    );
  }




}
