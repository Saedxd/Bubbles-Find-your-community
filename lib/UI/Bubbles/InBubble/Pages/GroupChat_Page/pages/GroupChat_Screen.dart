import 'dart:io';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Pages/GroupChat_Page/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Pages/GroupChat_Page/bloc/GroupChat_event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Pages/GroupChat_Page/bloc/GroupChat_state.dart';
import 'package:bubbles/core/widgets/OwnMessgaeCrad.dart';
import 'package:bubbles/core/widgets/RecordView.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:voice_message_package/voice_message_package.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// ignore: library_prefixes


class GroupChat extends StatefulWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  final TextEditingController _SendMessageController = TextEditingController();
  final _formkey3 = GlobalKey<FormState>(); //
  FocusNode _focus = FocusNode();
  final ScrollController _controller = ScrollController();
  IO.Socket? socket;
  late Directory appDirectory;
  List<String> records = [];
  bool SelectedChat = false;
  File? image;
  final _GroupChatBloc = sl<GroupChatBloc>();

  void connect() {
    socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.emit("signin", socket!.id.toString());
    print(socket!.id);
    socket!.onConnect((data) {
      print("Connected");
      socket!.on("message", (msg) {
        print(msg);
        //  setMessage("destination", msg["message"]);
        _controller.animateTo(
          _controller.position.minScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      });
    });
    print(socket!.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    // setMessage("source", message);
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  // void setMessage(String type, String message)
  // {
  //   MessageModel messageModel = MessageModel(
  //       type: type,
  //       message: message,
  //       time: DateTime.now().toString().substring(10, 16));
  //   print(messages);
  //
  //   setState(() {
  //     messages.add(messageModel);
  //   });
  // }
  // void _scrollDown() {
  //   Timer(Duration(milliseconds: 500), () {
  //     _controller.jumpTo(_controller.position.maxScrollExtent);
  //   });
  //
  // }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    if (_focus.hasFocus){
      _GroupChatBloc.add(KetbaordStatus((b) => b
      ..status = true
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  //  connect();
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        if (onData.path.contains('.aac')) records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return
      BlocBuilder(
          bloc: _GroupChatBloc,
          builder: (BuildContext Context, GroupChatState state) {
            return
              WillPopScope(
                onWillPop: () async {
                  print("hi");
              if(state.KetbaordStatuss==true){
                _GroupChatBloc.add(KetbaordStatus((b) => b
                  ..status = false));
                return false;
              }
              return true;
            },
            child :
              Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: h / 13,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                                behavior: MyBehavior(),
                                child: Container(
                                  child: ListView.separated(
                                    controller: _controller,
                                    shrinkWrap: true,
                                    reverse: true,
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: records.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return  Row(
                                        children: [
                                          SizedBox(width: h/100,),
                                         Flexible(
                                           child: VoiceMessage(
                                                audioSrc: records[index],
                                                //audioSrc: 'https://sounds-mp3.com/mp3/0012660.mp3',
                                                played: false, // To show played badge or not.
                                                me: true,
                                                // Set message side.
                                              ),
                                         )
                                         
                                        ],
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
                          ),
                          Container(
                            height: h / 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: h / 100,
                                      top: h / 50,
                                      bottom: h / 70),
                                  child: InkWell(
                                    onTap: () {
                                      dIALOG1();
                                    },
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xff15D078),
                                      child: Center(
                                        child: Icon(
                                          Icons.add, size: 35,
                                          color: Colors.white,),
                                      ),
                                    ),
                                  ),
                                ),
                                !state.KetbaordStatuss!
                                    ? Row(
                                  children: [
                                    RecorderView(onSaved: _onRecordComplete,),

                                    Container(
                                      width: w / 10,
                                      padding: EdgeInsets.only(top: h / 50),
                                      child: IconButton(
                                          onPressed:CameraDialog,
                                          icon: SvgPicture.asset(
                                            "Assets/images/cAMERA.svg",
                                            width: w / 16,)),)
                                  ],
                                ) : Text(""),
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
                                          textInputAction: TextInputAction.done,
                                          focusNode: _focus,
                                          onChanged: (value) {},
                                          onFieldSubmitted: (value) {
                                            _SendMessageController.clear();
                                            _GroupChatBloc.add(KetbaordStatus((b) => b
                                              ..status = false));
                                          },
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.brown),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    30)),
                                            filled: true,
                                            fillColor: Color(0xffEAEAEA),
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                horizontal: 12,
                                                vertical: h / 100),
                                            hintText: 'Sup?..',
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    96, 96, 96, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 13,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w300,
                                                height: 1
                                            ),
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
                                                icon: Icon(
                                                  Icons.send, size: 30,),
                                                onPressed: () {
                                                  _SendMessageController
                                                      .clear();
                                                },

                                                color: Color(0xff15D078),),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10,)
                                  ],
                                )
                                    : Text("")

                              ],
                            ),
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
                          color: ColorS.shadow,
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
                                      Text("       "),
                                      SvgPicture.asset(
                                          "Assets/images/Frame 11.svg",
                                          width: 30, color: ColorS.surface),
                                    ],
                                  )),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'DORRiTo\$',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: ColorS.tertiary,
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
    return   showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container(
            width: w/2,
            height: h/2.23,
            color: Colors.transparent,
            child: Column(
              children: [

                InkWell(
                  onTap: (){},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: w,
                          child: Stack(
                            children: [

                           Positioned(
                             top: h/100,
                             left: h/35,
                             child: Container(
                                      width: w/2.7,
                                      height: h/17,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topRight: Radius.circular(30.5),
                                          topLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(30.5),
                                          bottomLeft: Radius.circular(0),
                                        ),
                                        color : Color.fromRGBO(234, 234, 234, 1),
                                      ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children :[
                                   Text(""),
                                   Text('Media dump', textAlign: TextAlign.center, style: TextStyle(
                                       color: Color.fromRGBO(47, 47, 47, 1),
                                       fontFamily: 'Red Hat Display',
                                       fontSize: 15,
                                       letterSpacing: 0 ,
                                       fontWeight: FontWeight.w600,
                                       height: 1
                                   ),),
                                 ]

                               ),
                                  ),
                           ),
                              Container(
                                width: w/7,
                                height: h/13,
                                margin: EdgeInsets.only(left: h/70),
                                decoration: BoxDecoration(
                                  color : Color(0xffCF6D38),
                                  borderRadius : BorderRadius.all(Radius.elliptical(36, 36)),
                                ),
                                child: Center(
                                  child: SvgPicture.asset("Assets/images/Layer_1-2_1_.svg",width: w/13.5,),

                                ),
                              ),
                            ],

                          ),
                        )

                      ],
                    ),
                ),

                SizedBox(height: 10,),
                InkWell(
                  onTap: (){

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w,
                        child: Stack(
                          children: [

                            Positioned(
                              top: h/100,
                              left: h/35,
                              child: Container(
                                  width: w/2.7,
                                  height: h/17,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topRight: Radius.circular(30.5),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30.5),
                                      bottomLeft: Radius.circular(0),
                                    ),
                                    color : Color.fromRGBO(234, 234, 234, 1),
                                  ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children :[
                                      Text(""),
                                      Text('Post a Photo', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(47, 47, 47, 1),
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 15,
                                          letterSpacing: 0 ,
                                          fontWeight: FontWeight.w600,
                                          height: 1
                                      ),),
                                    ]

                                ),
                              ),
                            ),
                            Container(
                              width: w/7,
                              height: h/13,
                              margin: EdgeInsets.only(left: h/70),
                              decoration: BoxDecoration(
                                color : Color(0xffCA4E4E),
                                borderRadius : BorderRadius.all(Radius.elliptical(36, 36)),
                              ),
                              child: Center(
                                child: SvgPicture.asset("Assets/images/12123123.svg",width: w/13.5,),

                              ),
                            )
                          ],

                        ),
                      )


                    ],
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w,
                        child: Stack(
                          children: [

                            Positioned(
                              top: h/100,
                              left: h/35,
                              child: Container(
                                  width: w/2.7,
                                  height: h/17,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topRight: Radius.circular(30.5),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30.5),
                                      bottomLeft: Radius.circular(0),
                                    ),
                                    color : Color.fromRGBO(234, 234, 234, 1),
                                  ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children :[
                                      Text(""),
                                      Text('New Poll      ', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(47, 47, 47, 1),
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 15,
                                          letterSpacing: 0 ,
                                          fontWeight: FontWeight.w600,
                                          height: 1
                                      ),),
                                    ]

                                ),
                              ),
                            ),
                            Container(
                              width: w/7,
                              height: h/13,
                              margin: EdgeInsets.only(left: h/70),
                              decoration: BoxDecoration(
                                color : Color(0xffA83063),
                                borderRadius : BorderRadius.all(Radius.elliptical(36, 36)),
                              ),
                              child: Center(
                                child: SvgPicture.asset("Assets/images/123323232.svg",width: w/13.5,),

                              ),
                            )
                          ],

                        ),
                      )



                    ],
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w,
                        child: Stack(
                          children: [

                            Positioned(
                              top: h/100,
                              left: h/35,
                              child: Container(
                                  width: w/2.7,
                                  height: h/17,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topRight: Radius.circular(30.5),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30.5),
                                      bottomLeft: Radius.circular(0),
                                    ),
                                    color : Color.fromRGBO(234, 234, 234, 1),
                                  ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children :[
                                      Text(""),
                                      Text('New Topic   ', textAlign: TextAlign.left, style: TextStyle(
                                          color: Color.fromRGBO(47, 47, 47, 1),
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 15,
                                          letterSpacing: 0 ,
                                          fontWeight: FontWeight.w600,
                                          height: 1
                                      ),),
                                    ]

                                ),
                              ),
                            ),
                            Container(
                              width: w/7,
                              height: h/13,
                              margin: EdgeInsets.only(left: h/70),
                              decoration: BoxDecoration(
                                color : Color(0xff942657),
                                borderRadius : BorderRadius.all(Radius.elliptical(36, 36)),
                              ),
                              child: Center(
                                child: SvgPicture.asset("Assets/images/notifiy.svg",width: w/13.5,),
                              ),
                            )

                          ],

                        ),
                      )


                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
               Container(
                        padding: EdgeInsets.only(left: h / 100, top: h / 50),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xff15D078),
                          child: Center(
                            child: IconButton(
                              icon: Image.asset("Assets/images/closee.png"),
                              onPressed: (){     Navigator.of(context).pop();},
                            )
                          ),
                        ),
                      ),

                  ],
                ),
              ],
            ),

              );
        });
  }

  _onRecordComplete() {
   //  print(records);
   //  records.sort();
   //  records = records.reversed.toList();
   //  setState(() {});
   //  print(records);
   // records.clear();
    appDirectory.list().listen((onData) {
      if (onData.path.contains('.aac')) records.add(onData.path);
    }).onDone(() {
      print(records);
      records.sort();
      records = records.reversed.toList();
      setState(() {});
      print(records);
    });
  }

  Future<void> CameraDialog() {
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

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final  imagePath = File(image.path);
    this.image = imagePath;
  }

}



