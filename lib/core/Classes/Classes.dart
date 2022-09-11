import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/models/GetInterestsModel/InterestsListModel.dart';
import 'package:built_value/built_value.dart';
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/OrganizersListModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:built_collection/built_collection.dart';

class FrinedsData{
  String? Background_Color;
  String? Avatar;
  String? Alias;
  String? boi;
  BuiltList<InterestsListModel>?  interests;
  int? ID;
  int? my_id;
  int? His_id;
  bool? is_Frined;
  String? Serial;

}


class FlowData{
  int? FlowMessage_id;
  String? Flow_type;
  String? Title;
  String? Content="";
  String? Image;
  bool? ISMediaDump;
  List<String> Answers=[];


  FrinedsData?  Who_Made_it_data;
  String? Who_Made_it_Avatar;
  int? Who_Made_it_Color;
  String? Who_Made_it_Alias;
  int? Who_Made_it_ID;


  String? Flow_Icon;
  int? Color;
  File? File_Image;

  String? BACKEND_PATH;
  Uint8List? Uint8_Image;
  String? Image_type;
  String? time;
  bool? SettledWithID;
}

class Locationss{
  double? lat;
  double? lng;
  int? bubble_id;
  String? Title;
}

class BubbleData{
  bool? isAvailable;
  double? lat;
  double? lng;
  int? Raduis;
  String? image;
  String? Cateogory_Icon;
  String? TYPE;
  String? Title;
  String? location;
  String? StartDate;
  String? endDate;
  String? type;
  String? Description;
  int? Color;
  int? id;
  int? index;
  BuiltList<OrganizersListModel>? Organizers;
  BuiltList<DatesEventListModel>?  dates;
  BuiltList<UsersInsideBubbleListModel>?  users_in_bubble;
  BuiltList<UsersInsideBubbleListModel>?  saved_users;
  String? Creator_Alias="";
  String? Creator_Color;
  String? Creator_Avatar;
  String? User_type;
  bool? is_Saved;
  String? Category;
  FrinedsData? data;
}

class SprintsChat {
  int? ID;
  int? ReplyMessage_id;
  String? message="";
  String? time;
  String? Avatar="";

  FrinedsData? Sender_data;
  int? User_ID;

  String? Alias="";
  String? Type="";
  int? background_Color;
  String? Image_type;

  String? ReplierAvatar="";
  String? ReplierAlias="";
  String? Repliertime="";
  String? ReplierMessage="";
  FrinedsData? Replier_data;
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
  String? ModelType="";
  File? Image2;
  Uint8List? Image1;
  String? VoicePath;

  bool? MsgSentSuccessfuly = false;

  SprintsChat({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}

class GroupChatMessage {
  int? ID;
  int? User_ID;

  int? ReplyMessage_id;
  String? message="";
  String? time;
  String? Avatar="";

  FrinedsData? Sender_data;

  String? ReplierAvatar="";
  String? ReplierAlias="";
  String? Repliertime="";
  String? ReplierMessage="";
  FrinedsData? Replier_data;


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
  bool? CanReply = true;
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
  bool? Multible_Answers;
  bool? Show_participants;
  List<String> PollAnswers=[];

  File? MediaDumpImageFile;
  String? MediaDumpImagePath;
  Uint8List? MediaDumpImageuntil64;
  String? MediaDumpTitle;

  bool? FlowSettledWithID;
  bool? MessageSettledWIthID;

  GroupChatMessage({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}


class GroupChatFlowsMessage {
  int? ID;
  int? User_ID;
  int? ReplyMessage_id;
  String? message="";
  String? time;
  String? Avatar="";
  FrinedsData? Replier_data;
  FrinedsData? Sender_data;


  String? ReplierAvatar="";
  String? ReplierAlias="";
  String? Repliertime="";
  String? ReplierMessage="";
  BuiltList<InterestsListModel>?   Replier_interests;
  int?  Replier_ID;
  String?  Replier_boi;
  int? Replier_background_Color;


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

  bool? ISMediaDump;
  bool? MessageSettledWIthID;

  GroupChatFlowsMessage({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}

class MessageModel {
  int? ID;
  String? message="";
  String? time;
  String? Avatar="";
  FrinedsData? Replier_data;
  FrinedsData? Sender_data;


  String? ReplierAvatar="";
  String? ReplierAlias="";
  String? Repliertime="";
  String? ReplierMessage="";
  int? Replierbackground_Color;
  BuiltList<InterestsListModel>?  Replier_interests;
  int?  Replier_ID;
  String?  Replier_boi;



  String? RepliedTOAvatar="";
  String? RepliedTOAlias="";
  String? RepliedTOtime="";
  String? RepliedTOMessage="";
  int? ReplieDtobackground_Color;

  bool? ISreply;
  String? Alias="";
  String? Type="";
  int? background_Color;

  MessageModel({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color,this.ISreply});
}

class DmlistData{
  String? alias;
  String? time;
  String? lastMessage;
  String? Avatar;
  int? backgroundColor;
  int? id;
  int? MY_id;
  String? Replies;
  String? Msg_Type;
  FrinedsData? Sender_data;
}

class Data{
  int? raduis;
  double? lat;
  double? lng;
  List<String>? Dates;
  String? Start_Date;
  String? End_Date;
  List<int>? OrganizersId;
  String? Title;
  String? Location;
  String? Description;
  String? Base64Image;
  int? Category_id;
  String? Picked_Color;
}

