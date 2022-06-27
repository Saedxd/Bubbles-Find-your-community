// ignore_for_file: non_constant_identifier_names

library GroupChat_state;

import 'dart:convert';


import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/Data/Data.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
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

  bool? get MYAliasISLoading;
  bool? get MYAliasISsuccess;

  bool? get typingStatusISloading;
  bool? get TypingStatusSuccess;
  bool? get TypingStatus;

  GetAliasModel? get GetAliasMinee;
  List<GroupChatMessage>? get messages;

  bool? get AddModelISloading;
  bool? get AddModelSUccess;

  String? get AvatarPathForRepliedTo;
  int? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  bool? get Status;

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
      ..CheckboxStatuss1 = false
      ..CheckboxStatuss2 = false
      ..KetbaordStatuss = false
      ..messages = []
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
      ..MYAliasISLoading = false
      ..success = false
      ..AliasISsuccess = false
      ..RefreshSuccess = true
      ..MYAliasISsuccess = false
      ..Isreply = false
      ..DescriptionLengthSuccess = false
      ..DescriptionLengthISloading = false
      ..ColorForRepliedTo = 0
      ..DescriptionLength = 0
      ..TextfieldSum = 2
      ..Done = false
      ..GetAlias=null
      ..GetAliasMinee=null
    );
  }
}
