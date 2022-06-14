//InterestsListModel
// /{
//     "interests": [
//
//     ],
//     "msg": "success",
//     "statuscode": 200
// }
//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library InterestsListModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'InterestsListModel.g.dart';

abstract class InterestsListModel
    implements Built<InterestsListModel,InterestsListModelBuilder> {

  String? get title;
  int? get id;
  String? get image;

  InterestsListModel._();
  factory InterestsListModel([void Function(InterestsListModelBuilder b)? updates]) =  _$InterestsListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(InterestsListModel.serializer, this));
  }
  static InterestsListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        InterestsListModel.serializer, json.decode(jsonString));
  }

  static Serializer<InterestsListModel> get serializer => _$interestsListModelSerializer;
}
