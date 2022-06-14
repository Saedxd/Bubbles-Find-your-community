// ignore_for_file: non_constant_identifier_names

library Challenges_Event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Challenges_Event.g.dart';

abstract class ChallengesEvent {}

abstract class GetChallenges extends ChallengesEvent implements
    Built<GetChallenges, GetChallengesBuilder> {

  GetChallenges._();
  factory GetChallenges([updates(GetChallengesBuilder b)]) = _$GetChallenges;
}


abstract class ClearError extends ChallengesEvent implements
    Built<ClearError,ClearErrorBuilder> {

  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetPoints extends ChallengesEvent implements
    Built<GetPoints,GetPointsBuilder> {

int? get ChallengeId;

  GetPoints._();
  factory GetPoints([updates(GetPointsBuilder b)]) = _$GetPoints;
}