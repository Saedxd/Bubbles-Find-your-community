library login_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_event.g.dart';

abstract class LOginEvent {}


abstract class PostLOgin extends LOginEvent
    implements Built<PostLOgin,PostLOginBuilder> {
 String?  get Email;
 String?  get password;
 String?  get fcmToken;

 PostLOgin._();

  factory PostLOgin([updates(PostLOginBuilder b)]) = _$PostLOgin;
}

abstract class LoginSocial extends LOginEvent
    implements Built<LoginSocial, LoginSocialBuilder> {
  LoginSocial._();

  String? get  fcmToken;
  String? get Token;
  factory LoginSocial([updates(LoginSocialBuilder b)]) = _$LoginSocial;
}


abstract class LoginGoogle extends LOginEvent
    implements Built<LoginGoogle, LoginGoogleBuilder> {
  LoginGoogle._();

String? get Email;
String? get name;
String? get fcmToken;
String? get avatar;
  factory LoginGoogle([updates(LoginGoogleBuilder b)]) = _$LoginGoogle;
}

abstract class ClearError extends LOginEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;


}

abstract class SetPermission extends LOginEvent
    implements Built<SetPermission, SetPermissionBuilder> {
  SetPermission._();
int? get is_notify;
  factory SetPermission([updates(SetPermissionBuilder b)]) = _$SetPermission;
}


