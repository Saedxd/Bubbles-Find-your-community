library AnswersListModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'AnswersListModel.g.dart';

abstract class AnswersListModel
    implements Built<AnswersListModel, AnswersListModelBuilder> {

  String? get title;
  String? get created_at;
  String? get updated_at;
  int? get id;
  int? get question_id;

  AnswersListModel._();
  factory AnswersListModel(
          [void Function(AnswersListModelBuilder b)? updates]) =
      _$AnswersListModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(AnswersListModel.serializer, this));
  }

  static AnswersListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AnswersListModel.serializer, json.decode(jsonString));
  }

  static Serializer<AnswersListModel> get serializer =>
      _$answersListModelSerializer;
}
