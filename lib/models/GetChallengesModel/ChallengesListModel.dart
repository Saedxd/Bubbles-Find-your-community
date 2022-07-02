//challenges
//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library ChallengesListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ChallengesListModel.g.dart';

abstract class ChallengesListModel
    implements Built<ChallengesListModel,ChallengesListModelBuilder> {

  String? get title;
  String? get content;
  String? get image;
  int? get id;
  int? get point;
  int? get max_number;



  ChallengesListModel._();
  factory ChallengesListModel([void Function(ChallengesListModelBuilder b)? updates]) =  _$ChallengesListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ChallengesListModel.serializer, this));
  }
  static ChallengesListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChallengesListModel.serializer, json.decode(jsonString));
  }

  static Serializer<ChallengesListModel> get serializer => _$challengesListModelSerializer;
}
