import 'dart:async';

import 'dart:math';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Event.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_state.dart';
import 'package:bubbles/UI/DirectMessages/MessageModel/MessageModel.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/core/widgets/OwnMessgaeCrad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:voice_message_package/voice_message_package.dart';

class DirectChat extends StatefulWidget {
  DirectChat({Key? key, required this.receiver_id, required this.my_ID})
      : super(key: key);
  int receiver_id = 0;
  int my_ID;

  @override
  State<DirectChat> createState() => _DirectChatState();
}

class _DirectChatState extends State<DirectChat> {
  bool DIditonce2 = false;
  bool Diditonces = false;
  bool Diditoncess = false;
  final TextEditingController _SendMessageController = TextEditingController();
  final _formkey3 = GlobalKey<FormState>(); //
  late FocusNode _SendMessages;

  final ScrollController _controller = ScrollController();
  final _ChatBloc_Bloc = sl<ChatBloc>();
  List<MessageModel> messages = [];
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
      print(msg);

     SetHisReplyMessage(msg["message"],msg["comment"],msg["type"]);
    // SetHisReplyMessage(msg["message"],msg["comment"],"sender");
    });
  }


  void ListenForTyping() async {
    socket!.on("typing_from_friend", (msg) {
      _ChatBloc_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = true));
    });


    timer = Timer.periodic(Duration(seconds: 5), (Timer t){
      return
        _ChatBloc_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = false));
    });
  }



  void sendMessage(String message, String UserDestination_ID) {
    print("EMITTTEDDDD $UserDestination_ID");

    socket!.emit("send_message",
        {"message": message.toString(), "to": UserDestination_ID.toString()});
  }

  void sendReply(
      String message, String UserDestination_ID, String Comment, String type) {
    socket!.emit("send_reply", {
      "message": message.toString(),
      "to": UserDestination_ID.toString(),
      "comment": Comment,
      "type": type
    });

  }

  void NotifyTyping(int UserDestination_ID) {
    socket!.emit("write_now", {
      "to": UserDestination_ID.toString(),
    });
  }

  void SetmyReplyMessage(String message, String Comment, String type) {
    MessageModel InstanceMessages = MessageModel();
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
    LAST_MESSAGE_ID+=1;
    InstanceMessages.ID = LAST_MESSAGE_ID;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _ChatBloc_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void SetHisReplyMessage(
      String message, String Comment, String type) {
    MessageModel InstanceMessages = MessageModel();
    InstanceMessages.ISreply = true;

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
    LAST_MESSAGE_ID+=1;
    InstanceMessages.ID = LAST_MESSAGE_ID;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _ChatBloc_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void setHisMessage(String message) {
    MessageModel messageModel = MessageModel(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);

    messageModel.background_Color = HisBackgroundColor;
    messageModel.Type = "receiver";
    LAST_MESSAGE_ID+=1;
    messageModel.ID = LAST_MESSAGE_ID;
    _ChatBloc_Bloc.add(AddModel((b) => b..message = messageModel));

  }

  void setMYMessage(String message) {
    MessageModel messageModel = MessageModel(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false
    );
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    LAST_MESSAGE_ID+=1;
    messageModel.ID = LAST_MESSAGE_ID;
    _ChatBloc_Bloc.add(AddModel((b) => b..message = messageModel));
  }

  @override
  void initState() {
    super.initState();
    ListenForMessages();
    ListenForReplyMessage();
    ListenForTyping();
    DIditonce2 = false;
    Diditonces = true;
    Diditoncess = true;
    _SendMessages = FocusNode();
    print(widget.receiver_id);
    print(widget.my_ID);
    _ChatBloc_Bloc.add(GetAlias((b) => b
      ..HIS_ID = widget.receiver_id
      ..My_ID = widget.my_ID));

    _ChatBloc_Bloc.add(
        GetOldMessages((b) => b..receiver_id = widget.receiver_id));
    _SendMessageController.addListener(() {
      _ChatBloc_Bloc.add(SendStatus(
          (b) => b..Status = _SendMessageController.text.isNotEmpty));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _SendMessages.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _ChatBloc_Bloc,
        builder: (BuildContext Context, ChatState state) {

          if (state.success! && Diditoncess){
            if (state.OldMessages!.messages!.isNotEmpty){
              LAST_MESSAGE_ID = state.OldMessages!.messages![0].id!.toInt();
            }
            print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
            Diditoncess = false;
          }


          if (state.AliasISsuccess!) {
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
            // print("state Alias:${state.GetAliasMinee!.friend!.alias.toString()}");
            // print("state Avatar:${state.GetAliasMinee!.friend!.avatar.toString()}");
            // print("state Alias:${state.GetAlias!.friend!.alias.toString()}");
            // print("state Avatar:${state.GetAlias!.friend!.avatar.toString()}");
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
                                          controller: _controller,
                                          shrinkWrap: true,
                                          reverse: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: state.messages!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SwipeTo(
                                                onRightSwipe: () {
                                                  _SendMessages.requestFocus();
                                                  SystemChannels.textInput
                                                      .invokeMethod(
                                                          'TextInput.show');
                                                  if (state.messages![index].ISreply==false) {

                                                    Old_MESSAGE_ID = state
                                                        .messages![index].ID!;
                                                    RepliedTOMessage = state
                                                        .messages![index]
                                                        .message.toString();

                                                    this.index = index;
                                                    _ChatBloc_Bloc.add(
                                                        ShowReplyWidget((b) => b
                                                          ..Isreply = true
                                                          ..ColorForRepliedTo = state.messages![index].background_Color!
                                                          ..RepliedToMessage = state.messages![index] .message.toString()
                                                          ..AliasForRepliedTo =state.messages![index].Alias.toString()
                                                          ..AvatarPathForRepliedTo =state .messages![index].Avatar.toString())
                                                    );

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
                                                        ? !state .messages![index].ISreply!



                                                            ? Row(
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundColor: Color(state.messages![index]
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
                                                                                  color: Color(0xffEAEAEA),
                                                                                  fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                                ))
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              7,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              w / 1.3,
                                                                          child: Text(
                                                                              state.messages![index].message.toString(),
                                                                              textAlign: TextAlign.left,
                                                                              style: _textthem.headline2!.copyWith(
                                                                                fontWeight: FontWeight.w300,
                                                                                color: Color(0xffEAEAEA),
                                                                                fontSize: 2.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                              )),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            : Column(
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
                                                                                color: Color(0xffEAEAEA),
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
                                                                                          color: Color(0xffEAEAEA),
                                                                                          height: h / 1000,
                                                                                          width: w / 20,
                                                                                        ),
                                                                                        CircleAvatar(
                                                                                          radius: 10,
                                                                                          backgroundImage: NetworkImage(state.messages![index].RepliedTOAvatar.toString()),
                                                                                          backgroundColor: Color(state.messages![index].ReplieDtobackground_Color!),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 3,
                                                                                        ),
                                                                                        Text(
                                                                                          state.messages![index].RepliedTOAlias.toString()
                                                                                          // state.AliasForRepliedTo.toString()
                                                                                          ,
                                                                                          textAlign: TextAlign.left,
                                                                                          style: TextStyle(color: Color.fromRGBO(147, 147, 147, 1), fontFamily: 'Red Hat Text', fontSize: 1.7 * SizeConfig.blockSizeVertical!.toDouble(), letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w500, height: 1),
                                                                                        ),
                                                                                        SizedBox(
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
                                                                                            style: TextStyle(color: Color.fromRGBO(196, 196, 196, 1), fontFamily: 'Red Hat Text', fontSize: 10.539999961853027, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w300, height: 1),
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
                                                                                      color: Color(0xffEAEAEA),
                                                                                      fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                                    ))
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              height: 7,
                                                                            ),
                                                                            Container(
                                                                              width: w / 1.3,
                                                                              child: Text(state.messages![index].ReplierMessage.toString(),
                                                                                  textAlign: TextAlign.left,
                                                                                  style: _textthem.headline2!.copyWith(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    color: Color(0xffEAEAEA),
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
                                                        : Text("")));
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            //state.OldMessages!.messages![index].replies!.isEmpty? h / 23:
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
                          Column(
                            children: [
                              state.Isreply! ?
                              ReplyWidgett(state)
                                  : SizedBox(),
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: h / 100, top: h / 50),
                                      width: w / 1.13,
                                      height: h / 10,
                                      child: Form(
                                          key: _formkey3,
                                          child: TextFormField(
                                            focusNode: _SendMessages,
                                            controller: _SendMessageController,
                                            keyboardAppearance: Brightness.dark,
                                            textInputAction:
                                                TextInputAction.done,
                                            onChanged: (value) {

                                              NotifyTyping(
                                                  widget.receiver_id);
                                            },
                                            onFieldSubmitted: (value) {
                                              if (state.Isreply == true) {
                                                _ChatBloc_Bloc.add(
                                                    ShowReplyWidget((b) =>
                                                    b..Isreply = false));
                                                String Comment =
                                                    _SendMessageController.text;
                                                String message =
                                                    RepliedTOMessage;
                                                String type = state
                                                    .messages![index].Type!;

                                                String HIS_ID =state.GetAlias!.friend!.id
                                                    .toString();

                                                // state.messages![index].Type=="receiver"
                                                //     ?  state
                                                //     .GetAlias!.friend!.id
                                                //     .toString()
                                                //     :state
                                                //     .GetAliasMinee!.friend!.id
                                                //     .toString();




                                                print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
                                                print("Old_MESSAGE_ID : $Old_MESSAGE_ID");


                                                _ChatBloc_Bloc.add(
                                                    addReply((b) => b
                                                      ..comment =
                                                          _SendMessageController
                                                              .text
                                                      ..message_id =
                                                          Old_MESSAGE_ID!=LAST_MESSAGE_ID?Old_MESSAGE_ID:LAST_MESSAGE_ID
                                                    ));


                                                sendReply(message, HIS_ID,
                                                    Comment, type);
                                                SetmyReplyMessage(
                                                    message, Comment, type);
                                                _SendMessageController.clear();
                                              } else if (_SendMessageController
                                                      .text.isNotEmpty &&
                                                  state.Isreply == false) {
                                                sendMessage(
                                                    _SendMessageController.text,
                                                    state.GetAlias!.friend!.id!
                                                        .toString());
                                                setMYMessage(
                                                    _SendMessageController
                                                        .text);

                                                _ChatBloc_Bloc.add(SendMessage(
                                                    (b) => b
                                                      ..receiver_id =
                                                          widget.receiver_id
                                                      ..message =
                                                          _SendMessageController
                                                              .text));

                                                _SendMessageController.clear();
                                              }
                                            },
                                            cursorColor: Colors.black,
                                            style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.brown),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              filled: true,
                                              fillColor: Color(0xffEAEAEA),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: h / 100),
                                            ),
                                            keyboardType: TextInputType.text,
                                          ))),
                                  Container(
                                    width: w / 9,
                                    height: h / 10,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.send,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                if (state.Status!) {
                                                  if (state.Isreply == true) {

                                                    _ChatBloc_Bloc.add(
                                                        ShowReplyWidget((b) => b
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
                                                        .messages![index].Type!;

                                                    String HIS_ID =state.GetAlias!.friend!.id
                                                        .toString();

                                                    print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
                                                    print("Old_MESSAGE_ID : $Old_MESSAGE_ID");

                                                    sendReply(message, HIS_ID,
                                                        Comment, type);
                                                    SetmyReplyMessage(
                                                        message, Comment, type);

                                                    _ChatBloc_Bloc.add(
                                                        addReply((b) => b
                                                          ..comment =
                                                              _SendMessageController
                                                                  .text
                                                          ..message_id =   Old_MESSAGE_ID!=LAST_MESSAGE_ID?Old_MESSAGE_ID:LAST_MESSAGE_ID));


                                                    _SendMessageController
                                                        .clear();
                                                  } else if (_SendMessageController
                                                          .text.isNotEmpty &&
                                                      state.Isreply == false) {


                                                    sendMessage(
                                                        _SendMessageController
                                                            .text,
                                                        state.GetAlias!.friend!
                                                            .id!
                                                            .toString());
                                                    setMYMessage(
                                                        _SendMessageController
                                                            .text);


                                                    _ChatBloc_Bloc.add(
                                                        SendMessage((b) => b
                                                          ..receiver_id =
                                                              widget.receiver_id
                                                          ..message =
                                                              _SendMessageController
                                                                  .text));
                                                    _SendMessageController
                                                        .clear();
                                                  }
                                                }
                                              },
                                              color: state.Status!
                                                  ? Color(0xffCF6D38)
                                                  : Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
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
                          color: COLOR.shadow,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: h / 40),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/Frame 11.svg",
                                      width: 30,
                                      color: COLOR.surface),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                            SizedBox(width: 5,),
                            state.AliasISsuccess!
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      InkWell(
                                        onTap: (){
                                          print("LAST_MESSAGE_ID : $LAST_MESSAGE_ID");
                                          print("Old_MESSAGE_ID : $Old_MESSAGE_ID");
                                        },
                                        child: CircleAvatar(
                                          radius: 16,
                                          backgroundImage: NetworkImage(state
                                              .GetAlias!.friend!.avatar
                                              .toString()),
                                          backgroundColor:
                                              Color(HisBackgroundColor),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        state.GetAlias!.friend!.alias
                                            .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: COLOR.tertiary,
                                            fontFamily: 'Futura',
                                            fontSize: 24,
                                            letterSpacing:
                                                0.5 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w500,
                                            height: 1),
                                      ),

                                    ],
                                  )
                                : state.AliasISLoading == true
                                    ? Container(
                                        width: w / 5,
                                        height: h / 10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: listLoader(
                                                    context: context)),
                                          ],
                                        ))
                                    : Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Error\$',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: COLOR.tertiary,
                                                fontFamily: 'Futura',
                                                fontSize: 24,
                                                letterSpacing:
                                                    0.5 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w500,
                                                height: 1),
                                          ),
                                        ],
                                      ),

                            SizedBox(width: 5,),
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

  Widget ReplyWidgett(ChatState state) {
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Color(0xffEAEAEA),
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
                                color: Color(0xffEAEAEA),
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
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                state.AliasForRepliedTo.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(147, 147, 147, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 1.7 *
                                        SizeConfig.blockSizeVertical!
                                            .toDouble(),
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: w / 8,
                                height: h / 79,
                                child: Text(
                                  state.RepliedToMessage.toString(),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
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
                  _ChatBloc_Bloc.add(
                      ShowReplyWidget((b) => b..Isreply = false));
                },
                icon: Icon(
                  Icons.clear,
                  size: 25,
                ),
              ))
        ],
      ),
    );
  }
}
