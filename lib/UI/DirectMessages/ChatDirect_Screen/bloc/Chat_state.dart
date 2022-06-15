library Chat_state;

import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:built_value/built_value.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




part 'Chat_state.g.dart';

abstract class ChatState implements Built<ChatState, ChatStateBuilder>   {
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

  String? get AvatarPathForRepliedTo;
  int? get ColorForRepliedTo;
  String? get RepliedToMessage;
  String? get AliasForRepliedTo;
  bool? get Isreply;
  bool? get Status;


  ChatState._();
  factory ChatState([updates(ChatStateBuilder b)]) = _$ChatState;
  factory ChatState.initail() {
    return ChatState((b) => b
      ..error = ""
      ..RepliedToMessage = ""
      ..AvatarPathForRepliedTo = ""
      ..AliasForRepliedTo = ""
      ..isLoading = false
      ..Status = false
      ..AliasISLoading = false
      ..success = false
      ..AliasISsuccess = false
      ..Isreply = false
      ..ColorForRepliedTo = 0
      ..Done = false
        ..OldMessages=null
        ..GetAlias=null
        ..PostMessages=null
        ..Addreply=null
    );
  }




}
