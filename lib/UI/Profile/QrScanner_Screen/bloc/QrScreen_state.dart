library QrScreen_state;

import 'dart:convert';


import 'package:bubbles/models/AddFrindWithBarCodeModel/AddFreindBarCodeModel.dart';
import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'QrScreen_state.g.dart';

abstract class QrScreenState implements Built<QrScreenState, QrScreenStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;
  bool? get FreindAdded;


  AddFreindBarCodeModel? get AddFreindBarCode;

  QrScreenState._();

  factory QrScreenState([updates(QrScreenStateBuilder b)]) = _$QrScreenState;
  factory QrScreenState.initail() {
    return QrScreenState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..FreindAdded = false



    );
  }
}
