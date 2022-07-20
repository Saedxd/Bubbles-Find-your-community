// ignore_for_file: non_constant_identifier_names

library PlanPage_Event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/DirectMessages/MessageModel/MessageModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'PlanPage_Event.g.dart';

abstract class PlanPageEvent {}

abstract class GetDetailedPlan extends PlanPageEvent
    implements Built<GetDetailedPlan,GetDetailedPlanBuilder> {
int? get Event_id;
  GetDetailedPlan._();
  factory GetDetailedPlan([updates(GetDetailedPlanBuilder b)]) = _$GetDetailedPlan;
}


abstract class GetProfile extends PlanPageEvent
    implements Built<GetProfile,GetProfileBuilder> {

  GetProfile._();
  factory GetProfile([updates(GetProfileBuilder b)]) = _$GetProfile;
}
abstract class ToggleSaveBubble extends PlanPageEvent
    implements Built<ToggleSaveBubble,ToggleSaveBubbleBuilder> {
  int? get Bubble_id;
  int? get index;
  ToggleSaveBubble._();
  factory ToggleSaveBubble([updates(ToggleSaveBubbleBuilder b)]) = _$ToggleSaveBubble;
}
abstract class GetWhoSavedBubble extends PlanPageEvent
    implements Built<GetWhoSavedBubble,GetWhoSavedBubbleBuilder> {
  int? get Bubble_id;
  GetWhoSavedBubble._();
  factory GetWhoSavedBubble([updates(GetWhoSavedBubbleBuilder b)]) = _$GetWhoSavedBubble;
}
