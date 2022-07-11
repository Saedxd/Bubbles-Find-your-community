import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/Data/Data.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/bloc/GroupChat_event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/GroupChat_Page/bloc/GroupChat_state.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintChat.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintLobby.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/pages/ChatUi_screen.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/core/widgets/OwnMessgaeCrad.dart';
import 'package:bubbles/core/widgets/RecordView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:swipe_to/swipe_to.dart';
import 'package:voice_message_package/voice_message_package.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// ignore: library_prefixes
import 'package:http/http.dart' as http;
class GroupChat extends StatefulWidget {
  GroupChat({Key? key, this.plan_Title, this.MY_ID,required this.bubble_id,required this.Plan_Description}) : super(key: key);
  String? plan_Title = "";
  String Plan_Description = "";
  int? MY_ID;
  int bubble_id;

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _FlowTitleController = TextEditingController();
  final TextEditingController _FlowDescriptionController = TextEditingController();
  final TextEditingController _SendMessageController = TextEditingController();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey11 = GlobalKey<FormState>();
  late FocusNode FocuseNODE;
  final ScrollController _controller = ScrollController();
  final _GroupChatBloc = sl<GroupChatBloc>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  FocusNode _focus = FocusNode();
  RecorderView Recorder =RecorderView(onSaved: (){},);
  Dio dio = Dio();
  late FocusNode FoucesNodeFlowTitle;
  late FocusNode FoucesNodeFlowDescription;
  List<GroupChatMessage> messages = [];
  List<String> records = [];
  List<UserDATA> UserDaata = [];
  String base64Image = "";
  bool DIditonce2 = false;
  bool Diditonces = false;
  bool Diditoncess = false;
  late Directory appDirectory;
  bool SelectedChat = false;
  bool is_base64 = true;
  File? image;
  int idd = 0;
  int index = 0;
  int  Message_id  = 0;
  int HisBackgroundColor = 0;
  int MYbackGroundColor = 0;
  String MyAlias = "";
  String HisAlias = "";
  String MyAvatar = "";
  String HisAvatar = "";
  Timer? timer;
  String? base64String;
  Uint8List? Image1;
  Uint8List? Image122;
  File? filee;
  String? path;
  String? type;



  void ListenForWhoJoinedBUbble() async {
    socket!.on("join_bubble", (msg) {
      print("Listenting");
      print(msg);
      print(msg["username"]);
      if (MyAlias ==msg["username"]){
        print("set to true");
      }
//{username: saedxd}
//{username: Saed}

    });
  }

  void ListenForWhoLeftBUbble() async {
    socket!.on("leave_bubble", (msg) {
      print("Listenting");
      print(msg);
      print(msg["username"]);
      print(msg["username"].toString().substring(17));

      if (MyAlias==msg["username"].toString().substring(17)){

      }

// {username: leave Bubble Now:saedxd}

    });
  }





  //
  // void GivethemMyID() {
  //   print("Sent message");
  //   socket!.emit("send_dm_to_bubble",
  //       {
  //         "message":"Hey I am new here HERE IS MY ID-",
  //         "room":"bubble_${widget.bubble_id}",
  //         "type":"text",
  //          "message_id":widget.MY_ID
  //       });
  // }

  void sendIJoinedBubble(int Bubble_id) {
    print("Sent Status joined");
    socket!.emit("request_join_bubble",
        {"room": "bubble_${Bubble_id}"});
    //GivethemMyID();
  }

  void sendILeftBubble(int Bubble_id) {
    print("Sent Status left");
    socket!.emit("request_leave_bubble",
        {"room": "bubble_${Bubble_id}"});
  }







  void SetHisReplyToVoice(String message, String Comment, String type) {
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyVoice";

    InstanceMessages.RepliedTOAlias = type == "receiver" ? MyAlias : HisAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =
    type == "receiver" ? MyAvatar : HisAvatar;
    InstanceMessages.ReplieDtobackground_Color =
    type == "receiver" ? MYbackGroundColor : HisBackgroundColor;

    InstanceMessages.ReplierAlias = HisAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = HisAvatar;
    InstanceMessages.Replierbackground_Color = HisBackgroundColor;

    InstanceMessages.ID = 0;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void SetmyReplyToVoice(String message, String Comment, String type) {
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ModelType = "ReplyVoice";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias = type == "receiver" ? HisAlias : MyAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =
    type == "receiver" ? HisAvatar : MyAvatar;
    InstanceMessages.ReplieDtobackground_Color =
    type == "receiver" ? HisBackgroundColor : MYbackGroundColor;

    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;
    //
    InstanceMessages.ID = 0;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }


  void SetMyVoiceMessage(String Path){
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.ModelType = "Voice";
    messageModel.ISNOdeJS = true;
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.message = Path;

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    _GroupChatBloc.add(
        SendMessage((b) =>
        b..type = "audio"
          ..message = base64String
          ..bubble_id = widget.bubble_id
          ..main_type = 1
        ));

  }

  void SetHisVoiceMessage(String Path) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.message = Path;
    messageModel.ModelType = "Voice";
    messageModel.ISNOdeJS = true;
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }






