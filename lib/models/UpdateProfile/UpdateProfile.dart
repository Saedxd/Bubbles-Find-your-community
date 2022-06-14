//{
//     "msg": "updated success",
//     "statuscode": 200
// }
//UpdateProfile

library UpdateProfile;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'UpdateProfile.g.dart';

abstract class UpdateProfile
    implements Built<UpdateProfile,UpdateProfileBuilder> {

  String? get msg;
  int? get statuscode;



  UpdateProfile._();
  factory UpdateProfile([void Function(UpdateProfileBuilder b)? updates]) =  _$UpdateProfile;
  String toJson() {
    return json
        .encode(serializers.serializeWith(UpdateProfile.serializer, this));
  }
  static UpdateProfile? fromJson(String jsonString) {
    return serializers.deserializeWith(
        UpdateProfile.serializer, json.decode(jsonString));
  }

  static Serializer<UpdateProfile> get serializer => _$updateProfileSerializer;
}
