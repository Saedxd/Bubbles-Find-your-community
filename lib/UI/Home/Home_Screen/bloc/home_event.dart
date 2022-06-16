// ignore_for_file: non_constant_identifier_names

library home_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_event.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}


abstract class ChangeValue extends HomeEvent
    implements Built<ChangeValue,ChangeValueBuilder> {
double? get Value;
  ChangeValue._();
  factory ChangeValue([updates(ChangeValueBuilder b)]) = _$ChangeValue;
}


abstract class ShowDialoog extends HomeEvent
    implements Built<ShowDialoog,ShowDialoogBuilder> {

  ShowDialoog._();
  factory ShowDialoog([updates(ShowDialoogBuilder b)]) = _$ShowDialoog;
}


abstract class AddMarkers extends HomeEvent
    implements Built<AddMarkers,AddMarkersBuilder> {
  Set<Marker>? get marker2;

  AddMarkers._();
  factory AddMarkers([updates(AddMarkersBuilder b)]) = _$AddMarkers;
}


abstract class MakeDone extends HomeEvent
    implements Built<MakeDone,MakeDoneBuilder> {

  MakeDone._();
  factory MakeDone([updates(MakeDoneBuilder b)]) = _$MakeDone;
}


abstract class ClearError extends HomeEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;


}

abstract class GetAllBubbles extends HomeEvent
    implements Built<GetAllBubbles, GetAllBubblesBuilder> {


  GetAllBubbles._();
  factory GetAllBubbles([updates(GetAllBubblesBuilder b)]) = _$GetAllBubbles;
}


abstract class GetPrimeBubbles extends HomeEvent
    implements Built<GetPrimeBubbles, GetPrimeBubblesBuilder> {

  GetPrimeBubbles._();
  factory GetPrimeBubbles([updates(GetPrimeBubblesBuilder b)]) = _$GetPrimeBubbles;
}


abstract class GetNewBubbles extends HomeEvent
    implements Built<GetNewBubbles, GetNewBubblesBuilder> {

  GetNewBubbles._();
  factory GetNewBubbles([updates(GetNewBubblesBuilder b)]) = _$GetNewBubbles;
}

abstract class UserMoved extends HomeEvent
    implements Built<UserMoved,UserMovedBuilder> {
double? get lat;
double? get lng;

  UserMoved._();
  factory UserMoved([updates(UserMovedBuilder b)]) = _$UserMoved;
}


abstract class CreateBubbless extends HomeEvent
    implements Built<CreateBubbless,CreateBubblessBuilder> {
  double? get lat;
  double? get lng;
  double? get Radius;

  CreateBubbless._();
  factory CreateBubbless([updates(CreateBubblessBuilder b)]) = _$CreateBubbless;
}


abstract class RaduisUpdated extends HomeEvent
    implements Built<RaduisUpdated,RaduisUpdatedBuilder> {
  double? get Radius;

  RaduisUpdated._();
  factory RaduisUpdated([updates(RaduisUpdatedBuilder b)]) = _$RaduisUpdated;
}

abstract class UpdateLocation extends HomeEvent
    implements Built<UpdateLocation,UpdateLocationBuilder> {
  double? get lat;
  double? get lng;

  UpdateLocation._();
  factory UpdateLocation([updates(UpdateLocationBuilder b)]) = _$UpdateLocation;
}

abstract class DeleteBubble extends HomeEvent
    implements Built<DeleteBubble,DeleteBubbleBuilder> {

  DeleteBubble._();
  factory DeleteBubble([updates(DeleteBubbleBuilder b)]) = _$DeleteBubble;
}

abstract class ChangeSliderValue extends HomeEvent
    implements Built<ChangeSliderValue,ChangeSliderValueBuilder> {

  double? get value;

  ChangeSliderValue._();
  factory ChangeSliderValue([updates(ChangeSliderValueBuilder b)]) = _$ChangeSliderValue;
}

abstract class OpenDoorTObeAbleTOsetBubble extends HomeEvent
    implements Built<OpenDoorTObeAbleTOsetBubble, OpenDoorTObeAbleTOsetBubbleBuilder> {
bool? get MakeHimBEableTOSEtBubbles;
  OpenDoorTObeAbleTOsetBubble._();
  factory OpenDoorTObeAbleTOsetBubble([updates(OpenDoorTObeAbleTOsetBubbleBuilder b)]) = _$OpenDoorTObeAbleTOsetBubble;
}


