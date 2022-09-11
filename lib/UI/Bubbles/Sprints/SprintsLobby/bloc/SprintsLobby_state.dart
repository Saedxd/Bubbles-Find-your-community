library SprintsLobby_state;

import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/core/Classes/Classes.dart';


import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/GetUsersInsideBubbleModel.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
import 'package:built_value/built_value.dart';


part 'SprintsLobby_state.g.dart';

abstract class SprintsLobbyState implements Built<SprintsLobbyState, SprintsLobbyStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  SprintsLobbyState._();
  factory SprintsLobbyState([updates(SprintsLobbyStateBuilder b)]) = _$SprintsLobbyState;
  factory SprintsLobbyState.initail() {
    return SprintsLobbyState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
    );
  }
}
