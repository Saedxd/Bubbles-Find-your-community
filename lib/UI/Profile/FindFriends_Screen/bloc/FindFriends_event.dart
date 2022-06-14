// ignore_for_file: non_constant_identifier_names

library FindFriends_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'FindFriends_event.g.dart';

abstract class FindFriendsEvent {}

abstract class GetContactList extends FindFriendsEvent implements
    Built<GetContactList, GetContactListBuilder> {

  GetContactList._();
  factory GetContactList([updates(GetContactListBuilder b)]) = _$GetContactList;
}

abstract class AddFrined extends FindFriendsEvent
    implements Built<AddFrined,AddFrinedBuilder> {
String? get serial;

  AddFrined._();
  factory AddFrined([updates(AddFrinedBuilder b)]) = _$AddFrined;
}

abstract class OpenCopyMessage extends FindFriendsEvent
    implements Built<OpenCopyMessage,OpenCopyMessageBuilder> {
  OpenCopyMessage._();
  factory OpenCopyMessage([updates(OpenCopyMessageBuilder b)]) = _$OpenCopyMessage;
}

abstract class CloseCopyMessage extends FindFriendsEvent
    implements Built<CloseCopyMessage,CloseCopyMessageBuilder> {
  CloseCopyMessage._();
  factory CloseCopyMessage([updates(CloseCopyMessageBuilder b)]) = _$CloseCopyMessage;
}//

abstract class OpenContactMessage extends FindFriendsEvent
    implements Built<OpenContactMessage, OpenContactMessageBuilder> {

  OpenContactMessage._();
  factory OpenContactMessage([updates(OpenContactMessageBuilder b)]) = _$OpenContactMessage;
}

abstract class CloseContactMessage extends FindFriendsEvent
    implements Built<CloseContactMessage, CloseContactMessageBuilder> {

  CloseContactMessage._();
  factory CloseContactMessage([updates(CloseContactMessageBuilder b)]) = _$CloseContactMessage;
}

abstract class OpenCompletMessage extends FindFriendsEvent
    implements Built<OpenCompletMessage, OpenCompletMessageBuilder> {

  OpenCompletMessage._();
  factory OpenCompletMessage([updates(OpenCompletMessageBuilder b)]) = _$OpenCompletMessage;
}

abstract class CloseCompletMessage extends FindFriendsEvent
    implements Built<CloseCompletMessage, CloseCompletMessageBuilder> {

  CloseCompletMessage._();
  factory CloseCompletMessage([updates(CloseCompletMessageBuilder b)]) = _$CloseCompletMessage;
}

abstract class ClearError extends FindFriendsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}
abstract class GetProfile extends FindFriendsEvent
    implements Built<GetProfile,GetProfileBuilder> {

  GetProfile._();
  factory GetProfile([updates(GetProfileBuilder b)]) = _$GetProfile;
}



