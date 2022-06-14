

library GetQuestionsModel;

import 'dart:convert';

import 'package:bubbles/models/GetQuestionsModel/QuestionsListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'GetQuestionsModel.g.dart';

abstract class GetQuestionsModel
    implements Built<GetQuestionsModel, GetQuestionsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<QuestionsListModel>? get questions;

  GetQuestionsModel._();

  factory GetQuestionsModel(
          [void Function(GetQuestionsModelBuilder b)? updates]) =
      _$GetQuestionsModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(GetQuestionsModel.serializer, this));
  }

  static GetQuestionsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetQuestionsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetQuestionsModel> get serializer =>
      _$getQuestionsModelSerializer;
}
