
library SuggestedListModel;

import 'dart:convert';

import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SuggestedListModel.g.dart';

abstract class SuggestedListModel
    implements Built<SuggestedListModel,SuggestedListModelBuilder> {
int? get id;
String? get serial;
String? get alias;
String? get serialnumber;
String? get background_color;
String? get avatar;





  SuggestedListModel._();
  factory SuggestedListModel([void Function(SuggestedListModelBuilder b)? updates]) =  _$SuggestedListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SuggestedListModel.serializer, this));
  }
  static SuggestedListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SuggestedListModel.serializer, json.decode(jsonString));
  }

  static Serializer<SuggestedListModel> get serializer => _$suggestedListModelSerializer;
}
