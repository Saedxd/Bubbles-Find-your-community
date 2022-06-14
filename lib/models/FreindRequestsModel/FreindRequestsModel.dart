
library FreindRequestsModel;

import 'dart:convert';


import 'package:bubbles/models/FreindRequestsModel/UsersRequestsModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FreindRequestsModel.g.dart';

abstract class FreindRequestsModel
    implements Built<FreindRequestsModel,FreindRequestsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<UsersRequestsModel>? get users;



  FreindRequestsModel._();
  factory FreindRequestsModel([void Function(FreindRequestsModelBuilder b)? updates]) =  _$FreindRequestsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FreindRequestsModel.serializer, this));
  }
  static FreindRequestsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FreindRequestsModel.serializer, json.decode(jsonString));
  }

  static Serializer<FreindRequestsModel> get serializer => _$freindRequestsModelSerializer;
}
