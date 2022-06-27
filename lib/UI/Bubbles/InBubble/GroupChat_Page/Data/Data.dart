
import 'dart:io';

class GroupChatMessage {
  int? ID;
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

  bool? ISreply;
  String? Alias="";
  String? Type="";
  int? background_Color;

  String? ModelType="";
  File? Image;
  String? VoicePath;

  String? TopicFlowTitle;
  String? TopicFlowDescription;

  String? PollQuestion;
  List<String>? PollAnswers;

  String? MediaDumpImage;
  String? MediaDumpTitle;

  GroupChatMessage({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}
