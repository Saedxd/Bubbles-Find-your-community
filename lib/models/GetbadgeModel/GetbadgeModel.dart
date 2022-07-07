//

library GetbadgeModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetbadgeModel.g.dart';

abstract class GetbadgeModel
    implements Built<GetbadgeModel,GetbadgeModelBuilder> {

  String? get msg;
  int? get statuscode;
  int? get count;



  GetbadgeModel._();
  factory GetbadgeModel([void Function(GetbadgeModelBuilder b)? updates]) =  _$GetbadgeModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetbadgeModel.serializer, this));
  }
  static GetbadgeModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetbadgeModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetbadgeModel> get serializer => _$getbadgeModelSerializer;
}
