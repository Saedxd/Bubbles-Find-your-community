
library AddNewFriendModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'AddNewFriendModel.g.dart';

abstract class AddNewFriendModel
    implements Built<AddNewFriendModel,AddNewFriendModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  AddNewFriendModel._();
  factory AddNewFriendModel([void Function(AddNewFriendModelBuilder b)? updates]) =  _$AddNewFriendModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AddNewFriendModel.serializer, this));
  }
  static AddNewFriendModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AddNewFriendModel.serializer, json.decode(jsonString));
  }

  static Serializer<AddNewFriendModel> get serializer => _$addNewFriendModelSerializer;
}
