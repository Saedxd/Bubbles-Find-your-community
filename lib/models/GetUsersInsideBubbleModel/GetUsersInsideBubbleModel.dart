//
//{
//     "msg": "success",
//     "statuscode": 200
// }

library GetUsersInsideBubbleModel;

import 'dart:convert';


import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetUsersInsideBubbleModel.g.dart';

abstract class GetUsersInsideBubbleModel
    implements Built<GetUsersInsideBubbleModel,GetUsersInsideBubbleModelBuilder> {

  String? get msg;
  int? get statuscode;
BuiltList<UsersInsideBubbleListModel>? get users;
  String? get error;
  GetUsersInsideBubbleModel._();
  factory GetUsersInsideBubbleModel([void Function(GetUsersInsideBubbleModelBuilder b)? updates]) =  _$GetUsersInsideBubbleModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetUsersInsideBubbleModel.serializer, this));
  }
  static GetUsersInsideBubbleModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetUsersInsideBubbleModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetUsersInsideBubbleModel> get serializer => _$getUsersInsideBubbleModelSerializer;
}
