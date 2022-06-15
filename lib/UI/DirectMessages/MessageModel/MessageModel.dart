class MessageModel {
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

  MessageModel({ this.message,  this.time, this.Avatar, this.Alias,this.Type,this.background_Color});
}
