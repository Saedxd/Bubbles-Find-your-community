// ignore_for_file: non_constant_identifier_names

library EditBubble_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:built_value/built_value.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'EditBubble_Event.g.dart';

abstract class EditBubbleEvent {}


abstract class ChangeDone1 extends EditBubbleEvent
    implements Built<ChangeDone1, ChangeDone1Builder> {
  // fields go here
  bool? get DoneColor1;
  ChangeDone1._();
  factory ChangeDone1([Function(ChangeDone1Builder b) updates]) = _$ChangeDone1;
}

abstract class ChangeDone2 extends EditBubbleEvent
    implements Built<ChangeDone2, ChangeDone2Builder> {
  // fields go here
  bool? get DoneColor2;
  ChangeDone2._();
  factory ChangeDone2([Function(ChangeDone2Builder b) updates]) = _$ChangeDone2;
}

abstract class GetFreinds extends EditBubbleEvent
    implements Built<GetFreinds,GetFreindsBuilder> {

  GetFreinds._();
  factory GetFreinds([Function(GetFreindsBuilder b) updates]) = _$GetFreinds;
}

abstract class CreateBubble extends EditBubbleEvent
    implements Built<CreateBubble, CreateBubbleBuilder> {

  double? get lng;
  double? get lat;
  int? get raduis;
  List<String>? get Dates;
  List<int>? get OrganizersId;
  String? get Start_Date;
  String? get End_Date;
  List<String>? get Base64Images;
  String? get ColorS;
  String? get LOcation;
  String? get Title;
  String? get Description;
  int? get Cateogory_id;

  CreateBubble._();
  factory CreateBubble([updates(CreateBubbleBuilder b)]) = _$CreateBubble;
}

abstract class SearchFreinds extends EditBubbleEvent
    implements Built<SearchFreinds, SearchFreindsBuilder> {
  String? get Keyword;
  SearchFreinds._();
  factory SearchFreinds([updates(SearchFreindsBuilder b)]) = _$SearchFreinds;
}

abstract class ChangeDone3 extends EditBubbleEvent
    implements Built<ChangeDone3, ChangeDone3Builder> {

  bool? get ChangeDone33;
  ChangeDone3._();
  factory ChangeDone3([Function(ChangeDone3Builder b) updates]) = _$ChangeDone3;
}

abstract class AddStartandEndTime extends EditBubbleEvent
    implements Built<AddStartandEndTime, AddStartandEndTimeBuilder> {

  String? get StartTime;
  String? get EndTime;
  AddStartandEndTime._();
  factory AddStartandEndTime([Function(AddStartandEndTimeBuilder b) updates]) = _$AddStartandEndTime;
}

abstract class ChangePickedColor extends EditBubbleEvent
    implements Built<ChangePickedColor, ChangePickedColorBuilder> {
  ChangePickedColor._();
  String? get PickedColor;
  factory ChangePickedColor([updates(ChangePickedColorBuilder b)]) = _$ChangePickedColor;
}
abstract class GetEventCateogories extends EditBubbleEvent
    implements Built<GetEventCateogories,GetEventCateogoriesBuilder> {

  GetEventCateogories._();
  factory GetEventCateogories([updates(GetEventCateogoriesBuilder b)]) = _$GetEventCateogories;
}

abstract class SelectColor extends EditBubbleEvent
    implements Built<SelectColor,SelectColorBuilder> {
  int? get Index;
  String? get PickedColor;
  SelectColor._();
  factory SelectColor([updates(SelectColorBuilder b)]) = _$SelectColor;
}

abstract class Change_Chosen_frineds extends EditBubbleEvent
    implements Built<Change_Chosen_frineds,Change_Chosen_frinedsBuilder> {
  int? get Index;
  int? get Status;
  Change_Chosen_frineds._();
  factory Change_Chosen_frineds([updates(Change_Chosen_frinedsBuilder b)]) = _$Change_Chosen_frineds;
}

