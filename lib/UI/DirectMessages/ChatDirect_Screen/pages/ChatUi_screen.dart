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
import 'package:socket_io_client/socket_io_client.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:voice_message_package/voice_message_package.dart';



class DirectChat extends StatefulWidget {
   DirectChat({Key? key,required this.receiver_id,this.my_ID}) : super(key: key);
int receiver_id =0;
int? my_ID;
  @override
  State<DirectChat> createState() => _DirectChatState();
}

class _DirectChatState extends State<DirectChat> {
  bool DIditonce2 = false;
  final TextEditingController _SendMessageController = TextEditingController();
  final _formkey3 = GlobalKey<FormState>(); //
  late FocusNode _SendMessages;
  List<MessageModel> messages = [];
  final ScrollController _controller = ScrollController();
  int idd = 0;
  int BackgroundColor=0;
  bool Diditonces = false;
  final _ChatBloc_Bloc = sl<ChatBloc>();
String Alias="";
String Avatar="";

  void ListenForMessages()async{

    socket!.onConnect((data) {
      print(socket!.connected);
      print("Connected");
      print(data);
      socket!.on("receive_message_send",(msg){
        setHisMessage(
          msg["message"]
        ,//msg["avatar"] etc ... ..
        );
      });
    });

    print(socket!.connected);
  }

  void sendMessage(String message, String  Avatar, String Alias,)
  {
    socket!.emit("send_message ",//message my id and his id
        {"message": message,});

    setMYMessage(message);
  }


  void setHisMessage(String message)
  {
    DateTime datee = DateTime.now();
    MessageModel messageModel = MessageModel(
      message: message,
      time:  timeago.format(datee).toString(),
      Avatar: '',
      Alias: '',
    );

    setState((){
      messages.add(messageModel);
    });

  }

  void setMYMessage(String message){

      DateTime datee = DateTime.now();
      MessageModel messageModel = MessageModel(
        message: message,
        time:  timeago.format(datee).toString(),
        Avatar: Avatar,
        Alias: Alias,
      );

      setState((){
      messages.add(messageModel);
    });
  }


