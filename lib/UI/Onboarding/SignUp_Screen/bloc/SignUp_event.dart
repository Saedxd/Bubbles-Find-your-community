// ignore_for_file: file_names

library SignUp_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SignUp_event.g.dart';

abstract class SignUpEvent {}


abstract class ClearError extends SignUpEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;


}
abstract class PostSignUp extends SignUpEvent
    implements Built<PostSignUp,PostSignUpBuilder> {
    String? get Email;
    String? get password;
    String? get  fcmToken;
    String? get first_name;
    String? get last_name;
    int? get Genter;
    String? get background_color;
    String? get  bio;
    String? get birth_date;
    List<int>? get interests;
    int? get avatarID;
    String? get alias;

  PostSignUp._();
  factory PostSignUp([updates(PostSignUpBuilder b)]) = _$PostSignUp;
}

abstract class SocialUpdateProfile extends SignUpEvent
    implements Built<SocialUpdateProfile, SocialUpdateProfileBuilder> {
  String? get  fcmToken;
  String? get first_name;
  String? get last_name;
  int? get Genter;
  String? get background_color;
  String? get bio;
  String? get birth_date;
  List<int>? get interests;
  int? get avatarid;
  String? get alias;

  SocialUpdateProfile._();
  factory SocialUpdateProfile([updates(SocialUpdateProfileBuilder b)]) = _$SocialUpdateProfile;


}


abstract class GetGender extends SignUpEvent
    implements Built<GetGender, GetGenderBuilder> {

  GetGender._();

  factory GetGender([updates(GetGenderBuilder b)]) = _$GetGender;
}

abstract class ChangePickedColor extends SignUpEvent
    implements Built<ChangePickedColor, ChangePickedColorBuilder> {
  ChangePickedColor._();
String? get PickedColor;
  factory ChangePickedColor([updates(ChangePickedColorBuilder b)]) = _$ChangePickedColor;
}

abstract class GetInterests extends SignUpEvent
    implements Built<GetInterests, GetInterestsBuilder> {

  GetInterests._();

  factory GetInterests([updates(GetInterestsBuilder b)]) = _$GetInterests;
}

abstract class GetSubGenders extends SignUpEvent
    implements Built<GetSubGenders, GetSubGendersBuilder> {

  GetSubGenders._();

  factory GetSubGenders([updates(GetSubGendersBuilder b)]) = _$GetSubGenders;
}

abstract class GetAvatars extends SignUpEvent
    implements Built<GetAvatars, GetAvatarsBuilder> {

  GetAvatars._();

  factory GetAvatars([updates(GetAvatarsBuilder b)]) = _$GetAvatars;
}

abstract class CheckEmails extends SignUpEvent
    implements Built<CheckEmails, CheckEmailsBuilder> {
String? get Email;
  CheckEmails._();

  factory CheckEmails([updates(CheckEmailsBuilder b)]) = _$CheckEmails;


}

abstract class ChangeSelected extends SignUpEvent
    implements Built<ChangeSelected, ChangeSelectedBuilder> {

  bool? get status;

  ChangeSelected._();
  factory ChangeSelected([updates(ChangeSelectedBuilder b)]) = _$ChangeSelected;
}
abstract class HideSpaceOnSignUP extends SignUpEvent
    implements Built<HideSpaceOnSignUP, HideSpaceOnSignUPBuilder> {

  HideSpaceOnSignUP._();
  factory HideSpaceOnSignUP([updates(HideSpaceOnSignUPBuilder b)]) = _$HideSpaceOnSignUP;
}
