// ignore_for_file: non_constant_identifier_names

library PageAdmins_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'PageAdmins_Event.g.dart';

abstract class PageAdminsEvent {}


abstract class GiveHimListOfBoolean extends PageAdminsEvent
    implements Built<GiveHimListOfBoolean,GiveHimListOfBooleanBuilder> {

  GiveHimListOfBoolean._();
  factory GiveHimListOfBoolean([updates(GiveHimListOfBooleanBuilder b)]) = _$GiveHimListOfBoolean;
}
abstract class GetFreinds extends PageAdminsEvent
    implements Built<GetFreinds,GetFreindsBuilder> {

  GetFreinds._();
  factory GetFreinds([Function(GetFreindsBuilder b) updates]) = _$GetFreinds;
}
abstract class SearchFreinds extends PageAdminsEvent
    implements Built<SearchFreinds, SearchFreindsBuilder> {
  String? get Keyword;
  SearchFreinds._();
  factory SearchFreinds([updates(SearchFreindsBuilder b)]) = _$SearchFreinds;
}
abstract class Change_Chosen_frineds extends PageAdminsEvent
    implements Built<Change_Chosen_frineds,Change_Chosen_frinedsBuilder> {
  int? get Index;
  int? get Status;
  Change_Chosen_frineds._();
  factory Change_Chosen_frineds([updates(Change_Chosen_frinedsBuilder b)]) = _$Change_Chosen_frineds;
}

