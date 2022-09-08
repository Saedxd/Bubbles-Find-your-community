//

library SprintsJoinLeaveModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SprintsJoinLeaveModel.g.dart';

abstract class SprintsJoinLeaveModel
    implements Built<SprintsJoinLeaveModel,SprintsJoinLeaveModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  SprintsJoinLeaveModel._();
  factory SprintsJoinLeaveModel([void Function(SprintsJoinLeaveModelBuilder b)? updates]) =  _$SprintsJoinLeaveModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SprintsJoinLeaveModel.serializer, this));
  }
  static SprintsJoinLeaveModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SprintsJoinLeaveModel.serializer, json.decode(jsonString));
  }

  static Serializer<SprintsJoinLeaveModel> get serializer => _$sprintsJoinLeaveModelSerializer;
}
