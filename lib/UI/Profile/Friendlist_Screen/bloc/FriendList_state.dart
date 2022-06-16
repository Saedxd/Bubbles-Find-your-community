// ignore_for_file: file_names

library FriendList_state;

import 'dart:convert';


import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/models/ChangeAvatarModel/ChangeAvatarModel.dart';
import 'package:bubbles/models/GetAvatarsModel/GetAvatarsModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/RemoveFrinedModel/RemoveFriendModel.dart';
import 'package:bubbles/models/UpdateBoiModel/UpdateBoiModel.dart';
import 'package:built_value/built_value.dart';


part 'FriendList_state.g.dart';

abstract class FriendListState implements Built<FriendListState,FriendListStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  bool? get IsRefresh;

  bool? get ChangeStateLoading;
  bool? get ChangeStateSuccess;

  GetFriendsModel? get GetFriends;
  RemoveFriendModel? get RemoveFriend;

  FriendListState._();

  factory FriendListState([updates(FriendListStateBuilder b)]) = _$FriendListState;
  factory FriendListState.initail() {
    return FriendListState((b) => b
      ..error = ""
      ..isLoading = false
      ..ChangeStateLoading = false
      ..success = false
      ..ChangeStateSuccess = false
      ..IsRefresh = false
        ..GetFriends =null
        ..RemoveFriend=null

    );
  }
}
