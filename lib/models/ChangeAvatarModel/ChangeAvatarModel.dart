library ChangeAvatarModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ChangeAvatarModel.g.dart';

abstract class ChangeAvatarModel
    implements Built<ChangeAvatarModel,ChangeAvatarModelBuilder> {

  String? get msg;
  int? get statuscode;



  ChangeAvatarModel._();
  factory ChangeAvatarModel([void Function(ChangeAvatarModelBuilder b)? updates]) =  _$ChangeAvatarModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ChangeAvatarModel.serializer, this));
  }
  static ChangeAvatarModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ChangeAvatarModel.serializer, json.decode(jsonString));
  }

  static Serializer<ChangeAvatarModel> get serializer => _$changeAvatarModelSerializer;
}
