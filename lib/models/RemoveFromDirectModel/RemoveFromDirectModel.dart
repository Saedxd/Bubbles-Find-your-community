//

library RemoveFromDirectModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'RemoveFromDirectModel.g.dart';

abstract class RemoveFromDirectModel
    implements Built<RemoveFromDirectModel,RemoveFromDirectModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  RemoveFromDirectModel._();
  factory RemoveFromDirectModel([void Function(RemoveFromDirectModelBuilder b)? updates]) =  _$RemoveFromDirectModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(RemoveFromDirectModel.serializer, this));
  }
  static RemoveFromDirectModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        RemoveFromDirectModel.serializer, json.decode(jsonString));
  }

  static Serializer<RemoveFromDirectModel> get serializer => _$removeFromDirectModelSerializer;
}
