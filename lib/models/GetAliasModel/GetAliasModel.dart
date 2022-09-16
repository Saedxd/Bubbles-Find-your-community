
library GetAliasModel;

import 'dart:convert';


import 'package:bubbles/models/GetAliasModel/FreindModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetAliasModel.g.dart';

abstract class GetAliasModel
    implements Built<GetAliasModel,GetAliasModelBuilder> {

  String? get msg;
  int? get statuscode;
  FreindModel? get friend;
  String? get error;

  GetAliasModel._();
  factory GetAliasModel([void Function(GetAliasModelBuilder b)? updates]) =  _$GetAliasModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetAliasModel.serializer, this));
  }
  static GetAliasModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetAliasModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetAliasModel> get serializer => _$getAliasModelSerializer;
}
