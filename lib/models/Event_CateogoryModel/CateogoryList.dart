//

library CateogoryList;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'CateogoryList.g.dart';

abstract class CateogoryList
    implements Built<CateogoryList,CateogoryListBuilder> {

  String? get name;
  String? get type;
  String? get image;
  int? get id;



  CateogoryList._();
  factory CateogoryList([void Function(CateogoryListBuilder b)? updates]) =  _$CateogoryList;
  String toJson() {
    return json
        .encode(serializers.serializeWith(CateogoryList.serializer, this));
  }
  static CateogoryList? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CateogoryList.serializer, json.decode(jsonString));
  }

  static Serializer<CateogoryList> get serializer => _$cateogoryListSerializer;
}
