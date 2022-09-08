// ignore_for_file: non_constant_identifier_names

library EditPage_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'EditPage_Event.g.dart';

abstract class EditPageEvent {}


abstract class GiveHimListOfBoolean extends EditPageEvent
    implements Built<GiveHimListOfBoolean,GiveHimListOfBooleanBuilder> {


  GiveHimListOfBoolean._();
  factory GiveHimListOfBoolean([updates(GiveHimListOfBooleanBuilder b)]) = _$GiveHimListOfBoolean;
}
abstract class SelectColor extends EditPageEvent
    implements Built<SelectColor,SelectColorBuilder> {
  int? get Index;
  String? get PickedColor;
  SelectColor._();
  factory SelectColor([updates(SelectColorBuilder b)]) = _$SelectColor;
}

