
library AddreplyModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'AddreplyModel.g.dart';

abstract class AddreplyModel
    implements Built<AddreplyModel,AddreplyModelBuilder> {

  String? get msg;
  int? get statuscode;



  AddreplyModel._();
  factory AddreplyModel([void Function(AddreplyModelBuilder b)? updates]) =  _$AddreplyModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AddreplyModel.serializer, this));
  }
  static AddreplyModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AddreplyModel.serializer, json.decode(jsonString));
  }

  static Serializer<AddreplyModel> get serializer => _$addreplyModelSerializer;
}
