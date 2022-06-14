import 'dart:async';
import 'dart:math';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_Event.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/bloc/Chat_state.dart';
import 'package:bubbles/UI/DirectMessages/MessageModel/MessageModel.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/core/widgets/OwnMessgaeCrad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:voice_message_package/voice_message_package.dart';



class DirectChat extends StatefulWidget {
   DirectChat({Key? key,required this.receiver_id}) : super(key: key);
int receiver_id =0;
  @override
  State<DirectChat> createState() => _DirectChatState();
}

class _DirectChatState extends State<DirectChat> {

  final TextEditingController _SendMessageController = TextEditingController();
  final _formkey3 = GlobalKey<FormState>(); //
  late FocusNode _SendMessages;
  List<MessageModel> messages = [];
  final ScrollController _controller = ScrollController();
  IO.Socket? socket;
  bool Diditonces = false;
  final _ChatBloc_Bloc = sl<ChatBloc>();
  void connect() {
    print( DateTime.now().toString().substring(10, 16));
    socket = IO.io("https://chat.bubbles.app/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((data) {
      print("Connected");

      socket!.on("message",(msg){
        setHisMessage( msg["message"]);
      //   _controller.animateTo(
      //     _controller.position.minScrollExtent,
      //     curve: Curves.easeOut,
      //     duration: const Duration(milliseconds: 300),
      //   );

      });
    });
    print(socket!.connected);
  }

  void sendMessage(String message, int sourceId, int targetId)
  {
    socket!.emit("message",//message my id and his id
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  // void _scrollDown() {
  //   Timer(Duration(milliseconds: 500), () {
  //     _controller.jumpTo(_controller.position.maxScrollExtent);
  //   });
  //
  // }
  void setHisMessage(String message)
  {
    // MessageModel messageModel = MessageModel(
    //   message: message,
    //   time: DateTime.now().toString().substring(10, 16),
    //   Avatar: '', // get avatar from state.data.his avatar
    //   Alias: '',// get alias from state.data.his alias
    // );

    // setState((){
    //   messages.add(messageModel);
    // });
  }
  bool DIditonce2 = false;
  void setMYMessage(String message){

    // MessageModel messageModel = MessageModel(
    //   message: message,
    //   time: DateTime.now().toString().substring(10, 16),
    //   Avatar: '', // get avatar from state.data.my avatar avatar
    //   Alias: '',// get alias from state.data.myalias alias
    // );

    // setState((){
    //   messages.add(messageModel);
    // });
  }


  @override
  void initState() {
    super.initState();
    DIditonce2 = false;
    Diditonces = true;
    _SendMessages = FocusNode();
    _SendMessageController.addListener(() {

        _ChatBloc_Bloc.add(SendStatus((b) => b
        ..Status = _SendMessageController.text.isNotEmpty
        ));

    });
    connect();
    print(widget.receiver_id);
    _ChatBloc_Bloc.add(GetAlias((b) => b..ID=widget.receiver_id));
    _ChatBloc_Bloc.add(GetOldMessages((b) => b..receiver_id=widget.receiver_id));


  }

  @override
  void dispose() {
    super.dispose();
    _SendMessages.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
  }
  //VoiceMessage(
  //                                 audioSrc: 'https://sounds-mp3.com/mp3/0012660.mp3',
  //                                 played: false, // To show played badge or not.
  //                                 me: true,
  //                                 // Set message side.
  //                               );


  int BackgroundColor=0;
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
         for (int i = 0;i<state.OldMessages!.messages!.length;i++){
           MessageModel InstanceMessages = MessageModel();
           InstanceMessages.Alias = state.OldMessages!.messages![i].sender_name.toString();

           InstanceMessages.Avatar = state.OldMessages!.messages![i].sender_image.toString();
           String Value = "";
           Value = state.OldMessages!.messages![i].sender_background_color.toString();

           var myInt = int.parse(Value);
           var BackgroundColor= myInt;
           InstanceMessages.background_Color =BackgroundColor;

           InstanceMessages.message =   state.OldMessages!.messages![i].message.toString();

           DateTime datee = DateTime.parse(state.OldMessages!.messages![i].CreatAt.toString());
           print(timeago.format(datee));
           print(datee.toString());

           InstanceMessages.time =   timeago.format(datee).toString();
           InstanceMessages.Type =   state.OldMessages!.messages![i].type.toString();

           messages.add(InstanceMessages);
         }
      //   print(messages[0].time.toString());
      //    _ChatBloc_Bloc.add(Done((b) => b
      //    ..Donee = true
      //    ));
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
                                    _SendMessages.requestFocus();
                                    SystemChannels.textInput.invokeMethod('TextInput.show');
                                    _ChatBloc_Bloc.add(ShowReplyWidget((b) => b
                                      ..Isreply = true
                                        ..ColorForRepliedTo = messages[index].background_Color
                                        ..RepliedToMessage =messages[index].message.toString()
                                        ..AliasForRepliedTo =messages[index].Alias.toString()
                                      ..AvatarPathForRepliedTo=messages[index].Avatar.toString()
                                    ));
                                  },
                                  child: Container(
                                padding: EdgeInsets.only(left: h/50),
                                child: Row(
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
                                ),
                              )
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                int index) {
                              return SizedBox(
                                height: h / 20,
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
                                      }
                                      _ChatBloc_Bloc.add(SendMessage((b) => b
                                      ..receiver_id = widget.receiver_id
                                          ..message = _SendMessageController.text
                                      ));
                                      _SendMessageController.clear();
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
                                      if (state.Isreply==true){
                                        _ChatBloc_Bloc.add(ShowReplyWidget((b) => b
                                          ..Isreply = false
                                        ));
                                      }
                                        _ChatBloc_Bloc.add(SendMessage((b) =>
                                        b
                                          ..receiver_id = widget.receiver_id
                                          ..message = _SendMessageController
                                              .text
                                        ));
                                        _SendMessageController.clear();
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

