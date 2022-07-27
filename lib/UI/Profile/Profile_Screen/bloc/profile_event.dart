// ignore_for_file: non_constant_identifier_names, file_names

library profile_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'profile_event.g.dart';

abstract class profileEvent {}




abstract class GetProfile extends profileEvent
    implements Built<GetProfile,GetProfileBuilder> {

  GetProfile._();
  factory GetProfile([updates(GetProfileBuilder b)]) = _$GetProfile;
}


// abstract class Logout extends profileEvent
//     implements Built<Logout,LogoutBuilder> {
//
//   Logout._();
//
//   factory Logout([updates(LogoutBuilder b)]) = _$Logout;
// }

abstract class Toggle extends profileEvent
    implements Built<Toggle,ToggleBuilder> {
bool? get Status;
  Toggle._();
  factory Toggle([updates(ToggleBuilder b)]) = _$Toggle;
}
abstract class GetAvatars extends profileEvent
    implements Built<GetAvatars, GetAvatarsBuilder> {

  GetAvatars._();

  factory GetAvatars([updates(GetAvatarsBuilder b)]) = _$GetAvatars;
}
abstract class GOtoFrinedlIST extends profileEvent
    implements Built<GOtoFrinedlIST,GOtoFrinedlISTBuilder> {
bool? get Status;
  GOtoFrinedlIST._();
  factory GOtoFrinedlIST([updates(GOtoFrinedlISTBuilder b)]) = _$GOtoFrinedlIST;
}

abstract class ClearError extends profileEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}



abstract class ChangeAvatar extends profileEvent
    implements Built<ChangeAvatar,ChangeAvatarBuilder> {

  int? get AvatarId;
  ChangeAvatar._();
  factory ChangeAvatar([updates(ChangeAvatarBuilder b)]) = _$ChangeAvatar;
}


abstract class UpdateProfile extends profileEvent
    implements Built<UpdateProfile,UpdateProfileBuilder> {

  String? get Boi;
  String? get Username;
  UpdateProfile._();
  factory UpdateProfile([updates(UpdateProfileBuilder b)]) = _$UpdateProfile;
}