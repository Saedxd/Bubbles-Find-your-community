

library GetGender;

import 'dart:convert';

import 'package:bubbles/models/GetAvatarsModel/AvatarListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'GetAvatarsModel.dart';


part 'GetAvatarsModel.g.dart';

abstract class GetAvatarsModel
    implements Built<GetAvatarsModel,GetAvatarsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<AvatarListModel>? get avatars;



  GetAvatarsModel._();
  factory GetAvatarsModel([void Function(GetAvatarsModelBuilder b)? updates]) =  _$GetAvatarsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetAvatarsModel.serializer, this));
  }
  static GetAvatarsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetAvatarsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetAvatarsModel> get serializer => _$getAvatarsModelSerializer;
}
