// ignore_for_file: non_constant_identifier_names

library GroupChat_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/Data/Data.dart';
import 'package:built_value/built_value.dart';



part 'GroupChat_event.g.dart';

abstract class GroupChatevent {}

abstract class ClearError extends GroupChatevent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetOldMessages extends GroupChatevent
    implements Built<GetOldMessages,GetOldMessagesBuilder> {

  int? get receiver_id;

  GetOldMessages._();
  factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
}

abstract class KetbaordStatus extends GroupChatevent
    implements Built<KetbaordStatus,KetbaordStatusBuilder> {

  bool? get status;
  KetbaordStatus._();
  factory KetbaordStatus([updates(KetbaordStatusBuilder b)]) = _$KetbaordStatus;
}


abstract class GetAlias extends GroupChatevent
    implements Built<GetAlias,GetAliasBuilder> {

  int? get HIS_ID;
  int? get My_ID;
  GetAlias._();
  factory GetAlias([updates(GetAliasBuilder b)]) = _$GetAlias;
}
abstract class SendMessage extends GroupChatevent
    implements Built<SendMessage,SendMessageBuilder> {

  int? get receiver_id;
  String? get message;
  SendMessage._();
  factory SendMessage([updates(SendMessageBuilder b)]) = _$SendMessage;
}
abstract class addReply extends GroupChatevent
    implements Built<addReply,addReplyBuilder> {

  String? get comment;
  int? get message_id;
  addReply._();
  factory addReply([updates(addReplyBuilder b)]) = _$addReply;
}


abstract class AddModel extends GroupChatevent
    implements Built<AddModel,AddModelBuilder>  {
  GroupChatMessage? get message;

  AddModel._();
  factory AddModel([updates(AddModelBuilder b)]) = _$AddModel;
}



abstract class ChangeTypingStatus extends GroupChatevent
    implements Built<ChangeTypingStatus,ChangeTypingStatusBuilder> {
  bool? get ChangeStatus;

  ChangeTypingStatus._();
  factory ChangeTypingStatus([updates(ChangeTypingStatusBuilder b)]) = _$ChangeTypingStatus;
}

abstract class ShowReplyWidget extends GroupChatevent
    implements Built<ShowReplyWidget,ShowReplyWidgetBuilder> {

  String? get AvatarPathForRepliedTo;
  int? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  ShowReplyWidget._();
  factory ShowReplyWidget([updates(ShowReplyWidgetBuilder b)]) = _$ShowReplyWidget;
}
abstract class SendStatus extends GroupChatevent
    implements Built<SendStatus,SendStatusBuilder> {

  bool? get Status;
  SendStatus._();
  factory SendStatus([updates(SendStatusBuilder b)]) = _$SendStatus;
}

abstract class DescriptionLength extends GroupChatevent
    implements Built<DescriptionLength,DescriptionLengthBuilder> {

  int? get DescriptionLengthh;
  DescriptionLength._();
  factory DescriptionLength([updates(DescriptionLengthBuilder b)]) = _$DescriptionLength;
}

abstract class ChangeCheckboxStatus1 extends GroupChatevent
    implements Built<ChangeCheckboxStatus1,ChangeCheckboxStatus1Builder> {
  bool? get CheckboxStatus1;

  ChangeCheckboxStatus1._();
  factory ChangeCheckboxStatus1([updates(ChangeCheckboxStatus1Builder b)]) = _$ChangeCheckboxStatus1;
}

abstract class ChangeCheckboxStatus2 extends GroupChatevent
    implements Built<ChangeCheckboxStatus2,ChangeCheckboxStatus2Builder> {
  bool? get CheckboxStatus2;

  ChangeCheckboxStatus2._();
  factory ChangeCheckboxStatus2([updates(ChangeCheckboxStatus2Builder b)]) = _$ChangeCheckboxStatus2;
}

abstract class ChangeTextfieldSum extends GroupChatevent
    implements Built<ChangeTextfieldSum,ChangeTextfieldSumBuilder> {
  int? get num;

  ChangeTextfieldSum._();
  factory ChangeTextfieldSum([updates(ChangeTextfieldSumBuilder b)]) = _$ChangeTextfieldSum;
}

abstract class MakeTextFieldSumToNormal extends GroupChatevent
    implements Built<MakeTextFieldSumToNormal,MakeTextFieldSumToNormalBuilder> {

  MakeTextFieldSumToNormal._();
  factory MakeTextFieldSumToNormal([updates(MakeTextFieldSumToNormalBuilder b)]) = _$MakeTextFieldSumToNormal;
}
