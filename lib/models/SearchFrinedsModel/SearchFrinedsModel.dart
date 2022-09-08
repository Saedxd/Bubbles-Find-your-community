

library SearchFrinedsModel;

import 'dart:convert';


import 'package:bubbles/models/SearchFrinedsModel/UserModell.dart';
import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'SearchFrinedsModel.g.dart';

abstract class SearchFrinedsModel
    implements Built<SearchFrinedsModel,SearchFrinedsModelBuilder> {


BuiltList<UserModell>? get user;
String? get error;

  SearchFrinedsModel._();
  factory SearchFrinedsModel([void Function(SearchFrinedsModelBuilder b)? updates]) =  _$SearchFrinedsModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchFrinedsModel.serializer, this));
  }
  static SearchFrinedsModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchFrinedsModel.serializer, json.decode(jsonString));
  }

  static Serializer<SearchFrinedsModel> get serializer => _$searchFrinedsModelSerializer;
}
