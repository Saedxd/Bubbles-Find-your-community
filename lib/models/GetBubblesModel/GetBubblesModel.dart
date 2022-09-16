
library GetBubblesModel;

import 'dart:convert';


import 'package:bubbles/models/GetBubblesModel/DataPrimeBubbles.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetBubblesModel.g.dart';

abstract class GetBubblesModel
    implements Built<GetBubblesModel,GetBubblesModelBuilder> {

  int? get status;
  String? get error;
  BuiltList<DataPrimeBubbles>? get data;


  GetBubblesModel._();
  factory GetBubblesModel([void Function(GetBubblesModelBuilder b)? updates]) =  _$GetBubblesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetBubblesModel.serializer, this));
  }
  static GetBubblesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetBubblesModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetBubblesModel> get serializer => _$getBubblesModelSerializer;
}
