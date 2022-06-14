library Challenges_State;

import 'dart:convert';


import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/GetChallengesModel/GetChallengesModel.dart';
import 'package:bubbles/models/GetPointsModel/GetPointsModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'Challenges_State.g.dart';

abstract class ChallengesState implements Built<ChallengesState, ChallengesStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;


  bool? get GetPointsisLoading;
  bool? get GetPointsSuccess;
  GetChallengesModel? get GetChallenges;
  GetPointsModel? get GetPoints;
  ChallengesState._();

  factory ChallengesState([updates(ChallengesStateBuilder b)]) = _$ChallengesState;
  factory ChallengesState.initail() {
    return ChallengesState((b) => b
      ..error = ""
      ..isLoading = false
      ..GetPointsisLoading = false
      ..success = false
      ..GetPointsSuccess = false
        ..GetChallenges = null
        ..GetPoints = null

    );
  }
}
