//GendersListModel
//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library GendersListModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'GendersListModel.g.dart';

abstract class GendersListModel
    implements Built<GendersListModel, GendersListModelBuilder> {

  String? get title;
  int? get id;
  int? get type;
  String? get image;

  GendersListModel._();

  factory GendersListModel(
      [void Function(GendersListModelBuilder b)? updates]) = _$GendersListModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(GendersListModel.serializer, this));
  }

  static GendersListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GendersListModel.serializer, json.decode(jsonString));
  }

  static Serializer<GendersListModel> get serializer =>
      _$gendersListModelSerializer;
}
