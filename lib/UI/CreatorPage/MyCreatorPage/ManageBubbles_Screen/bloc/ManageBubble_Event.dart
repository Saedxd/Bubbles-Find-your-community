// ignore_for_file: non_constant_identifier_names

library ManageBubble_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'ManageBubble_Event.g.dart';

abstract class ManageBubbleEvent {}


abstract class GiveHimListOfBoolean extends ManageBubbleEvent
    implements Built<GiveHimListOfBoolean,GiveHimListOfBooleanBuilder> {

  GiveHimListOfBoolean._();
  factory GiveHimListOfBoolean([updates(GiveHimListOfBooleanBuilder b)]) = _$GiveHimListOfBoolean;
}
abstract class Change_Chosen_Category extends ManageBubbleEvent
    implements Built<Change_Chosen_Category,Change_Chosen_CategoryBuilder> {
  int? get Index;
  bool? get Status;
  Change_Chosen_Category._();
  factory Change_Chosen_Category([updates(Change_Chosen_CategoryBuilder b)]) = _$Change_Chosen_Category;
}
