
import 'dart:io';

import 'dart:typed_data';

class GroupChatMessage {
  int? ID;
  int? User_ID;
  int? ReplyMessage_id;
  String? message="";
  String? time;
  String? Avatar="";
  String? ReplierAvatar="";
  String? ReplierAlias="";
  String? Repliertime="";
  String? ReplierMessage="";
  int? Replierbackground_Color;
  String? RepliedTOAvatar="";
  String? RepliedTOAlias="";
  String? RepliedTOtime="";
  String? RepliedTOMessage="";
  int? ReplieDtobackground_Color;

  bool?  is_base64 = false;
  bool? IsBackEnd=false;
  bool? ISreply;
  bool? ISNOdeJS;
  String? Alias="";
  String? Type="";
  int? background_Color;
  String? Image_type;

  String? ModelType="";
  File? Image2;
  Uint8List? Image1;
  String? VoicePath;

  String? TopicFlowTitle;
  String? TopicFlowDescription;

  String? PollQuestion;
  List<String>? PollAnswers;

  File? MediaDumpImageFile;
  String? MediaDumpImagePath;
  Uint8List? MediaDumpImageuntil64;
  String? MediaDumpTitle;

  GroupChatMessage({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}
