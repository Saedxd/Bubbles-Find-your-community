// ignore_for_file: non_constant_identifier_names

library GroupChat_state;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/Data/Data.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/pages/GroupChat_Screen.dart';
import 'package:bubbles/models/EventOldMessagesModel/EventOldMessagesModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/SendBubbleMessageModel/SendBubbleMessageModel.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'GroupChat_state.g.dart';

abstract class GroupChatState implements Built<GroupChatState,GroupChatStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;


  bool? get KetbaordStatuss;

  bool? get Done;

  bool? get AliasISLoading;
  bool? get AliasISsuccess;

  GetAliasModel? get GetAlias;


  bool? get RefreshLoading;
  bool? get RefreshSuccess;

  bool? get Turnss;

  bool? get UserINbubbleAliasISLoading;
  bool? get  UserINbubbleAliasISsuccess;

  bool? get typingStatusISloading;
  bool? get TypingStatusSuccess;
  bool? get TypingStatus;

  bool? get SendMessageISloading;
  bool? get SendMessageSuccess;


  GetAliasModel? get GetAliasMinee;
  EventOldMessagesModel? get EventOldMessages;
  GetAliasModel? get GetAliasForInsideBubbleUser;
  SendBubbleMessageModel? get SendBubbleMessage;
  SendBubbleMessageModel? get SendBubbleReply;
  List<GroupChatMessage>? get messages;
  List<UserDATA>? get User;
  int? get index_For_Message_List;

  bool? get AddModelISloading;
  bool? get AddModelSUccess;

  String? get AvatarPathForRepliedTo;
  String? get ColorForRepliedTo;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  bool? get Status;
  String? get type;
  String? get RepliedToMessage;//if image will be backend path
  Uint8List? get Image1;
  File? get File_image;
  // bool? get is_Nodejs;
  // bool? get is_Backend;
  // bool? get is_base64;
String? get Image_type;


  bool? get DescriptionLengthISloading;
  bool? get DescriptionLengthSuccess;

  int? get DescriptionLength;
  bool? get CheckboxStatuss1;
  bool? get CheckboxStatuss2;

  int? get  TextfieldSum;

  GroupChatState._();


  factory GroupChatState([updates(GroupChatStateBuilder b)]) = _$GroupChatState;
  factory GroupChatState.initail() {
    return GroupChatState((b) => b
      ..error = ""
      ..success = false
      // ..is_Nodejs = false
      // ..is_Backend = false
      ..isLoading = false
      ..CheckboxStatuss1 = false
      ..SendMessageISloading = false
      ..SendMessageSuccess = false
      ..CheckboxStatuss2 = false
      ..UserINbubbleAliasISLoading = false
      ..UserINbubbleAliasISsuccess = false
      ..KetbaordStatuss = false
      ..messages = []
      ..User = []
      ..RepliedToMessage = ""
      ..AvatarPathForRepliedTo = ""
      ..AliasForRepliedTo = ""
      ..isLoading = false
      ..AddModelISloading = false
      ..AddModelSUccess = false
      ..Status = false
      ..Turnss = true
      ..AliasISLoading = false
      ..typingStatusISloading = false
      ..TypingStatusSuccess = false
      ..TypingStatus = false
      ..RefreshLoading = false
      ..AliasISsuccess = false
      ..RefreshSuccess = true
      ..Isreply = false
      ..DescriptionLengthSuccess = false
      ..DescriptionLengthISloading = false
      ..ColorForRepliedTo = ""
      ..index_For_Message_List = 0
      ..DescriptionLength = 0
      ..TextfieldSum = 2
      ..Done = false
      // ..is_base64 = false
      ..GetAlias=null
      ..Image1=null
      ..File_image=null
      ..GetAliasMinee=null
      ..EventOldMessages=null
      ..GetAliasForInsideBubbleUser=null
      ..SendBubbleMessage=null
      ..SendBubbleReply=null
    );
  }
}
