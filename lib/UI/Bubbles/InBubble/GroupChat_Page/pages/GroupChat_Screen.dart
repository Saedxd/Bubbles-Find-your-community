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
import 'package:bubbles/core/theme/ResponsiveText.dart';

import 'package:bubbles/core/widgets/OwnMessgaeCrad.dart';
import 'package:bubbles/core/widgets/RecordView.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class GroupChat extends StatefulWidget {
  GroupChat({Key? key, this.Plain_Title, this.MY_ID}) : super(key: key);
  String? Plain_Title = "";
  int? MY_ID;

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController _FlowTitleController = TextEditingController();
  final TextEditingController _FlowDescriptionController = TextEditingController();
  final TextEditingController _SendMessageController = TextEditingController();
  final ScrollController _controller = ScrollController();
  final _GroupChatBloc = sl<GroupChatBloc>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  FocusNode _focus = FocusNode();
  Dio dio = Dio();
  late FocusNode FoucesNodeFlowTitle;
  late FocusNode FoucesNodeFlowDescription;
  List<GroupChatMessage> messages = [];
  List<String> records = [];
  String base64Image = "";
  bool DIditonce2 = false;
  bool Diditonces = false;
  bool Diditoncess = false;
  IO.Socket? socket;
  late Directory appDirectory;
  bool SelectedChat = false;
  File? image;
  int idd = 0;
  int index = 0;
  int HisBackgroundColor = 0;
  int MYbackGroundColor = 0;
  String MyAlias = "";
  String HisAlias = "";
  String MyAvatar = "";
  String HisAvatar = "";
  String RepliedTOMessage = "";
  int LAST_MESSAGE_ID = 0;
  int Old_MESSAGE_ID = 0;
  Timer? timer;


  void ListenForMessages() async {
    socket!.on("receive_message_send", (msg) {
      setHisMessage(msg["message"]);
    });
  }

  void ListenForReplyMessage() async {
    socket!.on("receive_reply_send", (msg) {
      SetHisReplyMessage(msg["message"], msg["comment"], msg["type"]);
    });
  }

  void ListenForTyping() async {
    // socket!.on("typing_from_friend", (msg) {
    //   _ChatBloc_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = true));
    // });

    //
    // timer = Timer.periodic(Duration(seconds: 5), (Timer t){
    //   return
    //     _ChatBloc_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = false));
    // });

  }

  void ListenForVoice() async {


  }

  void ListenForImage() async {


  }

  void SendVoiceMessage(String Path) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void sendImage(String message) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void sendMessage(String message) {
    // socket!.emit("send_message",
    //     {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void sendReply(String message, String Comment, String type) {
    // socket!.emit("send_reply", {
    //   "message": message.toString(),
    //   "to": UserDestination_ID.toString(),
    //   "comment": Comment,
    //   "type": type
    // });
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
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
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }


  void SetMyImage(File Path) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.ModelType = "Image";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.Image = Path;
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetHisImage(File Path) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.Image = Path;
    messageModel.ModelType = "Image";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }


  void SetMyVoiceMessage(String Path) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.ModelType = "Voice";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.VoicePath = Path;
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void SetHisVoiceMessage(String Path) {
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.VoicePath = Path;
    messageModel.ModelType = "Voice";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }


  void SetmyReplyMessage(String message, String Comment, String type) {
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.ModelType = "ReplyMessage";
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
    LAST_MESSAGE_ID += 1;
    InstanceMessages.ID = LAST_MESSAGE_ID;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void SetHisReplyMessage(String message, String Comment, String type) {
    GroupChatMessage InstanceMessages = GroupChatMessage();
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
    LAST_MESSAGE_ID += 1;
    InstanceMessages.ID = LAST_MESSAGE_ID;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }


  void setHisMessage(String message) {
    GroupChatMessage messageModel = GroupChatMessage(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    messageModel.ModelType = "Message";
    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }

  void setMYMessage(String message) {
    GroupChatMessage messageModel = GroupChatMessage(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.ModelType = "Message";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    LAST_MESSAGE_ID += 1;
    messageModel.ID = LAST_MESSAGE_ID;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));
  }


  @override
  void initState() {
    super.initState();
    DIditonce2 = false;
    Diditonces = true;
    Diditoncess = true;
    _focus = FocusNode();
    FoucesNodeFlowDescription = FocusNode();
    FoucesNodeFlowTitle = FocusNode();
    _FlowDescriptionController.addListener(() {
      _GroupChatBloc.add(DescriptionLength((b) =>
      b
        ..DescriptionLengthh = _FlowDescriptionController.text.length
      ));
    });
    //todo : i want my id
    //todo : and maybe the avatar of the other guy throught node js listener
    _GroupChatBloc.add(GetAlias((b) =>
    b
      ..My_ID = widget.MY_ID
    ));
    _SendMessageController.addListener(() {
      _GroupChatBloc.add(SendStatus((b) =>
      b
        ..Status =
            _SendMessageController.text.isNotEmpty)); //prevent empty messages
      if (_SendMessageController.text.isNotEmpty) {
        _GroupChatBloc.add(
            KetbaordStatus((b) => b..status = true)); //toggle ui view
      } else {
        _GroupChatBloc.add(KetbaordStatus((b) => b..status = false));
      }
    });
    //download();

  }

void download()async{
  var dir = await getApplicationDocumentsDirectory();
 // print("path ${dir.path}");
  var path = "/data/user/0/com.arc.bubbles/app_flutter/1656663663219.aac";
  final uri = Uri.parse(path);
  File file = File(uri.path);
  Uint8List fileContent = await File(uri.path  )
      .readAsBytes();

  // print(file);
  // print(uri);
  //await dio.download("1656663663219.aac", "${dir.path}/data/user/0/com.arc.bubbles/app_flutter/1656663663219.aac");
 // records.add("/data/user/0/com.arc.bubbles/app_flutter/1656663663219.aac");
 //  print(records);
  setState(() {

  });
}
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
    _FlowTitleController.dispose();
    _FlowDescriptionController.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder(
        bloc: _GroupChatBloc,
        builder: (BuildContext Context, GroupChatState state) {
          if (state.success! && Diditoncess) {
            // if (state.OldMessages!.messages!.isNotEmpty){
            //   LAST_MESSAGE_ID = state.OldMessages!.messages![0].id!.toInt();
            // }//todo: give me last id from GetEventChatOLD request
            print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
            Diditoncess = false;
          }

          if (state.AliasISsuccess!) {
            MyAlias = state.GetAliasMinee!.friend!.alias.toString();
            MyAvatar = state.GetAliasMinee!.friend!.avatar.toString();
            String Value2 =
            state.GetAliasMinee!.friend!.background_color.toString();
            int myInt2 = int.parse(Value2);
            MYbackGroundColor = myInt2;
            //
            // HisAlias = state.GetAlias!.friend!.alias.toString();
            // HisAvatar = state.GetAlias!.friend!.avatar.toString();
            //
            // String Value = state.GetAlias!.friend!.background_color.toString();
            // int myInt = int.parse(Value);
            // HisBackgroundColor = myInt;

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
                body: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
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
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.messages!.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return


                                        SwipeTo(
                                            onRightSwipe: () {
                                              _focus.requestFocus();
                                              SystemChannels.textInput
                                                  .invokeMethod(
                                                  'TextInput.show');
                                              if (state.messages![index]
                                                  .ISreply ==
                                                  false && state
                                                  .messages![index].ModelType !=
                                                  "Image") {
                                                print("Insideeee");
                                                Old_MESSAGE_ID = state
                                                    .messages![index].ID!;
                                                RepliedTOMessage = state
                                                    .messages![index]
                                                    .message
                                                    .toString();

                                                this.index = index;
                                                _GroupChatBloc.add(
                                                    ShowReplyWidget((b) =>
                                                    b
                                                      ..Isreply = true
                                                      ..ColorForRepliedTo =
                                                      state
                                                          .messages![
                                                      index]
                                                          .background_Color!
                                                      ..RepliedToMessage =
                                                      state
                                                          .messages![
                                                      index]
                                                          .message
                                                          .toString()
                                                      ..AliasForRepliedTo =
                                                      state
                                                          .messages![
                                                      index]
                                                          .Alias
                                                          .toString()
                                                      ..AvatarPathForRepliedTo =
                                                      state
                                                          .messages![
                                                      index]
                                                          .Avatar
                                                          .toString()));
                                              } else if (state
                                                  .messages![index]
                                                  .ISreply ==
                                                  true) {
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
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: h / 50),
                                              child: state.success!
                                                  ? state.messages![index]
                                                  .ModelType == "Message"
                                                  ? Row(
                                                children: [
                                                Container(
                                                height: h/12,
                                                child:
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color(
                                                            state
                                                                .messages![index]
                                                                .background_Color!),
                                                        backgroundImage: NetworkImage(
                                                            state
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
                                                    child:
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text(
                                                              state
                                                                  .messages![index]
                                                                  .Alias
                                                                  .toString(),
                                                              textAlign: TextAlign
                                                                  .left,
                                                              style: _TextTheme
                                                                  .headline3!
                                                                  .copyWith(
                                                                color: ColorS
                                                                    .errorContainer,
                                                                fontWeight: FontWeight
                                                                    .w400,
                                                                fontSize: 3.2 *
                                                                    SizeConfig
                                                                        .blockSizeVertical!
                                                                        .toDouble(),
                                                              ),
                                                            ),
                                                            Text(state
                                                                .messages![index]
                                                                .time!,
                                                                textAlign: TextAlign
                                                                    .right,
                                                                style: _TextTheme
                                                                    .headline2!
                                                                    .copyWith(
                                                                  fontWeight: FontWeight
                                                                      .w300,
                                                                  color: const Color(
                                                                      0xffEAEAEA),
                                                                  fontSize: 1.5 *
                                                                      SizeConfig
                                                                          .blockSizeVertical!
                                                                          .toDouble(),
                                                                ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height:
                                                          7,
                                                        ),
                                                        Container(
                                                          width:
                                                          w / 1.3,
                                                          child: Text(
                                                              state
                                                                  .messages![index]
                                                                  .message
                                                                  .toString(),
                                                              textAlign: TextAlign
                                                                  .left,
                                                              style: _TextTheme
                                                                  .headline2!
                                                                  .copyWith(
                                                                fontWeight: FontWeight
                                                                    .w300,
                                                                color: const Color(
                                                                    0xffEAEAEA),
                                                                fontSize: 2.5 *
                                                                    SizeConfig
                                                                        .blockSizeVertical!
                                                                        .toDouble(),
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                                  : state.messages![index]
                                                  .ModelType == "ReplyMessage"
                                                  ?Column(
                                                children: [
                                                  Container(
                                                    height:
                                                    h / 36,
                                                    margin: EdgeInsets.only(
                                                        left: h /
                                                            50),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            height: h /
                                                                30,
                                                            child:
                                                            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
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
                                                            backgroundColor:
                                                            Color(state.messages![index].Replierbackground_Color!),
                                                            backgroundImage:
                                                            NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                            radius:
                                                            23,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: h /
                                                            100,
                                                      ),
                                                      Container(
                                                        width: w /
                                                            1.3,
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
                                                  : state.messages![index]
                                                  .ModelType == "Image"
                                                  ? Row(
                                                children: [

                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color(
                                                            state
                                                                .messages![index]
                                                                .background_Color!),
                                                        backgroundImage: NetworkImage(
                                                            state
                                                                .messages![index]
                                                                .Avatar
                                                                .toString()),
                                                        radius:
                                                        23,
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
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text(
                                                              state
                                                                  .messages![index]
                                                                  .Alias
                                                                  .toString(),
                                                              textAlign: TextAlign
                                                                  .left,
                                                              style: _TextTheme
                                                                  .headline3!
                                                                  .copyWith(
                                                                color: ColorS
                                                                    .errorContainer,
                                                                fontWeight: FontWeight
                                                                    .w400,
                                                                fontSize: 3.2 *
                                                                    SizeConfig
                                                                        .blockSizeVertical!
                                                                        .toDouble(),
                                                              ),
                                                            ),
                                                            Text(state
                                                                .messages![index]
                                                                .time!,
                                                                textAlign: TextAlign
                                                                    .right,
                                                                style: _TextTheme
                                                                    .headline2!
                                                                    .copyWith(
                                                                  fontWeight: FontWeight
                                                                      .w300,
                                                                  color: const Color(
                                                                      0xffEAEAEA),
                                                                  fontSize: 1.5 *
                                                                      SizeConfig
                                                                          .blockSizeVertical!
                                                                          .toDouble(),
                                                                ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height:
                                                          7,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                                height: h / 4,
                                                                child: Image
                                                                    .file(state
                                                                    .messages![index]
                                                                    .Image!)
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                                  : state.messages![index]
                                                  .ModelType == "Voice"
                                                  ? Row(
                                                children: [

                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor: Color(
                                                            state
                                                                .messages![index]
                                                                .background_Color!),
                                                        backgroundImage: NetworkImage(
                                                            state
                                                                .messages![index]
                                                                .Avatar
                                                                .toString()),
                                                        radius:
                                                        23,
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
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text(
                                                              state
                                                                  .messages![index]
                                                                  .Alias
                                                                  .toString(),
                                                              textAlign: TextAlign
                                                                  .left,
                                                              style: _TextTheme
                                                                  .headline3!
                                                                  .copyWith(
                                                                color: ColorS
                                                                    .errorContainer,
                                                                fontWeight: FontWeight
                                                                    .w400,
                                                                fontSize: 3.2 *
                                                                    SizeConfig
                                                                        .blockSizeVertical!
                                                                        .toDouble(),
                                                              ),
                                                            ),
                                                            Text(state
                                                                .messages![index]
                                                                .time!,
                                                                textAlign: TextAlign
                                                                    .right,
                                                                style: _TextTheme
                                                                    .headline2!
                                                                    .copyWith(
                                                                  fontWeight: FontWeight
                                                                      .w300,
                                                                  color: const Color(
                                                                      0xffEAEAEA),
                                                                  fontSize: 1.5 *
                                                                      SizeConfig
                                                                          .blockSizeVertical!
                                                                          .toDouble(),
                                                                ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height:
                                                          7,
                                                        ),
                                                        Container(
                                                          width: w / 1.2,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              VoiceMessage(
                                                                audioSrc:records[0],
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
                                                  : state.messages![index]
                                                  .ModelType == "TopicFlow"
                                                  ? TopicFlowWidget(
                                                  state, index)
                                                  : state.messages![index]
                                                  .ModelType == "PollFlow"
                                                  ? PollFlowWidget(  state, index)
                                                  : state.messages![index]
                                                  .ModelType == "TopicFlow"
                                                  ? const Text("")
                                                  : const Text("")
                                                  : const Text(""),


                                            )
                                        );
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
                          Column(
                              children: [
                                state.Isreply! ?
                                ReplyWidgett(state)
                                    : const SizedBox(),
                                Container(
                                  height: h / 10,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
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
                                                dIALOG1();
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
                                          ),
                                          Container(
                                            width: w / 10,
                                            padding:EdgeInsets.only(top: h / 50),
                                            child: IconButton(
                                                onPressed: PhotoFlowDialog,
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
                                                keyboardAppearance: Brightness
                                                    .dark,
                                                textInputAction: TextInputAction
                                                    .done,
                                                focusNode: _focus,
                                                onChanged: (value) {
                                                  download();
                                                },
                                                onFieldSubmitted: (value) {
                                                  if (state.Status!) {
                                                    if (state.Isreply == true) {
                                                      _GroupChatBloc.add(
                                                          ShowReplyWidget((b) =>
                                                          b
                                                            ..Isreply = false));
                                                      // print("index :${index}");
                                                      // print("ID :${state.messages![index].ID}");
                                                      // print("Type : ${state.messages![index].Type} ");

                                                      String Comment =
                                                          _SendMessageController
                                                              .text;
                                                      String message =
                                                          RepliedTOMessage;
                                                      String type = state
                                                          .messages![index]
                                                          .Type!;

                                                      String HIS_ID = state
                                                          .GetAlias!.friend!.id
                                                          .toString();

                                                      print(
                                                          "LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
                                                      print(
                                                          "Old_MESSAGE_ID : $Old_MESSAGE_ID");

                                                      // sendReply(message, HIS_ID,
                                                      //     Comment, type);
                                                      print("CLAED");
                                                      SetmyReplyMessage(
                                                          message, Comment,
                                                          type);

                                                      // _GroupChatBloc.add(
                                                      //     addReply((b) => b
                                                      //       ..comment =
                                                      //           _SendMessageController
                                                      //               .text
                                                      //       ..message_id =   Old_MESSAGE_ID!=LAST_MESSAGE_ID?Old_MESSAGE_ID:LAST_MESSAGE_ID));


                                                      _SendMessageController
                                                          .clear();
                                                    } else
                                                    if (_SendMessageController
                                                        .text.isNotEmpty &&
                                                        state.Isreply ==
                                                            false) {
                                                      // sendMessage(
                                                      //     _SendMessageController
                                                      //         .text,
                                                      //     state.GetAlias!.friend!
                                                      //         .id!
                                                      //         .toString());
                                                      setMYMessage(
                                                          _SendMessageController
                                                              .text);


                                                      // _GroupChatBloc.add(
                                                      //     SendMessage((b) => b
                                                      //       ..receiver_id =
                                                      //           widget.receiver_id
                                                      //       ..message =
                                                      //           _SendMessageController
                                                      //               .text));
                                                      _SendMessageController
                                                          .clear();
                                                    }
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
                                                  fillColor: const Color(0xffEAEAEA),
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
                                                      fontWeight: FontWeight
                                                          .w300,
                                                      height: 1),
                                                ),
                                                keyboardType: TextInputType
                                                    .text,
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
                                                      onPressed: () {
                                                        print("1");
                                                        if (state.Status!) {
                                                          print("2");
                                                          if (state.Isreply ==
                                                              true) {
                                                            print("3");
                                                            _GroupChatBloc.add(
                                                                ShowReplyWidget((
                                                                    b) =>
                                                                b
                                                                  ..Isreply = false));
                                                            // print("index :${index}");
                                                            // print("ID :${state.messages![index].ID}");
                                                            // print("Type : ${state.messages![index].Type} ");

                                                            String Comment =
                                                                _SendMessageController
                                                                    .text;
                                                            String message =
                                                                RepliedTOMessage;
                                                            String type = state
                                                                .messages![index]
                                                                .Type!;

                                                            // String HIS_ID =state.GetAlias!.friend!.id
                                                            //     .toString();
                                                            //
                                                            // print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
                                                            // print("Old_MESSAGE_ID : $Old_MESSAGE_ID");

                                                            // sendReply(message, HIS_ID,
                                                            //     Comment, type);
                                                            print("4");

                                                            SetmyReplyMessage(
                                                                message,
                                                                Comment, type);

                                                            // _GroupChatBloc.add(
                                                            //     addReply((b) => b
                                                            //       ..comment =
                                                            //           _SendMessageController
                                                            //               .text
                                                            //       ..message_id =   Old_MESSAGE_ID!=LAST_MESSAGE_ID?Old_MESSAGE_ID:LAST_MESSAGE_ID));


                                                            _SendMessageController
                                                                .clear();
                                                          } else
                                                          if (_SendMessageController
                                                              .text
                                                              .isNotEmpty &&
                                                              state.Isreply ==
                                                                  false) {
                                                            // sendMessage(
                                                            //     _SendMessageController
                                                            //         .text,
                                                            //     state.GetAlias!.friend!
                                                            //         .id!
                                                            //         .toString());

                                                            setMYMessage(
                                                                _SendMessageController
                                                                    .text);


                                                            // _GroupChatBloc.add(
                                                            //     SendMessage((b) => b
                                                            //       ..receiver_id =
                                                            //           widget.receiver_id
                                                            //       ..message =
                                                            //           _SendMessageController
                                                            //               .text));
                                                            _SendMessageController
                                                                .clear();
                                                          }
                                                        }
                                                      },
                                                      color: const Color(0xff15D078),
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
                                )
                              ]
                          ),
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
                            Container(
                              child: Text(
                                widget.Plain_Title!,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 22,
                                    letterSpacing: 0.2,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/MORE.svg",
                                      width: 23,
                                      color: ColorS.surface),
                                  onPressed: () {},
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

  Future<void> dIALOG1() {
    TextTheme _textthem = Theme
        .of(context)
        .textTheme;
    ColorScheme COLOR = Theme
        .of(context)
        .colorScheme;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
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
                  Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
    print(path);
    SetMyVoiceMessage(path);


  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imagePath = File(image.path);
    print(imagePath);
    this.image = imagePath;
    Convert(imagePath);
    SetMyImage(imagePath);
  }

  Widget ReplyWidgett(GroupChatState state) {
    TextTheme _textthem = Theme
        .of(context)
        .textTheme;
    ColorScheme COLOR = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
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
                                Color(state.ColorForRepliedTo!),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                state.AliasForRepliedTo.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: const Color.fromRGBO(147, 147, 147, 1),
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
                              Container(
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

  void Convert(File path) {
    Uint8List bytes = path.readAsBytesSync();
    base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    print(base64Image);
  }

  Future<void> PhotoFlowDialog() {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
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
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          TextTheme _TextTheme = Theme
              .of(context)
              .textTheme;
          ColorScheme ColorS = Theme
              .of(context)
              .colorScheme;

          return BlocBuilder(
              bloc: _GroupChatBloc,
              builder: (BuildContext Context, GroupChatState state) {
                return
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery
                              .of(context)
                              .viewInsets
                              .bottom),
                      child: Wrap(children: [
                        Container(
                          color: const Color(0xff942657),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceAround,
                              children: [
                                const Text(""),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [

                                        Text('New Topic',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.w400
                                            )),

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
                                            keyboardAppearance: Brightness
                                                .dark,
                                            textInputAction: TextInputAction
                                                .next,
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
                                                errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                filled: true,
                                                fillColor: const Color(0xff303030),
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                hintText: "Add Flow Title",
                                                hintStyle: _TextTheme
                                                    .headline6),
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
                                      child: Text('${state.DescriptionLength
                                          .toString()}/150',
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                            height: 1
                                        ),),
                                    ),
                                    const SizedBox(height: 6,),
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
                                            keyboardAppearance: Brightness
                                                .dark,
                                            textInputAction: TextInputAction
                                                .next,
                                            controller: _FlowDescriptionController,
                                            onChanged: (value) {
                                              //  _FlowDescriptionController
                                              _GroupChatBloc.add(
                                                  DescriptionLength((b) =>
                                                  b ..DescriptionLengthh = _FlowDescriptionController.text.length
                                                  ));
                                            },
                                            onFieldSubmitted: (value) {},
                                            cursorColor: Colors.black,
                                            validator: MultiValidator([
                                              RequiredValidator(
                                                  errorText: "Required"),
                                              MaxLengthValidator(150,
                                                  errorText: "You reached the max length available")
                                            ]),
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5)),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    5),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    5),
                                              ),
                                              hintText: "Flow Description",
                                              hintStyle: _TextTheme.headline6,
                                              filled: true,
                                              fillColor: const Color(0xff303030),
                                              contentPadding: const EdgeInsets
                                                  .only(
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
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
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
                                                  fontWeight: FontWeight
                                                      .w400)),
                                        ),
                                      ),
                                    ),
                                    const Text(""),
                                    InkWell(
                                      onTap: () {
                                        if (_formkey2.currentState!
                                            .validate() &&
                                            _formkey1.currentState!
                                                .validate()) {
                                          Navigator.pop(context);
                                          print("done");
                                          SetMyTopicFlow(
                                              _FlowTitleController.text,
                                              _FlowDescriptionController
                                                  .text);
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
                                                  fontWeight: FontWeight
                                                      .w400)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
              }
          );
        });
  }

  Future<void> PollFlowdIALOG() {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery
              .of(context)
              .size
              .height;
          var w = MediaQuery
              .of(context)
              .size
              .width;
          TextTheme _TextTheme = Theme
              .of(context)
              .textTheme;
          ColorScheme ColorS = Theme
              .of(context)
              .colorScheme;

          return
            BlocBuilder(
                bloc: _GroupChatBloc,
                builder: (BuildContext Context, GroupChatState state) {
                  return
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery
                                .of(context)
                                .viewInsets
                                .bottom),
                        child: Wrap(children: [
                          Container(
                            color: const Color(0xff942657),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  const Text(""),

                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Text('New Poll',
                                              textAlign: TextAlign.left,
                                              style: _TextTheme.subtitle1!
                                                  .copyWith(
                                                  letterSpacing: .5,
                                                  fontWeight: FontWeight.w400
                                              )),
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
                                          height: h /7,

                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            child: TextFormField(

                                              maxLines: 4,
                                              focusNode: FoucesNodeFlowDescription,
                                              keyboardAppearance: Brightness
                                                  .dark,
                                              textInputAction: TextInputAction
                                                  .next,
                                              controller: _FlowDescriptionController,
                                              onChanged: (value) {

                                              },
                                              onFieldSubmitted: (value) {},
                                              cursorColor: Colors.black,
                                              validator: MultiValidator([
                                                RequiredValidator(
                                                    errorText: "Required"),
                                                MaxLengthValidator(150,
                                                    errorText: "You reached the max length available")
                                              ]),
                                              decoration: InputDecoration(
                                                errorStyle: const TextStyle(
                                                  color: Colors.red,
                                                ),
                                                errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5)),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                hintText: 'Add Question',
                                                hintStyle: _TextTheme.headline6,
                                                filled: true,
                                                fillColor: const Color(0xff303030),
                                                contentPadding: const EdgeInsets
                                                    .only(
                                                    top: 20, left: 10),
                                              ),
                                              keyboardType: TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )),
                                      const SizedBox(height: 10,),
                                      Container(
                                          width: w / 1.2,
                                          height: h /10,
                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            child: TextFormField(

                                              maxLines: 4,
                                              focusNode: FoucesNodeFlowDescription,
                                              keyboardAppearance: Brightness
                                                  .dark,
                                              textInputAction: TextInputAction
                                                  .next,
                                              controller: _FlowDescriptionController,
                                              onChanged: (value) { },


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
                                                errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5)),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                  color: const Color(0xff303030)
                                                ),
                                                filled: true,

                                                fillColor: const Color(0xffC4C4C4),
                                                contentPadding: const EdgeInsets
                                                    .only(
                                                    top: 20, left: 10),
                                              ),
                                              keyboardType: TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )),
                                      const SizedBox(height: 10,),
                                      Container(
                                          width: w / 1.2,
                                          height: h /10,
                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            child: TextFormField(

                                              maxLines: 4,
                                              focusNode: FoucesNodeFlowDescription,
                                              keyboardAppearance: Brightness
                                                  .dark,
                                              textInputAction: TextInputAction
                                                  .next,
                                              controller: _FlowDescriptionController,
                                              onChanged: (value) { },


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
                                                errorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5)),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xff303030),
                                                  ),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      5),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                    color: const Color(0xff303030)
                                                ),
                                                filled: true,

                                                fillColor: const Color(0xffC4C4C4),
                                                contentPadding: const EdgeInsets
                                                    .only(
                                                    top: 20, left: 10),
                                              ),
                                              keyboardType: TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )),

                                      state.TextfieldSum!>=3
                                          ? Column(children: [
                                        const SizedBox(height: 10,),
                                        Container(
                                            width: w / 1.2,
                                            height: h /10,
                                            child: Form(
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              child: TextFormField(

                                                maxLines: 4,
                                                focusNode: FoucesNodeFlowDescription,
                                                keyboardAppearance: Brightness
                                                    .dark,
                                                textInputAction: TextInputAction
                                                    .next,
                                                controller: _FlowDescriptionController,
                                                onChanged: (value) { },


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
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 0.0),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 0.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(
                                                          5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  hintText: 'Answer',
                                                  hintStyle: _TextTheme.headline6!.copyWith(
                                                      color: const Color(0xff303030)
                                                  ),
                                                  filled: true,

                                                  fillColor: const Color(0xffC4C4C4),
                                                  contentPadding: const EdgeInsets
                                                      .only(
                                                      top: 20, left: 10),
                                                ),
                                                keyboardType: TextInputType.text,
                                                // obscureText: SecureInput_pass,
                                              ),
                                            )),
                                      ],)
                                          : const Text(""),

                                      state.TextfieldSum==4
                                          ? Column(children: [
                                        const SizedBox(height: 10,),
                                        Container(
                                            width: w / 1.2,
                                            height: h /10,
                                            child: Form(
                                              autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                              child: TextFormField(

                                                maxLines: 4,
                                                focusNode: FoucesNodeFlowDescription,
                                                keyboardAppearance: Brightness
                                                    .dark,
                                                textInputAction: TextInputAction
                                                    .next,
                                                controller: _FlowDescriptionController,
                                                onChanged: (value) { },


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
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 0.0),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent,
                                                        width: 0.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(
                                                          5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  hintText: 'Answer',
                                                  hintStyle: _TextTheme.headline6!.copyWith(
                                                      color: const Color(0xff303030)
                                                  ),
                                                  filled: true,

                                                  fillColor: const Color(0xffC4C4C4),
                                                  contentPadding: const EdgeInsets
                                                      .only(
                                                      top: 20, left: 10),
                                                ),
                                                keyboardType: TextInputType.text,
                                                // obscureText: SecureInput_pass,
                                              ),
                                            )),
                                      ],)
                                          : const Text(""),



                                      const SizedBox(height: 10,),
                                      InkWell(
                                        onTap: (){
                                          if (state.TextfieldSum!=4)
                                          _GroupChatBloc.add(ChangeTextfieldSum((b) => b
                                          ..num = 1
                                          ));
                                        },
                                        child: Container(
                                            width: w / 1.2,
                                            height: h /15,
                                            decoration: const BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                topRight: Radius.circular(5),
                                                bottomLeft: Radius.circular(5),
                                                bottomRight: Radius.circular(5),
                                              ),
                                              color : Color.fromRGBO(202, 78, 78, 1),
                                            ),
                                          child: const Center(
                                            child: Icon(Icons.add,size: 30,),
                                          ),
                                        ),
                                      ),
                                       Column(
                                         children: [
                                           Row(
                                             children: [
                                               const SizedBox(width: 10,),
                                               Checkbox(
                                                 checkColor: Colors.black,
                                                 value: state.CheckboxStatuss1,
                                                 onChanged: (value){
                                                   _GroupChatBloc.add(ChangeCheckboxStatus1((b) => b
                                                     ..CheckboxStatus1 = value
                                                   ));
                                                 },
                                               ),
                                               const Text('Show participants', textAlign: TextAlign.left, style: TextStyle(
                                                   color: Color.fromRGBO(234, 234, 234, 1),
                                                   fontFamily: 'Red Hat Text',
                                                   fontSize: 14,
                                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                   fontWeight: FontWeight.normal,
                                                   height: 1
                                               ),)
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               const SizedBox(width: 10,),
                                               Checkbox(
                                                 checkColor: Colors.black,
                                                 value: state.CheckboxStatuss2,
                                                 onChanged: (value){
                                                   _GroupChatBloc.add(ChangeCheckboxStatus2((b) => b
                                                     ..CheckboxStatus2 = value
                                                   ));
                                                 },
                                               ),
                                               const Text('Multiple Choice', textAlign: TextAlign.left, style: TextStyle(
                                                   color: Color.fromRGBO(234, 234, 234, 1),
                                                   fontFamily: 'Red Hat Text',
                                                   fontSize: 14,
                                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                   fontWeight: FontWeight.normal,
                                                   height: 1
                                               ),)
                                             ],
                                           ),
                                         ],
                                       )
                                    ],
                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
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
                                                    fontWeight: FontWeight
                                                        .w400)),
                                          ),
                                        ),
                                      ),
                                      const Text(""),
                                      InkWell(
                                        onTap: () {
                                          if (_formkey2.currentState!
                                              .validate() &&
                                              _formkey1.currentState!
                                                  .validate()) {
                                            Navigator.pop(context);
                                            print("done");
                                            SetMyTopicFlow(
                                                _FlowTitleController.text,
                                                _FlowDescriptionController
                                                    .text);
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
                                                    fontWeight: FontWeight
                                                        .w400)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                }
            );
        }).then((value) {

        _GroupChatBloc.add(MakeTextFieldSumToNormal());
    });
  }

  Future<void> MediaDumpdIALOG() {
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          var h = MediaQuery
              .of(context)
              .size
              .height;
          var w = MediaQuery
              .of(context)
              .size
              .width;
          TextTheme _TextTheme = Theme
              .of(context)
              .textTheme;
          ColorScheme ColorS = Theme
              .of(context)
              .colorScheme;

          return

            BlocBuilder(
                bloc: _GroupChatBloc,
                builder: (BuildContext Context, GroupChatState state) {
                  return
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery
                                .of(context)
                                .viewInsets
                                .bottom),
                        child: Wrap(children: [
                          Container(
                            color: const Color(0xff942657),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  const Text(""),
                                  Column(
                                    children: [
                             Container(
                               width: w/1.1,
                               child:   Text('Add image',
                                   textAlign: TextAlign.left,
                                   style: _TextTheme.subtitle1!
                                       .copyWith(
                                       letterSpacing: .5,
                                       fontWeight: FontWeight.w400
                                   )),
                             ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(""),
                                      InkWell(
                                        onTap: (){
                                        },
                                        child: Container(
                                          width: w/7,
                                          height: h/13,
                                          margin: EdgeInsets.only(right: h/2.5),
                                          decoration: const BoxDecoration(
                                            color : Color.fromRGBO(207, 109, 56, 1),
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: w/1.1,
                                    child: const Text('Write up to 3 keywords', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 20,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w400,
                                        height: 1
                                    ),),
                                  ),

                                  Column(
                                    children: const [
                                      Text(""),
                                      Text(""),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(height: 6,),
                                      Container(
                                          width: w / 1.2,
                                          child: Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            key: _formkey1,
                                            child: TextFormField(
                                              focusNode: FoucesNodeFlowTitle,
                                              keyboardAppearance: Brightness
                                                  .dark,
                                              textInputAction: TextInputAction
                                                  .next,
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
                                                  errorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent,
                                                        width: 0.0),
                                                  ),
                                                  focusedErrorBorder: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .transparent,
                                                        width: 0.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xff303030),
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .circular(
                                                        5),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0xff303030),
                                                  contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                                  hintText: "keywords",
                                                  hintStyle: _TextTheme
                                                      .headline6),
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
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
                                                    fontWeight: FontWeight
                                                        .w400)),
                                          ),
                                        ),
                                      ),
                                      const Text(""),
                                      InkWell(
                                        onTap: () {
                                          if (_formkey2.currentState!
                                              .validate() &&
                                              _formkey1.currentState!
                                                  .validate()) {
                                            Navigator.pop(context);
                                            print("done");
                                            SetMyTopicFlow(
                                                _FlowTitleController.text,
                                                _FlowDescriptionController
                                                    .text);
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
                                                    fontWeight: FontWeight
                                                        .w400)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                }
            );
        });
  }


  Widget TopicFlowWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Row(
      children: [
        Container(
          height: h/4.44,
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
          child:
          Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
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
                        fontSize: 1.5 *
                            SizeConfig.blockSizeVertical!.toDouble(),
                      ))
                ],
              ),
              const SizedBox(
                height:
                7,
              ),
              Container(
                width: w/1.3,
                height: h/4.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  boxShadow : [BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                      offset: Offset(0,0),
                      blurRadius: 10.645160675048828
                  )],
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                height: h/22,
                width: w/1.4,
                padding: EdgeInsets.only(top: h/100),
                child :  Text(state.messages![index].TopicFlowTitle.toString(),
                          textAlign: TextAlign.left, style: const TextStyle(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700,
                              height: 1
                          ),),
                      ),
                    ],
                  ),
                    Container(
                      width: w/1.4,
                      child: Text(state.messages![index].TopicFlowDescription.toString(),
                        textAlign: TextAlign.left, style: const TextStyle(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 17,

                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            height: 1
                        ),),
                    ),
                    Container(
                      width: w/1.4,
                      padding: EdgeInsets.only(bottom: h/100),
                      child: Row(
                        children: [
                          Container(
                              width: w/5,
                              height: h/24,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                color: Color.fromRGBO(20, 208, 120, 1),
                              ),
                            child:
                            const Center(
                              child: Text('Join Flow', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 11,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1
                              ),),
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
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Row(
      children: [

      ],
    );
  }

  Widget MediaDumpWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Row(
      children: [

      ],
    );
  }

  Widget PhotoFlowWidget(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme ColorS = Theme
        .of(context)
        .colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return Row(
      children: [

      ],
    );
  }
}
