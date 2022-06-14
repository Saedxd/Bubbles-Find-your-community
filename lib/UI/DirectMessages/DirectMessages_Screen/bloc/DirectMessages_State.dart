// ignore_for_file: non_constant_identifier_names

library DirectMessages_State;

import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:built_value/built_value.dart';



part 'DirectMessages_State.g.dart';

abstract class DirectMessagesState implements Built<DirectMessagesState, DirectMessagesStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;

  OldMessagesModel? get OldMessages;

  DirectMessagesState._();

  factory DirectMessagesState([updates(DirectMessagesStateBuilder b)]) = _$DirectMessagesState;
  factory DirectMessagesState.initail() {
    return DirectMessagesState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..OldMessages = null
    );
  }
}
