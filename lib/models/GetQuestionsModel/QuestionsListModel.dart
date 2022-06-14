

library QuestionsListModel;

import 'dart:convert';

import 'package:bubbles/models/GetQuestionsModel/AnswersListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'QuestionsListModel.g.dart';

abstract class QuestionsListModel
    implements Built<QuestionsListModel, QuestionsListModelBuilder> {

  String? get title;
  String? get created_at;
  String? get updated_at;
  int? get id;
  BuiltList<AnswersListModel>? get answers;


  QuestionsListModel._();

  factory QuestionsListModel(
      [void Function(QuestionsListModelBuilder b)? updates]) =
  _$QuestionsListModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(QuestionsListModel.serializer, this));
  }

  static QuestionsListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        QuestionsListModel.serializer, json.decode(jsonString));
  }

  static Serializer<QuestionsListModel> get serializer => _$questionsListModelSerializer;

}
