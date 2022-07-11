// // ignore_for_file: non_constant_identifier_names
//
// library Chat_Event;
//
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';
// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'package:equatable/equatable.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// part 'Chat_Event.g.dart';
//
// abstract class DMChat_Event {}
//
// abstract class GetOldMessages extends DMChat_Event
//     implements Built<GetOldMessages,GetOldMessagesBuilder> {
//
//   int? get receiver_id;
//
//   GetOldMessages._();
//   factory GetOldMessages([updates(GetOldMessagesBuilder b)]) = _$GetOldMessages;
// }
//
// abstract class Done extends DMChat_Event
//     implements Built<Done,DoneBuilder> {
//
//   bool? get Donee;
//
//   Done._();
//   factory Done([updates(DoneBuilder b)]) = _$Done;
// }
//
// abstract class GetAlias extends DMChat_Event
//     implements Built<GetAlias,GetAliasBuilder> {
//
//   int? get HIS_ID;
//   int? get My_ID;
//   GetAlias._();
//   factory GetAlias([updates(GetAliasBuilder b)]) = _$GetAlias;
// }
//
// abstract class SendMessage extends DMChat_Event
//     implements Built<SendMessage,SendMessageBuilder> {
//
//   int? get receiver_id;
//   String? get message;
//   String? get Type;
//   SendMessage._();
//   factory SendMessage([updates(SendMessageBuilder b)]) = _$SendMessage;
// }
//
// abstract class ShowReplyWidget extends DMChat_Event
//     implements Built<ShowReplyWidget,ShowReplyWidgetBuilder> {
//   String? get AvatarPathForRepliedTo;
//   String? get ColorForRepliedTo;
//   String? get RepliedToMessage;
//   String? get AliasForRepliedTo;
//   bool? get Isreply;
//   String? get Model_Type;
//   String? get MessageDirection_Type;
//   Uint8List? get Image1;
//   File? get File_image;
//   String? get Image_type;
//   ShowReplyWidget._();
//   factory ShowReplyWidget([updates(ShowReplyWidgetBuilder b)]) = _$ShowReplyWidget;
// }
//
// abstract class SendStatus extends DMChat_Event
//     implements Built<SendStatus,SendStatusBuilder> {
//
//   bool? get Status;
//   SendStatus._();
//   factory SendStatus([updates(SendStatusBuilder b)]) = _$SendStatus;
// }
//
//
// abstract class addReply extends DMChat_Event
//     implements Built<addReply,addReplyBuilder> {
//
//   String? get comment;
//   int? get message_id;
//   int? get DestinationUser_id;
//   String? get Message;
//   String? get Model_Type;
//   String? get MessageDirection_Type;
//
//
//
//   File? get File_file;
//   Uint8List? get Uint8;
//   addReply._();
//   factory addReply([updates(addReplyBuilder b)]) = _$addReply;
// }
//
// abstract class AddModel extends DMChat_Event
//     implements Built<AddModel,AddModelBuilder>  {
//   SprintsChat? get message;
//
//   AddModel._();
//   factory AddModel([updates(AddModelBuilder b)]) = _$AddModel;
// }
//
// abstract class ChangeTypingStatus extends DMChat_Event
//     implements Built<ChangeTypingStatus,ChangeTypingStatusBuilder> {
//   bool? get ChangeStatus;
//
//   ChangeTypingStatus._();
//   factory ChangeTypingStatus([updates(ChangeTypingStatusBuilder b)]) = _$ChangeTypingStatus;
// }
//
//
//
// abstract class KetbaordStatus extends DMChat_Event
//     implements Built<KetbaordStatus,KetbaordStatusBuilder> {
//
//   bool? get status;
//   KetbaordStatus._();
//   factory KetbaordStatus([updates(KetbaordStatusBuilder b)]) = _$KetbaordStatus;
// }
