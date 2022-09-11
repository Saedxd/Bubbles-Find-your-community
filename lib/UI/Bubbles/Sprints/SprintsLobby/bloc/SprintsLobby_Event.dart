// ignore_for_file: non_constant_identifier_names

library SprintsLobby_Event;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'SprintsLobby_Event.g.dart';

abstract class SprintsLobbyEvent {}

abstract class GetOldMessages extends SprintsLobbyEvent
    implements Built<GetOldMessages,GetOldMessagesBuilder> {


  GetOldMessages._();
  factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
}
