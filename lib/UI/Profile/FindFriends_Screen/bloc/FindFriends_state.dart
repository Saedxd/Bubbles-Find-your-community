library FindFriends_state;

import 'dart:convert';


import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'FindFriends_state.g.dart';

abstract class FindFriendsState implements Built<FindFriendsState, FindFriendsStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get AddFreindSuccess;
  bool? get CopyMessageOpened;
  bool? get FreindAddlOADING;
  bool? get ISCopyMessage;
  bool? get IsContactLoadedd;
  bool? get IsCompletMessage;
  List<Contact> get contacts;

  ProfileDateModel? get ProfileDate;
  AddNewFriendModel? get AddNewFriend;


  FindFriendsState._();

  factory FindFriendsState([updates(FindFriendsStateBuilder b)]) = _$FindFriendsState;
  factory FindFriendsState.initail() {
    return FindFriendsState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..AddFreindSuccess = false
      ..CopyMessageOpened = false
      ..FreindAddlOADING = false
      ..ISCopyMessage = false
      ..IsContactLoadedd = false
      ..IsCompletMessage = false
        ..contacts = []
        ..AddNewFriend = null
        ..ProfileDate=null


    );
  }
}
