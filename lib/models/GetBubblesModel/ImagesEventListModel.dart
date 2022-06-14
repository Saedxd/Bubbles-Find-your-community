//

library ImagesEventListModel;

import 'dart:convert';


import 'package:bubbles/models/serializer/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'ImagesEventListModel.g.dart';

abstract class ImagesEventListModel
    implements Built<ImagesEventListModel,ImagesEventListModelBuilder> {

  String? get image;



  ImagesEventListModel._();
  factory ImagesEventListModel([void Function(ImagesEventListModelBuilder b)? updates]) =  _$ImagesEventListModel;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ImagesEventListModel.serializer, this));
  }
  static ImagesEventListModel? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImagesEventListModel.serializer, json.decode(jsonString));
  }

  static Serializer<ImagesEventListModel> get serializer => _$imagesEventListModelSerializer;
}
