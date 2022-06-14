//RemoveFriendModel
library RemoveFriendModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'RemoveFriendModel.g.dart';

abstract class RemoveFriendModel
    implements Built<RemoveFriendModel,RemoveFriendModelBuilder> {

  String? get msg;
  int? get statuscode;




  RemoveFriendModel._();
  factory RemoveFriendModel([void Function(RemoveFriendModelBuilder b)? updates]) =  _$RemoveFriendModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(RemoveFriendModel.serializer, this));
  }
  static RemoveFriendModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        RemoveFriendModel.serializer, json.decode(jsonString));
  }

  static Serializer<RemoveFriendModel> get serializer => _$removeFriendModelSerializer;
}
