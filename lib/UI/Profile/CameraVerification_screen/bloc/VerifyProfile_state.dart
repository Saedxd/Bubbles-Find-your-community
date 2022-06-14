library VerifyProfile_state;

import 'dart:convert';


import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/VerifyProfileModel/VerifyProfileModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'VerifyProfile_state.g.dart';

abstract class VerifyProfileState implements Built<VerifyProfileState, VerifyProfileStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  bool? get Done;


  VerifyProfileModel? get VerifyProfile;

  VerifyProfileState._();

  factory VerifyProfileState([updates(VerifyProfileStateBuilder b)]) = _$VerifyProfileState;
  factory VerifyProfileState.initail() {
    return VerifyProfileState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..Done = false
        ..VerifyProfile =null



    );
  }
}
