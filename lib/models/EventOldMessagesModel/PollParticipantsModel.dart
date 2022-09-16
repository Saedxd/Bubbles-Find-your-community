// //
//
// library PollParticipantsModel;
//
// import 'dart:convert';
//
//
// import 'package:bubbles/models/serializer/serializer.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
//
//
// part 'PollParticipantsModel.g.dart';
//
// abstract class PollParticipantsModel
//     implements Built<PollParticipantsModel,PollParticipantsModelBuilder> {
//
//
//   String? get name;
//   String? get background_color;
//   String? get image;
//
//
//   PollParticipantsModel._();
//   factory PollParticipantsModel([void Function(PollParticipantsModelBuilder b)? updates]) =  _$PollParticipantsModel;
//   String toJson() {
//     return json
//         .encode(serializers.serializeWith(PollParticipantsModel.serializer, this));
//   }
//   static PollParticipantsModel? fromJson(String jsonString) {
//     return serializers.deserializeWith(
//         PollParticipantsModel.serializer, json.decode(jsonString));
//   }
//
//   static Serializer<PollParticipantsModel> get serializer => _$pollParticipantsModelSerializer;
// }
