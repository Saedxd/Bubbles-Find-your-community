//challenges
//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library AceeptRequestModel;

import 'dart:convert';


import 'package:bubbles/models/GetChallengesModel/ChallengesListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetChallengesModel.g.dart';

abstract class GetChallengesModel
    implements Built<GetChallengesModel,GetChallengesModelBuilder> {
  String? get error;
  String? get msg;
  int? get statuscode;
  BuiltList<ChallengesListModel>? get challenges;
  BuiltList<int>? get challengesStatus;
  BuiltList<int>? get values;

  GetChallengesModel._();
  factory GetChallengesModel([void Function(GetChallengesModelBuilder b)? updates]) =  _$GetChallengesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetChallengesModel.serializer, this));
  }
  static GetChallengesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetChallengesModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetChallengesModel> get serializer => _$getChallengesModelSerializer;
}
