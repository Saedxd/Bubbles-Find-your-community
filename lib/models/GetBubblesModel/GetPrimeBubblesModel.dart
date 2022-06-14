
library GetPrimeBubblesModel;

import 'dart:convert';


import 'package:bubbles/models/GetBubblesModel/DataPrimeBubbles.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetPrimeBubblesModel.g.dart';

abstract class GetPrimeBubblesModel
    implements Built<GetPrimeBubblesModel,GetPrimeBubblesModelBuilder> {

  int? get status;
  BuiltList<DataPrimeBubbles>? get data;





  GetPrimeBubblesModel._();
  factory GetPrimeBubblesModel([void Function(GetPrimeBubblesModelBuilder b)? updates]) =  _$GetPrimeBubblesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetPrimeBubblesModel.serializer, this));
  }
  static GetPrimeBubblesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetPrimeBubblesModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetPrimeBubblesModel> get serializer => _$getPrimeBubblesModelSerializer;
}
