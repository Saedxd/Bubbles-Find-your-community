library SprintsMatch_state;

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


part 'SprintsMatch_state.g.dart';

abstract class SprintsMatchState implements Built<SprintsMatchState, SprintsMatchStateBuilder>   {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  SprintsMatchState._();
  factory SprintsMatchState([updates(SprintsMatchStateBuilder b)]) = _$SprintsMatchState;
  factory SprintsMatchState.initail() {
    return SprintsMatchState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
    );
  }
}
