// ignore_for_file: non_constant_identifier_names

library Subscribed_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'Subscribed_event.g.dart';

abstract class SubscribedEvent {}

abstract class GetContactList extends SubscribedEvent implements
    Built<GetContactList, GetContactListBuilder> {

  GetContactList._();
  factory GetContactList([updates(GetContactListBuilder b)]) = _$GetContactList;
}
