//

library FreindsFilteredListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'FreindsFilteredListModel.g.dart';

abstract class FreindsFilteredListModel
    implements Built<FreindsFilteredListModel,FreindsFilteredListModelBuilder> {

  int? get id;
  String? get background_color;
  String? get alias;
  String? get avatar;


  FreindsFilteredListModel._();
  factory FreindsFilteredListModel([void Function(FreindsFilteredListModelBuilder b)? updates]) =  _$FreindsFilteredListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(FreindsFilteredListModel.serializer, this));
  }
  static FreindsFilteredListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        FreindsFilteredListModel.serializer, json.decode(jsonString));
  }

  static Serializer<FreindsFilteredListModel> get serializer => _$freindsFilteredListModelSerializer;
}
