import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintLobby.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/MessageModel/MessageModel.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/core/widgets/RecordView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:voice_message_package/voice_message_package.dart';

class Sprints extends StatefulWidget {
  Sprints({Key? key,
    required this.receiver_id
    , required this.my_ID,
    required this.IS_sprints,
    required this.His_Alias,
     this.Bubble_id,
     this.Plan_Title
  })
      : super(key: key);

  int receiver_id = 0;
  int my_ID;
  bool IS_sprints;
  String? His_Alias;
  String? Plan_Title;
  int? Bubble_id;

  @override
  State<Sprints> createState() => _SprintsState();
}

class _SprintsState extends State<Sprints> {
  bool DIditonce2 = false;
  bool Diditonces = false;
  bool Diditoncess = false;
  FocusNode _focus = FocusNode();
  final TextEditingController _SendMessageController = TextEditingController();
  final _formkey3 = GlobalKey<FormState>(); //
  late FocusNode _SendMessages;
  final ScrollController _controller = ScrollController();
  final _Sprints_Bloc = sl<SprintsBloc>();
  int idd = 0;
  int index = 0;
  int HisBackgroundColor = 0;
  int MYbackGroundColor = 0;
  String? base64String;
  Uint8List? Image1;
  Uint8List? Image122;
  File? filee;
  String? path;
  String MyAlias = "";
  String HisAlias = "";
  String MyAvatar = "";
  String HisAvatar = "";
  String RepliedTOMessage = "";
  String base64Image = "";
  int MESSAGE_ID = 0;
  Timer? timer;
  File? image;
  String type="";

  Future<String> _createFileFromString(String Base64) async {
    final encodedStr = Base64;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".aac");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  void ListenForMessages() async {
    //socket!.clearListeners();
    socket!.on("receive_message_send", (msg) {
      //   if (msg["receiver_id"]!=widget.my_ID)
      print(msg);
      if (widget.receiver_id.toString()==msg["from"].toString()) {
       if (msg["message"].toString().substring(0,4)=="text"){

         setHisMessage(msg["message"].toString().substring(4), msg["message_id"]);


       } else if (msg["message"].toString().substring(0,5)=="image"){
         socket!.disconnect()..connect();

         SetHisImage(msg["message"].toString().substring(5), msg["message_id"]);

       }else if (msg["message"].toString().substring(0, 5) == "audio") {

         SetHisVoiceMessage(msg["message"].toString().substring(5));
       }
      }
    });

  }


  void ListenForReplyMessage() async {
    socket!.on("receive_reply_send", (msg) {
      print(msg);

   if (widget.receiver_id.toString()==msg["from"].toString()) {
        print("Got in1");
        if (msg["message"].toString().substring(0, 4) == "text") {
          SetHisReplyMessage(msg["message"].toString().substring(4), msg["comment"], msg["type"]);
        }
        else if (
        msg["message"].toString().substring(0, 7) == "Backend" ||
            msg["message"].toString().substring(0, 9) == "Uint8List" ||
            msg["message"].toString().substring(0, 4) == "File"
        ) {
// print(msg["message"].toString().substring(7));

          SetHisReplyToImage(
              msg["message"].toString().substring(0, 4) == "File"
                  ? msg["message"].toString().substring(4)
                  : msg["message"].toString().substring(0, 9) == "Uint8List"
                  ? msg["message"].toString().substring(9)
                  : msg["message"].toString().substring(0, 7) == "Backend"
                  ? msg["message"].toString().substring(7)
                  : ""

              , msg["comment"]
              , msg["type"]
              , msg["message"].toString().substring(0, 4) == "File"
              ? "File"
              : msg["message"].toString().substring(0, 9) == "Uint8List"
              ? "Uint8List"
              : msg["message"].toString().substring(0, 7) == "Backend"
              ? "Backend"
              : ""


          );
        }else if (msg["message"].toString().substring(0, 10) == "ReplyVoice") {

          SetHisReplyToVoice(msg["message"].toString().substring(10),msg["comment"],msg["message"]);
        }
     }

    });
  }



