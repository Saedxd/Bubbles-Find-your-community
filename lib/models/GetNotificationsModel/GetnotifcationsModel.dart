


library GetnotifcationsModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'NotificationsListModel.dart';


part 'GetnotifcationsModel.g.dart';

abstract class GetnotifcationsModel
    implements Built<GetnotifcationsModel,GetnotifcationsModelBuilder> {

  String? get msg;
  int? get statuscode;
  BuiltList<NotificationsListModel>? get notifications;
  String? get error;


  GetnotifcationsModel._();
  factory GetnotifcationsModel([void Function(GetnotifcationsModelBuilder b)? updates]) =  _$GetnotifcationsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetnotifcationsModel.serializer, this));
  }
  static GetnotifcationsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetnotifcationsModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetnotifcationsModel> get serializer => _$getnotifcationsModelSerializer;
}
