library Subscribed_state;

import 'dart:convert';


import 'package:bubbles/models/AddNewFriendModel/AddNewFriendModel.dart';
import 'package:bubbles/models/ProfileDataModel/ProfileDateModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contacts_service/contacts_service.dart';

part 'Subscribed_state.g.dart';

abstract class SubscribedState implements Built<SubscribedState, SubscribedStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  SubscribedState._();

  factory SubscribedState([updates(SubscribedStateBuilder b)]) = _$SubscribedState;
  factory SubscribedState.initail() {
    return SubscribedState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false



    );
  }
}
