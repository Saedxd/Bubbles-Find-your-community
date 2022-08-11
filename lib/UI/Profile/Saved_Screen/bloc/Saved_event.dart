// ignore_for_file: non_constant_identifier_names, file_names

library Saved_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Saved_event.g.dart';

abstract class SavedEvent {}


abstract class GetSavedBubbles extends SavedEvent
    implements Built<GetSavedBubbles,GetSavedBubblesBuilder> {
int? get User_id;
  GetSavedBubbles._();
  factory GetSavedBubbles([updates(GetSavedBubblesBuilder b)]) = _$GetSavedBubbles;
}

abstract class ChangeShapStatus extends SavedEvent
    implements Built<ChangeShapStatus, ChangeShapStatusBuilder> {
  ChangeShapStatus._();

  factory ChangeShapStatus([updates(ChangeShapStatusBuilder b)]) = _$ChangeShapStatus;
}

abstract class UnSaveBubble extends SavedEvent
    implements Built<UnSaveBubble,UnSaveBubbleBuilder> {
  int? get Bubble_id;
  int? get index;

  UnSaveBubble._();
  factory UnSaveBubble([updates(UnSaveBubbleBuilder b)]) = _$UnSaveBubble;
}
abstract class ShowHomePage extends SavedEvent
    implements Built<ShowHomePage,ShowHomePageBuilder> {
  bool? get HomePageStatus;
  ShowHomePage._();
  factory ShowHomePage([updates(ShowHomePageBuilder b)]) = _$ShowHomePage;
}

