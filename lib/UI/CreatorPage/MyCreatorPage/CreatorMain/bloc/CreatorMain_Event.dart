// ignore_for_file: non_constant_identifier_names

library CreatorMain_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'CreatorMain_Event.g.dart';

abstract class CreatorMainEvent {}


abstract class GiveHimListOfBoolean extends CreatorMainEvent
    implements Built<GiveHimListOfBoolean,GiveHimListOfBooleanBuilder> {


  GiveHimListOfBoolean._();
  factory GiveHimListOfBoolean([updates(GiveHimListOfBooleanBuilder b)]) = _$GiveHimListOfBoolean;
}

