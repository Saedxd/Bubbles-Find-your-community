library Notifications_State;

import 'dart:convert';

import 'package:bubbles/models/ClearBadgeModel/ClearBadgeModel.dart';
import 'package:bubbles/models/GetNotificationsModel/GetnotifcationsModel.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:bubbles/models/permissionsModel/PermissionsModel.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Notifications_State.g.dart';

abstract class NotificationsState implements Built<NotificationsState, NotificationsStateBuilder> {
  // fields go here

  String? get error;
  bool? get isLoading;
  bool? get success;

  GetnotifcationsModel? get Getnotifcations;
  ClearBadgeModel? get ClearBadge;
  NotificationsState._();

  factory NotificationsState([updates(NotificationsStateBuilder b)]) = _$NotificationsState;

  factory NotificationsState.initail() {
    return NotificationsState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
        ..Getnotifcations = null
      ..ClearBadge =null

    );
  }
}
