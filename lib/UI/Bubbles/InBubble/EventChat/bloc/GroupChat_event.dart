// ignore_for_file: non_constant_identifier_names

library GroupChat_event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/UI/Bubbles/InBubble/EventChat/Data/Data.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';

import 'package:built_value/built_value.dart';



part 'GroupChat_event.g.dart';

abstract class GroupChatevent {}

abstract class ClearError extends GroupChatevent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
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

  int? get main_type;
  String? get message;

  String? get type;
  int? get bubble_id;
  int? get IndexOfMessageList;
  SendMessage._();
  factory SendMessage([updates(SendMessageBuilder b)]) = _$SendMessage;
}
abstract class addReply extends GroupChatevent
    implements Built<addReply,addReplyBuilder> {

  String? get comment;
  String? get Message;
  String? get RepliedToAlias;
  String? get RepliedToAvatar;
  String? get RepliedToColor;
  int? get message_id;
  int? get Bubble_id;
  String? get type;
  bool? get is_Nodejs;
  bool? get is_backend;
  File? get File_file;
  Uint8List? get Uint8;

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
  String? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  String? get Type;
  Uint8List? get Image1;
  File? get File_image;
  String? get Image_type;
  // bool? get is_Nodejs;
  // bool? get is_Backend;
  // bool? get Is_base64;

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

abstract class GetOldMessages extends GroupChatevent
    implements Built<GetOldMessages,GetOldMessagesBuilder> {
int? get bubble_id;
  GetOldMessages._();
  factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
}

abstract class GetAliasForInsideUser extends GroupChatevent
    implements Built<GetAliasForInsideUser,GetAliasForInsideUserBuilder> {
  int? get User_id;
  GetAliasForInsideUser._();
  factory GetAliasForInsideUser([updates(GetAliasForInsideUserBuilder b)]) = _$GetAliasForInsideUser;
}

abstract class AddUserDataToList extends GroupChatevent
    implements Built<AddUserDataToList,AddUserDataToListBuilder> {
  UserDATA? get  user;
  AddUserDataToList._();
  factory AddUserDataToList([updates(AddUserDataToListBuilder b)]) = _$AddUserDataToList;
}

//
abstract class GetUsersInsideBubble extends GroupChatevent
    implements Built<GetUsersInsideBubble,GetUsersInsideBubbleBuilder> {
  int? get Bubble_id;
  GetUsersInsideBubble._();
  factory GetUsersInsideBubble([updates(GetUsersInsideBubbleBuilder b)]) = _$GetUsersInsideBubble;
}

abstract class SearchInsideBubbleUser extends GroupChatevent
    implements Built<SearchInsideBubbleUser,SearchInsideBubbleUserBuilder> {
  String? get Keyword;

  SearchInsideBubbleUser._();
  factory SearchInsideBubbleUser([updates(SearchInsideBubbleUserBuilder b)]) = _$SearchInsideBubbleUser;
}

abstract class AddFrined extends GroupChatevent
    implements Built<AddFrined,AddFrinedBuilder> {
  String? get serial;

  AddFrined._();
  factory AddFrined([updates(AddFrinedBuilder b)]) = _$AddFrined;
}

abstract class RemoveFriend extends GroupChatevent
    implements Built<RemoveFriend,RemoveFriendBuilder> {
  int? get friend_id;
  RemoveFriend._();
  factory RemoveFriend([updates(RemoveFriendBuilder b)]) = _$RemoveFriend;
}

abstract class SendTopicFlow extends GroupChatevent
    implements Built<SendTopicFlow,SendTopicFlowBuilder> {
  String? get Title;
  String? get Content;
  int? get Bubble_id;
  FlowData? get Flow;
  SendTopicFlow._();
  factory SendTopicFlow([updates(SendTopicFlowBuilder b)]) = _$SendTopicFlow;
}

abstract class SendFootPrintFlow extends GroupChatevent
    implements Built<SendFootPrintFlow,SendFootPrintFlowBuilder> {
  String? get title;
  String? get image;
  FlowData? get Flow;
  int? get Bubble_id;
  SendFootPrintFlow._();
  factory SendFootPrintFlow([updates(SendFootPrintFlowBuilder b)]) = _$SendFootPrintFlow;
}

abstract class SendMediaDumpFlow extends GroupChatevent
    implements Built<SendMediaDumpFlow,SendMediaDumpFlowBuilder> {
  String? get title;
  String? get image;
  String? get image_type;
  int? get Bubble_id;
  FlowData? get Flow;
  SendMediaDumpFlow._();
  factory SendMediaDumpFlow([updates(SendMediaDumpFlowBuilder b)]) = _$SendMediaDumpFlow;
}

abstract class SendPollFloww extends GroupChatevent
    implements Built<SendPollFloww,SendPollFlowwBuilder> {
  String? get Question;
  int? get bubble_id;
  List<String>? get answers;
  FlowData? get Flow;
  SendPollFloww._();
  factory SendPollFloww([updates(SendPollFlowwBuilder b)]) = _$SendPollFloww;
}


abstract class ChangeFlowOptionsStatus extends GroupChatevent
    implements Built<ChangeFlowOptionsStatus,ChangeFlowOptionsStatusBuilder> {
  bool? get status;
  ChangeFlowOptionsStatus._();
  factory ChangeFlowOptionsStatus([updates(ChangeFlowOptionsStatusBuilder b)]) = _$ChangeFlowOptionsStatus;
}

abstract class ChangeMediaImageTaken extends GroupChatevent
    implements Built<ChangeMediaImageTaken,ChangeMediaImageTakenBuilder> {
  bool? get status;
  ChangeMediaImageTaken._();
  factory ChangeMediaImageTaken([updates(ChangeMediaImageTakenBuilder b)]) = _$ChangeMediaImageTaken;
}

abstract class ShowFloatingActionButton extends GroupChatevent
    implements Built<ShowFloatingActionButton, ShowFloatingActionButtonBuilder> {
  bool? get status;
  ShowFloatingActionButton._();
  factory ShowFloatingActionButton([updates(ShowFloatingActionButtonBuilder b)]) = _$ShowFloatingActionButton;
}

abstract class AddFlowModel extends GroupChatevent
    implements Built<AddFlowModel, AddFlowModelBuilder> {
  FlowData? get Flow;
  AddFlowModel._();
  factory AddFlowModel([updates(AddFlowModelBuilder b)]) = _$AddFlowModel;
}
