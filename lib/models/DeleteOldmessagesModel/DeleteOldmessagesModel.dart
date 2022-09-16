//

library DeleteOldmessagesModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'DeleteOldmessagesModel.g.dart';

abstract class DeleteOldmessagesModel
    implements Built<DeleteOldmessagesModel,DeleteOldmessagesModelBuilder> {

  String? get msg;
  int? get statuscode;
  String? get error;


  DeleteOldmessagesModel._();
  factory DeleteOldmessagesModel([void Function(DeleteOldmessagesModelBuilder b)? updates]) =  _$DeleteOldmessagesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DeleteOldmessagesModel.serializer, this));
  }
  static DeleteOldmessagesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        DeleteOldmessagesModel.serializer, json.decode(jsonString));
  }

  static Serializer<DeleteOldmessagesModel> get serializer => _$deleteOldmessagesModelSerializer;
}
