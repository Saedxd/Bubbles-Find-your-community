

library GetGender;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'AvatarListModel.dart';


part 'AvatarListModel.g.dart';

abstract class AvatarListModel
    implements Built<AvatarListModel,AvatarListModelBuilder> {

  String? get created_at;
  String? get updated_at;
  int? get id;
  String? get image;


  AvatarListModel._();
  factory AvatarListModel([void Function(AvatarListModelBuilder b)? updates]) =  _$AvatarListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AvatarListModel.serializer, this));
  }
  static AvatarListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        AvatarListModel.serializer, json.decode(jsonString));
  }

  static Serializer<AvatarListModel> get serializer => _$avatarListModelSerializer;
}
