// ignore_for_file: non_constant_identifier_names

library SuggestedFrineds_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'SuggestedFrineds_event.g.dart';

abstract class SuggestedFrinedsEvent {}

abstract class ClearError extends SuggestedFrinedsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetSuggestedFriends extends SuggestedFrinedsEvent
    implements Built<GetSuggestedFriends, GetSuggestedFriendsBuilder> {

  GetSuggestedFriends._();
  factory GetSuggestedFriends([updates(GetSuggestedFriendsBuilder b)]) = _$GetSuggestedFriends;
}

abstract class AddFrined extends SuggestedFrinedsEvent
    implements Built<AddFrined,AddFrinedBuilder> {
  String? get serial;

  AddFrined._();
  factory AddFrined([updates(AddFrinedBuilder b)]) = _$AddFrined;
}
abstract class DeleteFromList extends SuggestedFrinedsEvent
    implements Built<DeleteFromList,DeleteFromListBuilder> {
  int? get index;

  DeleteFromList._();
  factory DeleteFromList([updates(DeleteFromListBuilder b)]) = _$DeleteFromList;
}