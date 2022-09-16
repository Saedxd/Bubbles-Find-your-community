//

library InOutUserStatusModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'InOutUserStatusModel.g.dart';

abstract class InOutUserStatusModel
    implements Built<InOutUserStatusModel,InOutUserStatusModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  InOutUserStatusModel._();
  factory InOutUserStatusModel([void Function(InOutUserStatusModelBuilder b)? updates]) =  _$InOutUserStatusModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(InOutUserStatusModel.serializer, this));
  }
  static InOutUserStatusModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        InOutUserStatusModel.serializer, json.decode(jsonString));
  }

  static Serializer<InOutUserStatusModel> get serializer => _$inOutUserStatusModelSerializer;
}
