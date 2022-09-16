// library Chat_state;
//
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/FlowsChat_Screen.dart';
// import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';
// import 'package:bubbles/models/AddReplyModel/AddreplyModel.dart';
// import 'package:bubbles/models/GetAliasModel/GetAliasModel.dart';
// import 'package:bubbles/models/GetUsersInsideBubbleModell/GetUsersInsideBubbleModell.dart';
// import 'package:bubbles/models/OldMessagesModel/OldMessagesModel.dart';
// import 'package:bubbles/models/PostMessagesModel/PostMessagesModel.dart';
// import 'package:built_value/built_value.dart';
//
//
//
// part 'Chat_state.g.dart';
//
// abstract class DmChat_State implements Built<DmChat_State,DmChat_StateBuilder>   {
//   // fields go here
//
//   String? get error;
//   bool? get isLoading;
//   bool? get success;
//   bool? get Done;
//
//   bool? get AliasISLoading;
//   bool? get AliasISsuccess;
//
//   GetAliasModel? get GetAlias;
//   OldMessagesModel? get OldMessages;
//   PostMessagesModel? get PostMessages;
//   AddreplyModel? get Addreply;
//
//   GetUsersInsideBubbleModell? get GetUsersInsideBubble;
//   List<UserDATA>? get InsideBubbleUsers;
//
//   bool? get RefreshLoading;
//   bool? get RefreshSuccess;
//
//
//   bool? get GetInsideUsersISloading;
//   bool? get GetInsideUsersSuccess;
//
//   bool? get Turnss;
//
//   bool? get MYAliasISLoading;
//   bool? get MYAliasISsuccess;
//
//   bool? get typingStatusISloading;
//   bool? get TypingStatusSuccess;
//   bool? get TypingStatus;
//
//   GetAliasModel? get GetAliasMinee;
//   List<SprintsChat>? get messages;
//
//   bool? get AddModelISloading;
//   bool? get AddModelSUccess;
//
//   String? get AvatarPathForRepliedTo;
//   String? get ColorForRepliedTo;
//   String? get RepliedToMessage;
//   String? get AliasForRepliedTo;
//   bool? get Isreply;
//   bool? get Status;
//
//
//   String? get type;
//   Uint8List? get Image1;
//   File? get File_image;
//   String? get Image_type;
//   bool? get KetbaordStatuss;
//
//
//   DmChat_State._();
//   factory DmChat_State([updates(DmChat_StateBuilder b)]) = _$DmChat_State;
//   factory DmChat_State.initail() {
//     return DmChat_State((b) => b
//       ..error = ""
//       ..type = ""
//       ..Image_type = ""
//       ..messages = []
//       ..RepliedToMessage = ""
//       ..AvatarPathForRepliedTo = ""
//       ..AliasForRepliedTo = ""
//       ..isLoading = false
//       ..KetbaordStatuss = false
//       ..AddModelISloading = false
//       ..InsideBubbleUsers =[]
//       ..AddModelSUccess = false
//       ..Status = false
//       ..Turnss = true
//       ..AliasISLoading = false
//       ..typingStatusISloading = false
//       ..GetInsideUsersSuccess = false
//       ..GetInsideUsersISloading = false
//       ..TypingStatusSuccess = false
//       ..TypingStatus = false
//       ..RefreshLoading = false
//       ..MYAliasISLoading = false
//       ..success = false
//       ..AliasISsuccess = false
//       ..RefreshSuccess = true
//       ..MYAliasISsuccess = false
//       ..Isreply = false
//       ..ColorForRepliedTo = ""
//       ..Done = false
//       ..OldMessages=null
//       ..GetAlias=null
//       ..PostMessages=null
//       ..GetAliasMinee=null
//       ..Addreply=null
//       ..File_image=null
//
//     );
//   }
//
//
//
//
// }
