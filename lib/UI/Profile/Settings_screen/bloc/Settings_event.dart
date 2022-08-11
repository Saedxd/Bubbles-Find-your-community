// ignore_for_file: non_constant_identifier_names, file_names

library Settings_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Settings_event.g.dart';

abstract class SettingsEvent {}


abstract class Logout extends SettingsEvent
    implements Built<Logout,LogoutBuilder> {

  Logout._();
  factory Logout([updates(LogoutBuilder b)]) = _$Logout;
}

abstract class UserLeftBubble extends SettingsEvent
    implements Built<UserLeftBubble, UserLeftBubbleBuilder> {

  int? get Bubble_id;
  UserLeftBubble._();
  factory UserLeftBubble([Function(UserLeftBubbleBuilder b) updates]) = _$UserLeftBubble;
}