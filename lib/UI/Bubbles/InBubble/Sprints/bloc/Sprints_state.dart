library Sprints_state;

import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';


import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:built_value/built_value.dart';


part 'Sprints_state.g.dart';

abstract class SprintsState implements Built<SprintsState, SprintsStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get Done;

  bool? get AliasISLoading;
  bool? get AliasISsuccess;

  GetAliasModel? get GetAlias;
  OldMessagesModel? get OldMessages;
  PostMessagesModel? get PostMessages;
  AddreplyModel? get Addreply;


  bool? get RefreshLoading;
  bool? get RefreshSuccess;

  bool? get Turnss;

  bool? get MYAliasISLoading;
  bool? get MYAliasISsuccess;

  bool? get typingStatusISloading;
  bool? get TypingStatusSuccess;
  bool? get TypingStatus;

  GetAliasModel? get GetAliasMinee;
  List<MessageModel>? get messages;

  bool? get AddModelISloading;
  bool? get AddModelSUccess;

  String? get AvatarPathForRepliedTo;
  int? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  bool? get Status;



  SprintsState._();
  factory SprintsState([updates(SprintsStateBuilder b)]) = _$SprintsState;
  factory SprintsState.initail() {
    return SprintsState((b) => b
      ..error = ""
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
      ..ColorForRepliedTo = 0
      ..Done = false
        ..OldMessages=null
        ..GetAlias=null
        ..PostMessages=null
        ..GetAliasMinee=null
        ..Addreply=null

    );
  }




}
