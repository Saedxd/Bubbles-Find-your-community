// ignore_for_file: non_constant_identifier_names

library GroupChat_state;

import 'dart:convert';


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



  GroupChatState._();

  factory GroupChatState([updates(GroupChatStateBuilder b)]) = _$GroupChatState;
  factory GroupChatState.initail() {
    return GroupChatState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..KetbaordStatuss = false





    );
  }
}
