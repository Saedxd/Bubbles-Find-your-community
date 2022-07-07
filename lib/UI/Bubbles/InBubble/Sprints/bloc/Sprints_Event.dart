// ignore_for_file: non_constant_identifier_names

library Sprints_Event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'Sprints_Event.g.dart';

abstract class SprintsEvent {}

abstract class GetOldMessages extends SprintsEvent
    implements Built<GetOldMessages,GetOldMessagesBuilder> {

  int? get receiver_id;

  GetOldMessages._();
  factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
}

abstract class Done extends SprintsEvent
    implements Built<Done,DoneBuilder> {

  bool? get Donee;

  Done._();
  factory Done([updates(DoneBuilder b)]) = _$Done;
}


abstract class GetAlias extends SprintsEvent
    implements Built<GetAlias,GetAliasBuilder> {

  int? get HIS_ID;
  int? get My_ID;
  GetAlias._();
  factory GetAlias([updates(GetAliasBuilder b)]) = _$GetAlias;
}




abstract class SendMessage extends SprintsEvent
    implements Built<SendMessage,SendMessageBuilder> {

  int? get receiver_id;
  String? get message;
  SendMessage._();
  factory SendMessage([updates(SendMessageBuilder b)]) = _$SendMessage;
}

abstract class ShowReplyWidget extends SprintsEvent
    implements Built<ShowReplyWidget,ShowReplyWidgetBuilder> {

  String? get AvatarPathForRepliedTo;
  int? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
bool? get Isreply;
  ShowReplyWidget._();
  factory ShowReplyWidget([updates(ShowReplyWidgetBuilder b)]) = _$ShowReplyWidget;
}

abstract class SendStatus extends SprintsEvent
    implements Built<SendStatus,SendStatusBuilder> {

  bool? get Status;
  SendStatus._();
  factory SendStatus([updates(SendStatusBuilder b)]) = _$SendStatus;
}


abstract class addReply extends SprintsEvent
    implements Built<addReply,addReplyBuilder> {

  String? get comment;
  int? get message_id;
  addReply._();
  factory addReply([updates(addReplyBuilder b)]) = _$addReply;
}



abstract class AddModel extends SprintsEvent
    implements Built<AddModel,AddModelBuilder>  {
  MessageModel? get message;

  AddModel._();
  factory AddModel([updates(AddModelBuilder b)]) = _$AddModel;
}



abstract class ChangeTypingStatus extends SprintsEvent
    implements Built<ChangeTypingStatus,ChangeTypingStatusBuilder> {
  bool? get ChangeStatus;

  ChangeTypingStatus._();
  factory ChangeTypingStatus([updates(ChangeTypingStatusBuilder b)]) = _$ChangeTypingStatus;
}