  void ListenForTyping() async {
    socket!.on("typing_from_friend", (msg) {
      print(msg);
      //  if (msg["receiver_id"]!=widget.my_ID)
      _Sprints_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = true));
    });


    timer = Timer.periodic(Duration(seconds: 5), (Timer t){
      return
        _Sprints_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = false));
    });
  }

  void NotifyTyping(int UserDestination_ID) {
    socket!.emit("write_now", {
      "to": UserDestination_ID.toString(),
    });
  }

  void SetHisReplyToVoice(String message, String Comment, String type) {
    SprintsChat InstanceMessages = SprintsChat();
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

    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }


  void SetmyReplyToVoice(String message, String Comment, String type) {
    print(type);
    print(Comment);
    print(message);


    SprintsChat InstanceMessages = SprintsChat();
    InstanceMessages.ModelType = "ReplyVoice";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias = type == "receiver" ? HisAlias : MyAlias;
 //   InstanceMessages.RepliedTOMessage = message;
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
    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));




    _Sprints_Bloc.add(
        addReply((b) => b
          ..comment =_SendMessageController .text
          ..message_id = MESSAGE_ID
          ..Model_Type = "ReplyVoice"
          ..MessageDirection_Type = type
          // ..Uint8 =Image122
          // ..File_file = filee
          ..Message = message
          ..DestinationUser_id = widget.receiver_id
        ));



  }







  void SetMyVoiceMessage(String Path){


File filee = File(Path);
    Uint8List bytes = filee.readAsBytesSync();
    base64String = base64Encode(bytes);
    SprintsChat Sprints = SprintsChat(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    Sprints.ModelType = "Voice";
    Sprints.ISNOdeJS = true;
    Sprints.background_Color = MYbackGroundColor;
    Sprints.Type = "sender";
    Sprints.message = Path;

    Sprints.ID = 0;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));

    _Sprints_Bloc.add(
        SendMessage((b) =>
        b..Type = "audio"
          ..message = '$base64String'
            ..receiver_id = widget.receiver_id
          ..send_by = widget.IS_sprints?"sprint":"dm"
        ));
  }

  void SetHisVoiceMessage(String Path) async{
//     String pathh = "data:audio/mp3;base64,$Path";
//  File ee = File(Path);
//     final bytes =File(Path).readAsBytesSync();
// print(bytes);
//     String img64 = base64Encode(bytes);
//     print(img64);
// Uint8List?  _bytesImage = Base64Decoder().convert(Path);
  // String base64String = base64Encode(fileBytes);


   String file = await _createFileFromString(Path);

    SprintsChat Sprints = SprintsChat(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    Sprints.message = file.toString();
    Sprints.ModelType = "Voice";
    Sprints.ISNOdeJS = true;
    Sprints.background_Color = HisBackgroundColor;
    Sprints.Type = "receiver";

    Sprints.ID = 0;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));
  }


  void SetMyReplyToImage(
      String Comment,
      String type,
      String modeltype,
      ){
    // var Colore = int.parse(RepliedTo_BackGroundColor);


    SprintsChat InstanceMessages = SprintsChat();
    InstanceMessages.ModelType = "ReplyImage";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias =  type == "receiver" ? HisAlias : MyAlias;

    InstanceMessages.Image_type = modeltype;


    if (modeltype=="Uint8List") {
      InstanceMessages.Image1 = Image122;
    }else if (modeltype=="File"){
      InstanceMessages.Image2 = filee ;
    }else if (modeltype=="Backend"){
      InstanceMessages.RepliedTOMessage = path;
    }







    InstanceMessages.RepliedTOAvatar = type == "receiver" ? HisAvatar : MyAvatar;

    InstanceMessages.ReplieDtobackground_Color = type == "receiver" ? HisBackgroundColor : MYbackGroundColor;
    InstanceMessages.ReplyMessage_id =MESSAGE_ID;


    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;

    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));




    _Sprints_Bloc.add(
        addReply((b) => b
          ..comment =_SendMessageController .text
          ..message_id = MESSAGE_ID
          ..Model_Type = modeltype
          ..MessageDirection_Type = type
          ..Uint8 =Image122
          ..File_file = filee
          ..Message = path
            ..DestinationUser_id = widget.receiver_id
        ));
  }

  void SetHisReplyToImage(
      String message,
      String Comment,
      String MessageDirection_type,
      String ModelType_type
      ){
    SprintsChat InstanceMessages = SprintsChat();

   // String type =  (RepliedTo_BackGroundColor.substring(10));

    if (ModelType_type=="Uint8List") {
      Uint8List?  _bytesImage = Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (ModelType_type=="File"){
      Uint8List?  _bytesImage = Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (ModelType_type=="Backend"){
      InstanceMessages.RepliedTOMessage = message;
    }



    //
    // var Colore = int.parse(RepliedTo_BackGroundColor.substring(0,10));
    // var Color_ = int.parse(ReplierColor);

    InstanceMessages.ISNOdeJS = true;
    InstanceMessages.IsBackEnd = false;
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyImage";
    InstanceMessages.is_base64 = false;
    InstanceMessages.Image_type =ModelType_type!="File"? ModelType_type:"Uint8List";





    InstanceMessages.RepliedTOAlias =MessageDirection_type == "receiver" ? MyAlias : HisAlias;

    InstanceMessages.RepliedTOAvatar =MessageDirection_type == "receiver" ? MyAvatar : HisAvatar;
    InstanceMessages.ReplieDtobackground_Color = MessageDirection_type == "receiver" ? MYbackGroundColor : HisBackgroundColor;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAlias = HisAlias;
    InstanceMessages.ReplierAvatar =HisAvatar;
    InstanceMessages.Replierbackground_Color = HisBackgroundColor;

    InstanceMessages.ID = 0;

    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void SetMyImage(File Path){
    SprintsChat Sprints = SprintsChat(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    Sprints.ModelType ="Image" ;
    Sprints.IsBackEnd = false;
    Sprints.Image_type = "File";
    Sprints.ISNOdeJS = false;
    Sprints.ModelType = "Image";
    Sprints.background_Color = MYbackGroundColor;
    Sprints.Type = "sender";
    Sprints.Image2 = Path;
    Sprints.is_base64 = true;
    Sprints.ID = 0;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));


    _Sprints_Bloc.add(
        SendMessage((b) =>
        b    ..Type = "image"
          ..message = base64Image
          ..receiver_id = widget.receiver_id
            ..send_by = widget.IS_sprints?"sprint":"dm"

        ));

  }

  void SetHisImage( String Path,int Message_id,){
    Uint8List?  _bytesImage = Base64Decoder().convert(Path);
    SprintsChat Sprints = SprintsChat(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    Sprints.ModelType ="Image" ;
    Sprints.IsBackEnd = false;
    Sprints.Image_type = "Uint8List";
    Sprints.ISNOdeJS = true;
    Sprints.is_base64 = true;
    Sprints.Image1 = _bytesImage;
    Sprints.ModelType = "Image";
    Sprints.background_Color = HisBackgroundColor;
    Sprints.Type = "receiver";
    Sprints.User_ID = widget.receiver_id;

    Sprints.ID = Message_id;

    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));
  }

  void SetmyReplyMessage(String message, String Comment, String type, int message_id) {
    print("Function called");
    SprintsChat InstanceMessages = SprintsChat();
    InstanceMessages.ISreply = true;

    InstanceMessages.RepliedTOAlias = type == "receiver" ? HisAlias : MyAlias;
    InstanceMessages.ModelType = "ReplyMessage";

    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =
    type == "receiver" ? HisAvatar : MyAvatar;
    InstanceMessages.ReplieDtobackground_Color =
    type == "receiver" ? HisBackgroundColor : MYbackGroundColor;


    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;
    InstanceMessages.ID = message_id;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));

    _Sprints_Bloc.add(
        addReply((b) => b
          ..comment = _SendMessageController.text
          ..message_id =message_id
          ..Message = message
          ..MessageDirection_Type = type
          ..DestinationUser_id = widget.receiver_id
            ..Model_Type = "text"
        ));



  }

  void SetHisReplyMessage( String message, String Comment, String type,) {
    SprintsChat InstanceMessages = SprintsChat();
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyMessage";
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

    // InstanceMessages.ID = message_id;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void setHisMessage(String message,int MESSAGE_ID) {
    SprintsChat Sprints = SprintsChat(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    Sprints.ModelType ="Message" ;
    Sprints.background_Color = HisBackgroundColor;
    Sprints.Type = "receiver";

    Sprints.ID = MESSAGE_ID;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));

  }

  void setMYMessage(String message) {
    SprintsChat Sprints = SprintsChat(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false
    );
    Sprints.background_Color = MYbackGroundColor;
    Sprints.Type = "sender";
    Sprints.ModelType ="Message" ;
    Sprints.ID = 0;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));
    _Sprints_Bloc.add(SendMessage(
            (b) => b
          ..receiver_id =  widget.receiver_id
          ..message =_SendMessageController.text
          ..Type = "text"
              ..send_by = widget.IS_sprints?"sprint":"dm"
    ));
  }

  @override
  void initState() {
    super.initState();
    _Sprints_Bloc.add(
        GetOldMessages((b) => b
          ..receiver_id = widget.receiver_id
          ..send_by = widget.IS_sprints?"sprint":"dm"
        ));
    socket!.io..disconnect()..connect();
    ListenForMessages();
    ListenForReplyMessage();
    ListenForTyping();
    DIditonce2 = false;
    Diditonces = true;
    Diditoncess = true;
    _SendMessages = FocusNode();
    _focus = FocusNode();
    print(widget.receiver_id);
    print(widget.my_ID);
    _Sprints_Bloc.add(GetAlias((b) => b
      ..HIS_ID = widget.receiver_id
      ..My_ID = widget.my_ID));
    print(widget.my_ID);
    print( widget.receiver_id);



    _SendMessageController.addListener(() {
      _Sprints_Bloc.add(SendStatus((b) => b
        ..Status =_SendMessageController.text.isNotEmpty));//prevent empty messages

      if (_SendMessageController.text.isNotEmpty) {
        _Sprints_Bloc.add(
            KetbaordStatus((b) => b..status = true)); //toggle ui view
      } else {
        _Sprints_Bloc.add(KetbaordStatus((b) => b..status = false));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _SendMessages.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _Sprints_Bloc,
        builder: (BuildContext Context, SprintsState state) {

          // alreatDialogBuilder2(
          //     BuildContext Context,
          //     double h,
          //     double w,
          //     int Frined_id,
          //     ) async {
          //   return showDialog(
          //       context: Context,
          //       barrierDismissible: false,
          //       builder: (Context) {
          //         return AlertDialog(
          //           backgroundColor: Colors.transparent,
          //           insetPadding: EdgeInsets.all(h/50),
          //           content:
          //           Container(
          //             width: w/1.1,
          //             height: h/4.2,
          //             decoration: BoxDecoration(
          //               borderRadius : BorderRadius.only(
          //                 topLeft: Radius.circular(8.285714149475098),
          //                 topRight: Radius.circular(8.285714149475098),
          //                 bottomLeft: Radius.circular(8.285714149475098),
          //                 bottomRight: Radius.circular(8.285714149475098),
          //               ),
          //               color : Color.fromRGBO(47, 47, 47, 1),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.only(left: h/50,top: h/50),
          //                   child: Text('Are you sure you want to remove this user from your friendlist?',
          //                     textAlign: TextAlign.left, style: TextStyle(
          //                         color: Color.fromRGBO(234, 234, 234, 1),
          //                         fontFamily: 'Sofia Pro',
          //                         fontSize: 20.571428298950195,
          //                         letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                         fontWeight: FontWeight.normal,
          //                         height: 1
          //                     ),),
          //                 ),
          //                 Text(""),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: [
          //
          //                     InkWell(
          //                       onTap: (){
          //                         Navigator.pop(context);
          //                       },
          //                       child: Container(
          //                           width: w/3,
          //                           height: h/15,
          //                           decoration: BoxDecoration(
          //                             borderRadius : BorderRadius.only(
          //                               topLeft: Radius.circular(4.142857074737549),
          //                               topRight: Radius.circular(4.142857074737549),
          //                               bottomLeft: Radius.circular(4.142857074737549),
          //                               bottomRight: Radius.circular(4.142857074737549),
          //                             ),
          //                             boxShadow : [BoxShadow(
          //                                 color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                 offset: Offset(0,0),
          //                                 blurRadius: 6.628571510314941
          //                             )],
          //                             color : Color.fromRGBO(207, 109, 56, 1),
          //                           ),
          //                           child: Center(
          //                             child:
          //                             Text('No', textAlign: TextAlign.center, style: TextStyle(
          //                                 color: Color.fromRGBO(234, 234, 234, 1),
          //                                 fontFamily: 'Sofia Pro',
          //                                 fontSize: 19.571428298950195,
          //                                 letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                                 fontWeight: FontWeight.w500,
          //                                 height: 1
          //                             ),),
          //                           )
          //                       ),
          //                     ),
          //
          //                     InkWell(
          //                       onTap: (){
          //                         Navigator.pop(context);
          //                         _GroupChatBloc.add(RemoveFriend((b) => b
          //                           ..friend_id = Frined_id
          //                         ));
          //                       },
          //                       child: Container(
          //                         width: w/3,
          //                         height: h/15,
          //                         decoration: BoxDecoration(
          //                           borderRadius : BorderRadius.only(
          //                             topLeft: Radius.circular(4.142857074737549),
          //                             topRight: Radius.circular(4.142857074737549),
          //                             bottomLeft: Radius.circular(4.142857074737549),
          //                             bottomRight: Radius.circular(4.142857074737549),
          //                           ),
          //                           boxShadow : [BoxShadow(
          //                               color: Color.fromRGBO(0, 0, 0, 0.25),
          //                               offset: Offset(0,0),
          //                               blurRadius: 6.628571510314941
          //                           )],
          //                           color : Color.fromRGBO(168, 48, 99, 1),
          //                         ),
          //                         child: Center(
          //                           child:
          //                           Text('Yes', textAlign: TextAlign.center, style: TextStyle(
          //                               color: Color.fromRGBO(234, 234, 234, 1),
          //                               fontFamily: 'Sofia Pro',
          //                               fontSize: 19.571428298950195,
          //                               letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                               fontWeight: FontWeight.w500,
          //                               height: 1
          //                           ),),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       });
          // }
          //
          //
          // alreatDialogBuilder(
          //     BuildContext Context,
          //     double h,
          //     double w,
          //     int myINdex,
          //     bool is_frined,
          //     bool is_me,
          //     int frined_id,
          //     ) async {
          //   return showDialog(
          //       context: Context,
          //       barrierDismissible: false,
          //       builder: (Context) {
          //
          //
          //
          //         var myInt = int.parse(state.FilteredInsideBubbleUsers![myINdex].Background_Color.toString());
          //         var BackgroundColor= myInt;
          //
          //
          //         return AlertDialog(
          //             backgroundColor: Colors.transparent,
          //             insetPadding: EdgeInsets.all(h/50),
          //             content:GestureDetector(
          //               onTap: (){
          //                 Navigator.pop(context,true);
          //               },
          //               child: Container(
          //                 color: Colors.transparent,
          //                 width: w,
          //                 height: h,
          //                 child :
          //                 Stack(
          //                     children:[
          //
          //                       Center(
          //                         child: Container(
          //                           width: w/1.1,
          //                           height: h/2.3,
          //                           decoration: BoxDecoration(
          //                             borderRadius : BorderRadius.only(
          //                               topLeft: Radius.circular(8.285714149475098),
          //                               topRight: Radius.circular(8.285714149475098),
          //                               bottomLeft: Radius.circular(8.285714149475098),
          //                               bottomRight: Radius.circular(8.285714149475098),
          //                             ),
          //                             color : Color.fromRGBO(47, 47, 47, 1),
          //                           ),
          //                           child: Column(
          //                             crossAxisAlignment: CrossAxisAlignment.center,
          //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                             children: [
          //                               Row(
          //                                 mainAxisAlignment:
          //                                 MainAxisAlignment.spaceAround,
          //                                 children:  [
          //
          //
          //                                   Container(
          //                                     margin: EdgeInsets.only(left: h/60),
          //                                     child: CircleAvatar(
          //
          //                                       backgroundImage: NetworkImage(state.FilteredInsideBubbleUsers![myINdex].Avatar.toString()),
          //                                       radius:40,
          //                                       backgroundColor:Color(BackgroundColor),
          //                                     ),
          //                                   ),
          //                                   Container(
          //                                     margin: EdgeInsets.only(left: h/60),
          //                                     child: Column(
          //                                       children: [
          //                                         Container(
          //                                           child: Text(
          //                                               state.FilteredInsideBubbleUsers![myINdex].Alias
          //                                                   .toString(),
          //                                               overflow: TextOverflow.ellipsis,
          //                                               style: _TextTheme.headline6!.copyWith(
          //                                                   color: Color(
          //                                                       0xffEAEAEA),
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w400,
          //                                                   fontSize:
          //                                                   20)),
          //                                         ),
          //                                         Row(
          //                                           children: [
          //
          //                                             Text(
          //                                                 state.FilteredInsideBubbleUsers![myINdex].Serial_number!,
          //                                                 textAlign: TextAlign.left,
          //                                                 style: _TextTheme
          //                                                     .headline6!
          //                                                     .copyWith(
          //                                                     color: Color(
          //                                                         0xffEAEAEA),
          //                                                     fontWeight:
          //                                                     FontWeight
          //                                                         .w300,
          //                                                     fontSize:
          //                                                     13)),
          //                                           ],
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   Container(
          //                                     height: h/6,
          //                                     child: Column(
          //                                       children: [
          //                                         Container(
          //                                           //  color: Colors.pink,
          //                                           child: IconButton(
          //                                             onPressed: (){
          //                                               Navigator.pop(context,true);
          //                                             },
          //                                             icon: Icon(Icons.clear),
          //                                           ),
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                               Container(
          //                                   padding: EdgeInsets.only(left: h/50,top: h/50),
          //                                   child:
          //                                   Text(   state.FilteredInsideBubbleUsers![myINdex].boi.toString(), textAlign: TextAlign.left, style: TextStyle(
          //                                       color: Color.fromRGBO(255, 255, 255, 1),
          //                                       fontFamily: 'Red Hat Text',
          //                                       fontSize: 12,
          //                                       letterSpacing: 0 ,
          //                                       fontWeight: FontWeight.w300,
          //                                       height: 1.4166666666666667
          //                                   ),)
          //                               ),
          //                               Text(""),
          //                               Row(
          //                                 mainAxisAlignment:
          //                                 is_me?    MainAxisAlignment.center:
          //                                 MainAxisAlignment.spaceAround,
          //                                 children: [
          //                                   is_me
          //                                       ?Text("")
          //                                       :InkWell(
          //                                     onTap: (){
          //                                       //DirectChat
          //                                       WidgetsBinding.instance!
          //                                           .addPostFrameCallback((_) =>     Navigator.push(
          //                                         context,
          //                                         MaterialPageRoute(//receiver_id: ,my_ID: ,
          //                                           builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),   ));
          //                                     },
          //                                     child: Container(
          //                                         width: w/3,
          //                                         height: h/15,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius : BorderRadius.only(
          //                                             topLeft: Radius.circular(4.142857074737549),
          //                                             topRight: Radius.circular(4.142857074737549),
          //                                             bottomLeft: Radius.circular(4.142857074737549),
          //                                             bottomRight: Radius.circular(4.142857074737549),
          //                                           ),
          //                                           boxShadow:[
          //                                             BoxShadow(
          //                                                 color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                                 offset: Offset(0,0),
          //                                                 blurRadius: 6.628571510314941
          //                                             )
          //                                           ],
          //                                           color : Color.fromRGBO(207, 109, 56, 1),
          //                                         ),
          //                                         child: Center(
          //                                             child:
          //                                             SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
          //
          //                                         )
          //                                     ),
          //                                   ),
          //                                   InkWell(
          //                                     onTap: (){
          //                                       if ( !is_frined) {
          //                                         Navigator.pop(context);
          //                                         _GroupChatBloc.add(AddFrined((b) =>
          //                                         b ..serial = state.FilteredInsideBubbleUsers![myINdex].Serial.toString()
          //                                         ));
          //                                       }else{
          //                                         alreatDialogBuilder2(context,h,w,frined_id);
          //                                       }
          //                                     },
          //                                     child: Container(
          //                                       width: w/3,
          //                                       height: h/15,
          //                                       decoration: BoxDecoration(
          //                                         borderRadius : BorderRadius.only(
          //                                           topLeft: Radius.circular(4.142857074737549),
          //                                           topRight: Radius.circular(4.142857074737549),
          //                                           bottomLeft: Radius.circular(4.142857074737549),
          //                                           bottomRight: Radius.circular(4.142857074737549),
          //                                         ),
          //                                         boxShadow : [BoxShadow(
          //                                             color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                             offset: Offset(0,0),
          //                                             blurRadius: 6.628571510314941
          //                                         )],
          //                                         color : is_frined?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
          //                                       ),
          //                                       child: Center(
          //                                           child:
          //                                           //
          //                                           //   SvgPicture.asset(
          //                                           // "Assets/images/Add_friend.svg",
          //                                           // color: Colors.white,
          //                                           // width: h / 26,
          //                                           // )
          //                                           is_me
          //                                               ? Icon(Icons.person)
          //                                               :  is_frined
          //                                               ? SvgPicture.asset(
          //                                             "Assets/images/True_Mark.svg",
          //                                             color: Colors.white,
          //                                             width: h / 26,
          //                                           )
          //                                               :SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
          //
          //
          //                                       ),
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                               SizedBox(height: 7,),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //
          //                     ]
          //                 ),
          //
          //               ),
          //             )
          //
          //         );
          //       });
          // }

          if (state.MYAliasISsuccess!) {
            MyAlias = state.GetAliasMinee!.friend!.alias.toString();
            MyAvatar = state.GetAliasMinee!.friend!.avatar.toString();
            String Value2 = state.GetAliasMinee!.friend!.background_color.toString();

            int myInt2 = int.parse(Value2);
            MYbackGroundColor = myInt2;

            HisAlias = state.GetAlias!.friend!.alias.toString();
            HisAvatar = state.GetAlias!.friend!.avatar.toString();

            String Value = state.GetAlias!.friend!.background_color.toString();
            int myInt = int.parse(Value);
            HisBackgroundColor = myInt;

            DIditonce2 = true;
          }


          return GestureDetector(
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children:[

                          SizedBox(
                            height: h / 20,
                          ),
                          state.success!
                              ? Expanded(
                            child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: Container(
                                  child: ListView.separated(
                                    controller: _controller,
                                    shrinkWrap: true,
                                    reverse: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.messages!.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return SwipeTo(
                                          onRightSwipe: () {
                                           // print(state.GetAliasMinee!.friend!.avatar);

                                            _SendMessages.requestFocus();
                                            SystemChannels.textInput .invokeMethod('TextInput.show');
                                            if (state.messages![index].ISreply==false) {
                                              _SendMessages.requestFocus();
                                              SystemChannels.textInput .invokeMethod('TextInput.show');


                                              MESSAGE_ID = state
                                                  .messages![index].ID!;
                                              RepliedTOMessage = state
                                                  .messages![index]
                                                  .message.toString();
                                               type = state.messages![index].Type.toString();

                                              this.index = index;
                                              _Sprints_Bloc.add(
                                                  ShowReplyWidget((b) => b
                                                    ..Model_Type = state.messages![index].ModelType.toString()
                                                    ..Isreply = true
                                                    ..ColorForRepliedTo = state.messages![index].background_Color!.toString()
                                                    ..RepliedToMessage = state.messages![index].message.toString()
                                                    ..AliasForRepliedTo = state.messages![index].Alias.toString()
                                                    ..AvatarPathForRepliedTo = state.messages![index].Avatar.toString()
                                                    ..Image1 = state.messages![index].Image1
                                                    ..File_image = state.messages![index].Image2
                                                    ..Image_type = state.messages![index].Image_type
                                                  )
                                              );
                                            } else if (state.messages![index].ISreply==true) {


                                              // idd = state.OldMessages!.messages![index].replies![0].id!;
                                              // _ChatBloc_Bloc.add(ShowReplyWidget((b) =>
                                              // b
                                              //   ..Isreply = true
                                              //   ..ColorForRepliedTo = 0xff4caf50 replier BACKGROUND COLOR
                                              //   ..RepliedToMessage = messages[index].ReplierMessage.toString()
                                              //   ..AliasForRepliedTo = messages[index].ReplierAlias.toString()
                                              //   ..AvatarPathForRepliedTo =messages[index].ReplierAvatar.toString()
                                              // ));
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
                                                              _textthem.headline3!.copyWith(
                                                                color: COLOR.errorContainer,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ),
                                                            ),
                                                            Text(
                                                                state.messages![index].time!,
                                                                textAlign: TextAlign.right,
                                                                style: _textthem.headline2!.copyWith(
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
                                                              style: _textthem.headline2!.copyWith(
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
                                                              style: _textthem.headline3!.copyWith(
                                                                color: COLOR.errorContainer,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ),
                                                            ),
                                                            Text(state.messages![index].time!,
                                                                textAlign: TextAlign.right,
                                                                style: _textthem.headline2!.copyWith(
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
                                                                ? InkWell(
                                                              onTap: (){
                                                                //DirectChat
                                                                WidgetsBinding.instance!
                                                                    .addPostFrameCallback((_) =>     Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                    builder: (context) => HeroImage(Uint8List2: state.messages![index].Image1!, Image_Type: 'Uint8List',id: state.messages![index].ID,),),
                                                                ));

                                                              },
                                                              child: Hero(
                                                                  tag: "Image${state.messages![index].ID}",
                                                                  child: Material(
                                                                      type: MaterialType.transparency,
                                                                      child :Container(
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
                                                                          )))),
                                                            )
                                                                : state.messages![index].Image_type.toString()=="Backend"
                                                                ?  InkWell(
                                                                onTap: (){
                                                                  //DirectChat
                                                                  WidgetsBinding.instance!
                                                                      .addPostFrameCallback((_) =>     Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                      builder: (context) => HeroImage(path: state.messages![index].message!, Image_Type: 'Backend',id: state.messages![index].ID,),),
                                                                  ));
                                                                },
                                                                child: Hero(
                                                                    tag: "Image${state.messages![index].ID}",
                                                                    child:  Material(
                                                                        type: MaterialType.transparency,
                                                                        child : Container(
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
                                                                            )))))
                                                                :  InkWell(
                                                                onTap: (){
                                                                  //DirectChat
                                                                  WidgetsBinding.instance!
                                                                      .addPostFrameCallback((_) =>     Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                      builder: (context) => HeroImage(Image: state.messages![index].Image2!, Image_Type: 'File',id: state.messages![index].ID,),),
                                                                  ));
                                                                },
                                                                child: Hero(
                                                                    tag: "Image${state.messages![index].ID}",
                                                                    child: Material(
                                                                        type: MaterialType.transparency,
                                                                        child :Container(
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
                                                                            )))))
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
                                                              style: _textthem.headline3!.copyWith(
                                                                color: COLOR.errorContainer,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                              ),
                                                            ),
                                                            Text(state.messages![index].time!,
                                                                textAlign: TextAlign.right,
                                                                style: _textthem.headline2!.copyWith(
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
                                                                  style: _textthem.headline3!.copyWith(
                                                                    color: COLOR.errorContainer,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ),
                                                                ),
                                                                Text(state.messages![index].Repliertime!,
                                                                    textAlign: TextAlign.right,
                                                                    style: _textthem.headline2!.copyWith(
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
                                                                  style: _textthem.headline2!.copyWith(
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
                                                                width: w / 5,
                                                                height: h / 10,
                                                                margin: EdgeInsets.only(top: h/100),
                                                                child:
                                                                Text('Sticker...', textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(196, 196, 196, 1),
                                                                    fontFamily: 'Sofia Pro',
                                                                    fontSize: 7.539999961853027,
                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight: FontWeight.w400,
                                                                    height: 1
                                                                ),)),
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
                                                                  style: _textthem.headline3!.copyWith(
                                                                    color: COLOR.errorContainer,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ),
                                                                ),
                                                                Text(state.messages![index].Repliertime!,
                                                                    textAlign: TextAlign.right,
                                                                    style: _textthem.headline2!.copyWith(
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
                                                                  style: _textthem.headline2!.copyWith(
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
                                                                        // Container(
                                                                        //     width: w / 5,
                                                                        //     height: h / 10,
                                                                        //     child:
                                                                        //     Text('Sticker...', textAlign: TextAlign.left, style: TextStyle(
                                                                        //         color: Color.fromRGBO(196, 196, 196, 1),
                                                                        //         fontFamily: 'Sofia Pro',
                                                                        //         fontSize: 7.539999961853027,
                                                                        //         letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                        //         fontWeight: FontWeight.w400,
                                                                        //         height: 1
                                                                        //     ),)




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
                                                                                ),
                                                                                child:
                                                                                Image.memory(state.messages![index].Image1!,fit: BoxFit.fill,)



                                                                            )
                                                                                : state.messages![index].Image_type.toString()=="Backend"
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
                                                                                ),
                                                                                child:
                                                                                Image.network(state.messages![index].RepliedTOMessage!,fit: BoxFit.fill,)


                                                                            )
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
                                                                                ),
                                                                                child:Image.file(state.messages![index].Image2!,fit: BoxFit.fill,)
                                                                            )
                                                                        ),
                                                                //        )
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
                                                                  style: _textthem.headline3!.copyWith(
                                                                    color: COLOR.errorContainer,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                  ),
                                                                ),
                                                                Text(state.messages![index].Repliertime!,
                                                                    textAlign: TextAlign.right,
                                                                    style: _textthem.headline2!.copyWith(
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
                                                                  style: _textthem.headline2!.copyWith(
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
                                                      : const Text("empty 111")
                                           : const Text("empty 222 "),

                                          ));
                                    },
                                    separatorBuilder:
                                        (BuildContext context,
                                        int index) {

                                      return SizedBox(
                                        height: h / 30,
                                      );

                                    },
                                  ),
                                )),
                          )
                              : state.isLoading!
                              ? Expanded(
                              flex: 1,
                              child: Container(
                                  width: w,
                                  height: h / 3,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: listLoader(
                                              context: context)),
                                    ],
                                  )))
                              : Expanded(
                              flex: 1,
                              child: Container(
                                width: w,
                                height: h / 3,
                              )),

                          SizedBox(
                            height: 10,
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
                                          ? ReplyWidgett(state,index)
                                          :  Container(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [

                                          !state.KetbaordStatuss!
                                              ? Row(
                                            children: [
                                              RecorderView(
                                                onSaved: _onRecordComplete,
                                                bubble_id: -1,
                                                Want_test: false,
                                              ),
                                              Container(
                                                width: w / 10,
                                                child: IconButton(
                                                    onPressed: (){
                                                   PhotoFlowDialog();
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
                                                  left: h / 100,top: h/100,bottom: h/100),
                                              width: state.KetbaordStatuss!
                                                  ? w / 1.25
                                                  : w / 1.8,
                                              height: h / 13.5,
                                              child: Form(
                                                  key: _formkey3,
                                                  child: TextFormField(
                                                    controller: _SendMessageController,
                                                    keyboardAppearance: Brightness.dark,
                                                    textInputAction:
                                                    TextInputAction.done,
                                                    focusNode: _focus,
                                                    onChanged: (value) {
                                                      if (_SendMessageController.text.isNotEmpty) {
                                                        _Sprints_Bloc.add(
                                                            KetbaordStatus((b) => b..status = true)); //toggle ui view
                                                      } else {
                                                        _Sprints_Bloc.add(KetbaordStatus((b) => b..status = false));
                                                      }
                                                    },
                                                    onFieldSubmitted: (value)async {

                                                      print(_SendMessageController
                                                          .text.trim().length);
                                                      if (_SendMessageController
                                                          .text.trim().length!=0) {

                                                        String Comment =
                                                            _SendMessageController
                                                                .text;
                                                        if (state .Status!) {


                                                          if (state.Isreply ==true &&
                                                              state .messages![index].ModelType ==  "Message" &&
                                                              _SendMessageController.text .isNotEmpty) {
                                                            _Sprints_Bloc
                                                                .add(
                                                                ShowReplyWidget((
                                                                    b) => b..Isreply = false));

                                                            String message = state
                                                                .RepliedToMessage!;

                                                            SetmyReplyMessage(
                                                                message,
                                                                Comment,
                                                                type,
                                                                MESSAGE_ID);
                                                          }
                                                          else if (state.Isreply == true &&
                                                              state
                                                                  .type ==
                                                                  "Image" &&
                                                              _SendMessageController
                                                                  .text
                                                                  .isNotEmpty) {
                                                            _Sprints_Bloc
                                                                .add(
                                                                ShowReplyWidget((
                                                                    b) => b..Isreply = false));


                                                            // String path= "";


                                                            if (state
                                                                .Image_type ==
                                                                "Backend") {
                                                              path = state
                                                                  .RepliedToMessage!;
                                                            } else
                                                            if (state
                                                                .Image_type ==
                                                                "File") {
                                                              filee =
                                                              state
                                                                  .File_image!;
                                                            } else
                                                            if (state
                                                                .Image_type ==
                                                                "Uint8List") {
                                                              Image122 =
                                                              state
                                                                  .Image1!;
                                                            }

                                                            SetMyReplyToImage(
                                                                Comment,
                                                                state
                                                                    .messages![index]
                                                                    .Type!,
                                                                state
                                                                    .Image_type!
                                                            );
                                                          }
                                                          else if (state
                                                              .Isreply ==
                                                              true &&
                                                              state
                                                                  .type ==
                                                                  "Voice" &&
                                                              _SendMessageController
                                                                  .text
                                                                  .isNotEmpty) {
                                                            _Sprints_Bloc
                                                                .add(
                                                                ShowReplyWidget((
                                                                    b) => b..Isreply = false));

                                                            SetmyReplyToVoice(
                                                                state
                                                                    .RepliedToMessage!,
                                                                Comment,
                                                                state
                                                                    .messages![index]
                                                                    .Type!);
                                                          }
                                                          else
                                                          if (_SendMessageController
                                                              .text
                                                              .isNotEmpty &&
                                                              state
                                                                  .Isreply ==
                                                                  false) {
                                                            setMYMessage(
                                                                _SendMessageController
                                                                    .text);

                                                            // _controller
                                                            //     .animateTo(
                                                            //   _controller
                                                            //       .position
                                                            //       .minScrollExtent,
                                                            //   duration: Duration(
                                                            //       microseconds: 2),
                                                            //   curve: Curves
                                                            //       .easeIn,
                                                            // );
                                                          }
                                                        }

                                                      }
                                                      _SendMessageController
                                                          .clear();

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
                                        Row(
                                            children: [
                                              Container(
                                                width: w / 10,
                                                height: h / 10,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: IconButton(
                                                          icon: const Icon(
                                                            Icons.send,
                                                            size: 30,
                                                          ),
                                                          onPressed: ()async{
                                                            print(_SendMessageController
                                                                .text.trim().length);
                                                            if (_SendMessageController
                                                                .text.trim().length!=0) {

                                                              String Comment =
                                                                  _SendMessageController
                                                                      .text;
                                                              if (state .Status!) {


                                                                if (state.Isreply ==true &&
                                                                    state .messages![index].ModelType ==  "Message" &&
                                                                    _SendMessageController.text .isNotEmpty) {
                                                                  _Sprints_Bloc
                                                                      .add(
                                                                      ShowReplyWidget((
                                                                          b) => b..Isreply = false));

                                                                  String message = state
                                                                      .RepliedToMessage!;

                                                                  SetmyReplyMessage(
                                                                      message,
                                                                      Comment,
                                                                      type,
                                                                      MESSAGE_ID);
                                                                }
                                                                else if (state.Isreply == true &&
                                                                    state
                                                                        .type ==
                                                                        "Image" &&
                                                                    _SendMessageController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  _Sprints_Bloc
                                                                      .add(
                                                                      ShowReplyWidget((
                                                                          b) => b..Isreply = false));


                                                                  // String path= "";


                                                                  if (state
                                                                      .Image_type ==
                                                                      "Backend") {
                                                                    path = state
                                                                        .RepliedToMessage!;
                                                                  } else
                                                                  if (state
                                                                      .Image_type ==
                                                                      "File") {
                                                                    filee =
                                                                    state
                                                                        .File_image!;
                                                                  } else
                                                                  if (state
                                                                      .Image_type ==
                                                                      "Uint8List") {
                                                                    Image122 =
                                                                    state
                                                                        .Image1!;
                                                                  }

                                                                  SetMyReplyToImage(
                                                                      Comment,
                                                                      state
                                                                          .messages![index]
                                                                          .Type!,
                                                                      state
                                                                          .Image_type!
                                                                  );
                                                                }
                                                                else if (state
                                                                    .Isreply ==
                                                                    true &&
                                                                    state
                                                                        .type ==
                                                                        "Voice" &&
                                                                    _SendMessageController
                                                                        .text
                                                                        .isNotEmpty) {
                                                                  _Sprints_Bloc
                                                                      .add(
                                                                      ShowReplyWidget((
                                                                          b) => b..Isreply = false));

                                                                  SetmyReplyToVoice(
                                                                      state
                                                                          .RepliedToMessage!,
                                                                      Comment,
                                                                      state
                                                                          .messages![index]
                                                                          .Type!);
                                                                }
                                                                else
                                                                if (_SendMessageController
                                                                    .text
                                                                    .isNotEmpty &&
                                                                    state
                                                                        .Isreply ==
                                                                        false) {
                                                                  setMYMessage(
                                                                      _SendMessageController
                                                                          .text);

                                                                  // _controller
                                                                  //     .animateTo(
                                                                  //   _controller
                                                                  //       .position
                                                                  //       .minScrollExtent,
                                                                  //   duration: Duration(
                                                                  //       microseconds: 2),
                                                                  //   curve: Curves
                                                                  //       .easeIn,
                                                                  // );
                                                                }
                                                              }

                                                            }
                                                            _SendMessageController
                                                                .clear();
                                                          },

                                                          color: widget.IS_sprints? Color(
                                                              0xff15D078):Color(0xffCF6D38)
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

                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),

                      Container(
                        width: w,
                        height: h / 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color:widget.IS_sprints?Color(0xff15D078): COLOR.shadow,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: h / 100),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/Frame 11.svg",
                                      width: 30,
                                      color:widget.IS_sprints? Color(0xff303030):Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                            Container(
                          margin:
                          !widget.IS_sprints?  EdgeInsets.only(left: h/30):EdgeInsets.only(left: h/10000),
                          child: Row(
                            children: [
                              widget.IS_sprints?Container():
                            state.MYAliasISsuccess!?
                              CircleAvatar(
                                radius: 14,
                                backgroundImage: NetworkImage(

                                    state
                                        .GetAlias!.friend!.avatar
                                        .toString()

                                ),
                                backgroundColor:
                                Color(HisBackgroundColor),
                              ):Container(),
                              !widget.IS_sprints?  SizedBox(width: 10,):Container(),
                              Text(
                                widget.His_Alias!,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:widget.IS_sprints? Color(0xff303030):Colors.white,
                                    fontFamily: 'Futura',
                                    fontSize: 24,
                                    letterSpacing:
                                    0.5 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                            SizedBox(width: 5,),
                            widget.IS_sprints?
                                Container(
                                  width: w/3,
                                  margin: EdgeInsets.only(left: h/20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                            "Assets/images/Frame.svg",
                                            width: w/18,
                                            color:Color(0xff303030)),
                                        onPressed: () {

                                        },
                                      ),

                                      IconButton(
                                        icon: SvgPicture.asset(
                                            "Assets/images/Group 252.svg",
                                            width: w/18,
                                            color: Color(0xff303030)),
                                        onPressed: () {
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) => Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SprintLobby(plan_title: widget.Plan_Title!,Bubble_id: widget.Bubble_id!,my_id: widget.my_ID,)),
                                          ));
                                        },
                                      )
                                    ],
                                  ),
                                )

                                :
                            state.TypingStatusSuccess!
                                ? state.TypingStatus!
                                ? Text("Typing...")
                                : Text("")
                                : Text(""),
                            SizedBox(width: 5,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

  _onRecordComplete(String path) async {
      await EncodeVoice(path, "me");
  }

  Widget ReplyWidgett(SprintsState state,int index) {
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



                              state.messages![index].ModelType=="Image"
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



                                  :  state.messages![index].ModelType=="Message"
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
                                  :  state.messages![index].ModelType=="Voice"
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
                  _Sprints_Bloc.add(
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

  Future OutsideBubbleAlreat()async {
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

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imagePath = File(image.path);
    print(imagePath);
    this.image = imagePath;
    encodeImage(imagePath,"me");
  }

  void encodeImage(File path,String type) {
    Uint8List bytes = path.readAsBytesSync();
    base64Image = base64Encode(bytes);
    print(base64Image);
    if (type =="me") {
      SetMyImage(path);
    }
  }
}
class HeroImage extends StatefulWidget {
  HeroImage({Key? key, this.path, this.Image,required this.Image_Type, this.Uint8List2,this.id}) : super(key: key);
  File? Image;
  String? path;
  String Image_Type;
  Uint8List? Uint8List2;
  int? id;
  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Hero(
      tag: "Image${widget.id}",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: w/1.1,
              height: h/2.5,
              child:widget.Image_Type=="Uint8List"
                  ?Image.memory(widget.Uint8List2!,fit: BoxFit.fill,)
                  :widget.Image_Type=="Backend"
                  ?Image.network(widget.path!,fit: BoxFit.fill,)
                  :Image.file(widget.Image!,fit: BoxFit.fill,)


              ,
            ),
          ),
        ],
      ),
    );
  }
}
