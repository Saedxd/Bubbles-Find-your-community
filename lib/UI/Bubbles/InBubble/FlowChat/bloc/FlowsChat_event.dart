// ignore_for_file: non_constant_identifier_names

library FlowsChat_event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/core/Classes/Classes.dart';

import 'package:built_value/built_value.dart';



part 'FlowsChat_event.g.dart';

abstract class FlowsChatEvent {}

abstract class ClearError extends FlowsChatEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class ShowFloatingActionButton extends FlowsChatEvent
    implements Built<ShowFloatingActionButton, ShowFloatingActionButtonBuilder> {
  bool? get status;
  ShowFloatingActionButton._();
  factory ShowFloatingActionButton([updates(ShowFloatingActionButtonBuilder b)]) = _$ShowFloatingActionButton;
}

abstract class KetbaordStatus extends FlowsChatEvent
    implements Built<KetbaordStatus,KetbaordStatusBuilder> {

  bool? get status;
  KetbaordStatus._();
  factory KetbaordStatus([updates(KetbaordStatusBuilder b)]) = _$KetbaordStatus;
}


abstract class GetAlias extends FlowsChatEvent
    implements Built<GetAlias,GetAliasBuilder> {

  int? get HIS_ID;
  int? get My_ID;
  GetAlias._();
  factory GetAlias([updates(GetAliasBuilder b)]) = _$GetAlias;
}
abstract class SendMessage extends FlowsChatEvent
    implements Built<SendMessage,SendMessageBuilder> {

  int? get main_type;
  String? get message;
  int? get FlowMessage_Id;

  String? get type;
  int? get bubble_id;
  int? get IndexOfMessageList;
  SendMessage._();
  factory SendMessage([updates(SendMessageBuilder b)]) = _$SendMessage;
}
abstract class addReply extends FlowsChatEvent
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


abstract class AddModel extends FlowsChatEvent
    implements Built<AddModel,AddModelBuilder>  {
  GroupChatFlowsMessage? get message;

  AddModel._();
  factory AddModel([updates(AddModelBuilder b)]) = _$AddModel;
}



abstract class ChangeTypingStatus extends FlowsChatEvent
    implements Built<ChangeTypingStatus,ChangeTypingStatusBuilder> {
  bool? get ChangeStatus;

  ChangeTypingStatus._();
  factory ChangeTypingStatus([updates(ChangeTypingStatusBuilder b)]) = _$ChangeTypingStatus;
}

abstract class ShowReplyWidget extends FlowsChatEvent
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
abstract class SendStatus extends FlowsChatEvent
    implements Built<SendStatus,SendStatusBuilder> {

  bool? get Status;
  SendStatus._();
  factory SendStatus([updates(SendStatusBuilder b)]) = _$SendStatus;
}

abstract class DescriptionLength extends FlowsChatEvent
    implements Built<DescriptionLength,DescriptionLengthBuilder> {

  int? get DescriptionLengthh;
  DescriptionLength._();
  factory DescriptionLength([updates(DescriptionLengthBuilder b)]) = _$DescriptionLength;
}

abstract class ChangeCheckboxStatus1 extends FlowsChatEvent
    implements Built<ChangeCheckboxStatus1,ChangeCheckboxStatus1Builder> {
  bool? get CheckboxStatus1;

  ChangeCheckboxStatus1._();
  factory ChangeCheckboxStatus1([updates(ChangeCheckboxStatus1Builder b)]) = _$ChangeCheckboxStatus1;
}

abstract class ChangeCheckboxStatus2 extends FlowsChatEvent
    implements Built<ChangeCheckboxStatus2,ChangeCheckboxStatus2Builder> {
  bool? get CheckboxStatus2;

  ChangeCheckboxStatus2._();
  factory ChangeCheckboxStatus2([updates(ChangeCheckboxStatus2Builder b)]) = _$ChangeCheckboxStatus2;
}

abstract class ChangeTextfieldSum extends FlowsChatEvent
    implements Built<ChangeTextfieldSum,ChangeTextfieldSumBuilder> {
  int? get num;

  ChangeTextfieldSum._();
  factory ChangeTextfieldSum([updates(ChangeTextfieldSumBuilder b)]) = _$ChangeTextfieldSum;
}

abstract class MakeTextFieldSumToNormal extends FlowsChatEvent
    implements Built<MakeTextFieldSumToNormal,MakeTextFieldSumToNormalBuilder> {

  MakeTextFieldSumToNormal._();
  factory MakeTextFieldSumToNormal([updates(MakeTextFieldSumToNormalBuilder b)]) = _$MakeTextFieldSumToNormal;
}

abstract class GetOldMessages extends FlowsChatEvent
    implements Built<GetOldMessages,GetOldMessagesBuilder> {
int? get message_id;
  GetOldMessages._();
  factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
}

abstract class GetAliasForInsideUser extends FlowsChatEvent
    implements Built<GetAliasForInsideUser,GetAliasForInsideUserBuilder> {
  int? get User_id;
  GetAliasForInsideUser._();
  factory GetAliasForInsideUser([updates(GetAliasForInsideUserBuilder b)]) = _$GetAliasForInsideUser;
}


abstract class GetUsersInsideBubble extends FlowsChatEvent
    implements Built<GetUsersInsideBubble,GetUsersInsideBubbleBuilder> {
  int? get Bubble_id;
  GetUsersInsideBubble._();
  factory GetUsersInsideBubble([updates(GetUsersInsideBubbleBuilder b)]) = _$GetUsersInsideBubble;
}

abstract class SearchInsideBubbleUser extends FlowsChatEvent
    implements Built<SearchInsideBubbleUser,SearchInsideBubbleUserBuilder> {
  String? get Keyword;
  SearchInsideBubbleUser._();
  factory SearchInsideBubbleUser([updates(SearchInsideBubbleUserBuilder b)]) = _$SearchInsideBubbleUser;
}

abstract class AddFrined extends FlowsChatEvent
    implements Built<AddFrined,AddFrinedBuilder> {
  String? get serial;

  AddFrined._();
  factory AddFrined([updates(AddFrinedBuilder b)]) = _$AddFrined;
}

abstract class RemoveFriend extends FlowsChatEvent
    implements Built<RemoveFriend,RemoveFriendBuilder> {
  int? get friend_id;
  RemoveFriend._();
  factory RemoveFriend([updates(RemoveFriendBuilder b)]) = _$RemoveFriend;
}

// abstract class SendTopicFlow extends FlowsChatEvent
//     implements Built<SendTopicFlow,SendTopicFlowBuilder> {
//   String? get Title;
//   String? get Content;
//   bool? get Is_topic;
//   String? get Topic_Type;
//   int? get Bubble_id;
//   SendTopicFlow._();
//   factory SendTopicFlow([updates(SendTopicFlowBuilder b)]) = _$SendTopicFlow;
// }