  void SetMyReplyToImage(
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor
      ,int ReplyMessage_id,
      String type
      ){

    var Colore = int.parse(RepliedTo_BackGroundColor);


    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ModelType = "ReplyImage";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias = RepliedTOAlias;
    InstanceMessages.Image_type = type;


    if (type=="Uint8List") {
      InstanceMessages.Image1 = Image122;
    }else if (type=="File"){
      InstanceMessages.Image2 = filee ;
    }else if (type=="Backend"){
      InstanceMessages.RepliedTOMessage = path;
    }






    InstanceMessages.RepliedTOAvatar =repliedToAvatar;

    InstanceMessages.ReplieDtobackground_Color =Colore;
    InstanceMessages.ReplyMessage_id =ReplyMessage_id;


    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;

    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));


    print(Image122);

    _GroupChatBloc.add(
        addReply((b) => b
          ..comment =_SendMessageController .text
          ..message_id = ReplyMessage_id
          ..Bubble_id = widget.bubble_id
          ..RepliedToColor = RepliedTo_BackGroundColor
          ..RepliedToAvatar = repliedToAvatar
          ..RepliedToAlias = RepliedTOAlias
          ..type = type
          ..Uint8 =Image122
          ..File_file = filee
          ..Message = path
        ));
  }

  void SetHisReplyToImage(
      String message,
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor,
      String replierAvatar,
      String ReplierAlias,
      String ReplierColor,
      int ReplyMessage_id,
      ){
    GroupChatMessage InstanceMessages = GroupChatMessage();

    String type =  (RepliedTo_BackGroundColor.substring(10));


    if (type=="Uint8List") {
      Uint8List?  _bytesImage = Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (type=="File"){
      Uint8List?  _bytesImage = Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (type=="Backend"){
      InstanceMessages.RepliedTOMessage = message;
    }




    var Colore = int.parse(RepliedTo_BackGroundColor.substring(0,10));
    var Color_ = int.parse(ReplierColor);

    InstanceMessages.ISNOdeJS = true;
    InstanceMessages.IsBackEnd = false;
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyImage";
    InstanceMessages.is_base64 = false;
    InstanceMessages.Image_type =type!="File"? type:"Uint8List";




    InstanceMessages.RepliedTOAlias = RepliedTOAlias;

    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.ReplieDtobackground_Color =Colore;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAlias = ReplierAlias;
    InstanceMessages.ReplierAvatar =replierAvatar;
    InstanceMessages.Replierbackground_Color = Color_;

    InstanceMessages.ID = 0;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }




  void SetMyImage(
      File Path,
      ){
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.IsBackEnd = false;
    messageModel.Image_type = "File";
    messageModel.ISNOdeJS = false;
    messageModel.ModelType = "Image";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.Image2 = Path;
    messageModel.is_base64 = true;
    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));


    _GroupChatBloc.add(
        SendMessage((b) =>
        b
          ..type = "image"
          ..message = base64Image
          ..bubble_id = widget.bubble_id
          ..main_type = 1
        ));
  }


  void SetHisImage(
      String Path,
      String Sender_id,
      int Message_id,
      String Avatar,
      String Alias,
      String Color,
      ){
    var Senderr_id = int.parse(Sender_id);
    var Color_ = int.parse(Color);
    Uint8List?  _bytesImage = Base64Decoder().convert(Path);

    // Image.memory(_bytesImage)
    // print(Path);
    // print(decoded);

    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: Avatar,
        Alias: Alias,
        ISreply: false);

    messageModel.IsBackEnd = false;
    messageModel.Image_type = "Uint8List";
    messageModel.ISNOdeJS = true;
    messageModel.is_base64 = true;
    messageModel.Image1 = _bytesImage;
    messageModel.ModelType = "Image";
    messageModel.background_Color = Color_;
    messageModel.Type = "receiver";
    messageModel.User_ID = Senderr_id;

    messageModel.ID = Message_id;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }



  void SetmyReplyMessage(
      String message,
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor,
      int Message_id) {

    var Colore = int.parse(RepliedTo_BackGroundColor);
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ModelType = "ReplyMessage";
    InstanceMessages.ISreply = true;
    InstanceMessages.is_base64 = false;
    InstanceMessages.IsBackEnd = false;
    InstanceMessages.RepliedTOAlias= RepliedTOAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.ID = Message_id;
    InstanceMessages.ReplieDtobackground_Color =Colore;

    InstanceMessages.ISNOdeJS = true;
    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;
    InstanceMessages.ReplyMessage_id = 0;

    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));




    _GroupChatBloc.add(
        addReply((b) => b
          ..comment =_SendMessageController .text
          ..message_id = Message_id
          ..Bubble_id = widget.bubble_id
          ..RepliedToColor = RepliedTo_BackGroundColor
          ..RepliedToAvatar = repliedToAvatar
          ..RepliedToAlias = RepliedTOAlias
          ..Message = message
          ..type ="text"
        ));


  }



  void SetHisReplyMessage(
      String message,
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor,
      String replierAvatar,
      String ReplierAlias,
      String ReplierColor
      ,int ReplyMessage_id,
      ){

    var Colore = int.parse(RepliedTo_BackGroundColor);
    var Color_ = int.parse(ReplierColor);
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ISreply = true;
    InstanceMessages.IsBackEnd = false;
    InstanceMessages.is_base64 = false;
    InstanceMessages.ModelType = "ReplyMessage";
    InstanceMessages.ISNOdeJS = true;
    InstanceMessages.RepliedTOAlias =RepliedTOAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.ID = 0;
    InstanceMessages.ReplieDtobackground_Color =Colore;



    InstanceMessages.ReplierAlias = ReplierAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = replierAvatar;
    InstanceMessages.Replierbackground_Color = Color_;

    InstanceMessages.ReplyMessage_id = ReplyMessage_id;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }




  void setHisMessage(String message,String Sender_id, int Message_id,String Avatar,String Alias,String Color) {
    try {
      print("setHisMessage");
      var Senderr_id = int.parse(Sender_id);
      var Colore = int.parse(Color);
      GroupChatMessage messageModel = GroupChatMessage(
          message: message,
          time: DateFormat.jm().format(DateTime.now()),
          Avatar: Avatar,
          Alias: Alias,
          ISreply: false);
      messageModel.ISNOdeJS = true;
      messageModel.is_base64 = false;
      messageModel.IsBackEnd = false;
      messageModel.ModelType = "Message";
      messageModel.background_Color = Colore;
      messageModel.Type = "receiver";
      messageModel.User_ID = Senderr_id;
      messageModel.ID = Message_id;





      _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    }catch(e){
      print(e);
    }
  }


  void setMYMessage(String message,int Message_id,int User_ID) {
    GroupChatMessage messageModel = GroupChatMessage(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.ISNOdeJS = true;
    messageModel.is_base64 = false;
    messageModel.ModelType ="Message" ;
    //"Message"
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.User_ID = User_ID;
    messageModel.ID = Message_id;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    _GroupChatBloc.add( SendMessage((b) => b
      ..type = "text"
      ..message = _SendMessageController.text
      ..bubble_id = widget.bubble_id
      ..main_type = 1
    ));

    // sendMessage(event.message!,
    //     "text",event.bubble_id!, state.SendBubbleMessage!.message_id!.toInt());
    // sendMessage(_SendMessageController.text,
    //     "text",widget.bubble_id, 1);
  }

  @override
  void initState() {
    super.initState();
//  socket!.io..disconnect()..connect();
    ListenForWhoJoinedBUbble();
    ListenForWhoLeftBUbble();
    sendIJoinedBubble(widget.bubble_id);
    DIditonce2 = false;
    Diditonces = true;
    Diditoncess = true;
    _focus = FocusNode();
    FocuseNODE = FocusNode();
    FoucesNodeFlowDescription = FocusNode();
    FoucesNodeFlowTitle = FocusNode();

    // ListenForWhoJoinedBUbble();
    // ListenForWhoLeftBUbble();
    _GroupChatBloc.add(GetOldMessages((b) => b
      ..bubble_id = widget.bubble_id
    ));
    _FlowDescriptionController.addListener(() {
      _GroupChatBloc.add(DescriptionLength((b) =>
      b..DescriptionLengthh = _FlowDescriptionController.text.length));
    });
    _GroupChatBloc.add(GetAlias((b) => b..My_ID = widget.MY_ID));
    _SendMessageController.addListener(() {
      _GroupChatBloc.add(SendStatus((b) => b
        ..Status =
            _SendMessageController.text.isNotEmpty)); //prevent empty messages
      if (_SendMessageController.text.isNotEmpty) {
        _GroupChatBloc.add(
            KetbaordStatus((b) => b..status = true)); //toggle ui view
      } else {
        _GroupChatBloc.add(KetbaordStatus((b) => b..status = false));
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
    _FlowTitleController.dispose();
    _FlowDescriptionController.dispose();
    _SearchController.dispose();
    FocuseNODE.dispose();
    _focus.dispose();
    sendILeftBubble(widget.bubble_id);
  }


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _GroupChatBloc,
        builder: (BuildContext Context, GroupChatState state) {

          void ListenForMessages() async {
            socket!.on("receive_dm_message_bubble", (msg) {
              print("Listenting");
              print(msg);
              if (msg["user_id"].toString()!=widget.MY_ID.toString()) {
                //image
                if (msg["type"]=="text") {
                  setHisMessage(
                      msg["message"], msg["user_id"], msg["message_id"],
                      msg["avatar"], msg["username"], msg["color"]);
                }


                if(msg["type"]=="image"){
                  SetHisImage(
                      msg["message"], msg["user_id"], msg["message_id"],
                      msg["avatar"], msg["username"], msg["color"]);
                }
              }
            });
          }

          void ListenForReplyMessage() async {
            socket!.on("receive_reply_dm_bubble", (msg) {
              print(msg);

              if (msg["user_id"].toString()!=widget.MY_ID.toString()) {
                print(msg["Hiscolor"].toString().substring(10));
                if (msg["Hiscolor"].toString().substring(10)=="text"){

                  print("inside text");


                  SetHisReplyMessage(
                    msg["message"],
                    msg["comment"],
                    msg["HisAlias"],
                    msg["Hisavatar"],
                    (msg["Hiscolor"].substring(0,10)),
                    msg["avatar"] ,
                    msg["username"] ,
                    msg["color"],
                    msg["message_id"],
                  );






                } else if (
                msg["Hiscolor"].toString().substring(10) == "Backend"
                    ||
                    msg["Hiscolor"].toString().substring(10)=="Uint8List"
                    ||msg["Hiscolor"].toString().substring(10)=="File"
                ) {


                }else if (
                msg["Hiscolor"].toString().substring(10) == "Backend"
                    ||
                    msg["Hiscolor"].toString().substring(10)=="Uint8List"
                    ||msg["Hiscolor"].toString().substring(10)=="File"
                ) {



                  SetHisReplyToImage(
                    msg["message"],
                    msg["comment"],
                    msg["HisAlias"],
                    msg["Hisavatar"],
                    msg["Hiscolor"],
                    msg["avatar"] ,
                    msg["username"] ,
                    msg["color"],
                    msg["message_id"],
                  );


                }
              }
            });
          }

          alreatDialogBuilder2(
              BuildContext Context,
              double h,
              double w,
              int Frined_id,
              ) async {
            return showDialog(
                context: Context,
                barrierDismissible: false,
                builder: (Context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.all(h/50),
                    content:
                    Container(
                      width: w/1.1,
                      height: h/4.2,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(8.285714149475098),
                          topRight: Radius.circular(8.285714149475098),
                          bottomLeft: Radius.circular(8.285714149475098),
                          bottomRight: Radius.circular(8.285714149475098),
                        ),
                        color : Color.fromRGBO(47, 47, 47, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: h/50,top: h/50),
                            child: Text('Are you sure you want to remove this user from your friendlist?',
                              textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(234, 234, 234, 1),
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 20.571428298950195,
                                  letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                          ),
                          Text(""),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: w/3,
                                    height: h/15,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(4.142857074737549),
                                        topRight: Radius.circular(4.142857074737549),
                                        bottomLeft: Radius.circular(4.142857074737549),
                                        bottomRight: Radius.circular(4.142857074737549),
                                      ),
                                      boxShadow : [BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: Offset(0,0),
                                          blurRadius: 6.628571510314941
                                      )],
                                      color : Color.fromRGBO(207, 109, 56, 1),
                                    ),
                                    child: Center(
                                      child:
                                      Text('No', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(234, 234, 234, 1),
                                          fontFamily: 'Sofia Pro',
                                          fontSize: 19.571428298950195,
                                          letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          height: 1
                                      ),),
                                    )
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  _GroupChatBloc.add(RemoveFriend((b) => b
                                    ..friend_id = Frined_id
                                  ));
                                },
                                child: Container(
                                  width: w/3,
                                  height: h/15,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4.142857074737549),
                                      topRight: Radius.circular(4.142857074737549),
                                      bottomLeft: Radius.circular(4.142857074737549),
                                      bottomRight: Radius.circular(4.142857074737549),
                                    ),
                                    boxShadow : [BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: Offset(0,0),
                                        blurRadius: 6.628571510314941
                                    )],
                                    color : Color.fromRGBO(168, 48, 99, 1),
                                  ),
                                  child: Center(
                                    child:
                                    Text('Yes', textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Sofia Pro',
                                        fontSize: 19.571428298950195,
                                        letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          }

          // if (state.success! && Diditoncess) {
          //   if (state.messages!.isNotEmpty){
          //     LAST_MESSAGE_ID = state.messages![0].ID!.toInt();
          //   }
          //
          //
          //   Diditoncess = false;
          // }
          alreatDialogBuilder(
              BuildContext Context,
              double h,
              double w,
              int myINdex,
              bool is_frined,
              bool is_me,
              int frined_id,
              ) async {
            return showDialog(
                context: Context,
                barrierDismissible: false,
                builder: (Context) {



                  var myInt = int.parse(state.FilteredInsideBubbleUsers![myINdex].Background_Color.toString());
                  var BackgroundColor= myInt;


                  return AlertDialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.all(h/50),
                      content:GestureDetector(
                        onTap: (){
                          Navigator.pop(context,true);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: w,
                          height: h,
                          child :
                          Stack(
                              children:[

                                Center(
                                  child: Container(
                                    width: w/1.1,
                                    height: h/2.3,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(8.285714149475098),
                                        topRight: Radius.circular(8.285714149475098),
                                        bottomLeft: Radius.circular(8.285714149475098),
                                        bottomRight: Radius.circular(8.285714149475098),
                                      ),
                                      color : Color.fromRGBO(47, 47, 47, 1),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children:  [


                                            Container(
                                              margin: EdgeInsets.only(left: h/60),
                                              child: CircleAvatar(

                                                backgroundImage: NetworkImage(state.FilteredInsideBubbleUsers![myINdex].Avatar.toString()),
                                                radius:40,
                                                backgroundColor:Color(BackgroundColor),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: h/60),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                        state.FilteredInsideBubbleUsers![myINdex].Alias
                                                            .toString(),
                                                        overflow: TextOverflow.ellipsis,
                                                        style: _TextTheme.headline6!.copyWith(
                                                            color: Color(
                                                                0xffEAEAEA),
                                                            fontWeight:
                                                            FontWeight
                                                                .w400,
                                                            fontSize:
                                                            20)),
                                                  ),
                                                  Row(
                                                    children: [

                                                      Text(
                                                  state.FilteredInsideBubbleUsers![myINdex].Serial_number!,
                                                          textAlign: TextAlign.left,
                                                          style: _TextTheme
                                                              .headline6!
                                                              .copyWith(
                                                              color: Color(
                                                                  0xffEAEAEA),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                              fontSize:
                                                              13)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: h/6,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    //  color: Colors.pink,
                                                    child: IconButton(
                                                      onPressed: (){
                                                        Navigator.pop(context,true);
                                                      },
                                                      icon: Icon(Icons.clear),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: h/50,top: h/50),
                                            child:
                                            Text(   state.FilteredInsideBubbleUsers![myINdex].boi.toString(), textAlign: TextAlign.left, style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 12,
                                                letterSpacing: 0 ,
                                                fontWeight: FontWeight.w300,
                                                height: 1.4166666666666667
                                            ),)
                                        ),
                                        Text(""),
                                        Row(
                                          mainAxisAlignment:
                                          is_me?    MainAxisAlignment.center:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            is_me
                                                ?Text("")
                                            :InkWell(
                                              onTap: (){
                                                //DirectChat
                                                WidgetsBinding.instance!
                                                    .addPostFrameCallback((_) =>     Navigator.push(
                                                  context,
                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                    builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),   ));
                                              },
                                              child: Container(
                                                  width: w/3,
                                                  height: h/15,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(4.142857074737549),
                                                      topRight: Radius.circular(4.142857074737549),
                                                      bottomLeft: Radius.circular(4.142857074737549),
                                                      bottomRight: Radius.circular(4.142857074737549),
                                                    ),
                                                    boxShadow:[
                                                      BoxShadow(
                                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                                          offset: Offset(0,0),
                                                          blurRadius: 6.628571510314941
                                                      )
                                                    ],
                                                    color : Color.fromRGBO(207, 109, 56, 1),
                                                  ),
                                                  child: Center(
                                                      child:
                                                      SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)

                                                  )
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                          if ( !is_frined) {
                                            Navigator.pop(context);
                                            _GroupChatBloc.add(AddFrined((b) =>
                                            b ..serial = state.FilteredInsideBubbleUsers![myINdex].Serial.toString()
                                            ));
                                          }else{
                                            alreatDialogBuilder2(context,h,w,frined_id);
                                            // _GroupChatBloc.add(AddFrined((b) =>
                                            // b ..serial = state.FilteredInsideBubbleUsers![index].Serial_number.toString()
                                            // ));
                                            //todo : implemment bloc pattern to Removing frineds so it gets instant

                                          }
                                              },
                                              child: Container(
                                                width: w/3,
                                                height: h/15,
                                                decoration: BoxDecoration(
                                                  borderRadius : BorderRadius.only(
                                                    topLeft: Radius.circular(4.142857074737549),
                                                    topRight: Radius.circular(4.142857074737549),
                                                    bottomLeft: Radius.circular(4.142857074737549),
                                                    bottomRight: Radius.circular(4.142857074737549),
                                                  ),
                                                  boxShadow : [BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                                      offset: Offset(0,0),
                                                      blurRadius: 6.628571510314941
                                                  )],
                                                  color : is_frined?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
                                                ),
                                                child: Center(
                                                    child:
            //
                  //   SvgPicture.asset(
                  // "Assets/images/Add_friend.svg",
                  // color: Colors.white,
                  // width: h / 26,
                  // )
                                                  is_me
                                                      ? Icon(Icons.person)
                                                      :  is_frined
                                                        ? SvgPicture.asset(
                                                      "Assets/images/True_Mark.svg",
                                                      color: Colors.white,
                                                      width: h / 26,
                                                    )
                                                        :SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)


                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 7,),
                                      ],
                                    ),
                                  ),
                                ),

                              ]
                          ),

                        ),
                      )

                  );
                });
          }


          if (state.AliasISsuccess! && !DIditonce2) {
            ListenForMessages();
            ListenForReplyMessage();

            print("Listeninggggggg");
            MyAlias = state.GetAliasMinee!.friend!.alias.toString();
            MyAvatar = state.GetAliasMinee!.friend!.avatar.toString();
            String Value2 =
            state.GetAliasMinee!.friend!.background_color.toString();
            int myInt2 = int.parse(Value2);
            MYbackGroundColor = myInt2;
            DIditonce2 = true;
          }

          return WillPopScope(
              onWillPop: () async {
                print("hi");
                if (state.KetbaordStatuss == true) {
                  _GroupChatBloc.add(KetbaordStatus((b) => b..status = false));
                  return false;
                }
                return true;
              },
              child: Scaffold(
                key: _scaffoldKey,
             //   resizeToAvoidBottomInset: true,
                onEndDrawerChanged: (isOpened) {
                 if (isOpened){
                   _GroupChatBloc.add(GetUsersInsideBubble((b) => b
                     ..Bubble_id = widget.bubble_id
                   ));
                 }
                },

                endDrawer:Column(
                  children: [
                    Expanded(child:  Drawer(

                      child: SafeArea(
                        child:

                        Column(
                          children: [
                            Container(
                              width: w,
                              height: h/4,
                              color: Color(0xff15D078),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                }, icon: Icon(Icons.arrow_back_ios_outlined,color: Color(0xff303030),size: 15,)),
                                          Text(widget.plan_Title.toString(),
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(47, 47, 47, 1),
                                                  fontFamily: 'Red Hat Display',
                                                  fontSize: 21,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1
                                              ),),
                                          
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: h/100),
                                        child: IconButton(
                                            onPressed: (){
                                              Navigator.pop(context);
                                            }, icon:
                                        SvgPicture.asset(
                                          "Assets/images/Gallary.svg",
                                          width: w / 16,
                                        )
                                        ),
                                      ),

                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: w/1.3,
                                      child: Center(
                                        child:

                                        Row(
                                          children: [
                                            Text(widget.Plan_Description.toString(),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Color.fromRGBO(46, 46, 46, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 13,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w400,
                                                height: 1.6
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: Container(
                                  //     width: w,
                                  //     height: h/6,
                                  //     margin: EdgeInsets.only(left: h/50),
                                  //     child: ScrollConfiguration(
                                  //       behavior: MyBehavior(),
                                  //       child:
                                  //       ListView.separated(
                                  //         cacheExtent : 500,
                                  //         // shrinkWrap: true,
                                  //         physics: BouncingScrollPhysics(),
                                  //         scrollDirection: Axis.horizontal,
                                  //         itemCount: 20,
                                  //         itemBuilder: (BuildContext context,
                                  //             int index) {
                                  //           return CircleAvatar(
                                  //             radius: 25,
                                  //           );
                                  //
                                  //         }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: h/100); },),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()
                                ),
                                child:   Container(
                                  width: w,
                                  height: h/1.7,
                                  child:
                                  Column(
                                    children: [

                                      SizedBox(height: h/40,),
                                      InkWell(
                                        onTap: (){
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                SprintLobby(plan_title: widget.plan_Title!,Bubble_id: widget.bubble_id,my_id: widget.MY_ID!,)),
                                          ));
                                        },
                                        child: Container(
                                          width: w/1.4,
                                          height: h/9.5,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(50),
                                              topRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(50),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            boxShadow : [BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                                                offset: Offset(0,0),
                                                blurRadius: 10.645160675048828
                                            )],
                                            color : Color.fromRGBO(96, 96, 96, 1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                //   margin: EdgeInsets.only(right: h/100),
                                                child: Stack(
                                                  children: [

                                                    SvgPicture.asset(
                                                      "Assets/images/Exclude.svg",
                                                      color: Color(0xff15D078),
                                                      width: w/5,
                                                    ),
                                                    Positioned(
                                                      top: h/30,
                                                      left: h/25,
                                                      child: SvgPicture.asset(
                                                        "Assets/images/S3EQA.svg",
                                                        width: w/24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(right: h/100),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [

                                                    Container(
                                                      margin: EdgeInsets.only(right: h/15),
                                                      child: RichText(
                                                        textAlign: TextAlign.left,
                                                        text: TextSpan(

                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: state.GetInsideUsersSuccess!?state.GetUsersInsideBubble!.users!.length.toString():"0",
                                                              style: TextStyle(
                                                                  color: Color.fromRGBO(234, 234, 234, 1),
                                                                  fontFamily: 'Red Hat Text',
                                                                  fontSize: 16,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.w900,
                                                                  height: 1
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                  text: " Users",
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(234, 234, 234, 1),
                                                                      fontFamily: 'Red Hat Text',
                                                                      fontSize: 16,
                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1
                                                                  ),)

                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    Text('in Sprints Lobby'
                                                      , textAlign: TextAlign.left, style: TextStyle(
                                                          color: Color(0xff15D078),
                                                          fontFamily: 'Red Hat Text',
                                                          fontSize: 17,
                                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1
                                                      ),)
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: (){},
                                                icon: Icon(Icons.chevron_right,size: h/20,color: Color(0xff15D078),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: h/50),
                                            child: Text('Active Users', textAlign: TextAlign.left, style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 18,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w700,
                                                height: 1
                                            ),),
                                          ),
                                          Text(""),
                                          Container(
                                            margin: EdgeInsets.only(left: h/50),
                                            child: IconButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              }, icon:
                                            SvgPicture.asset("Assets/images/active.svg",),
                                            ),
                                          ),

                                        ],
                                      ),
                                      Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                          ),
                                          width: w / 1.4,
                                          height: h / 15,
                                          child: Form(
                                            key: _formkey11,
                                            child: TextFormField(
                                              textInputAction: TextInputAction.search,
                                              controller: _SearchController,
                                              focusNode: FocuseNODE,
                                              onFieldSubmitted: (value) {},
                                              onChanged: (value){
                                                _GroupChatBloc.add(SearchInsideBubbleUser((b) => b
                                                  ..Keyword = value
                                                ));
                                              },
                                              cursorColor: Colors.grey,
                                              style: const TextStyle(
                                                  color: Colors.orange, fontSize: 16.5),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff939393), width: 10),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(30.0)),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff939393), width: 3),
                                                ),
                                                enabledBorder: const OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(30.0)),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff939393), width: 3),
                                                ),
                                                prefixIcon: IconButton(
                                                    icon: SvgPicture.asset(
                                                      'Assets/images/Vector(1).svg',
                                                    ),
                                                    onPressed: null //do something,
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                contentPadding: const EdgeInsets.symmetric(
                                                    horizontal: 12, vertical: 20),
                                                hintText: "Search",
                                                hintStyle:   TextStyle(
                                                    color: Color.fromRGBO(147, 147, 147, 1),
                                                    fontFamily: 'Red Hat Text',
                                                    fontSize: 15,
                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1
                                                ),
                                              ),
                                              keyboardType: TextInputType.text,
                                            ),
                                          )),
                                      SizedBox(height: h/45,),

                                      state.GetInsideUsersSuccess!
                                          ?  Expanded(
                                          child:    Container(
                                            width: w,
                                            height: h/1.266,
                                            margin: EdgeInsets.only(right: h/40),
                                            child: ScrollConfiguration(
                                              behavior: MyBehavior(),
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                physics: NeverScrollableScrollPhysics(
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: state.FilteredInsideBubbleUsers!.length,
                                                separatorBuilder: (BuildContext context, int index) {
                                                  return SizedBox(
                                                    height: 5,
                                                  );
                                                },
                                                itemBuilder: (BuildContext context, int index) {

                                                  var myInt = int.parse(state.FilteredInsideBubbleUsers![index].Background_Color.toString());
                                                  var BackgroundColor= myInt;


                                                  return

                                                    Slidable(
                                                      closeOnScroll: true,
                                                      key:  ValueKey(state.FilteredInsideBubbleUsers![index].id!),
                                                      endActionPane: ActionPane(
                                                        motion: const ScrollMotion(),
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                if (state.FilteredInsideBubbleUsers![index].id!!=widget.MY_ID)
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                    builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),
                                                                );
                                                                else
                                                                  print("its your account");
                                                              },
                                                              child: Container(
                                                                width: w / 6,
                                                                height: h / 9,
                                                                decoration: const BoxDecoration(
                                                                  color: const Color(0xffCF6D38),
                                                                  borderRadius: BorderRadius.only(
                                                                    bottomRight: const Radius.circular(0),
                                                                    topRight: Radius.circular(0),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                        "Assets/images/Vector2.svg",
                                                                        width: h / 26,
                                                                        color: Colors.white),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                //    if (state.FilteredInsideBubbleUsers![index].id!!=widget.MY_ID)
                                                                alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);
                                                              },
                                                              child: Container(
                                                                width: w / 6,
                                                                height: h / 9,
                                                                decoration:  BoxDecoration(
                                                                  color : state.FilteredInsideBubbleUsers![index].is_frined!?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
                                                                  borderRadius: BorderRadius.only(
                                                                    bottomRight: const Radius.circular(5),
                                                                    topRight: Radius.circular(5),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.center,
                                                                  children: [
                                                                    state.GetInsideUsersSuccess!?
                                                                    state.FilteredInsideBubbleUsers![index].id==widget.MY_ID
                                                                        ?Icon(Icons.person)
                                                                 :    state.FilteredInsideBubbleUsers![index].is_frined!
                                                                       ?     SvgPicture.asset(
                                                                      "Assets/images/True_Mark.svg",
                                                                color: Colors.white,
                                                                width: h / 26,
                                                              )
                                                                        :   SvgPicture.asset(
                                                                      "Assets/images/Add_friend.svg",
                                                                      color: Colors.white,
                                                                      width: h / 26,
                                                                    )


                                                                        :state.GetInsideUsersISloading!
                                                                        ?    Center(
                                                                              child: listLoader(
                                                                              context: context))
                                                                        :    Expanded(
                                                                      child:    Container(
                                                                        child: Text("Error"),
                                                                      ),)
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          WidgetsBinding.instance!
                                                              .addPostFrameCallback((_) =>     Navigator.push(
                                                            context,
                                                            MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                              builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),));
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(left: h/40),
                                                              width: w / 1.2,
                                                              height: h / 13,
                                                              decoration: BoxDecoration(
                                                                color: ColorS.secondaryContainer,
                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(40),
                                                                  bottomRight: Radius.circular(5),
                                                                  topLeft: Radius.circular(40),
                                                                  topRight: Radius.circular(5),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: ColorS.primaryVariant ,
                                                                      offset: Offset(0, 0),
                                                                      blurRadius: 2)
                                                                ],
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.center,
                                                                    children: [
                                                                      //FrinedsStatus
                                                                      Stack(
                                                                          children:[
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                              children: [
                                                                                Text("  "),
                                                                                Container(
                                                                                  width: w/6,
                                                                                  height: h / 15,
                                                                                  child:   CachedNetworkImage(
                                                                                    imageUrl:
                                                                                    state.FilteredInsideBubbleUsers![index].Avatar!,
                                                                                    errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                                                    imageBuilder: (context, imageProvider) => CircleAvatar(
                                                                                      radius: 30,
                                                                                      backgroundImage: imageProvider,
                                                                                      backgroundColor:   Color(BackgroundColor),
                                                                                    ),
                                                                                  ),

                                                                                ),

                                                                              ],
                                                                            ),
                                                                            // state.ChangeStateSuccess!?
                                                                            // FrinedsStatus[index]==1?
                                                                            // Positioned(
                                                                            //   bottom: 0,
                                                                            //   right: 0,
                                                                            //   child:
                                                                            //   CircleAvatar(
                                                                            //       backgroundColor:ColorS.secondaryContainer,
                                                                            //       radius: 10,
                                                                            //       child:  CircleAvatar(backgroundColor: Color(0xff34A853),radius: 8,)),
                                                                            // )
                                                                            //     :Text("")
                                                                            //     :Text("")

                                                                            //: Center(
                                                                            //                                                   child:SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
                                                                            //                                               ),       SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
                                                                          ]
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(width: 10,),

                                                                  Text(
                                                                      state.FilteredInsideBubbleUsers![index].Alias!,
                                                                      textAlign: TextAlign.left,
                                                                      style: _TextTheme.headline3!.copyWith(
                                                                          fontFamily: 'Red Hat Display',
                                                                          fontWeight: FontWeight.w400
                                                                          ,fontSize: 22
                                                                      )

                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );



                                                },
                                              ),
                                            ),
                                          )
                                      )
                                          :   state.GetInsideUsersISloading!
                                          ?    Expanded(
                                          child:    Container(
                                              width: w,
                                              height: h/1.266,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                      child: listLoader(
                                                          context: context)),
                                                ],
                                              )))
                                          :    Expanded(
                                        child:    Container(
                                          width: w,
                                          height: h/1.266,
                                          child: Text("Error"),
                                        ),)


                                    ],
                                  ),
                                ))

                          ],
                        ),
                      ),
                    ),),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  ],
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: h / 13,
                          ),

                          state.success!
                              ? Expanded(
                            child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: Container(
                                  child: ListView.separated(
                                    cacheExtent : 500,
                                    controller: _controller,
                                    shrinkWrap: true,
                                    reverse: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.messages!.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return SwipeTo(
                                          onRightSwipe: () {
                                          bool GetInStatus = false;
                                          for(int j =0;j<AllBubblesIDS!.length;j++){
                                            if (widget.bubble_id==AllBubblesIDS![j]){
                                                if (AllBubblesStatus![j]==1)
                                                GetInStatus = true;
                                              }
                                          }

                                          if ( GetInStatus) {
                                            //  print(state.messages![index].message);
                                            _focus.requestFocus();
                                            SystemChannels.textInput.invokeMethod('TextInput.show');
                                            if (state.messages![index].ISreply == false) {
                                              Message_id = state.messages![index].ID!;


                                              type = state.messages![index].ModelType.toString();

                                              _GroupChatBloc.add(
                                                  ShowReplyWidget((b) =>
                                                  b
                                                    ..Type = state.messages![index].ModelType.toString()
                                                    ..Isreply = true
                                                    ..ColorForRepliedTo = state.messages![index]
                                                        .background_Color!.toString()
                                                    ..RepliedToMessage = state.messages![index].message
                                                        .toString()
                                                    ..AliasForRepliedTo = state.messages![index].Alias
                                                        .toString()
                                                    ..AvatarPathForRepliedTo = state.messages![index].Avatar
                                                        .toString()
                                                    ..Image1 = state.messages![index].Image1
                                                    ..File_image = state.messages![index].Image2
                                                    ..Image_type = state.messages![index].Image_type
                                                    // ..is_Nodejs = state.messages![index].ISNOdeJS
                                                    // ..is_Backend = state.messages![index].IsBackEnd
                                                    //   ..Is_base64 = state.messages![index].is_base64
                                                  )
                                              );

                                              print(state.messages![index].message.toString());
                                            }


                                            else if (state.messages![index].ISreply == true) {
                                              //todo : this is for reply to reply
                                              // idd = state.OldMessages!.messages![index].replies![0].id!;
                                              // _ChatBloc_Bloc.add(ShowReplyWidget((b) =>
                                              // b
                                              //   ..Isreply = true
                                              //   ..ColorForRepliedTo = 0xff4caf50//todo : replier BACKGROUND COLOR
                                              //   ..RepliedToMessage = messages[index].ReplierMessage.toString()
                                              //   ..AliasForRepliedTo = messages[index].ReplierAlias.toString()
                                              //   ..AvatarPathForRepliedTo =messages[index].ReplierAvatar.toString()
                                              // ));
                                            }
                                          }else{
                                            OutsideBubbleAlreat();
                                          }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: h / 50),
                                            child: state.success!
                                                ? state.messages![index].ModelType == "Message"
                                                ? Row(
                                              children: [
                                                Container(
                                                  height:
                                                  h / 12,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color(state
                                                            .messages![index]
                                                            .background_Color!),
                                                        backgroundImage: NetworkImage(state
                                                            .messages![index]
                                                            .Avatar
                                                            .toString()),
                                                        radius:
                                                        23,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                  h / 100,
                                                ),
                                                Container(
                                                  width:
                                                  w / 1.3,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            state.messages![index].Alias.toString(),
                                                            textAlign:
                                                            TextAlign.left,
                                                            style:
                                                            _TextTheme.headline3!.copyWith(
                                                              color: ColorS.errorContainer,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                            ),
                                                          ),
                                                          Text(
                                                              state.messages![index].time!,
                                                              textAlign: TextAlign.right,
                                                              style: _TextTheme.headline2!.copyWith(
                                                                fontWeight: FontWeight.w300,
                                                                color: const Color(0xffEAEAEA),
                                                                fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ))
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height:
                                                        7,
                                                      ),
                                                      Container(
                                                        width: w /
                                                            1.3,
                                                        child: Text(
                                                            state.messages![index].message
                                                                .toString(),
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: _TextTheme.headline2!.copyWith(
                                                              fontWeight: FontWeight.w300,
                                                              color: const Color(0xffEAEAEA),
                                                              fontSize: 2.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                                : state.messages![index].ModelType == "Image"
                                                ? Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor: Color(state.messages![index].background_Color!),
                                                      backgroundImage: NetworkImage(state.messages![index].Avatar.toString()),
                                                      radius: 23,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width:
                                                  h / 100,
                                                ),
                                                Container(
                                                  width:
                                                  w / 1.3,
                                                  child:
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            state.messages![index].Alias.toString(),
                                                            textAlign: TextAlign.left,
                                                            style: _TextTheme.headline3!.copyWith(
                                                              color: ColorS.errorContainer,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                            ),
                                                          ),
                                                          Text(state.messages![index].time!,
                                                              textAlign: TextAlign.right,
                                                              style: _TextTheme.headline2!.copyWith(
                                                                fontWeight: FontWeight.w300,
                                                                color: const Color(0xffEAEAEA),
                                                                fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ))
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),

                                                      Row(
                                                        children: [

                                                          state.messages![index].Image_type.toString()=="Uint8List"
                                                              ? Container(
                                                              width: w / 1.5,
                                                              height: h / 4,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(20),
                                                                  topRight: Radius.circular(20),
                                                                  bottomLeft: Radius.circular(0),
                                                                  bottomRight: Radius.circular(0),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                  child:Image.memory(state.messages![index].Image1!,fit: BoxFit.fill,)
                                                              ))
                                                              : state.messages![index].Image_type.toString()=="Backend"
                                                              ?Container(
                                                              width: w / 1.5,
                                                              height: h / 4,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(20),
                                                                  topRight: Radius.circular(20),
                                                                  bottomLeft: Radius.circular(0),
                                                                  bottomRight: Radius.circular(0),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                  child:Image.network(state.messages![index].message!,fit: BoxFit.fill,)
                                                              ))
                                                              :Container(
                                                              width: w / 1.5,
                                                              height: h / 4,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(20),
                                                                  topRight: Radius.circular(20),
                                                                  bottomLeft: Radius.circular(0),
                                                                  bottomRight: Radius.circular(0),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                  child:Image.file(state.messages![index].Image2!,fit: BoxFit.fill,)
                                                              ))
                                                        ],

                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                                : state.messages![index].ModelType == "Voice"
                                                ? Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor: Color(state.messages![index].background_Color!),
                                                      backgroundImage: NetworkImage(state.messages![index].Avatar.toString()),
                                                      radius: 23,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: h / 100,
                                                ),
                                                Container(
                                                  width: w / 1.3,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            state.messages![index].Alias.toString(),
                                                            textAlign: TextAlign.left,
                                                            style: _TextTheme.headline3!.copyWith(
                                                              color: ColorS.errorContainer,
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                            ),
                                                          ),
                                                          Text(state.messages![index].time!,
                                                              textAlign: TextAlign.right,
                                                              style: _TextTheme.headline2!.copyWith(
                                                                fontWeight: FontWeight.w300,
                                                                color: const Color(0xffEAEAEA),
                                                                fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ))
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Container(
                                                        width: w / 1.2,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            VoiceMessage(
                                                              audioSrc: state.messages![index].message.toString(),
                                                              // state
                                                              //     .messages![index]
                                                              //     .VoicePath
                                                              //     .toString(),
                                                              played: true,
                                                              me: true,
                                                            ),
                                                            const Text(""),
                                                            const Text(""),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                                : state .messages![index].ModelType == "ReplyMessage"
                                                ? Column(
                                              children: [
                                                Container(
                                                  height:
                                                  h / 36,
                                                  margin: EdgeInsets.only(
                                                      left: h /
                                                          50),
                                                  child:
                                                  Row(
                                                    children: [
                                                      Container(
                                                          height: h / 30,
                                                          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                            Container(
                                                              color: const Color(0xffEAEAEA),
                                                              width: w / 500,
                                                              height: h / 70,
                                                            ),
                                                          ])),
                                                      Container(
                                                        width:
                                                        w / 1.27,
                                                        height:
                                                        h / 30,
                                                        child:
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        color: const Color(0xffEAEAEA),
                                                                        height: h / 1000,
                                                                        width: w / 20,
                                                                      ),
                                                                      CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundImage: NetworkImage(state.messages![index].RepliedTOAvatar.toString()),
                                                                        backgroundColor: Color(state.messages![index].ReplieDtobackground_Color!),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 3,
                                                                      ),
                                                                      Text(
                                                                        state.messages![index].RepliedTOAlias.toString()
                                                                        // state.AliasForRepliedTo.toString()
                                                                        ,
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(color: const Color.fromRGBO(147, 147, 147, 1), fontFamily: 'Red Hat Text', fontSize: 1.7 * SizeConfig.blockSizeVertical!.toDouble(), letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w500, height: 1),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Container(
                                                                        width: w / 8,
                                                                        height: h / 79,
                                                                        child: Text(
                                                                          state.messages![index].RepliedTOMessage.toString()
                                                                          // state.RepliedToMessage.toString()
                                                                          ,
                                                                          textAlign: TextAlign.left,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: const TextStyle(color: Color.fromRGBO(196, 196, 196, 1), fontFamily: 'Red Hat Text', fontSize: 10.539999961853027, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w300, height: 1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                          backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                          radius: 23,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                      h / 100,
                                                    ),
                                                    Container(
                                                      width:
                                                      w / 1.3,
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                state.messages![index].ReplierAlias.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline3!.copyWith(
                                                                  color: ColorS.errorContainer,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                ),
                                                              ),
                                                              Text(state.messages![index].Repliertime!,
                                                                  textAlign: TextAlign.right,
                                                                  style: _TextTheme.headline2!.copyWith(
                                                                    fontWeight: FontWeight.w300,
                                                                    color: const Color(0xffEAEAEA),
                                                                    fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ))
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Container(
                                                            width: w / 1.3,
                                                            child: Text(state.messages![index].ReplierMessage.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline2!.copyWith(
                                                                  fontWeight: FontWeight.w300,
                                                                  color: const Color(0xffEAEAEA),
                                                                  fontSize: 2.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                                : state .messages![index].ModelType == "ReplyVoice"
                                                ? Column(
                                              children: [
                                                Container(
                                                  height:
                                                  h / 36,
                                                  margin: EdgeInsets.only(
                                                      left: h /
                                                          50),
                                                  child:
                                                  Row(
                                                    children: [
                                                      Container(
                                                          height: h / 30,
                                                          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                            Container(
                                                              color: const Color(0xffEAEAEA),
                                                              width: w / 500,
                                                              height: h / 70,
                                                            ),
                                                          ])),
                                                      Container(
                                                        width:
                                                        w / 1.27,
                                                        height:
                                                        h / 30,
                                                        child:
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        color: const Color(0xffEAEAEA),
                                                                        height: h / 1000,
                                                                        width: w / 20,
                                                                      ),
                                                                      CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundImage: NetworkImage(state.messages![index].RepliedTOAvatar.toString()),
                                                                        backgroundColor: Color(state.messages![index].ReplieDtobackground_Color!),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 3,
                                                                      ),
                                                                      Text(
                                                                        state.messages![index].RepliedTOAlias.toString()
                                                                        // state.AliasForRepliedTo.toString()
                                                                        ,
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(color: const Color.fromRGBO(147, 147, 147, 1), fontFamily: 'Red Hat Text', fontSize: 1.7 * SizeConfig.blockSizeVertical!.toDouble(), letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w500, height: 1),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Container(
                                                                        width: w / 8,
                                                                        height: h / 79,
                                                                        child: Text(
                                                                          state.messages![index].RepliedTOMessage.toString()
                                                                          // state.RepliedToMessage.toString()
                                                                          ,
                                                                          textAlign: TextAlign.left,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: const TextStyle(color: Color.fromRGBO(196, 196, 196, 1), fontFamily: 'Red Hat Text', fontSize: 10.539999961853027, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w300, height: 1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                          backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                          radius: 23,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                      h / 100,
                                                    ),
                                                    Container(
                                                      width:
                                                      w / 1.3,
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                state.messages![index].ReplierAlias.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline3!.copyWith(
                                                                  color: ColorS.errorContainer,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                ),
                                                              ),
                                                              Text(state.messages![index].Repliertime!,
                                                                  textAlign: TextAlign.right,
                                                                  style: _TextTheme.headline2!.copyWith(
                                                                    fontWeight: FontWeight.w300,
                                                                    color: const Color(0xffEAEAEA),
                                                                    fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ))
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Container(
                                                            width: w / 1.3,
                                                            child: Text(state.messages![index].ReplierMessage.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline2!.copyWith(
                                                                  fontWeight: FontWeight.w300,
                                                                  color: const Color(0xffEAEAEA),
                                                                  fontSize: 2.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                                : state .messages![index].ModelType == "ReplyImage"
                                                ? Column(
                                              children: [
                                                Container(
                                                  height:
                                                  h / 36,
                                                  margin: EdgeInsets.only(
                                                      left: h /
                                                          50),
                                                  child:
                                                  Row(
                                                    children: [
                                                      Container(
                                                          height: h / 30,
                                                          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                            Container(
                                                              color: const Color(0xffEAEAEA),
                                                              width: w / 500,
                                                              height: h / 70,
                                                            ),
                                                          ])),
                                                      Container(
                                                        width:
                                                        w / 1.27,
                                                        height:
                                                        h / 30,
                                                        child:
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        color: const Color(0xffEAEAEA),
                                                                        height: h / 1000,
                                                                        width: w / 20,
                                                                      ),
                                                                      CircleAvatar(
                                                                        radius: 10,
                                                                        backgroundImage: NetworkImage(state.messages![index].RepliedTOAvatar.toString()),
                                                                        backgroundColor: Color(state.messages![index].ReplieDtobackground_Color!),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 3,
                                                                      ),
                                                                      Text(
                                                                        state.messages![index].RepliedTOAlias.toString()
                                                                        // state.AliasForRepliedTo.toString()
                                                                        ,
                                                                        textAlign: TextAlign.left,
                                                                        style: TextStyle(color: const Color.fromRGBO(147, 147, 147, 1), fontFamily: 'Red Hat Text', fontSize: 1.7 * SizeConfig.blockSizeVertical!.toDouble(), letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w500, height: 1),
                                                                      ),
                                                                      const SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Container(
                                                                          width: w / 5,
                                                                          height: h / 10,
                                                                          child:

                                                                          state.messages![index].Image_type.toString()=="Uint8List"
                                                                              ? Container(
                                                                              width: w / 5,
                                                                              height: h / 10,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(0),
                                                                                  topRight: Radius.circular(0),
                                                                                  bottomLeft: Radius.circular(0),
                                                                                  bottomRight: Radius.circular(0),
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                                ],
                                                                              ),
                                                                              child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                                  child:
                                                                                  Image.memory(state.messages![index].Image1!,fit: BoxFit.fill,)



                                                                              ))
                                                                              :    state.messages![index].Image_type.toString()=="Backend"
                                                                              ?Container(
                                                                              width: w / 5,
                                                                              height: h / 10,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(0),
                                                                                  topRight: Radius.circular(0),
                                                                                  bottomLeft: Radius.circular(0),
                                                                                  bottomRight: Radius.circular(0),
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                                ],
                                                                              ),
                                                                              child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                                  child:
                                                                                  Image.network(state.messages![index].RepliedTOMessage!,fit: BoxFit.fill,)


                                                                              ))
                                                                              :Container(
                                                                              width: w / 5,
                                                                              height: h / 10,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(0),
                                                                                  topRight: Radius.circular(0),
                                                                                  bottomLeft: Radius.circular(0),
                                                                                  bottomRight: Radius.circular(0),
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                                                                ],
                                                                              ),
                                                                              child: ClipRRect(
                                                                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                                                                  child:Image.file(state.messages![index].Image2!,fit: BoxFit.fill,)
                                                                              ))
                                                                      )
                                                                      // Container(
                                                                      //   width: w / 8,
                                                                      //   height: h / 79,
                                                                      //   child: Image.file(  state.messages![index].RepliedTOMessage.toString())
                                                                      // ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                          backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                          radius: 23,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width:
                                                      h / 100,
                                                    ),
                                                    Container(
                                                      width:
                                                      w / 1.3,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                state.messages![index].ReplierAlias.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline3!.copyWith(
                                                                  color: ColorS.errorContainer,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                ),
                                                              ),
                                                              Text(state.messages![index].Repliertime!,
                                                                  textAlign: TextAlign.right,
                                                                  style: _TextTheme.headline2!.copyWith(
                                                                    fontWeight: FontWeight.w300,
                                                                    color: const Color(0xffEAEAEA),
                                                                    fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ))
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Container(
                                                            width: w / 1.3,
                                                            child: Text(state.messages![index].ReplierMessage.toString(),
                                                                textAlign: TextAlign.left,
                                                                style: _TextTheme.headline2!.copyWith(
                                                                  fontWeight: FontWeight.w300,
                                                                  color: const Color(0xffEAEAEA),
                                                                  fontSize: 2.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                )),
                                                          )

                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            )
                                                : state.messages![index].ModelType =="TopicFlow"
                                                ? TopicFlowWidget(
                                                state,
                                                index)
                                                : state.messages![index].ModelType == "PollFlow"
                                                ? PollFlowWidget(state, index)
                                                : state.messages![index].ModelType == "TopicFlow"
                                                ? const Text("")
                                                : const Text("")
                                                : const Text("empty"),
                                          ));
                                    },
                                    separatorBuilder:
                                        (BuildContext context,
                                        int index) {
                                      return SizedBox(
                                        height: h / 20,
                                      );
                                    },
                                  ),
                                )),
                          )
                              : state.isLoading!
                              ?  Container(
                              width: w,
                              height: h/1.28,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: listLoader(
                                          context: context)),
                                ],
                              ))
                              :  Container(
                            width: w,
                            height: h / 3,
                            child: Text("Error"),
                          ),



                                Container(
                                  height:state.Isreply!?h/7: h / 10,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              0, 0, 0, 0.25),
                                          offset: Offset(0, 0),
                                          blurRadius: 2.0,
                                        )
                                      ],
                                      color: Color(0xff303030)
                                  ),
                                  child: Column(
                                    children: [
                                      state.Isreply!
                                          ? ReplyWidgett(state)
                                          :  Container(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: h / 100,
                                                top: h / 50,
                                                bottom: h / 70),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: const Color(0xff15D078),
                                              child: Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    bool GetInStatus = false;
                                                    for(int j =0;j<AllBubblesIDS!.length;j++){
                                                      if (widget.bubble_id==AllBubblesIDS![j]){
                                                        if (AllBubblesStatus![j]==1)
                                                          GetInStatus = true;
                                                      }
                                                    }
                                                    if (GetInStatus) {
                                                      // dIALOG1();
                                                    }else{
                                                      OutsideBubbleAlreat();
                                                    }
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 35,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          !state.KetbaordStatuss!
                                              ? Row(
                                            children: [
                                              RecorderView(
                                                onSaved: _onRecordComplete,
                                                bubble_id: widget.bubble_id,
                                              ),
                                              Container(
                                                width: w / 10,
                                                padding:
                                                EdgeInsets.only(top: h / 50),
                                                child: IconButton(
                                                    onPressed: (){
                                              bool GetInStatus = false;
                                              for(int j =0;j<AllBubblesIDS!.length;j++){
                                              if (widget.bubble_id==AllBubblesIDS![j]){
                                              if (AllBubblesStatus![j]==1)
                                              GetInStatus = true;
                                                  }
                                              }

                                              if ( GetInStatus) {
                                                PhotoFlowDialog();
                                              }else{
                                                OutsideBubbleAlreat();
                                              }

                                                    },
                                                    icon: SvgPicture.asset(
                                                      "Assets/images/cAMERA.svg",
                                                      width: w / 16,
                                                    )),
                                              )
                                            ],
                                          )
                                              : const Text(""),
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: h / 100, top: h / 50),
                                              width: state.KetbaordStatuss!
                                                  ? w / 1.4
                                                  : w / 2,
                                              height: h / 13.5,
                                              child: Form(
                                                  key: _formkey3,
                                                  child: TextFormField(
                                                    controller: _SendMessageController,
                                                    keyboardAppearance: Brightness.dark,
                                                    textInputAction:
                                                    TextInputAction.done,
                                                    focusNode: _focus,
                                                    onChanged: (value) { },
                                                    onFieldSubmitted: (value)async {
                                                      String Comment =_SendMessageController.text;

                                                        bool GetInStatus = false;
                                                      for(int j =0;j<AllBubblesIDS!.length;j++){
                                                        if (widget.bubble_id==AllBubblesIDS![j]){
                                                          if (AllBubblesStatus![j]==1)
                                                          GetInStatus = true;
                                                        }
                                                      }


                                                         if ( GetInStatus) {
                                                           if (state.Status!) {
                                                             if (state.Isreply ==
                                                                 true &&
                                                                 state.type ==
                                                                     "Message" &&
                                                                 _SendMessageController
                                                                     .text
                                                                     .isNotEmpty) {
                                                               _GroupChatBloc.add(
                                                                   ShowReplyWidget((
                                                                       b) => b..Isreply = false));


                                                               String message = state
                                                                   .RepliedToMessage!;
                                                               String ALias = state
                                                                   .AliasForRepliedTo!;
                                                               String Avatar = state
                                                                   .AvatarPathForRepliedTo!;
                                                               String Color = state
                                                                   .ColorForRepliedTo!
                                                                   .toString();

                                                               SetmyReplyMessage(
                                                                   message, Comment,
                                                                   ALias,
                                                                   Avatar, Color,
                                                                   Message_id);
                                                               _SendMessageController
                                                                   .clear();
                                                             } else
                                                             if (state.Isreply ==
                                                                 true &&
                                                                 state.type ==
                                                                     "Image" &&
                                                                 _SendMessageController
                                                                     .text
                                                                     .isNotEmpty) {
                                                               _GroupChatBloc.add(
                                                                   ShowReplyWidget((
                                                                       b) => b..Isreply = false));


                                                               // String path= "";


                                                               if (state
                                                                   .Image_type ==
                                                                   "Backend") {
                                                                 path =
                                                                 state
                                                                     .RepliedToMessage!;
                                                               } else if (state
                                                                   .Image_type ==
                                                                   "File") {
                                                                 filee =
                                                                 state.File_image!;
                                                               } else if (state
                                                                   .Image_type ==
                                                                   "Uint8List") {
                                                                 Image122 =
                                                                 state.Image1!;
                                                               }


                                                               SetMyReplyToImage(
                                                                   Comment, state
                                                                   .AliasForRepliedTo!,
                                                                   state
                                                                       .AvatarPathForRepliedTo!,
                                                                   state
                                                                       .ColorForRepliedTo!,
                                                                   Message_id,
                                                                   state.Image_type!
                                                               );
                                                             }
                                                             else
                                                             if (state.Isreply ==
                                                                 true &&
                                                                 state.type ==
                                                                     "Voice" &&
                                                                 _SendMessageController
                                                                     .text
                                                                     .isNotEmpty) {
                                                               _GroupChatBloc.add(
                                                                   ShowReplyWidget(
                                                                           (b) =>
                                                                       b
                                                                         ..Isreply =
                                                                         false));


                                                               //     SetMyReplyToImage(state.RepliedToMessage!,Comment,state.type!);

                                                               _GroupChatBloc.add(
                                                                   addReply((b) =>
                                                                   b
                                                                     ..comment = _SendMessageController
                                                                         .text
                                                                     ..message_id = Message_id));
                                                             }
                                                             else
                                                             if (_SendMessageController
                                                                 .text.isNotEmpty &&
                                                                 state.Isreply ==
                                                                     false) {
                                                               setMYMessage(
                                                                   _SendMessageController
                                                                       .text, 1,
                                                                   widget.MY_ID!);

                                                               _controller
                                                                   .animateTo(
                                                                 _controller
                                                                     .position
                                                                     .minScrollExtent,
                                                                 duration: Duration(
                                                                     microseconds: 2),
                                                                 curve: Curves
                                                                     .easeIn,
                                                               );
                                                             }
                                                           }
                                                           _SendMessageController.clear();
                                                         }else{
                                                           OutsideBubbleAlreat();
                                                         }


                                                    },
                                                    cursorColor: Colors.black,
                                                    style: const TextStyle(
                                                        fontSize: 19,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.brown),
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xffEAEAEA),
                                                      contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: h / 100),
                                                      hintText: 'Sup?..',
                                                      hintStyle: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              96, 96, 96, 1),
                                                          fontFamily: 'Red Hat Text',
                                                          fontSize: 13,
                                                          letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight: FontWeight.w300,
                                                          height: 1),
                                                    ),
                                                    keyboardType: TextInputType.text,
                                                  ))),
                                          state.KetbaordStatuss!
                                              ? Row(
                                            children: [
                                              Container(
                                                width: w / 10,
                                                height: h / 10,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: h / 50),
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.send,
                                                            size: 30,
                                                          ),
                                                          onPressed: ()async{

                                                            String Comment =
                                                                _SendMessageController
                                                                    .text;
                                                            bool GetInStatus = false;
                                                            for(int j =0;j<AllBubblesIDS!.length;j++){
                                                            if (widget.bubble_id==AllBubblesIDS![j]){
                                                            if (AllBubblesStatus![j]==1)
                                                            GetInStatus = true;
                                                            }
                                                            }


                                                            if ( GetInStatus) {
                                                              if (state.Status!) {
                                                                if (state.Isreply ==
                                                                    true &&
                                                                    state.type ==
                                                                        "Message" &&
                                                                    _SendMessageController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  _GroupChatBloc
                                                                      .add(
                                                                      ShowReplyWidget((
                                                                          b) => b..Isreply = false));


                                                                  String message = state
                                                                      .RepliedToMessage!;
                                                                  String ALias = state
                                                                      .AliasForRepliedTo!;
                                                                  String Avatar = state
                                                                      .AvatarPathForRepliedTo!;
                                                                  String Color = state
                                                                      .ColorForRepliedTo!
                                                                      .toString();

                                                                  SetmyReplyMessage(
                                                                      message,
                                                                      Comment,
                                                                      ALias,
                                                                      Avatar, Color,
                                                                      Message_id);
                                                                  _SendMessageController
                                                                      .clear();
                                                                } else if (state
                                                                    .Isreply ==
                                                                    true &&
                                                                    state.type ==
                                                                        "Image" &&
                                                                    _SendMessageController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  _GroupChatBloc
                                                                      .add(
                                                                      ShowReplyWidget((
                                                                          b) => b..Isreply = false));


                                                                  // String path= "";


                                                                  if (state
                                                                      .Image_type ==
                                                                      "Backend") {
                                                                    path =
                                                                    state
                                                                        .RepliedToMessage!;
                                                                  } else if (state
                                                                      .Image_type ==
                                                                      "File") {
                                                                    filee = state
                                                                        .File_image!;
                                                                  } else if (state
                                                                      .Image_type ==
                                                                      "Uint8List") {
                                                                    Image122 =
                                                                    state.Image1!;
                                                                  }


                                                                  SetMyReplyToImage(
                                                                      Comment, state
                                                                      .AliasForRepliedTo!,
                                                                      state
                                                                          .AvatarPathForRepliedTo!,
                                                                      state
                                                                          .ColorForRepliedTo!,
                                                                      Message_id,
                                                                      state
                                                                          .Image_type!
                                                                  );
                                                                }
                                                                else if (state
                                                                    .Isreply ==
                                                                    true &&
                                                                    state.type ==
                                                                        "Voice" &&
                                                                    _SendMessageController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  _GroupChatBloc
                                                                      .add(
                                                                      ShowReplyWidget(
                                                                              (b) =>
                                                                          b
                                                                            ..Isreply =
                                                                            false));


                                                                  //     SetMyReplyToImage(state.RepliedToMessage!,Comment,state.type!);

                                                                  _GroupChatBloc
                                                                      .add(
                                                                      addReply((
                                                                          b) =>
                                                                      b
                                                                        ..comment = _SendMessageController
                                                                            .text
                                                                        ..message_id = Message_id));
                                                                }
                                                                else
                                                                if (_SendMessageController
                                                                    .text
                                                                    .isNotEmpty &&
                                                                    state.Isreply ==
                                                                        false) {
                                                                  setMYMessage(
                                                                      _SendMessageController
                                                                          .text, 1,
                                                                      widget
                                                                          .MY_ID!);

                                                                  _controller
                                                                      .animateTo(
                                                                    _controller
                                                                        .position
                                                                        .minScrollExtent,
                                                                    duration: Duration(
                                                                        microseconds: 2),
                                                                    curve: Curves
                                                                        .easeIn,
                                                                  );
                                                                }
                                                              }
                                                              _SendMessageController.clear();
                                                            }else{
                                                              OutsideBubbleAlreat();
                                                            }


                                                          },
                                                          color: const Color(
                                                              0xff15D078),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              )
                                            ],
                                          )
                                              : const Text("")
                                        ],
                                      ),
                                    ],
                                  ),
                                )

                        ],
                      ),
                      Container(
                        width: w,
                        height: h / 15,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Color.fromRGBO(0, 0, 0, 0.25),
                          //       offset: Offset(0, 4),
                          //       blurRadius: 4)
                          // ],
                          color: Color(0xff942657),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: w / 7,
                                  height: h / 30,
                                  child: Row(
                                    children: [
                                      const Text("       "),
                                      SvgPicture.asset(
                                          "Assets/images/Frame 11.svg",
                                          width: 30,
                                          color: ColorS.surface),
                                    ],
                                  )),
                            ),

                            Flexible(
                              child: Container(
                                child: Text(
                                  widget.plan_Title!,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 22,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/MORE.svg",
                                      width: 23,
                                      color: ColorS.surface),
                                  onPressed: () {
                                    _scaffoldKey.currentState!
                                        .openEndDrawer();
                                    bool GetInStatus = false;
                                    for(int j =0;j<AllBubblesIDS!.length;j++){
                                      if (widget.bubble_id==AllBubblesIDS![j]){
                                        if (AllBubblesStatus![j]==1)
                                          GetInStatus = true;
                                      }
                                    }

                                    if ( GetInStatus) {
                                      _scaffoldKey.currentState!
                                          .openEndDrawer();
                                      _GroupChatBloc.add(GetUsersInsideBubble((b) => b
                                        ..Bubble_id = widget.bubble_id
                                      ));
                                    }else{
                                      OutsideBubbleAlreat();
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }


Future OutsideBubbleAlreat()async
{
  return       showDialog(
    builder: (BuildContext context) {
      var h = MediaQuery.of(context).size.height;
      var w = MediaQuery.of(context).size.width;
      return Container(
        child: AlertDialog(
          backgroundColor: Color(0xffEAEAEA),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content:  Container(
              width: w,
              height: h/3,
              decoration: BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color : Color.fromRGBO(234, 234, 234, 1),
              ),
            child: Column(
              children: [
                Stack(
                  children: [

                        Container(
                            width: w/3,
                            child: Image.asset("Assets/images/Ellipse 26.png",fit: BoxFit.fill,)
                        ),

                    Positioned(
                      top: h/35,
                        left: h/35,
                        child: Image.asset("Assets/images/Vector.png")
                    )

                  ],
                ),
                SizedBox(height: h/40,),
                Text('WOOPS!', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(47, 47, 47, 1),
                    fontFamily: 'Red Hat Display',
                    fontStyle: FontStyle.italic,
                    fontSize: 22,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),),
                SizedBox(height: h/40,),
                Text('Looks like you are not in this bubble! Please move closer to activate additional features.', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(47, 47, 47, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 12,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1.25
                ),)


              ],
            ),
          ),

        )
      );
    }, context: context
      );

    }



  void DecodeImage(String path,String type) {
    String decoded = utf8.decode(base64.decode(path));
    //todo: when you listen for image message call this function to decode it
    //todo : maybe download it or i dont know figure out how its going to work
    print(decoded);
  }

  void encodeImage(File path,String type) {
    Uint8List bytes = path.readAsBytesSync();
    base64Image = base64Encode(bytes);
    print(base64Image);
    if (type =="me") {
      SetMyImage(path);
    }
  }


  Future<void> EncodeVoice(String path,String type) async {
    var Voicepath =path;
    var dir = await getApplicationDocumentsDirectory();
    final uri = Uri.parse(Voicepath);
    File file = File(uri.path);
    List<int> fileBytes = await file.readAsBytes();
    base64String = base64Encode(fileBytes);

    if (type =="me"){
      print(path);

      SetMyVoiceMessage(Voicepath.toString());

    }
  }

  Future<void> DecodeVoice(String path,String type) async {
    String decoded = utf8.decode(base64.decode(path));
//todo: when you listen for voice message call this function to decode it
    //todo : maybe download it or i dont know figure out how its going to work
    print(decoded);

  }





















  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imagePath = File(image.path);
    print(imagePath);
    this.image = imagePath;
    encodeImage(imagePath,"me");
  }




  Widget ReplyWidgett(GroupChatState state) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  height: h / 30,
                  // decoration: BoxDecoration(
                  //     boxShadow : [BoxShadow(
                  //         blurRadius: 0.3
                  //     )],
                  //     color: Color(0xff303030)
                  // ),

                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: const Color(0xffEAEAEA),
                          width: w / 400,
                          height: h / 50,
                        ),
                      ])),
              Container(
                width: w / 1.27,
                height: h / 30,
                margin: EdgeInsets.only(bottom: h / 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                color: const Color(0xffEAEAEA),
                                height: w / 400,
                                width: h / 34,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                    state.AvatarPathForRepliedTo.toString()),
                                backgroundColor:
                                Color(int.parse(state.ColorForRepliedTo!)),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                state.AliasForRepliedTo.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:
                                    const Color.fromRGBO(147, 147, 147, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 1.7 *
                                        SizeConfig.blockSizeVertical!
                                            .toDouble(),
                                    letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                              const SizedBox(
                                width: 5,
                              ),



                              state.type=="Image"
                                  ?state.Image_type.toString()=="Uint8List"
                                  ?Container(
                                  width: w/5,
                                  height: h/5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                      child:Image.memory(state.Image1!,fit: BoxFit.fill,)
                                  ))
                                  : state.Image_type.toString()=="Backend"
                                  ?Container(
                                  width: w/5,
                                  height: h/5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                      child:Image.network(state.RepliedToMessage!,fit: BoxFit.fill,)
                                  ))
                                  :Container(
                                  width: w/5,
                                  height: h/5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.20000000298023224), offset: Offset(0, 1), blurRadius: 11)
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10)   ),
                                      child:Image.file(state.File_image!,fit: BoxFit.fill,)
                                  ))



                                  :  state.type=="Message"
                                  ?  Container(
                                width: w / 8,
                                height: h / 79,
                                child: Text(
                                  state.RepliedToMessage.toString(),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 10.539999961853027,
                                      letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w300,
                                      height: 1),
                                ),
                              )
                                  : state.type=="Voice"
                                  ?  Container(
                                width: w / 5,
                                height: h / 40,
                                child:    VoiceMessage(
                                  audioSrc: state.RepliedToMessage.toString(),
                                  played: true,
                                  me: false,
                                ),
                              )
                                  : Container()

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              width: w / 10,
              height: h / 35,
              child: IconButton(
                onPressed: () {
                  _GroupChatBloc.add(
                      ShowReplyWidget((b) => b..Isreply = false));
                },
                icon: const Icon(
                  Icons.clear,
                  size: 25,
                ),
              ))
        ],
      ),
    );
  }









  Future<void> dIALOG1() {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container(
              width: w / 2,
              height: h / 2.23,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: w / 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              TopicFlowdIALOG();
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,
                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5),
                                        topLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30.5),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(""),
                                          const Text(
                                            'New Topic   ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                height: 1),
                                          ),
                                        ]),
                                  ),
                                ),
                                Container(
                                  width: w / 7,
                                  height: h / 13,
                                  margin: EdgeInsets.only(left: h / 70),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff942657),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36, 36)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/notifiy.svg",
                                      width: w / 13.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: w / 2,
                          child: InkWell(
                            onTap: () {
                              PollFlowdIALOG();
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,
                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5),
                                        topLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30.5),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(""),
                                          const Text(
                                            'New Poll      ',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                height: 1),
                                          ),
                                        ]),
                                  ),
                                ),
                                Container(
                                  width: w / 7,
                                  height: h / 13,
                                  margin: EdgeInsets.only(left: h / 70),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffA83063),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36, 36)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/123323232.svg",
                                      width: w / 13.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: w / 2,
                          child: InkWell(
                            onTap: () {

                              PhotoFlowDialog();
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,
                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5),
                                        topLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30.5),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(""),
                                          const Text(
                                            'Footprint',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                                height: 1),
                                          ),
                                        ]),
                                  ),
                                ),
                                Container(
                                  width: w / 7,
                                  height: h / 13,
                                  margin: EdgeInsets.only(left: h / 70),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffCA4E4E),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36, 36)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/12123123.svg",
                                      width: w / 13.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        width: w / 2,
                        child: InkWell(
                            onTap: () {
                              MediaDumpdIALOG();
                            },
                            child: Stack(children: [
                              Positioned(
                                top: h / 100,
                                left: h / 35,
                                child: Container(
                                  width: w / 2.7,
                                  height: h / 17,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.5),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30.5),
                                      bottomLeft: Radius.circular(0),
                                    ),
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(""),
                                        const Text(
                                          'Media dump',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(47, 47, 47, 1),
                                              fontFamily: 'Red Hat Display',
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: w / 7,
                                height: h / 13,
                                margin: EdgeInsets.only(left: h / 70),
                                decoration: const BoxDecoration(
                                  color: Color(0xffCF6D38),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(36, 36)),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "Assets/images/Layer_1-2_1_.svg",
                                    width: w / 13.5,
                                  ),
                                ),
                              ),
                            ]))),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: h / 100, top: h / 50),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xff15D078),
                          child: Center(
                              child: IconButton(
                                icon: Image.asset("Assets/images/closee.png"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        });
  }

  _onRecordComplete(String path) async {
    //SetMyVoiceMessage(path);
    bool GetInStatus = false;
    for(int j =0;j<AllBubblesIDS!.length;j++){
      if (widget.bubble_id==AllBubblesIDS![j]){
        if (AllBubblesStatus![j]==1)
          GetInStatus = true;
      }
    }
    if (GetInStatus) {
      await EncodeVoice(path, "me");
    }else{

    }
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }










  Future<void> PhotoFlowDialog() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Color.fromRGBO(148, 38, 87, 1),
            ),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Open Camera',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: w,
                  height: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'From Library',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> TopicFlowdIALOG() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          TextTheme _TextTheme = Theme.of(context).textTheme;
          ColorScheme ColorS = Theme.of(context).colorScheme;

          return BlocBuilder(
              bloc: _GroupChatBloc,
              builder: (BuildContext Context, GroupChatState state) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Wrap(children: [
                      Container(
                        color: const Color(0xff942657),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(""),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('New Topic',
                                          textAlign: TextAlign.left,
                                          style: _TextTheme.subtitle1!.copyWith(
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w400)),
                                      const Text(""),
                                      const Text(""),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(""),
                                  Container(
                                      width: w / 1.2,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey1,
                                        child: TextFormField(
                                          focusNode: FoucesNodeFlowTitle,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller: _FlowTitleController,
                                          onChanged: (value) {},
                                          onFieldSubmitted: (value) {
                                            FoucesNodeFlowDescription
                                                .requestFocus();
                                          },
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              errorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor:
                                              const Color(0xff303030),
                                              contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              hintText: "Add Flow Title",
                                              hintStyle: _TextTheme.headline6),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(""),
                                  Text(""),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: w / 1.2,
                                    child: Text(
                                      '${state.DescriptionLength.toString()}/150',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                          color:
                                          Color.fromRGBO(234, 234, 234, 1),
                                          fontFamily: 'Red Hat Text',
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w300,
                                          height: 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 2.5,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey2,
                                        child: TextFormField(
                                          maxLines: 18,
                                          focusNode: FoucesNodeFlowDescription,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _FlowDescriptionController,
                                          onChanged: (value) {
                                            //  _FlowDescriptionController
                                            _GroupChatBloc.add(
                                                DescriptionLength((b) => b
                                                  ..DescriptionLengthh =
                                                      _FlowDescriptionController
                                                          .text.length));
                                          },
                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                            MaxLengthValidator(150,
                                                errorText:
                                                "You reached the max length available")
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            hintText: "Flow Description",
                                            hintStyle: _TextTheme.headline6,
                                            filled: true,
                                            fillColor: const Color(0xff303030),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),
                              const Text(""),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Cancel',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                  const Text(""),
                                  InkWell(
                                    onTap: () {
                                      if (_formkey2.currentState!.validate() &&
                                          _formkey1.currentState!.validate()) {
                                        Navigator.pop(context);
                                        print("done");
                                        SetMyTopicFlow(
                                            _FlowTitleController.text,
                                            _FlowDescriptionController.text);
                                        _FlowTitleController.clear();
                                        _FlowDescriptionController.clear();
                                      }
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Post',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              });
        });
  }

  Future<void> PollFlowdIALOG() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          TextTheme _TextTheme = Theme.of(context).textTheme;
          ColorScheme ColorS = Theme.of(context).colorScheme;

          return BlocBuilder(
              bloc: _GroupChatBloc,
              builder: (BuildContext Context, GroupChatState state) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Wrap(children: [
                      Container(
                        color: const Color(0xff942657),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(""),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('New Poll',
                                          textAlign: TextAlign.left,
                                          style: _TextTheme.subtitle1!.copyWith(
                                              letterSpacing: .5,
                                              fontWeight: FontWeight.w400)),
                                      const Text(""),
                                      const Text(""),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(""),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 7,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          maxLines: 4,
                                          focusNode: FoucesNodeFlowDescription,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _FlowDescriptionController,
                                          onChanged: (value) {},
                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                            MaxLengthValidator(150,
                                                errorText:
                                                "You reached the max length available")
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            hintText: 'Add Question',
                                            hintStyle: _TextTheme.headline6,
                                            filled: true,
                                            fillColor: const Color(0xff303030),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 10,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          maxLines: 4,
                                          focusNode: FoucesNodeFlowDescription,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _FlowDescriptionController,
                                          onChanged: (value) {},

                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            hintText: 'Answer',
                                            hintStyle: _TextTheme.headline6!
                                                .copyWith(
                                                color: const Color(
                                                    0xff303030)),
                                            filled: true,
                                            fillColor: const Color(0xffC4C4C4),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 10,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          maxLines: 4,
                                          focusNode: FoucesNodeFlowDescription,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _FlowDescriptionController,
                                          onChanged: (value) {},

                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle: const TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                            const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5),
                                            ),
                                            hintText: 'Answer',
                                            hintStyle: _TextTheme.headline6!
                                                .copyWith(
                                                color: const Color(
                                                    0xff303030)),
                                            filled: true,
                                            fillColor: const Color(0xffC4C4C4),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                  state.TextfieldSum! >= 3
                                      ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: w / 1.2,
                                          height: h / 10,
                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode
                                                .onUserInteraction,
                                            child: TextFormField(
                                              maxLines: 4,
                                              focusNode:
                                              FoucesNodeFlowDescription,
                                              keyboardAppearance:
                                              Brightness.dark,
                                              textInputAction:
                                              TextInputAction.next,
                                              controller:
                                              _FlowDescriptionController,
                                              onChanged: (value) {},

                                              onFieldSubmitted:
                                                  (value) {},
                                              cursorColor: Colors.black,
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText:
                                                    "Required"),
                                              ]),
                                              decoration: InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                  color: Colors.red,
                                                ),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                border:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5)),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme
                                                    .headline6!
                                                    .copyWith(
                                                    color: const Color(
                                                        0xff303030)),
                                                filled: true,
                                                fillColor: const Color(
                                                    0xffC4C4C4),
                                                contentPadding:
                                                const EdgeInsets.only(
                                                    top: 20,
                                                    left: 10),
                                              ),
                                              keyboardType:
                                              TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )),
                                    ],
                                  )
                                      : const Text(""),
                                  state.TextfieldSum == 4
                                      ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: w / 1.2,
                                          height: h / 10,
                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode
                                                .onUserInteraction,
                                            child: TextFormField(
                                              maxLines: 4,
                                              focusNode:
                                              FoucesNodeFlowDescription,
                                              keyboardAppearance:
                                              Brightness.dark,
                                              textInputAction:
                                              TextInputAction.next,
                                              controller:
                                              _FlowDescriptionController,
                                              onChanged: (value) {},

                                              onFieldSubmitted:
                                                  (value) {},
                                              cursorColor: Colors.black,
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText:
                                                    "Required"),
                                              ]),
                                              decoration: InputDecoration(
                                                errorStyle:
                                                const TextStyle(
                                                  color: Colors.red,
                                                ),
                                                errorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:
                                                const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                border:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5)),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme
                                                    .headline6!
                                                    .copyWith(
                                                    color: const Color(
                                                        0xff303030)),
                                                filled: true,
                                                fillColor: const Color(
                                                    0xffC4C4C4),
                                                contentPadding:
                                                const EdgeInsets.only(
                                                    top: 20,
                                                    left: 10),
                                              ),
                                              keyboardType:
                                              TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )),
                                    ],
                                  )
                                      : const Text(""),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (state.TextfieldSum != 4)
                                        _GroupChatBloc.add(ChangeTextfieldSum(
                                                (b) => b..num = 1));
                                    },
                                    child: Container(
                                      width: w / 1.2,
                                      height: h / 15,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        color: Color.fromRGBO(202, 78, 78, 1),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Checkbox(
                                            checkColor: Colors.black,
                                            value: state.CheckboxStatuss1,
                                            onChanged: (value) {
                                              _GroupChatBloc.add(
                                                  ChangeCheckboxStatus1((b) => b
                                                    ..CheckboxStatus1 = value));
                                            },
                                          ),
                                          const Text(
                                            'Show participants',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    234, 234, 234, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 14,
                                                letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Checkbox(
                                            checkColor: Colors.black,
                                            value: state.CheckboxStatuss2,
                                            onChanged: (value) {
                                              _GroupChatBloc.add(
                                                  ChangeCheckboxStatus2((b) => b
                                                    ..CheckboxStatus2 = value));
                                            },
                                          ),
                                          const Text(
                                            'Multiple Choice',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    234, 234, 234, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 14,
                                                letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Cancel',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                  const Text(""),
                                  InkWell(
                                    onTap: () {
                                      if (_formkey2.currentState!.validate() &&
                                          _formkey1.currentState!.validate()) {
                                        Navigator.pop(context);
                                        print("done");
                                        SetMyTopicFlow(
                                            _FlowTitleController.text,
                                            _FlowDescriptionController.text);
                                      }
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Post',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              });
        }).then((value) {
      _GroupChatBloc.add(MakeTextFieldSumToNormal());
    });
  }

  Future<void> MediaDumpdIALOG() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          TextTheme _TextTheme = Theme.of(context).textTheme;
          ColorScheme ColorS = Theme.of(context).colorScheme;

          return BlocBuilder(
              bloc: _GroupChatBloc,
              builder: (BuildContext Context, GroupChatState state) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Wrap(children: [
                      Container(
                        color: const Color(0xff942657),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(""),
                              Column(
                                children: [
                                  Container(
                                    width: w / 1.1,
                                    child: Text('Add image',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme.subtitle1!.copyWith(
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(""),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: w / 7,
                                      height: h / 13,
                                      margin: EdgeInsets.only(right: h / 2.5),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(207, 109, 56, 1),
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: w / 1.1,
                                child: const Text(
                                  'Write up to 3 keywords',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 20,
                                      letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w400,
                                      height: 1),
                                ),
                              ),
                              Column(
                                children: const [
                                  Text(""),
                                  Text(""),
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey1,
                                        child: TextFormField(
                                          focusNode: FoucesNodeFlowTitle,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller: _FlowTitleController,
                                          onChanged: (value) {},
                                          onFieldSubmitted: (value) {
                                            FoucesNodeFlowDescription
                                                .requestFocus();
                                          },
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              errorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor:
                                              const Color(0xff303030),
                                              contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              hintText: "keywords",
                                              hintStyle: _TextTheme.headline6),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),
                              const Text(""),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Cancel',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                  const Text(""),
                                  InkWell(
                                    onTap: () {
                                      if (_formkey2.currentState!.validate() &&
                                          _formkey1.currentState!.validate()) {
                                        Navigator.pop(context);
                                        print("done");
                                        SetMyTopicFlow(
                                            _FlowTitleController.text,
                                            _FlowDescriptionController.text);
                                      }
                                    },
                                    child: Container(
                                      width: w / 5,
                                      height: h / 20,
                                      child: Center(
                                        child: Text('Post',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              });
        });
  }

  Widget TopicFlowWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: h / 4.44,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor:
                Color(state.messages![index].background_Color!),
                backgroundImage:
                NetworkImage(state.messages![index].Avatar.toString()),
                radius: 23,
              ),
            ],
          ),
        ),
        SizedBox(
          width: h / 100,
        ),
        Container(
          width: w / 1.3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.messages![index].Alias.toString(),
                    textAlign: TextAlign.left,
                    style: _TextTheme.headline3!.copyWith(
                      color: ColorS.errorContainer,
                      fontWeight: FontWeight.w400,
                      fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                    ),
                  ),
                  Text(state.messages![index].time!,
                      textAlign: TextAlign.right,
                      style: _TextTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: const Color(0xffEAEAEA),
                        fontSize:
                        1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                      ))
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: w / 1.3,
                height: h / 4.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                        offset: Offset(0, 0),
                        blurRadius: 10.645160675048828)
                  ],
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: h / 22,
                          width: w / 1.4,
                          padding: EdgeInsets.only(top: h / 100),
                          child: Text(
                            state.messages![index].TopicFlowTitle.toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                                height: 1),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: w / 1.4,
                      child: Text(
                        state.messages![index].TopicFlowDescription.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 17,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            height: 1),
                      ),
                    ),
                    Container(
                      width: w / 1.4,
                      padding: EdgeInsets.only(bottom: h / 100),
                      child: Row(
                        children: [
                          Container(
                            width: w / 5,
                            height: h / 24,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              color: Color.fromRGBO(20, 208, 120, 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Join Flow',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(47, 47, 47, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 11,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget PollFlowWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [],
    );
  }

  Widget MediaDumpWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [],
    );
  }

  Widget PhotoFlowWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [],
    );
  }


  void SendTopicFlow(String Title, String Description) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void SendPollFlow(String Question, List<String> Answers) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void SendMediadump(String MediaDumpImage, String MediaDumpTitle) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void SetMyMediaDump(String MediaDumpImage, String MediaDumpTitle) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.MediaDumpImage = MediaDumpImage;
    messageModel.MediaDumpTitle = MediaDumpTitle;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetHisMediaDump(String MediaDumpImage, String MediaDumpTitle) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.MediaDumpImage = MediaDumpImage;
    messageModel.MediaDumpTitle = MediaDumpTitle;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetMyPollFlow(String Question, List<String> Answers) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.PollAnswers = Answers;
    messageModel.PollQuestion = Question;
    messageModel.ModelType = "PollFlow";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetHisPollFlow(String Question, List<String> Answers) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.PollAnswers = Answers;
    messageModel.PollQuestion = Question;
    messageModel.ModelType = "PollFlow";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetMyTopicFlow(String Title, String Description) {
    print(Title);
    print("im here");
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.TopicFlowDescription = Description;
    messageModel.TopicFlowTitle = Title;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetHisTopicFlow(String Title, String Description) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.TopicFlowDescription = Description;
    messageModel.TopicFlowTitle = Title;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  Future<void> OnRefresh() async {

  }

}
class UserDATA{
  int? id;
  String? Avatar;
  String? Alias;
  String? Background_Color;
  String? Serial_number;
String? Serial;
  String? boi;
  bool? is_frined;
}