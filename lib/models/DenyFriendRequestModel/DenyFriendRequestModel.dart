//

library DenyFriendRequestModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DenyFriendRequestModel.g.dart';

abstract class DenyFriendRequestModel
    implements Built<DenyFriendRequestModel,DenyFriendRequestModelBuilder> {

  String? get msg;
  int? get statuscode;



  DenyFriendRequestModel._();
  factory DenyFriendRequestModel([void Function(DenyFriendRequestModelBuilder b)? updates]) =  _$DenyFriendRequestModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DenyFriendRequestModel.serializer, this));
  }
  static DenyFriendRequestModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DenyFriendRequestModel.serializer, json.decode(jsonString));
  }

  static Serializer<DenyFriendRequestModel> get serializer => _$denyFriendRequestModelSerializer;
}