  @override
  void initState() {
    super.initState();
    ListenForMessages();
    DIditonce2 = false;
    Diditonces = true;
    _SendMessages = FocusNode();
    _SendMessageController.addListener(() {
        _ChatBloc_Bloc.add(SendStatus((b) => b
        ..Status = _SendMessageController.text.isNotEmpty
        ));

    });

    print(widget.receiver_id);


    _ChatBloc_Bloc.add(GetAlias((b) => b..ID=widget.receiver_id));
    _ChatBloc_Bloc.add(GetAliasMine((b) => b..ID=widget.my_ID));
    _ChatBloc_Bloc.add(GetOldMessages((b) => b..receiver_id=widget.receiver_id));


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
        builder: (BuildContext Context, ChatState state){
          if (state.success! && Diditonces){
             Alias=state.GetAliasMinee!.friend!.alias.toString();
             Avatar=state.GetAliasMinee!.friend!.avatar.toString();

         for (int i = 0;i<state.OldMessages!.messages!.length;i++){
           MessageModel InstanceMessages = MessageModel();
           if (state.OldMessages!.messages![i].replies!.isEmpty) {
             InstanceMessages.ISreply = false;
             InstanceMessages.Alias =
                 state.OldMessages!.messages![i].sender_name.toString();
             InstanceMessages.Avatar =
                 state.OldMessages!.messages![i].sender_image.toString();
             String Value = "";
             Value = state.OldMessages!.messages![i].sender_background_color
                 .toString();
             var myInt = int.parse(Value);
             var BackgroundColor = myInt;
             InstanceMessages.background_Color = BackgroundColor;

             InstanceMessages.message =
                 state.OldMessages!.messages![i].message.toString();

             DateTime datee = DateTime.parse(
                 state.OldMessages!.messages![i].CreatAt.toString());
             // print(timeago.format(datee));
             // print(datee.toString());

           InstanceMessages.time =   timeago.format(datee).toString();
           InstanceMessages.Type =   state.OldMessages!.messages![i].type.toString();
           }
           if (state.OldMessages!.messages![i].replies!.isNotEmpty){
             InstanceMessages.ISreply = true;


         String   Value = state.OldMessages!.messages![i].sender_background_color.toString();

            var myInt = int.parse(Value);
            var BackgroundColor = myInt;



             InstanceMessages.RepliedTOAlias =        state.OldMessages!.messages![i].sender_name.toString();
             InstanceMessages.RepliedTOMessage =   state.OldMessages!.messages![i].message.toString();
             InstanceMessages.RepliedTOAvatar =   state.OldMessages!.messages![i].sender_image.toString();
             InstanceMessages.ReplieDtobackground_Color =  BackgroundColor;


             String Value2 =  state.OldMessages!.messages![i].replies![0].background.toString();
             var myInt2 = int.parse(Value2);
             var BackgroundColor2 = myInt2;

             InstanceMessages.ReplierAlias = state.OldMessages!.messages![i].replies![0].alias.toString();
             InstanceMessages.ReplierMessage = state.OldMessages!.messages![i].replies![0].comment.toString();
             InstanceMessages.ReplierAvatar = state.OldMessages!.messages![i].replies![0].avatar.toString();
             InstanceMessages.Replierbackground_Color =BackgroundColor2;

             DateTime datee2 = DateTime.parse(state.OldMessages!.messages![i].replies![0].CreatAt.toString());
             print(datee2.toString());
             print("date :");

             InstanceMessages.Repliertime =timeago.format(datee2);
             print(InstanceMessages.time);

            // InstanceMessages.background_Color = state.OldMessages!.messages![i].replies![0].
           }
           messages.add(InstanceMessages);
         }
            Diditonces= false;
          }

          if (state.AliasISsuccess! && !DIditonce2){
            String Value = state.GetAlias!.friend!.background_color.toString();
            print(Value);
            int myInt = int.parse(Value);
            print(myInt);
            BackgroundColor = myInt;
            print("IM HERE");
            print(BackgroundColor);
          DIditonce2 = true;
          }



          return  GestureDetector(
              onTap: () async {
              //  print(socket!.connected);
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
                state.success! && !Diditonces
                      ? Expanded(
                    child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: Container(
                          child: ListView.separated(
                            controller: _controller,
                            shrinkWrap: true,
                            reverse: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SwipeTo(
                                  onRightSwipe:(){



                                    print(idd);
                                    print( state.OldMessages!.messages![index].id!);

                                    _SendMessages.requestFocus();
                                    SystemChannels.textInput.invokeMethod('TextInput.show');
                                    if (!messages[index].ISreply!) {
                                      idd = state.OldMessages!.messages![index].id!;
                                      _ChatBloc_Bloc.add(ShowReplyWidget((b) =>
                                      b
                                        ..Isreply = true
                                        ..ColorForRepliedTo = messages[index]
                                            .background_Color
                                        ..RepliedToMessage = messages[index]
                                            .message.toString()
                                        ..AliasForRepliedTo = messages[index]
                                            .Alias.toString()
                                        ..AvatarPathForRepliedTo = messages[index]
                                            .Avatar.toString()
                                      ));
                                    }else if (messages[index].ISreply!){
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
                                padding: EdgeInsets.only(left: h/50),
                                child:  state.OldMessages!.messages![index].replies!.isEmpty
                                    ?     Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                        CircleAvatar(
                                          backgroundColor: Color(messages[index].background_Color!),
                                          backgroundImage: NetworkImage(messages[index].Avatar.toString()),
                                          radius: 23,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: h/100,),
                                    Container(
                                      width: w/1.3,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(messages[index].Alias.toString(), textAlign: TextAlign.left,
                                                style: _textthem.headline3!.copyWith(
                                                  color:COLOR.errorContainer,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 3.2 *
                                                      SizeConfig
                                                          .blockSizeVertical!
                                                          .toDouble(),
                                                ),),
                                              Text(messages[index].time!, textAlign: TextAlign.right,  style: _textthem.headline2!.copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xffEAEAEA),
                                                fontSize: 1.5 *
                                                    SizeConfig
                                                        .blockSizeVertical!
                                                        .toDouble(),
                                              ))
                                            ],
                                          ),
                                          SizedBox(height: 7,),
                                          Container(
                                            width: w/1.3,
                                            child:      Text(messages[index].message.toString()
                                                , textAlign: TextAlign.left, style: _textthem.headline2!.copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xffEAEAEA),
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
                                    :     Column(
                                      children: [
                                        Container(
                                          height: h/36,

                                          margin: EdgeInsets.only(left: h/50),
                                          child: Row(
                                            children: [
                                              Container(
                                                  height: h/30,
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          color: Color(0xffEAEAEA),
                                                          width: w/500,
                                                          height: h/70,
                                                        ),
                                                      ]
                                                  )
                                              ),
                                              Container(
                                                width: w/1.27,
                                                height: h/30,
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
                                                                height: h/1000,
                                                                width: w/20,
                                                              ),
                                                              CircleAvatar(
                                                                radius: 10,
                                                                backgroundImage: NetworkImage(messages[index].RepliedTOAvatar.toString()),
                                                               backgroundColor: Color(messages[index].ReplieDtobackground_Color!),
                                                              ),

                                                              SizedBox(width: 3,),
                                                              Text(messages[index].RepliedTOAlias.toString()
                                                                // state.AliasForRepliedTo.toString()
                                                                ,

                                                                textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(147, 147, 147, 1),
                                                                    fontFamily: 'Red Hat Text',
                                                                    fontSize: 1.7 *
                                                                        SizeConfig
                                                                            .blockSizeVertical!
                                                                            .toDouble(),
                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight: FontWeight.w500,
                                                                    height: 1
                                                                ),),
                                                              SizedBox(width: 5,),
                                                              Container(
                                                                width: w/8,
                                                                height: h/79,
                                                                child:  Text(
                                                                 messages[index].RepliedTOMessage.toString()
                                                                  // state.RepliedToMessage.toString()
                                                                  ,

                                                                  textAlign: TextAlign.left,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(196, 196, 196, 1),
                                                                      fontFamily: 'Red Hat Text',
                                                                      fontSize: 10.539999961853027,
                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight: FontWeight.w300,
                                                                      height: 1
                                                                  ),),

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
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 children:[
                                                   CircleAvatar(
                                                     backgroundColor: Color(messages[index].Replierbackground_Color!),
                                                     backgroundImage: NetworkImage(messages[index].ReplierAvatar.toString()),
                                                     radius: 23,
                                                   ),
                                                 ],
                                               ),
                                               SizedBox(width: h/100,),
                                               Container(
                                                 width: w/1.3,
                                                 child: Column(
                                                   children: [
                                                     Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children: [
                                                         Text(messages[index].ReplierAlias.toString(), textAlign: TextAlign.left,
                                                           style: _textthem.headline3!.copyWith(
                                                             color:COLOR.errorContainer,
                                                             fontWeight: FontWeight.w400,
                                                             fontSize: 3.2 *
                                                                 SizeConfig
                                                                     .blockSizeVertical!
                                                                     .toDouble(),
                                                           ),),
                                                         Text(messages[index].Repliertime!, textAlign: TextAlign.right,  style: _textthem.headline2!.copyWith(
                                                           fontWeight: FontWeight.w300,
                                                           color: Color(0xffEAEAEA),
                                                           fontSize: 1.5 *
                                                               SizeConfig
                                                                   .blockSizeVertical!
                                                                   .toDouble(),
                                                         ))
                                                       ],
                                                     ),
                                                     SizedBox(height: 7,),
                                                     Container(
                                                       width: w/1.3,
                                                       child:      Text(messages[index].ReplierMessage.toString()
                                                           , textAlign: TextAlign.left, style: _textthem.headline2!.copyWith(
                                                             fontWeight: FontWeight.w300,
                                                             color: Color(0xffEAEAEA),
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
                                            ),
                                      ],
                                    ),
                              )
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                int index) {
                              return SizedBox(
                                height:state.OldMessages!.messages![index].replies!.isEmpty? h / 23:h/30,
                              );
                            },
                          ),
                        )),
                  )
                      : state.isLoading == true
                     ? Expanded(
                     flex: 1,
                     child: Container(
                         width: w,
                         height: h / 3,
                         child: Row(
                           mainAxisAlignment:
                           MainAxisAlignment
                               .center,
                           children: [
                             Center(
                                 child: listLoader(
                                     context:
                                     context)),
                           ],
                         )))
                     : Expanded(
                     flex: 1,
                     child: Container(
                       width: w,
                       height: h / 3,
                     )),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      state.Isreply!
                      ?ReplyWidgett(state)
                      :SizedBox(),
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
                                    textInputAction: TextInputAction.done,
                                    onChanged: (value) {},
                                    onFieldSubmitted: (value) {
                                      if (state.Isreply==true){
                                        _ChatBloc_Bloc.add(ShowReplyWidget((b) => b
                                          ..Isreply = false
                                        ));
                                        print(idd);
                                       print( _SendMessageController.text);
                                       print(state.GetAlias!.friend!.id!);
                                       //waiting for reply to reply BACKEND

                                      }else {
                                        _ChatBloc_Bloc.add(SendMessage((b) =>b
                                          ..receiver_id = widget.receiver_id
                                          ..message = _SendMessageController.text
                                        ));
                                        setMYMessage(_SendMessageController.text);
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
                                          borderRadius: BorderRadius.circular(
                                              30)),
                                      filled: true,
                                      fillColor: Color(0xffEAEAEA),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: h / 100),
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

                                    icon: Icon(Icons.send, size: 30,),
                                    onPressed: () {
                                      if (state.Status!) {
                                        if (state.Isreply == true) {


                                          _ChatBloc_Bloc.add(
                                              ShowReplyWidget((b) =>
                                              b
                                                ..Isreply = false
                                              ));

                                          print(idd);
                                          print(_SendMessageController.text);
                                          print(state.GetAlias!.friend!.id!);
                                          _ChatBloc_Bloc.add(addReply((b) =>
                                          b..comment=_SendMessageController.text
                                              ..message_id =idd
                                         //     ..user_id = state.GetAlias!.friend!.id!
                                          ));
                                          _SendMessageController.clear();


                                        } else {
                                          _ChatBloc_Bloc.add(SendMessage((b) =>
                                          b
                                            ..receiver_id = widget.receiver_id
                                            ..message = _SendMessageController
                                                .text
                                          ));
                                          _SendMessageController.clear();
                                        }
                                      }
                                    },

                                    color:state.Status!? Color(0xffCF6D38):Colors.grey),
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
                        margin: EdgeInsets.only(
                            left: h / 40),
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "Assets/images/Frame 11.svg",
                              width: 30,
                              color: COLOR.surface),
                          onPressed:(){
                            Navigator.pop(context);
                          },
                        )),
                        state.AliasISsuccess! && DIditonce2?
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(state.GetAlias!.friend!.avatar.toString()),
                             backgroundColor: Color(BackgroundColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.GetAlias!.friend!.alias.toString(),
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
                        width: w/5,
                        height: h / 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: listLoader(context: context)),
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
                    Text(""),
                    Text(""),
                  ],
                ),
              ),
            ],
          ),

        ),
      )
          );
    }
    );
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
      height: h/28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                  height: h/30,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Color(0xffEAEAEA),
                          width: w/400,
                          height: h/50,
                        ),
                      ]
                  )
              ),
              Container(
                width: w/1.27,
                height: h/30,
                margin: EdgeInsets.only(bottom: h/500),
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
                                height: w/400,
                                width: h/34,
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(state.AvatarPathForRepliedTo.toString()),
                                backgroundColor: Color(state.ColorForRepliedTo!),
                              ),
                              SizedBox(width: 3,),
                              Text(state.AliasForRepliedTo.toString(), textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(147, 147, 147, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 1.7 *
                                      SizeConfig
                                          .blockSizeVertical!
                                          .toDouble(),
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.w500,
                                  height: 1
                              ),),
                              SizedBox(width: 5,),
                              Container(
                                width: w/8,
                                height: h/79,
                                child:  Text(state.RepliedToMessage.toString(), textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(196, 196, 196, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 10.539999961853027,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w300,
                                        height: 1
                                    ),),
                              
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
              width: w/10,
              height: h/35,
              child:  IconButton(
                  onPressed: (){
                    _ChatBloc_Bloc.add(ShowReplyWidget((b) => b
                      ..Isreply = false
                    ));
                  },

                    icon: Icon(  Icons.clear,  size: 25, ),)
              )
        ],
      ),
    );
  }
}

