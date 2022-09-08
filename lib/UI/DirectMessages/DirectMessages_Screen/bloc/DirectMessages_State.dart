// ignore_for_file: non_constant_identifier_names

library DirectMessages_State;

import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
import 'package:built_value/built_value.dart';



part 'DirectMessages_State.g.dart';

abstract class DirectMessagesState implements Built<DirectMessagesState, DirectMessagesStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;

  bool? get ChangeStateLoading;
  bool? get ChangeStateSuccess;

  OldMessagesModel? get OldMessages;
  OldMessagesModel? get DMListSearchResult;

  List<DmlistData>? get Dmlist;
  List<DmlistData>? get FilteredDmlist;

  DirectMessagesState._();

  factory DirectMessagesState([updates(DirectMessagesStateBuilder b)]) = _$DirectMessagesState;
  factory DirectMessagesState.initail() {
    return DirectMessagesState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..ChangeStateLoading = false
      ..ChangeStateSuccess = false
      ..Dmlist = []
      ..FilteredDmlist = []
      ..OldMessages = null
      ..DMListSearchResult = null
    );
  }
}
