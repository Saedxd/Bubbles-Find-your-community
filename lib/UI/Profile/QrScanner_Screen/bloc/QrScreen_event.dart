// ignore_for_file: non_constant_identifier_names

library QrScreen_event;

import 'dart:convert';
import 'dart:io';

import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'QrScreen_event.g.dart';

abstract class QrScreenEvent {}

abstract class AddfriendWithQr extends QrScreenEvent implements
    Built<AddfriendWithQr, AddfriendWithQrBuilder> {
  String? get serial;
  AddfriendWithQr._();
  factory AddfriendWithQr([updates(AddfriendWithQrBuilder b)]) = _$AddfriendWithQr;
}
