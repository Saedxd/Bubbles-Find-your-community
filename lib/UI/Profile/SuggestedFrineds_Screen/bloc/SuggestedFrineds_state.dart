// ignore_for_file: non_constant_identifier_names

library SuggestedFrineds_state;

import 'dart:convert';


import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/pages/SuggestedFrineds_screen.dart';
import 'package:bubbles/models/SuggestFrinedsModel/SuggestFriendsModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

import '../../../../models/AddNewFriendModel/AddNewFriendModel.dart';

part 'SuggestedFrineds_state.g.dart';

abstract class SuggestedFreindsState implements Built<SuggestedFreindsState,SuggestedFreindsStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get AddFreindSuccess;
  bool? get FreindAddlOADING;

  SuggestFriendsModel? get SuggestFriends;
  AddNewFriendModel? get AddNewFriend;
List<Data>? get ListOFSUggested;

  SuggestedFreindsState._();

  factory SuggestedFreindsState([updates(SuggestedFreindsStateBuilder b)]) = _$SuggestedFreindsState;
  factory SuggestedFreindsState.initail() {
    return SuggestedFreindsState((b) => b
      ..error = ""
      ..isLoading = false
      ..FreindAddlOADING = false
      ..success = false
      ..AddFreindSuccess = false
        ..SuggestFriends =null
        ..AddNewFriend=null
        ..ListOFSUggested=[]
    );
  }
}
