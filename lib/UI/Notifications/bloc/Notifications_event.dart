library Notifications_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Notifications_event.g.dart';

abstract class NotificationEvent {}


abstract class GetNotifications extends NotificationEvent
    implements Built<GetNotifications,GetNotificationsBuilder> {

  GetNotifications._();
  factory GetNotifications([updates(GetNotificationsBuilder b)]) = _$GetNotifications;
}



abstract class ClearError extends NotificationEvent
    implements Built<ClearError, ClearErrorBuilder> {

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;


}

abstract class ClearBadge extends NotificationEvent
    implements Built<ClearBadge,ClearBadgeBuilder> {

  ClearBadge._();
  factory ClearBadge([updates(ClearBadgeBuilder b)]) = _$ClearBadge;
}
abstract class GetBadge extends NotificationEvent
    implements Built<GetBadge,GetBadgeBuilder> {

  GetBadge._();
  factory GetBadge([updates(GetBadgeBuilder b)]) = _$GetBadge;
}
