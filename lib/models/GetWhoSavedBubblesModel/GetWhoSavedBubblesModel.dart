//

library GetWhoSavedBubblesModel;

import 'dart:convert';


import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'GetWhoSavedBubblesModel.g.dart';

abstract class GetWhoSavedBubblesModel
    implements Built<GetWhoSavedBubblesModel,GetWhoSavedBubblesModelBuilder> {

  int? get status;
  BuiltList<UsersInsideBubbleListModel>? get data;
  String? get error;

  GetWhoSavedBubblesModel._();
  factory GetWhoSavedBubblesModel([void Function(GetWhoSavedBubblesModelBuilder b)? updates]) =  _$GetWhoSavedBubblesModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(GetWhoSavedBubblesModel.serializer, this));
  }
  static GetWhoSavedBubblesModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GetWhoSavedBubblesModel.serializer, json.decode(jsonString));
  }

  static Serializer<GetWhoSavedBubblesModel> get serializer => _$getWhoSavedBubblesModelSerializer;
}
