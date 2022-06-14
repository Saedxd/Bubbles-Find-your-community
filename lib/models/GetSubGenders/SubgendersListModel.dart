//SubgendersListModel
//{
//     "genders": [
//
//     ],
//     "msg": "success",
//     "statuscode": 200
// }

//class name "Must" be Started with Capital Letter and the part""
// MUST START with file.dart name and same as libary
/// another thing that Every Data Type name must be same as the model names.
// ignore_for_file: file_names

library SubgendersListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SubgendersListModel.g.dart';

abstract class SubgendersListModel
    implements Built<SubgendersListModel,SubgendersListModelBuilder> {

  String? get title;
  int? get id;
  int? get type;
  String? get image;



  SubgendersListModel._();
  factory SubgendersListModel([void Function(SubgendersListModelBuilder b)? updates]) =  _$SubgendersListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SubgendersListModel.serializer, this));
  }
  static SubgendersListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SubgendersListModel.serializer, json.decode(jsonString));
  }

  static Serializer<SubgendersListModel> get serializer => _$subgendersListModelSerializer;
}
