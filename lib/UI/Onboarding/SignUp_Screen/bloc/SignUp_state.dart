// ignore_for_file: file_names

library SignUp_state;

import 'dart:convert';
import 'package:bubbles/models/CheckMailModel/CheckMailModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetGenderModel/GetGender.dart';
import 'package:bubbles/models/GetInterestsModel/GetInterestsModel.dart';
import 'package:bubbles/models/GetSubGenders/GetSubGenderss.dart';
import 'package:bubbles/models/UpdateProfile/UpdateProfile.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'SignUp_state.g.dart';

abstract class SignUpState implements Built<SignUpState, SignUpStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get ChangeSelectedd;

  int? get UserDataINDEX;
  int? get UpdateProfileINDEX;
  // String? get Username;
  // String? get Email;
  // String? get Pass;
  // String? get ConfirmPass;
  // int? get Gender;
  // int? get AvatarID;
  // List<int>? get Intersets;
  // String? get Image;
  // String? get FirstName;
  // String? get LastName;
  // String? get BirthDay;
  // String? get Boi;
  // String? get FcmToken;

  UserData? get data;
  GetAvatarsModel? get GetAvatar;
  GetGenderModel? get GetGender;
  GetInterestsModel? get GetInterests;
  GetSubGender? get GetSubGenders;
  UpdateProfile? get UpdateSocialProfile;
  CheckMailModel? get Checkemail;


  SignUpState._();
  factory SignUpState([updates(SignUpStateBuilder b)]) = _$SignUpState;
  factory SignUpState.initail() {
    return SignUpState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..ChangeSelectedd = false
      ..GetAvatar= null
      ..GetGender= null
      ..GetInterests= null
      ..GetSubGenders= null
      ..data =null
        ..UpdateSocialProfile =null
        ..UserDataINDEX = 1000
        ..UpdateProfileINDEX = 1000
        ..Checkemail= null





    );
  }
}
