// ignore_for_file: non_constant_identifier_names

library SeeAll_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'SeeAll_Event.g.dart';

abstract class SeeAllEvent {}


abstract class GiveHimListOfBoolean extends SeeAllEvent
    implements Built<GiveHimListOfBoolean,GiveHimListOfBooleanBuilder> {
  List<bool>? get List_Saved_Status;

  GiveHimListOfBoolean._();
  factory GiveHimListOfBoolean([updates(GiveHimListOfBooleanBuilder b)]) = _$GiveHimListOfBoolean;
}
abstract class ChangeToDetailUiState extends SeeAllEvent
    implements Built<ChangeToDetailUiState, ChangeToDetailUiStateBuilder> {
  BubbleData? get Bubbledata;
  bool? get Status;
  ChangeToDetailUiState._();
  factory ChangeToDetailUiState([Function(ChangeToDetailUiStateBuilder b) updates]) = _$ChangeToDetailUiState;
}
abstract class ToggleSaveBubbleEventScreen extends SeeAllEvent
    implements Built<ToggleSaveBubbleEventScreen,ToggleSaveBubbleEventScreenBuilder> {
  int? get Bubble_id;
  int? get index;
  String? get List_type;
  bool? get Saved_Status;
  ToggleSaveBubbleEventScreen._();
  factory ToggleSaveBubbleEventScreen([updates(ToggleSaveBubbleEventScreenBuilder b)]) = _$ToggleSaveBubbleEventScreen;
}

abstract class ChangeShapStatus extends SeeAllEvent
    implements Built<ChangeShapStatus, ChangeShapStatusBuilder> {
  ChangeShapStatus._();

  factory ChangeShapStatus([updates(ChangeShapStatusBuilder b)]) = _$ChangeShapStatus;
}
