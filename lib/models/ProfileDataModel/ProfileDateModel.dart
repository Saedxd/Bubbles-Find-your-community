library ProfileDateModel;

import 'dart:convert';


import 'package:bubbles/models/ProfileDataModel/UserProfileData.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ProfileDateModel.g.dart';

abstract class ProfileDateModel
    implements Built<ProfileDateModel,ProfileDateModelBuilder> {

  String? get msg;
  int? get statuscode;
  UserProfileData? get user;
  String? get error;


  ProfileDateModel._();
  factory ProfileDateModel([void Function(ProfileDateModelBuilder b)? updates]) =  _$ProfileDateModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ProfileDateModel.serializer, this));
  }
  static ProfileDateModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProfileDateModel.serializer, json.decode(jsonString));
  }

  static Serializer<ProfileDateModel> get serializer => _$profileDateModelSerializer;
}
