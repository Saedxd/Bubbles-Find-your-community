// ignore_for_file: non_constant_identifier_names

library TopBar_State;

import 'dart:convert';


import 'package:bubbles/models/ClearBadgeModel/ClearBadgeModel.dart';
import 'package:bubbles/models/GetFriendsModel/GetFriendsModel.dart';
import 'package:bubbles/models/GetbadgeModel/GetbadgeModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'TopBar_State.g.dart';

abstract class TopBarState implements Built<TopBarState, TopBarStateBuilder> {

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get Index1;
  bool? get Index2;
  bool? get Index3;
  bool? get Index4;
  bool? get Index5;
  bool? get GetbadgeSucess;
  int? get INDEX;
  int? get BadgeCounter;

  bool? get is_Creator;



  bool? get GetprofileLoading;
  bool? get GetprofileSuccess;
  GetFriendsModel? get GetFriends;
 ProfileDateModel? get ProfileDate;
  GetbadgeModel? get Getbadge;
  ClearBadgeModel? get ClearBadge;

  TopBarState._();

  factory TopBarState([updates(TopBarStateBuilder b)]) = _$TopBarState;
  factory TopBarState.initail() {
    return TopBarState((b) => b
      ..error = ""
      ..isLoading = false
      ..GetprofileLoading = false
      ..success = false
      ..GetprofileSuccess = false
      ..INDEX = 0
      ..BadgeCounter = 0
      ..Index1 = true
      ..Index2 = false
      ..GetbadgeSucess = false
      ..is_Creator = false
      ..Index3 = false
      ..Index4 = false
      ..Index5 = false
    ..ProfileDate =null
      ..GetFriends =null
      ..Getbadge =null

    );
  }
}
