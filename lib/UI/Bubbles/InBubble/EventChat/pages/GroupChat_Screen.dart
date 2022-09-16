import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Bubbles/Sprints/SprintsLobby/pages/SprintLobby.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_state.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/FlowsOnlyChat.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/pages/FlowsChat_Screen.dart';
import 'package:bubbles/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
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
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:voice_message_package/voice_message_package.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class GroupChat extends StatefulWidget {
  GroupChat({Key? key,
    this.plan_Title,
    this.MY_ID,required
    this.bubble_id,
    this.Plan_Description,
    required  this.Bubble_Color,
    this.Want_LOcation_cHECK
  }) : super(key: key);
  String? plan_Title = "";
  String? Plan_Description = "";
  int? MY_ID;
  int bubble_id;
  int Bubble_Color;
  bool? Want_LOcation_cHECK=true;
  // FlowData?  flow;
  // bool IsNested;

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat>{
  final PanelController PanelControllerr = PanelController();
  FlowData  flow = FlowData();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _MediaDumpController = TextEditingController();
  final TextEditingController _FlowTitleController = TextEditingController();
  final TextEditingController _FlowDescriptionController = TextEditingController();
  final TextEditingController _SendMessageController = TextEditingController();
  final TextEditingController _SearchController = TextEditingController();
  final TextEditingController _PollQuestionController = TextEditingController();
  final TextEditingController _PollAnswer1Controller = TextEditingController();
  final TextEditingController _PollAnswer2Controller = TextEditingController();
  final TextEditingController _PollAnswer3Controller = TextEditingController();
  final TextEditingController _PollAnswer4Controller = TextEditingController();
  final _PollkeyQuestion = GlobalKey<FormState>();
  final _Pollkey1 = GlobalKey<FormState>();
  final _Pollkey2 = GlobalKey<FormState>();
  final _Pollkey3 = GlobalKey<FormState>();
  final _Pollkey4 = GlobalKey<FormState>();
  final _formkey11 = GlobalKey<FormState>();
  final _formkey12 = GlobalKey<FormState>();
  late FocusNode FocuseNODE;
  final ScrollController _controller = ScrollController();
  final ScrollController Controllerrr = ScrollController();
  final _GroupChatBloc = sl<GroupChatBloc>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  FocusNode _focus = FocusNode();
  Dio dio = Dio();

  late FocusNode FoucesNodeFlowTitle;
  late FocusNode FoucesNodeFlowDescription;
  late FocusNode FoucesNodePollQuestion;
  late FocusNode FoucesNodePollAnswer1;
  late FocusNode FoucesNodePollAnswer2;
  late FocusNode FoucesNodePollAnswer3;
  late FocusNode FoucesNodePollAnswer4;
  List<GroupChatMessage> messages = [];
  List<String> records = [];
  List<FrinedsData> UserDaata = [];
  List<String> Colorss =["0xff8D4624","0xff31576D", "0xffE0A41E","0xffE0A41E","0xff4ECEB6","0xff303030"

    ,"0xffDEDDBF","0xff77C08A","0xffD588B1","0xff7B78F5","0xffBA477A","0xff80BFC5","0xffEB9B5D","0xffCD6356"];
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
  String? base64String;
  Uint8List? Image1;
  Uint8List? Image122;
  File? filee;
  String? path;
  String? type;
  File? Fileee;
  List<String> TEMP = ["Selfie","Funny","Action","Memories"];
  final pref = sl<IPrefsHelper>();

  String Time_zonE= "";

  // Future<void> GetTimeZone() async {
  //   Time_zonE = await pref.GetTimeZone();
  //
  // }

  @override
  void initState() {
    super.initState();
    // GetTimeZone();
    _GroupChatBloc.add(GetOldMessages((b) =>
    b
      ..bubble_id = widget.bubble_id
      ..Time_Zone = Time_zonE
    ));
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(widget.Bubble_Color),
        //   systemNavigationBarColor: Color(widget.Bubble!.Color!),
      ),
    );
  ListenForWhoJoinedBUbble();
  ListenForWhoLeftBUbble();
    ListenForTopicFlows();
    ListenForMediaDumpFlows();
    ListenForPollFlows();
  sendIJoinedBubble(widget.bubble_id);
  DIditonce2 = false;
  Diditonces = true;
  Diditoncess = true;
    _focus = FocusNode();
    FocuseNODE = FocusNode();
    FoucesNodeFlowDescription = FocusNode();
    FoucesNodeFlowTitle = FocusNode();
    FoucesNodePollQuestion = FocusNode();
    FoucesNodePollAnswer1 = FocusNode();
    FoucesNodePollAnswer2 = FocusNode();
    FoucesNodePollAnswer3 = FocusNode();
    FoucesNodePollAnswer4 = FocusNode();



  _FlowDescriptionController.addListener(() {
    _GroupChatBloc.add(DescriptionLength((b) =>
    b..DescriptionLengthh = _FlowDescriptionController.text.length));
  });


    _GroupChatBloc.add(GetAlias((b) => b..My_ID = widget.MY_ID));
    print("Init state called again");
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

    _controller.addListener(() {
      if (_controller.position.atEdge){
          _GroupChatBloc.add(ShowFloatingActionButton((b) =>
          b..status = false
          ));

      }else {
        _GroupChatBloc.add(ShowFloatingActionButton((b) =>
        b..status = true
        ));
      }



    });
    _SearchController.addListener(() {

      if(_SearchController.text.isEmpty){
        _GroupChatBloc.add(SearchInsideBubbleUser((b) => b
          ..Keyword = _SearchController.text
        ));
      }else{
        _GroupChatBloc.add(SearchInsideBubbleUser((b) => b
          ..Keyword = _SearchController.text
        ));
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
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
          statusBarColor: Color(0xff303030),
          systemNavigationBarColor: Color(0xff303030)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
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

                if(msg["type"]=="audio"){
                  SetHisVoiceMessage(
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

                if (msg["Hiscolor"].toString().substring(10)=="text"){

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






                }
                else if ( msg["Hiscolor"].toString().substring(10) == "Backend"
                    ||msg["Hiscolor"].toString().substring(10)=="Uint8List"
                    ||msg["Hiscolor"].toString().substring(10)=="File"){


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
                }   else if (msg["Hiscolor"].toString().substring(10)=="ReplyVoice"){


                  SetHisReplyToVoice(
                    msg["message"],
                    msg["comment"],
                    msg["HisAlias"],
                    msg["Hisavatar"],
                    msg["Hiscolor"].toString().substring(0,10),
                    msg["avatar"] ,
                    msg["username"] ,
                    msg["color"],
                    msg["message_id"],
                  );
                }
                //
              }
            });
          }

          alreatDialogBuilder2(
              BuildContext Context,
              double h,
              double w,
              int Frined_id,
              int index,
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
                          topLeft: Radius.circular(8.285714149475098.r),
                          topRight:  Radius.circular(8.285714149475098.r),
                          bottomLeft:  Radius.circular(8.285714149475098.r),
                          bottomRight:  Radius.circular(8.285714149475098.r),
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
                                        fontSize: 20.sp,
                                  letterSpacing: 0.5 ,
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
                                        topLeft: Radius.circular(4.142857074737549.r),
                                        topRight:  Radius.circular(4.142857074737549.r),
                                        bottomLeft:  Radius.circular(4.142857074737549.r),
                                        bottomRight:  Radius.circular(4.142857074737549.r),
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
                                          fontSize: 19.571428298950195.sp,
                                          letterSpacing: 0.5 ,
                                          fontWeight: FontWeight.w500,
                                          height: 1
                                      ),),
                                    )
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  _GroupChatBloc.add(RemoveFriend((b) => b
                                    ..friend_id = Frined_id
                                      ..index = index
                                  ));
                                },
                                child: Container(
                                  width: w/3,
                                  height: h/15,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft:  Radius.circular(4.142857074737549.r),
                                      topRight:  Radius.circular(4.142857074737549.r),
                                      bottomLeft:  Radius.circular(4.142857074737549.r),
                                      bottomRight: Radius.circular(4.142857074737549.r),
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
                                        fontSize: 19.571428298950195.sp,
                                        letterSpacing: 0.5 ,
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
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(8.285714149475098.r),
                                        topRight:Radius.circular(8.285714149475098.r),
                                        bottomLeft: Radius.circular(8.285714149475098.r),
                                        bottomRight: Radius.circular(8.285714149475098.r),
                                      ),
                                      color : Color.fromRGBO(47, 47, 47, 1),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children:  [


                                              Container(
                                                margin: EdgeInsets.only(left: h/60),
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(state.FilteredInsideBubbleUsers![myINdex].Avatar.toString()),
                                                  radius:35.w,

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
                                                              20.sp)),
                                                    ),
                                                    Row(
                                                      children: [

                                                        Text(
                                                    state.FilteredInsideBubbleUsers![myINdex].Serial!,
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
                                                                13.sp)),
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
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 20.w),
                                                child:
                                                Text( state.FilteredInsideBubbleUsers![myINdex].boi.toString(), textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                    fontFamily: 'Red Hat Text',
                                                    fontSize: 12.sp,
                                                    letterSpacing: 0 ,
                                                    fontWeight: FontWeight.w300,
                                                    height: 1.4166666666666667
                                                ),)
                                            ),
                                          ],
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
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>     Navigator.push(
                                                  context,
                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                    builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![myINdex].ID!,His_Alias: state.FilteredInsideBubbleUsers![myINdex].Alias!,),),   ));
                                              },

                                              child: Container(
                                                  width: w/3,
                                                  height: h/15,
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(4.142857074737549.r),
                                                      topRight: Radius.circular(4.142857074737549.r),
                                                      bottomLeft: Radius.circular(4.142857074737549.r),
                                                      bottomRight: Radius.circular(4.142857074737549.r),
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
                                            is_me
                                                ?Text("")
                                                :
                                            InkWell(
                                              onTap: (){
                                                if (widget.MY_ID!= state.FilteredInsideBubbleUsers![myINdex].ID!) {
                                                  if (!is_frined) {
                                                    Navigator.pop(context);
                                                    _GroupChatBloc.add(
                                                        AddFrined((b) =>
                                                        b
                                                          ..serial = state
                                                              .FilteredInsideBubbleUsers![myINdex]
                                                              .Serial.toString()
                                                          ..index = myINdex
                                                        ));
                                                  } else {
                                                    alreatDialogBuilder2(
                                                        context, h, w,
                                                        frined_id, myINdex);
                                                  }
                                                }

                                              },
                                              child: Container(
                                                width: w/3,
                                                height: h/15,
                                                decoration: BoxDecoration(
                                                  borderRadius : BorderRadius.only(
                                                    topLeft: Radius.circular(4.142857074737549.r),
                                                    topRight: Radius.circular(4.142857074737549.r),
                                                    bottomLeft:Radius.circular(4.142857074737549.r),
                                                    bottomRight: Radius.circular(4.142857074737549.r),
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

                                                     is_frined
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

//Count/total*100 you get percent width size
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
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  return false;
                }
                return true;
              },
              child: Scaffold(
                key: _scaffoldKey,
                onEndDrawerChanged: (isOpened) {

                 if (isOpened){
                   _GroupChatBloc.add(GetUsersInsideBubble((b) => b
                     ..Bubble_id = widget.bubble_id
                   ));
                 }
                },
                endDrawer:Drawerr(w, h, context, state, alreatDialogBuilder, ColorS, _TextTheme),
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
                            child: Container(
                              width: w,
                              child: ListView.separated(
                                cacheExtent : 500,
                                controller: _controller,
                                shrinkWrap: true,
                                reverse: true,
                                scrollDirection: Axis.vertical,
                                itemCount: state.messages!.length,
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  return
                                      SwipeTo(
                                          onRightSwipe: () {
                                            // print(   state.messages![index].ModelType);
                                            // print( state.Image_type.toString());
                                            // // state.messages![index].ModelType=="Image"
                                            // //     ?
                                            // // state.Image_type.toString()=="Uint8List"
                                            // print(AllBubblesStatus);
                                            // print(AllBubblesIDS);
                                            bool GetInStatus = false;
                                            for(int j =0;j<AllBubblesIDS!.length;j++){
                                              if (widget.bubble_id==AllBubblesIDS![j]){
                                                if (AllBubblesStatus![j]==1)
                                                  GetInStatus = true;
                                              }
                                            }

                                            this.index = index;
                                            if ( GetInStatus || !widget.Want_LOcation_cHECK!) {

                                              if (state.messages![index].CanReply!) {
                                                //  print(state.messages![index].message);

                                                if (state.messages![index]
                                                    .ISreply == false) {
                                                  _focus.requestFocus();
                                                  SystemChannels.textInput
                                                      .invokeMethod(
                                                      'TextInput.show');
                                                  Message_id =
                                                  state.messages![index].ID!;


                                                  type = state.messages![index]
                                                      .ModelType.toString();

                                                  _GroupChatBloc.add(
                                                      ShowReplyWidget((b) =>
                                                      b
                                                        ..Type = state
                                                            .messages![index]
                                                            .ModelType.toString()
                                                        ..Isreply = true
                                                        ..ColorForRepliedTo = state
                                                            .messages![index]
                                                            .background_Color!
                                                            .toString()
                                                        ..RepliedToMessage = state
                                                            .messages![index]
                                                            .message
                                                            .toString()
                                                        ..AliasForRepliedTo = state
                                                            .messages![index]
                                                            .Alias
                                                            .toString()
                                                        ..AvatarPathForRepliedTo = state
                                                            .messages![index]
                                                            .Avatar
                                                            .toString()
                                                        ..Image1 = state
                                                            .messages![index]
                                                            .Image1
                                                        ..File_image = state
                                                            .messages![index]
                                                            .Image2
                                                        ..Image_type = state
                                                            .messages![index]
                                                            .Image_type
                                                        // ..is_Nodejs = state.messages![index].ISNOdeJS
                                                        // ..is_Backend = state.messages![index].IsBackEnd
                                                        //   ..Is_base64 = state.messages![index].is_base64
                                                      )
                                                  );

                                                  print(state.messages![index]
                                                      .message.toString());
                                                }
                                                else if (state.messages![index]
                                                    .ISreply == true) {

                                                  // idd = state.OldMessages!.messages![index].replies![0].id!;
                                                  // _ChatBloc_Bloc.add(ShowReplyWidget((b) =>
                                                  // b
                                                  //   ..Isreply = true
                                                  //   ..ColorForRepliedTo = 0xff4caf50
                                                  //   ..RepliedToMessage = messages[index].ReplierMessage.toString()
                                                  //   ..AliasForRepliedTo = messages[index].ReplierAlias.toString()
                                                  //   ..AvatarPathForRepliedTo =messages[index].ReplierAvatar.toString()
                                                  // ));
                                                }
                                              }
                                            }else{
                                              OutsideBubbleAlreat();
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top:index==state.messages!.length-1? h/13:0),
                                            padding: EdgeInsets.only(
                                                left: h / 50),
                                            child:
                                            state.success!
                                                ? state.messages![index].ModelType == "Message"
                                                ? Container(
                                              width:
                                              w / 1.3,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Stack(
                                                            children :[
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);
                                                                        },
                                                                        child: CircleAvatar(
                                                                          backgroundColor: Color(state
                                                                              .messages![index]
                                                                              .background_Color!),
                                                                          backgroundImage: NetworkImage(state
                                                                              .messages![index]
                                                                              .Avatar
                                                                              .toString()),
                                                                          radius: 20.w,

                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10,),
                                                                      Container(
                                                                        margin: EdgeInsets.only(bottom: h/50),
                                                                        child: Text(
                                                                          state.messages![index].Alias.toString(),
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style:
                                                                          _textthem.headline3!.copyWith(
                                                                              color: COLOR.errorContainer,
                                                                              fontWeight: FontWeight.w400,
                                                                            fontSize: 13.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          state.messages![index].time!,
                                                                          textAlign: TextAlign.right,
                                                                          style: _textthem.headline2!.copyWith(
                                                                              fontWeight: FontWeight.w300,
                                                                              color:  Color(0xffEAEAEA),
                                                                              fontSize: 9.sp
                                                                          )),
                                                                      SizedBox(width: 10,),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                              Container(
                                                                width: w /  1.4,
                                                                margin: EdgeInsets.only(right: w/100),
                                                                child: Text(
                                                                    state.messages![index].message
                                                                        .toString(),
                                                                    textAlign:
                                                                    TextAlign.left,
                                                                    style: GoogleFonts.roboto().copyWith(
                                                                        color: Colors.transparent,
                                                                        fontWeight: FontWeight.w300,
                                                                        fontSize: 11.sp
                                                                    )),
                                                              ),
                                                            ]
                                                        ),
                                                        SizedBox(height: 5,),



                                                      ],
                                                    ),
                                                  ),

                                                  Positioned(
                                                    bottom: 0,
                                                    left: 0,
                                                    right: 0,
                                                    child: Container(
                                                      width: w /  1.4,
                                                      color: Colors.transparent,
                                                      margin: EdgeInsets.only(bottom: 0,right: 0,top:h/20,left: w/7),
                                                      child:Text(
                                                          state.messages![index].message
                                                              .toString(),
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: GoogleFonts.roboto().copyWith(
                                                              color:  Color(0xffEAEAEA),
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 11.sp
                                                          )),

                                                      // Text(
                                                      // state.messages![index].message
                                                      //     .toString(),
                                                      // textAlign:
                                                      // TextAlign.left,
                                                      // style: _textthem.headline2!.copyWith(
                                                      //
                                                      //   fontWeight: FontWeight.w300,
                                                      //    fontSize: 0.23.sp
                                                      // )),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            )
                                                : state.messages![index].ModelType == "Image"
                                                ? Container(
                                              width:
                                              w / 1.3,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: (){
                                                                  //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

                                                                },
                                                                child: CircleAvatar(
                                                                  backgroundColor: Color(state
                                                                      .messages![index]
                                                                      .background_Color!),
                                                                  backgroundImage: NetworkImage(state
                                                                      .messages![index]
                                                                      .Avatar
                                                                      .toString()),
                                                                  radius: 20.w,
                                                                ),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              Container(
                                                                margin: EdgeInsets.only(bottom: h/50),
                                                                child: Text(
                                                                  state.messages![index].Alias.toString(),
                                                                  textAlign:
                                                                  TextAlign.left,
                                                                  style:
                                                                  _textthem.headline3!.copyWith(
                                                                    color: COLOR.errorContainer,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 13.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  state.messages![index].time!,
                                                                  textAlign: TextAlign.right,
                                                                  style: _textthem.headline2!.copyWith(
                                                                    fontWeight: FontWeight.w300,
                                                                    color:  Color(0xffEAEAEA),
                                                                      fontSize: 9.sp
                                                                  )),
                                                              SizedBox(width: 10,),
                                                            ],
                                                          )
                                                        ],
                                                      ),


                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      !state.messages![index].MessageSettledWIthID!?
                                                      SpinKitDualRing(
                                                        color: Colors.white,
                                                        size: h/80.0,
                                                      ):Text(""),
                                                      Container(
                                                        margin: EdgeInsets.only(left: h/14),
                                                        child: Row(
                                                          children: [

                                                            state.messages![index].Image_type.toString()=="Uint8List"
                                                                ? Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){
                                                                    WidgetsBinding.instance
                                                                        .addPostFrameCallback((_) =>     Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                        builder: (context) =>
                                                                            HeroImage( Uint8List2 : state.messages![index].Image1!, Image_Type: 'Uint8List',id: state.messages![index].ID, Message_Time: state.messages![index].time!, Sender_Avatar: state.messages![index].Avatar, Sender_Color: state.messages![index].background_Color, Sender_Alias: state.messages![index].Alias,),),
                                                                    ));

                                                                  },
                                                                  child: Hero(
                                                                      tag: "Image${state.messages![index].ID}",
                                                                      child: Material(
                                                                          type: MaterialType.transparency,
                                                                          child :Container(
                                                                              height: h / 4,
                                                                              child: ClipRRect(
                                                                                  child:Image.memory(state.messages![index].Image1!)
                                                                              )))),
                                                                ),
                                                              ],
                                                            )
                                                                : state.messages![index].Image_type.toString()=="Backend"
                                                                ?

                                                            InkWell(
                                                                onTap: (){
                                                                  WidgetsBinding.instance
                                                                      .addPostFrameCallback((_) =>     Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                      builder: (context) =>
                                                                          HeroImage( path : state.messages![index].message!, Image_Type: 'Backend',id: state.messages![index].ID, Message_Time: state.messages![index].time!, Sender_Avatar: state.messages![index].Avatar, Sender_Color: state.messages![index].background_Color, Sender_Alias: state.messages![index].Alias,),),
                                                                  ));

                                                                },
                                                                child: Hero(
                                                                  tag: "Image${state.messages![index].ID}",
                                                                  child:  Material(
                                                                      type: MaterialType.transparency,
                                                                      child :


                                                                      CachedNetworkImage(
                                                                        imageUrl:state.messages![index].message!,
                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                          height: h / 4,
                                                                          width: w/3,

                                                                          decoration: BoxDecoration(
                                                                            image:DecorationImage(image: imageProvider,
                                                                                fit: BoxFit.fitHeight
                                                                            ),

                                                                          ),

                                                                        ),
                                                                        placeholder: (context, url) => Container(
                                                                            height: h / 4,child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            CircularProgressIndicator(),
                                                                          ],
                                                                        )),
                                                                        errorWidget: (context, url, error) => Container(
                                                                            height: h / 4,child: Icon(Icons.error)),
                                                                      )),

                                                                )
                                                            )


                                                                :  Row(
                                                              children: [
                                                                InkWell(
                                                                    onTap: (){
                                                                      WidgetsBinding.instance
                                                                          .addPostFrameCallback((_) =>     Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                          builder: (context) =>
                                                                              HeroImage( Image : state.messages![index].Image2!, Image_Type: 'File',id: state.messages![index].ID, Message_Time: state.messages![index].time!, Sender_Avatar: state.messages![index].Avatar, Sender_Color: state.messages![index].background_Color, Sender_Alias: state.messages![index].Alias,),),
                                                                      ));

                                                                    },
                                                                    child: Hero(
                                                                        tag: "Image${state.messages![index].ID}",
                                                                        child: Material(
                                                                            type: MaterialType.transparency,
                                                                            child :Container(
                                                                                height: h / 4,
                                                                                child: ClipRRect(
                                                                                    child:Image.file(state.messages![index].Image2!)
                                                                                ))))),
                                                              ],
                                                            )
                                                          ],

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                                : state.messages![index].ModelType == "Voice"
                                                ? Container(
                                              width:
                                              w / 1.3,
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: (){
                                                                  //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

                                                                },
                                                                child: CircleAvatar(
                                                                  backgroundColor: Color(state
                                                                      .messages![index]
                                                                      .background_Color!),
                                                                  backgroundImage: NetworkImage(state
                                                                      .messages![index]
                                                                      .Avatar
                                                                      .toString()),
                                                                  radius: 20.w,
                                                                ),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              Container(
                                                                margin: EdgeInsets.only(bottom: h/50),
                                                                child: Text(
                                                                  state.messages![index].Alias.toString(),
                                                                  textAlign:
                                                                  TextAlign.left,
                                                                  style:
                                                                  _textthem.headline3!.copyWith(
                                                                    color: COLOR.errorContainer,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 13.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  state.messages![index].time!,
                                                                  textAlign: TextAlign.right,
                                                                  style: _textthem.headline2!.copyWith(
                                                                    fontWeight: FontWeight.w300,
                                                                    color:  Color(0xffEAEAEA),
                                                                      fontSize: 9.sp
                                                                  )),
                                                              SizedBox(width: 10,),
                                                            ],
                                                          )
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                  Container(
                                                    width: w / 1.2,
                                                    margin: EdgeInsets.only(left: h/14),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        VoiceMessage(
                                                          audioSrc: state.messages![index].message.toString(),
                                                          played: false,
                                                          me: false,
                                                        ),
                                                         Text(""),
                                                         Text(""),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                                : state .messages![index].ModelType == "ReplyMessage"
                                                ? Container(
                                                width: w / 1.3,
                                                child: Stack(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            height: h / 25,
                                                            child:  Row(
                                                              children: [
                                                                Container(
                                                                  height: w / 400,
                                                                  width: h / 34,
                                                                ),
                                                                Container(
                                                                  color:  Color(0xffEAEAEA),
                                                                  width: w / 400,
                                                                  height: h / 50,
                                                                  margin: EdgeInsets.only(top: h/105,bottom: h/105),
                                                                ),
                                                                Container(
                                                                  color:  Color(0xffEAEAEA),
                                                                  height: w / 400,
                                                                  width: h / 34,
                                                                  margin: EdgeInsets.only(bottom: h/55),
                                                                ),
                                                                Container(
                                                                  width:
                                                                  w / 1.6,
                                                                  height:
                                                                  h / 30,
                                                                  child:
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [

                                                                      Flexible(
                                                                        child:    Row(
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(bottom: h/150),
                                                                              child: Row(
                                                                                children: [
                                                                                  CircleAvatar(
                                                                                    radius: 10.w,
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
                                                                                    style: TextStyle(
                                                                                        color:  Color.fromRGBO(147, 147, 147, 1),
                                                                                        fontFamily: 'Red Hat Text',
                                                                                        fontSize: 9.sp,letterSpacing: 0
                                                                                        ,
                                                                                        fontWeight: FontWeight.w500, height: 1),
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
                                                                                        style: GoogleFonts.roboto().copyWith(
                                                                                          color:  Color(0xffEAEAEA),
                                                                                          fontWeight: FontWeight.w300,
                                                                                          fontSize: 7.54.sp
                                                                                        )

                                                                                    ),
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
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

                                                                    },
                                                                    child:    CircleAvatar(
                                                                      backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                                      backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                                      radius: 20.w,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 10,),
                                                                  Container(
                                                                    margin: EdgeInsets.only(bottom: h/50),
                                                                    child: Text(
                                                                      state.messages![index].ReplierAlias.toString(),
                                                                      textAlign:
                                                                      TextAlign.left,
                                                                      style:
                                                                      _textthem.headline3!.copyWith(
                                                                        color: COLOR.errorContainer,
                                                                        fontWeight: FontWeight.w400,
                                                                        fontSize: 13.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      state.messages![index].Repliertime!,
                                                                      textAlign: TextAlign.right,
                                                                      style: _textthem.headline2!.copyWith(
                                                                        fontWeight: FontWeight.w300,
                                                                        color:  Color(0xffEAEAEA),
                                                                          fontSize: 9.sp
                                                                      )),
                                                                  SizedBox(width: 10,),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            width: w /  1.4,
                                                            color: Colors.transparent,
                                                            margin: EdgeInsets.only(left: h/50),
                                                            child: Text(
                                                                state.messages![index].ReplierMessage.toString(),
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: GoogleFonts.roboto().copyWith(
                                                                    color: Colors.transparent,
                                                                    fontWeight: FontWeight.w300,
                                                                    fontSize: 11.sp
                                                                )),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        width: w/1.3,
                                                        color: Colors.transparent,
                                                        margin: EdgeInsets.only(bottom: 0,right: 0,top:h/12,left: w/7),
                                                        child:Text(
                                                            state.messages![index].ReplierMessage.toString(),
                                                            textAlign:
                                                            TextAlign.left,
                                                            style: GoogleFonts.roboto().copyWith(
                                                                color:  Color(0xffEAEAEA),
                                                                fontWeight: FontWeight.w300,
                                                                fontSize: 11.sp
                                                            )),
                                                      ),

                                                    ]
                                                )
                                            )
                                                : state .messages![index].ModelType == "ReplyVoice"
                                                ? Container(
                                              //  color: Colors.red,
                                                width: w / 1.3,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                height: h / 25,
                                                                child:  Row(
                                                                  children: [
                                                                    Container(
                                                                      height: w / 400,
                                                                      width: h / 34,
                                                                    ),
                                                                    Container(
                                                                      color:  Color(0xffEAEAEA),
                                                                      width: w / 400,
                                                                      height: h / 50,
                                                                    ),
                                                                    Container(
                                                                      color:  Color(0xffEAEAEA),
                                                                      height: w / 400,
                                                                      width: h / 34,
                                                                      margin: EdgeInsets.only(bottom: h/55),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                      w / 1.5,
                                                                      height:
                                                                      h / 30,
                                                                      child:
                                                                      Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        children: [

                                                                          Flexible(
                                                                            child:    Row(
                                                                              children: [
                                                                                SizedBox(width: w/250,),

                                                                                Container(
                                                                                  margin: EdgeInsets.only(bottom: h/150),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      CircleAvatar(
                                                                                        radius: 10.w,
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
                                                                                        style: TextStyle(
                                                                                            color:  Color.fromRGBO(147, 147, 147, 1),
                                                                                            fontFamily: 'Red Hat Text',  fontSize: 9.sp,
                                                                                            letterSpacing: 0 , fontWeight: FontWeight.w500, height: 1),
                                                                                      ),
                                                                                       SizedBox(
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
                                                                                              fontSize: 7.539999961853027.sp,
                                                                                              letterSpacing: 0 ,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              height: 1
                                                                                          ),)),
                                                                                    ],
                                                                                  ),
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
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

                                                                        },
                                                                        child:    CircleAvatar(
                                                                          backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                                          backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                                          radius: 20.w,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 5,),
                                                                      Container(
                                                                        margin: EdgeInsets.only(bottom: h/50),
                                                                        child: Text(
                                                                          state.messages![index].ReplierAlias.toString(),
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style:
                                                                          _textthem.headline3!.copyWith(
                                                                            color: COLOR.errorContainer,
                                                                            fontWeight: FontWeight.w400,
                                                                            fontSize: 13.sp,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          state.messages![index].Repliertime!,
                                                                          textAlign: TextAlign.right,
                                                                          style: _textthem.headline2!.copyWith(
                                                                            fontWeight: FontWeight.w300,
                                                                            color:  Color(0xffEAEAEA),
                                                                              fontSize: 9.sp
                                                                          )),
                                                                      SizedBox(width: 10,),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),

                                                          Container(
                                                            width: w /  1.4,
                                                            margin: EdgeInsets.only(left: h/100),
                                                            child: Text(
                                                                state.messages![index].ReplierMessage.toString(),
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: GoogleFonts.roboto().copyWith(
                                                                    color: Colors.transparent,
                                                                    fontWeight: FontWeight.w300,
                                                                    fontSize: 11.sp
                                                                )),
                                                          ),
                                                        ]
                                                    ),


                                                    Container(
                                                      width: w/1.3,
                                                      color: Colors.transparent,
                                                      margin: EdgeInsets.only(bottom: 0,right: 0,top:h/12,left: w/7.5),
                                                      child: Text(
                                                          state.messages![index].ReplierMessage.toString(),
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: GoogleFonts.roboto().copyWith(
                                                              color:  Color(0xffEAEAEA),
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 11.sp
                                                          )),
                                                    )

                                                  ],
                                                )
                                            )
                                                : state .messages![index].ModelType == "ReplyImage"
                                                ? Container(
                                                width: w / 1.3,
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                height: h / 25,
                                                                child:  Row(
                                                                  children: [
                                                                    Container(
                                                                      height: w / 400,
                                                                      width: h / 34,
                                                                    ),
                                                                    Container(
                                                                      color:  Color(0xffEAEAEA),
                                                                      width: w / 400,
                                                                      height: h / 50,
                                                                    ),
                                                                    Container(
                                                                      color:  Color(0xffEAEAEA),
                                                                      height: w / 400,
                                                                      width: h / 34,
                                                                      margin: EdgeInsets.only(bottom: h/55),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                      w / 1.5,
                                                                      height:
                                                                      h / 30,
                                                                      child:
                                                                      Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        children: [

                                                                          Flexible(
                                                                            child:    Row(
                                                                              children: [
                                                                                SizedBox(width: w/250,),

                                                                                Container(
                                                                                  margin: EdgeInsets.only(bottom: h/150),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      CircleAvatar(
                                                                                        radius: 10.w,
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
                                                                                        style: TextStyle(
                                                                                            color:  Color.fromRGBO(147, 147, 147, 1),
                                                                                            fontFamily: 'Red Hat Text', fontSize: 9.sp,
                                                                                            letterSpacing: 0 , fontWeight: FontWeight.w500, height: 1),
                                                                                      ),
                                                                                       SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Container(
                                                                                        width: w / 5,
                                                                                        height: h / 10,
                                                                                        child:

                                                                                        state.messages![index].Image_type.toString()=="Uint8List"
                                                                                            ? InkWell(
                                                                                          onTap: (){

                                                                                          },

                                                                                          child: Container(
                                                                                              height: h / 10,
                                                                                              child:
                                                                                              Image.memory(state.messages![index].Image1!,)
                                                                                          ),
                                                                                        )
                                                                                            : state.messages![index].Image_type.toString()=="Backend"
                                                                                            ?Row(
                                                                                          children: [
                                                                                            InkWell(
                                                                                                onTap: (){

                                                                                                },
                                                                                                child:
                                                                                                Container(
                                                                                                    height: h / 10,
                                                                                                    child:
                                                                                                    Image.network(state.messages![index].RepliedTOMessage!,)


                                                                                                )),
                                                                                          ],
                                                                                        )
                                                                                            :Row(
                                                                                          children: [
                                                                                            InkWell(
                                                                                                onTap: (){

                                                                                                },
                                                                                                child:
                                                                                                Container(
                                                                                                    height: h / 10,
                                                                                                    child:Image.file(state.messages![index].Image2!,)
                                                                                                )
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
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
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

                                                                        },
                                                                        child:    CircleAvatar(
                                                                          backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                                                          backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                                                          radius: 20.w,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 5,),
                                                                      Container(
                                                                        margin: EdgeInsets.only(bottom: h/50),
                                                                        child: Text(
                                                                          state.messages![index].ReplierAlias.toString(),
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style:
                                                                          _textthem.headline3!.copyWith(
                                                                            color: COLOR.errorContainer,
                                                                            fontWeight: FontWeight.w400,
                                                                                    fontSize: 13.sp
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          state.messages![index].Repliertime!,
                                                                          textAlign: TextAlign.right,
                                                                          style: _textthem.headline2!.copyWith(
                                                                            fontWeight: FontWeight.w300,
                                                                            color:  Color(0xffEAEAEA),
                                                                              fontSize: 9.sp
                                                                          )),
                                                                      SizedBox(width: 10,),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                          Container(
                                                            width: w /  1.4,
                                                            margin: EdgeInsets.only(left: h/100),
                                                            child: Text(
                                                                state.messages![index].ReplierMessage.toString(),
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: GoogleFonts.roboto().copyWith(
                                                                    color: Colors.transparent,
                                                                    fontWeight: FontWeight.w300,
                                                                    fontSize: 11.sp
                                                                )),

                                                          ),
                                                        ]
                                                    ),
                                                    Container(
                                                      width: w/1.3,
                                                      color: Colors.transparent,
                                                      margin: EdgeInsets.only(bottom: 0,right: 0,top:h/12,left: w/7.5),
                                                      child: Text(
                                                          state.messages![index].ReplierMessage.toString(),
                                                          textAlign:
                                                          TextAlign.left,
                                                          style: GoogleFonts.roboto().copyWith(
                                                              color:  Color(0xffEAEAEA),
                                                              fontWeight: FontWeight.w300,
                                                              fontSize: 11.sp
                                                          )),
                                                    )

                                                  ],
                                                )
                                            )
                                                : state.messages![index].ModelType =="TopicFlow"
                                                ? TopicFlowWidget(  state,index,state.messages![index].ID!)
                                                : state.messages![index].ModelType == "PollFlow"
                                                ? PollFlowWidget(state, index)
                                                : state.messages![index].ModelType == "MediaDump"
                                                ? MediaDumpWidget(state, index)
                                                :  Text("")
                                                :  Text("empty"),

                                          ));
                                },
                                separatorBuilder:
                                    (BuildContext context,
                                    int index) {
                                  return SizedBox(
                                    height: h / 50,
                                  );
                                },
                              ),
                            )
                          )
                              : state.isLoading!
                              ?  Expanded(
                                child: Container(
                            
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
                                )),
                              )
                              :  Expanded(
                                child: Container(
                                      width: w,
                                      height: h / 3,
                                      child: Text(""),
                                    ),
                              ),



                                Container(
                                  height:state.Isreply!?h/7: h / 12,
                                  decoration: BoxDecoration(
                                      boxShadow:  [
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
                                      
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [

                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: h / 100,
                                        ),
                                              child: CircleAvatar(
                                                radius: 20.w,
                                                backgroundColor: Color(widget.Bubble_Color),
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
                                                      if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                                        dIALOG1();
                                                        _GroupChatBloc.add(ChangeFlowOptionsStatus((b) =>
                                                        b..status = true
                                                        ));
                                                      }else{
                                                        OutsideBubbleAlreat();
                                                      }
                                                    },
                                                    child:  Icon(
                                                      state.FlowOptionsOpened!?Icons.arrow_drop_down_sharp:
                                                      Icons.add,
                                                      size: 30,
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
                                                  Want_test: widget.Want_LOcation_cHECK!,
                                                ),
                                                Container(
                                                  width: w / 10,
                                                  child: IconButton(
                                                      onPressed: (){
                                                bool GetInStatus = false;
                                                for(int j =0;j<AllBubblesIDS!.length;j++){
                                                if (widget.bubble_id==AllBubblesIDS![j]){
                                                if (AllBubblesStatus![j]==1)
                                                GetInStatus = true;
                                                    }
                                                }

                                                if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                                  PhotoFlowBottomSheet("ImageOnChat");
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
                                                :  Text(""),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: w / 100, top: h / 100,bottom: h/100,right: w/40),
                                                width: state.KetbaordStatuss!
                                                    ? w / 1.4
                                                    : w / 1.6,
                                                height: h / 14.5,
                                                child: Form(
                                                    key: _formkey3,
                                                    child: TextFormField(
                                                      controller: _SendMessageController,
                                                      keyboardAppearance: Brightness.dark,
                                                      textInputAction:
                                                      TextInputAction.done,
                                                      focusNode: _focus,
                                                      style : GoogleFonts.roboto().copyWith(
                                                          color: Colors.brown,
                                                          fontSize: 19.sp,
                                                          fontWeight: FontWeight.w500,
                                                          height: 1
                                                      ),
                                                      onChanged: (value) {
                                                        if (_SendMessageController.text.isNotEmpty) {
                                                          _GroupChatBloc.add(
                                                              KetbaordStatus((b) => b..status = true)); //toggle ui view
                                                        } else {
                                                          _GroupChatBloc.add(KetbaordStatus((b) => b..status = false));
                                                        }
                                                      },

                                                      onFieldSubmitted: (value)async {

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


                                                        if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                                  if (_SendMessageController
                                                      .text.trim().length!=0) {
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
                                                            ShowReplyWidget((b) => b..Isreply = false));

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
                                                            ShowReplyWidget((b) => b..Isreply = false));


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
                                                                b..Isreply = false));


                                                        SetmyReplyToVoice(
                                                          Comment, state
                                                            .AliasForRepliedTo!,
                                                          state
                                                              .AvatarPathForRepliedTo!,
                                                          state.ColorForRepliedTo!
                                                          ,
                                                          Message_id,
                                                        );
                                                        //     SetMyReplyToImage(state.RepliedToMessage!,Comment,state.type!);


                                                      }
                                                      else if (_SendMessageController
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
                                                  }

                                                        }else{
                                                          OutsideBubbleAlreat();
                                                        }

                                                        _SendMessageController.clear();


                                                      },
                                                      cursorColor: Colors.black,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                30)),
                                                        filled: true,
                                                        fillColor:
                                                         Color(0xffEAEAEA),
                                                        contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: h / 100),
                                                        hintText: 'Sup?..',
                                                        hintStyle:  TextStyle(
                                                            color: Color.fromRGBO(
                                                                96, 96, 96, 1),
                                                            fontFamily: 'Red Hat Text',
                                                            fontSize: 13.sp,
                                                            letterSpacing:
                                                            0 ,
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
                                                          child: IconButton(
                                                            icon:  Icon(
                                                              Icons.send,
                                                              size: 30,
                                                              color: Color(widget.Bubble_Color),
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


                                                              if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                                                if (_SendMessageController
                                                                    .text.trim().length!=0) {
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
                                                                          ShowReplyWidget((b) => b..Isreply = false));

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
                                                                          ShowReplyWidget((b) => b..Isreply = false));


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
                                                                              b..Isreply = false));


                                                                      SetmyReplyToVoice(
                                                                        Comment, state
                                                                          .AliasForRepliedTo!,
                                                                        state
                                                                            .AvatarPathForRepliedTo!,
                                                                        state.ColorForRepliedTo!
                                                                        ,
                                                                        Message_id,
                                                                      );
                                                                      //     SetMyReplyToImage(state.RepliedToMessage!,Comment,state.type!);


                                                                    }
                                                                    else if (_SendMessageController
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
                                                                }
                                                                _SendMessageController.clear();
                                                              }else{
                                                                OutsideBubbleAlreat();
                                                              }

                                                              _SendMessageController.clear();


                                                            },
                                                            color:  Color(
                                                                0xff15D078),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                 SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            )
                                                :  Text("")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                        ],
                      ),
                      Container(
                        child :
                      state.FlowList!.length!=0?
                      SlidingUpPanel(
                          controller: PanelControllerr,
                          color: ColorS.onPrimaryContainer,
                          maxHeight: h/4,
                          minHeight: h/9.5,
                          slideDirection: SlideDirection.DOWN,
                          onPanelOpened: () {
                            // print(state.FlowList![2].Flow_type);
                            // print(state.FlowList![2].Title);
                            Controllerrr.animateTo(
                              Controllerrr.position
                                  .minScrollExtent,
                              duration: Duration(
                                  milliseconds: 2000),
                              curve: Curves.easeIn,
                            );
                          },
                          borderRadius:  BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          panel: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              width: w,
                              height: h * 2,
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  state.success!?
                                  Container(
                                    width: w,
                                    height: h/6,
                                    margin: EdgeInsets.only(top: h/20),
                                    child:  ListView.separated(
                                      cacheExtent : 500,
                                      shrinkWrap: true,
                                      reverse: false,
                                      controller: Controllerrr,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.FlowList!.length,
                                      itemBuilder: (BuildContext context,
                                      int index) {
                                        return
                                          Row(
                                            children: [

                                              InkWell(

                                                onTap: (){
                                                  print(state.FlowList![index].FlowMessage_id);
                                        if (state.FlowList![index].Flow_type=="TopicFlow") {
                                              TopicFlowDialog(
                                                  state.FlowList![index], index,
                                                );
                                        }else if (state.FlowList![index].Flow_type=="MediaDump"){
                                                    MediaDumpDialog(state.FlowList![index], index,
                                                    );
                                        }else if (state.FlowList![index].Flow_type=="PollFlow"){
                                              PollFlowDialog (state.FlowList![index], index,
                                              );
                                        }else if (state.FlowList![index].Flow_type==""){

                                        }

                                        },
                                                child: Stack(
                                                children: [
                                      CircleAvatar(
                                        radius: h/15,
                                        backgroundColor: Color(state.FlowList![index].Color!),
                                        child: SvgPicture.asset(state.FlowList![index].Flow_Icon!,width: h/23,)
                                        ),

                                                  Positioned(
                                                    top: h/11,
                                                    left: h/12,
                                                    child: CircleAvatar(
                                                      backgroundImage: NetworkImage(state.FlowList![index].Who_Made_it_Avatar!),
                                                      backgroundColor: Color(state.FlowList![index].Who_Made_it_Color!),
                                                      radius: 13,
                                                    ),
                                                  ),
                                                ],
                                        ),
                                              ),

                                              index==state.FlowList!.length-1?
                                              Row(
                                                children: [
                                                  SizedBox(width: 10,),
                                                  Stack(
                                                    children: [
                                                      InkWell(
                                                        onTap: (){

                                                          WidgetsBinding.instance
                                                              .addPostFrameCallback((_) => Navigator.push(
                                                            context,

                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    FlowPostsChat(
                                                                      plan_Title:widget.plan_Title,
                                                                      MY_ID: widget.MY_ID,
                                                                      bubble_id: widget.bubble_id,
                                                                      Plan_Description: widget.Plan_Description!,
                                                                      Bubble_Color: widget.Bubble_Color,
                                                                      data: state.FlowList!,

                                                                    )),
                                                          ));
                                                        },
                                                        child: CircleAvatar(
                                                            radius: h/15,
                                                            backgroundColor: Color(0xffC4C4C4),
                                                            child: SvgPicture.asset("Assets/images/reshap1.svg",width: w/12,)

                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ):Text("")
                                            ],
                                          );
                                      }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 10,); },
                                                                ),
                                  ):
                                  state.isLoading!
                                      ? Container(
                                        width: w,
                                        height: h/6,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: listLoader(
                                                    context: context)),
                                          ],
                                        ),
                                  )
                                      :   Container(
                                      width: w,
                                    height: h/6,
                                      child: Text(""),

                                  ),

                                  Container(
                                    width: w / 3.9,
                                    height: h / 130,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      color: ColorS.onTertiary,
                                    ),
                                    //
                                  ),
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                ],
                              ))):Text(""),),

                      Container(
                        width: w,
                        height: h / 15,
                        decoration:  BoxDecoration(
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
                            color: Color(widget.Bubble_Color)
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
                                          width: 30.w,
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
                                  style: GoogleFonts.roboto().copyWith(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 18.sp,
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
                                    // _scaffoldKey.currentState!
                                    //     .openEndDrawer();
                                    bool GetInStatus = false;
                                    for(int j =0;j<AllBubblesIDS!.length;j++){
                                      if (widget.bubble_id==AllBubblesIDS![j]){
                                        if (AllBubblesStatus![j]==1)
                                          GetInStatus = true;
                                      }
                                    }

                                    if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
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
                floatingActionButton: Container(
          child :
                state.ShowFloatingActionButtonn!?
                Container(

                  margin: EdgeInsets.only(bottom: state.Isreply!?h/8: h/14),
                    child: FloatingActionButton(onPressed: () {
                      _controller.animateTo(
                        _controller.position
                            .minScrollExtent,
                        duration: Duration(
                            milliseconds: 200),
                        curve: Curves.easeIn,
                      );
                    },
                    backgroundColor:Color(widget.Bubble_Color),
                      child: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: h/20,),
                    )

                )
                    :Text("")
                )
              ));
        });
  }

  Widget Drawerr(double w, double h, BuildContext context, GroupChatState state, Future<dynamic> alreatDialogBuilder(BuildContext Context, double h, double w, int myINdex, bool is_frined, bool is_me, int frined_id), ColorScheme ColorS, TextTheme _TextTheme) {
    return Container(
      width: w/1.14,
      child:
                     Drawer(

                      child: SafeArea(
                        child:

                        SingleChildScrollView(
                          child: Column(
                            children: [
                             Container(
                                  width: w,
                             color: Color(widget.Bubble_Color),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Row(
                                  children: [
                                  IconButton(
                                      onPressed: (){
                          Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back_ios_outlined,color: Color(0xff303030),size: 15,)),
                          Text(widget.plan_Title.toString(),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto().copyWith(
                                color: Color.fromRGBO(47, 47, 47, 1),
                                fontSize: 18.sp,
                                letterSpacing: 0 ,
                                fontWeight: FontWeight.w800,
                                height: 1
                            ),
                          ),

                          ],
                      ),

                                          // Container(
                                          //   margin: EdgeInsets.only(right: h/100),
                                          //   child: IconButton(
                                          //       onPressed: (){
                                          //         Navigator.pop(context);
                                          //       }, icon:
                                          //   SvgPicture.asset(
                                          //     "Assets/images/Gallary.svg",
                                          //     width: w / 16,
                                          //   )
                                          //   ),
                                          // ),

                                        ],
                                      ),
                                      Container(
                                        width: w/1.2,
                                        margin: EdgeInsets.all(5.w),
                                        child: Center(
                                          child:
                                              Text(widget.Plan_Description.toString(),
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto().copyWith(
                                                    color: Color.fromRGBO(47, 47, 47, 1),
                                                    fontSize: 10.sp,
                                                    letterSpacing: 0 ,
                                                    fontWeight: FontWeight.w800,
                                                    height: 1
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              SingleChildScrollView(
                                  child:  Container(
                                      width: w,
                                    height: h/1.3,
                                      child:
                                      Column(
                                        children: [
                                          SizedBox(height: h/100,),
                                          state.ChangeSearchStatus!?

                                    Column(
                                      children: [
                                        SizedBox(height: h/40,),
                                        InkWell(
                                          onTap: (){
                                            if (state.GetUsersInsideBubble!.users!.length>1)
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SprintLobby(plan_title: widget.plan_Title!,Bubble_id: widget.bubble_id,my_id: widget.MY_ID!, Color:widget.Bubble_Color,)),
                                              ));
                                            else{
                                              CommingSoonPopup(context, h, w, "No one is in bubble to match make with!", "OK", 18);
                                            }
                                          },
                                          child: Container(
                                            width: w/1.38,
                                            height: h/10.5,
                                            decoration: BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(50.r),
                                                topRight: Radius.circular(5.r),
                                                bottomLeft: Radius.circular(50.r),
                                                bottomRight: Radius.circular(5.r),
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
                                                        color: Color(widget.Bubble_Color),
                                                        width: w/5,
                                                      ),
                                                      Positioned(
                                                        top: h/26,
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
                                                                    fontSize: 16.sp,
                                                                    letterSpacing: 0 ,
                                                                    fontWeight: FontWeight.w900,
                                                                    height: 1
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                    text: " Users",
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(234, 234, 234, 1),
                                                                        fontFamily: 'Red Hat Text',
                                                                        fontSize: 14.sp,
                                                                        letterSpacing: 0 ,
                                                                        fontWeight: FontWeight.w600,
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
                                                            color: Color(widget.Bubble_Color),
                                                            fontFamily: 'Red Hat Text',
                                                            fontSize: 14.sp,
                                                            letterSpacing: 0 ,
                                                            fontWeight: FontWeight.w700,
                                                            height: 1
                                                        ),)
                                                    ],
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: (){
                                                    if (state.GetUsersInsideBubble!.users!.length>1)
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback((_) => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            
                                                                SprintLobby(plan_title: widget.plan_Title!,Bubble_id: widget.bubble_id,my_id: widget.MY_ID!, Color: widget.Bubble_Color,)),
                                                      ));
                                                    else{
                                                     CommingSoonPopup(context, h, w, "No one is in bubble to match make with!", "OK", 18);
                                                    }
                                                  },
                                                  icon: Icon(Icons.chevron_right,size: h/20,    color: Color(widget.Bubble_Color),),
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
                                                  fontSize: 18.sp,
                                                  letterSpacing: 0 ,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1
                                              ),),
                                            ),
                                            Text(""),
                                            Container(
                                              margin: EdgeInsets.only(left: h/50),
                                              child: IconButton(
                                                onPressed: (){
                                                  CommingSoonPopup(context, h, w, "Coming Soon!", "OK", 24);
                                                }, icon:
                                              SvgPicture.asset("Assets/images/active.svg",),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ):Container(),
                                          Container(
                                              decoration:  BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15.r),
                                                  bottomRight:  Radius.circular(15.r),
                                                  topLeft: Radius.circular(15.r),
                                                  topRight: Radius.circular(15.r),
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
                                                  style:  TextStyle(
                                                      color: Colors.orange, fontSize: 16.5.sp),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(30.0.r),
                                                      borderSide:  BorderSide(
                                                          color: Color(0xff939393), width: 10),
                                                    ),
                                                    focusedBorder:  OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(30.0.r)),
                                                      borderSide: BorderSide(
                                                          color: Color(0xff939393), width: 3),
                                                    ),
                                                    enabledBorder:  OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(Radius.circular(30.0.r)),
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
                                                    contentPadding:  EdgeInsets.symmetric(
                                                        horizontal: 12.w, vertical: 20.h),
                                                    hintText: "Search",
                                                    hintStyle:   TextStyle(
                                                        color: Color.fromRGBO(147, 147, 147, 1),
                                                        fontFamily: 'Red Hat Text',
                                                        fontSize: 15.sp,
                                                        letterSpacing: 0 ,
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
                                              child:Container(
                                                width: w,
                                                height: h/1.42,
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
                                                      state.FilteredInsideBubbleUsers![index].ID==id?
                                                      Column(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(left: h/40),
                                                            width: w / 1.2,
                                                            height: h / 13,
                                                            decoration: BoxDecoration(
                                                              color: ColorS.secondaryContainer,
                                                              borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius.circular(40.r),
                                                                bottomRight: Radius.circular(5.r),
                                                                topLeft: Radius.circular(40.r),
                                                                topRight: Radius.circular(5.r),
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
                                                                    Stack(
                                                                        children:[
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                            children: [
                                                                              SizedBox(width: h/50,),

                                                                              Container(
                                                                                width: w/9,
                                                                                height: h / 15,
                                                                                child:InkWell(
                                                                                  onTap: (){
                                                                                    alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_Frined!,state.FilteredInsideBubbleUsers![index].ID==widget.MY_ID,state.FilteredInsideBubbleUsers![index].ID!);
                                                                                  },
                                                                                  child: CachedNetworkImage(
                                                                                    imageUrl:state.FilteredInsideBubbleUsers![index].Avatar!,
                                                                                    errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                                                    imageBuilder: (context, imageProvider) => CircleAvatar(
                                                                                      radius: 12.w,
                                                                                      backgroundImage: imageProvider,
                                                                                      backgroundColor: Color(BackgroundColor),
                                                                                    ),
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
                                                                        ,fontSize: 15.35.sp
                                                                    )

                                                                ),

                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                      : Slidable(
                                                        closeOnScroll: true,
                                                        key:  ValueKey(state.FilteredInsideBubbleUsers![index].ID!),
                                                        endActionPane: ActionPane(
                                                          motion:  ScrollMotion(),
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: () {
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].ID!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),
                                                                    );
                                                                },
                                                                child: Container(
                                                                  width: w / 6,
                                                                  height: h / 9,
                                                                  decoration:  BoxDecoration(
                                                                    color:  Color(0xffCF6D38),
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomRight:  Radius.circular(0),
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
                                                                  alreatDialogBuilder(context,h,w,index
                                                                      ,state.FilteredInsideBubbleUsers![index].is_Frined!
                                                                      ,false
                                                                      ,state.FilteredInsideBubbleUsers![index].ID!
                                                                  );
                                                                },
                                                                child: Container(
                                                                  width: w / 6,
                                                                  height: h / 9,
                                                                  decoration:  BoxDecoration(
                                                                    color : state.FilteredInsideBubbleUsers![index].is_Frined!?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
                                                                    borderRadius: BorderRadius.only(
                                                                      bottomRight:  Radius.circular(5.r),
                                                                      topRight: Radius.circular(5.r),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.center,
                                                                    children: [
                                                                      state.GetInsideUsersSuccess!?
                                                                      state.FilteredInsideBubbleUsers![index].ID==widget.MY_ID
                                                                          ?Icon(Icons.person)
                                                                          :    state.FilteredInsideBubbleUsers![index].is_Frined!
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
                                                                        child:    Center(
                                                                          child: Container(
                                                                            child: Text("Loading..."),
                                                                          ),
                                                                        ),)
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(left: h/40),
                                                              width: w / 1.2,
                                                              height: h / 13,
                                                              decoration: BoxDecoration(
                                                                color: ColorS.secondaryContainer,
                                                                borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(40.r),
                                                                  bottomRight: Radius.circular(5.r),
                                                                  topLeft: Radius.circular(40.r),
                                                                  topRight: Radius.circular(5.r),
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
                                                                      Stack(
                                                                          children:[
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(width: h/50,),

                                                                                Container(
                                                                                  width: w/9,
                                                                                  height: h / 15,
                                                                                  child:InkWell(
                                                                                    onTap: (){
                                                                                      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_Frined!,state.FilteredInsideBubbleUsers![index].ID==widget.MY_ID,state.FilteredInsideBubbleUsers![index].ID!);
                                                                                    },
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl:state.FilteredInsideBubbleUsers![index].Avatar!,
                                                                                      errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                                                      imageBuilder: (context, imageProvider) => CircleAvatar(
                                                                                        radius: 12.w,
                                                                                        backgroundImage: imageProvider,
                                                                                        backgroundColor: Color(BackgroundColor),
                                                                                      ),
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
                                                                          ,fontSize: 15.35.sp
                                                                      )

                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                          ],
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
                                    ),
                                  )

                            ],
                          ),
                        ),
                      ),
                    ),

    );
  }

  Future OutsideBubbleAlreat()async{

    return       showDialog(
      builder: (BuildContext context) {
        var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size.width;
        return Container(
          child: AlertDialog(
            backgroundColor: Color(0xffEAEAEA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
            content:  Container(
                width: w,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
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
                      fontSize: 22.sp,
                      letterSpacing: 0 ,
                      fontWeight: FontWeight.bold,
                      height: 1
                  ),),
                  SizedBox(height: h/40,),
                  Text('Looks like you are not in this bubble! Please move closer to activate additional features.', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(47, 47, 47, 1),
                      fontFamily: 'Red Hat Text',
                      fontSize: 11.sp,
                      letterSpacing: 0 ,
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

    print(decoded);
  }

  void encodeImage(File path,String type) {
    Uint8List bytes = path.readAsBytesSync();
    base64Image = base64Encode(bytes);
    print(base64Image);
    if (type =="me") {
      SetMyImage(path);
    }else if (type =="MediaOnChat"){
_GroupChatBloc.add(ChangeMediaImageTaken((b) => b..status = true));
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
    print(decoded);

  }

  Future<void> pickImage(ImageSource source,String type) async {
    final image = await ImagePicker().pickImage(source: source);
    Fileee =File(image!.path);
    if (image == null) return;
    final imagePath = File(image.path);
    print(imagePath);
    this.image = imagePath;
    if (type=="ImageOnChat")
    encodeImage(imagePath,"me");
    else if (type =="MediaOnChat"){
      encodeImage(imagePath,"MediaOnChat");
    }
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
                          color:  Color(0xffEAEAEA),
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
                                color:  Color(0xffEAEAEA),
                                height: w / 400,
                                width: h / 34,
                              ),
                              CircleAvatar(
                                radius: 10.w,
                                backgroundImage: NetworkImage(
                                    state.AvatarPathForRepliedTo.toString()),
                                backgroundColor:
                                Color(int.parse(state.ColorForRepliedTo!)),
                              ),
                               SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                state.AliasForRepliedTo.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:
                                     Color.fromRGBO(147, 147, 147, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 13.sp,
                                    letterSpacing:
                                    0 ,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                               SizedBox(
                                width: 5,
                              ),



                              state.type=="Image"
                                  ?
                              state.messages![index].Image_type.toString()=="Uint8List"
                                      ?Container(
                                      width: w/10,
                                      height: h/5,
                                      child: Image.memory(state.Image1!)
                                      )
                                        :state.messages![index].Image_type.toString()=="Backend"
                                        ?Container(
                                  width: w/10,
                                        height: h/5,
                                   child :
                                   Image.network(state.RepliedToMessage!)
                                        )
                                        :Container(
                                  width: w/10,
                                        height: h/5,
                                     child :
                                     Image.file(state.File_image!)
                                        )

                                  :
                              state.messages![index].ModelType=="Message"
                                  ?  Container(
                                width: w / 8,
                                height: h / 79,
                                child: Text(
                                  state.RepliedToMessage.toString(),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                      color: Color.fromRGBO(196, 196, 196, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 7.54.sp,
                                      letterSpacing:
                                      0 ,
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
                                  me: true,
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
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                icon:  Icon(
                  Icons.clear,
                  size: 25.w,
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
      elevation: 0,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        enableDrag: true,
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        // raints: Boxraints(
        //   maxWidth: Responsive.isMobile(context) ? Get.width : 600,
        // ),
        builder: (context) {
          return


            Container(
              width: w / 2,
              height: h / 2.23,
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
                              TopicFlowBottomSheet();
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,

                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5.r),
                                        topLeft: Radius.circular(0),
                                        bottomRight:Radius.circular(30.5.r),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                           Text(""),
                                           Text(
                                            'New Topic',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 13.5.sp,
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
                                  decoration:  BoxDecoration(
                                    color: Color(0xff942657),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36.r, 36.r)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/notifiy.svg",
                                      width: w / 14.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: w / 2,
                          child: InkWell(
                            onTap: () {
                          // PollFlowBottomSheet();
                              CommingSoonPopup(context, h, w, "Coming Soon!", "OK", 24);
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,
                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5.r),
                                        topLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30.5.r),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                           Text(""),
                                           Text(
                                            'New Poll',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 13.5.sp,
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
                                  decoration:  BoxDecoration(
                                    color: Color(0xffA83063),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36.r, 36.r)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/123323232.svg",
                                      width: w / 14.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: w / 2,
                          child: InkWell(
                            onTap: () {

                              PhotoFlowBottomSheet("ImageOnChat");
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                  top: h / 100,
                                  left: h / 35,
                                  child: Container(
                                    width: w / 2.7,
                                    height: h / 17,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.5.r),
                                        topLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(30.5.r),
                                        bottomLeft: Radius.circular(0),
                                      ),
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                           Text(
                                            'Footprint',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    47, 47, 47, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 13.5.sp,
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
                                  decoration:  BoxDecoration(
                                    color: Color(0xffCA4E4E),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(36.r, 36.r)),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "Assets/images/12123123.svg",
                                      width: w / 14.5,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        width: w / 2,
                        child: InkWell(
                            onTap: () {
                             MediaDumpBottomSheet();
                            },
                            child: Stack(children: [
                              Positioned(
                                top: h / 100,
                                left: h / 35,
                                child: Container(
                                  width: w / 2.7,
                                  height: h / 17,
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.5.r),
                                      topLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(30.5.r),
                                      bottomLeft: Radius.circular(0),
                                    ),
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                         Text(""),
                                         Text(
                                          'Media dump',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(47, 47, 47, 1),
                                              fontFamily: 'Red Hat Display',
                                              fontSize: 13.5.sp,
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
                                decoration:  BoxDecoration(
                                  color: Color(0xffCF6D38),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(36.r, 36.r)),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "Assets/images/Layer_1-2_1_.svg",
                                    width: w / 14.5,
                                  ),
                                ),
                              ),
                            ]))),
                  ]),
              SizedBox(height: 10,),
              SizedBox(height: 10,),

                      InkWell(
                        onTap: (){
                      Navigator.pop(context);
                      _GroupChatBloc.add(ChangeFlowOptionsStatus((b) =>
                      b..status = false
                      ));
                        },
                        child :  Container(
                          margin: EdgeInsets.only(right: h/2.55),
                          width: w/10,
                        height: h/20,

                        color: Colors.transparent,

                      )
                      ),



                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.only(left: h / 100, top: h / 50),
                  //       child: CircleAvatar(
                  //         radius: 25,
                  //         backgroundColor:  Color(0xff15D078),
                  //         child: Center(
                  //             child: IconButton(
                  //               icon: Image.asset("Assets/images/closee.png"),
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //             )),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ));
        }).then((value) {
          _GroupChatBloc.add(ChangeFlowOptionsStatus((b) =>
          b..status = false
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
    if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
      await EncodeVoice(path, "me");
    }else{

    }
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }

  Future<void> PhotoFlowBottomSheet(String type) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        shape:  RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration:  BoxDecoration(
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
                      pickImage(ImageSource.camera,type);
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
                              fontWeight: FontWeight.w600, fontSize: 30.sp),
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
                      pickImage(ImageSource.gallery,type);
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
                              fontWeight: FontWeight.w600, fontSize: 30.sp),
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

  Future<void> TopicFlowBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0.r),
          ),
        ),
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
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                          color: Color.fromRGBO(148, 38, 87, 1),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Text(""),
                              Column(
                                children: [
                                  Container(
                                    width: w/1.2,
                                    child: Text('New Topic',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme.subtitle1!.copyWith(
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w400,
                                          fontSize: 24.sp

                                        )),
                                  ),
                                   SizedBox(
                                    height: 5,
                                  ),
                                   Text(""),
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

                                            style: GoogleFonts.roboto().copyWith(
                                              color:  Color(0xffEAEAEA),
                                              fontWeight: FontWeight.w300,
                                                fontSize: 17.sp
                                            ),
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
                                              errorStyle:  TextStyle(
                                                color: Colors.red,
                                              ),
                                              errorBorder:
                                               OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder:
                                               OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5.r)),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide:  BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5.r),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide:  BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5.r),
                                              ),
                                              filled: true,
                                              fillColor:
                                               Color(0xff303030),
                                              contentPadding:
                                               EdgeInsets.symmetric(
                                                  horizontal: 12.w),
                                              hintText: "Add Flow Title",
                                              hintStyle: _TextTheme.headline6!.copyWith(
                                                fontSize: 17.sp
                                              )),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),

                              Column(
                                children: [
                                   SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: w / 1.2,
                                    height: h/27,
                                    child: Text(
                                        '${state.DescriptionLength.toString()}/150',
                                        textAlign: TextAlign.right,
                                        style:  TextStyle(
                                            color:
                                            Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 16.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                            height: 1),
                                      ),
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
                                          style: GoogleFonts.roboto().copyWith(
                                            color:  Color(0xffEAEAEA),
                                            fontWeight: FontWeight.w300,
                                              fontSize: 17.sp
                                           // fontSize: 2 * .blockSizeHorizontal!.toDouble(),
                                          ),
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
                                            errorStyle:  TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.r)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            hintText: "Flow Description",
                                            hintStyle: _TextTheme.headline6!.copyWith(
                                                fontSize: 17.sp
                                            ),
                                            filled: true,
                                            fillColor:  Color(0xff303030),
                                            contentPadding:
                                             EdgeInsets.only(
                                                top: 20.w, left: 10.w),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),
                               Text(""),
                               SizedBox(
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
                                                FontWeight.w400
                                                ,fontSize: 20.sp

                                            )),
                                      ),
                                    ),
                                  ),
                                   Text(""),
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
                                      width: w / 4,
                                      height: h / 20,
                                      margin: EdgeInsets.only(left: h/7),
                                      child: Center(
                                        child: Text('Post',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.subtitle1!
                                                .copyWith(
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400 ,fontSize: 20.sp)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(
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

  Future<void> PollFlowBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
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
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color:  Color(0xff942657),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Text(""),
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
                                       Text(""),
                                       Text(""),
                                    ],
                                  ),
                                   SizedBox(
                                    height: 5,
                                  ),
                                   Text(""),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 7,
                                      child:     Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _PollkeyQuestion,
                                        child: TextFormField(
                                          maxLines: 4,
                                          focusNode: FoucesNodePollQuestion,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _PollQuestionController,
                                          onChanged: (value) {},
                                          style: GoogleFonts.roboto().copyWith(
                                              color:  Color(0xffEAEAEA),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17.sp
                                          ),
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
                                            errorStyle:  TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.r)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            hintText: 'Add Question',
                                            hintStyle: _TextTheme.headline6,
                                            filled: true,
                                            fillColor:  Color(0xff303030),
                                            contentPadding:
                                             EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                   SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 10,
                                      child:   Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _Pollkey1,
                                        child:TextFormField(
                                          maxLines: 4,
                                          focusNode: FoucesNodePollAnswer2,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _PollAnswer1Controller,
                                          onChanged: (value) {},
                                          style: GoogleFonts.roboto().copyWith(
                                              color:  Color(0xffEAEAEA),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17.sp
                                          ),
                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle:  TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.r)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            hintText: 'Answer',
                                            hintStyle: _TextTheme.headline6!
                                                .copyWith(
                                                color:  Color(
                                                    0xff303030)),
                                            filled: true,
                                            fillColor:  Color(0xffC4C4C4),
                                            contentPadding:
                                             EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      ) ),
                                   SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: w / 1.2,
                                      height: h / 10,
                                      child:   Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _Pollkey2,
                                        child:TextFormField(
                                          maxLines: 4,
                                          style: GoogleFonts.roboto().copyWith(
                                              color:  Color(0xffEAEAEA),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17.sp
                                          ),
                                          focusNode: FoucesNodeFlowDescription,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                          _PollAnswer2Controller,
                                          onChanged: (value) {},

                                          onFieldSubmitted: (value) {},
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                            errorStyle:  TextStyle(
                                              color: Colors.red,
                                            ),
                                            errorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            focusedErrorBorder:
                                             OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(5.r)),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: Color(0xff303030),
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(5.r),
                                            ),
                                            hintText: 'Answer',
                                            hintStyle: _TextTheme.headline6!
                                                .copyWith(
                                                color:  Color(
                                                    0xff303030)),
                                            filled: true,
                                            fillColor:  Color(0xffC4C4C4),
                                            contentPadding:
                                             EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                  state.TextfieldSum! >= 3
                                      ? Column(
                                    children: [
                                       SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: w / 1.2,
                                          height: h / 10,
                                          child:    Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            key: _Pollkey3,
                                            child:TextFormField(
                                              maxLines: 4,
                                              focusNode:
                                              FoucesNodePollAnswer3,
                                              style: GoogleFonts.roboto().copyWith(
                                                  color:  Color(0xffEAEAEA),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 17.sp
                                              ),
                                              keyboardAppearance:
                                              Brightness.dark,
                                              textInputAction:
                                              TextInputAction.next,
                                              controller:
                                              _PollAnswer3Controller,
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
                                                 TextStyle(
                                                  color: Colors.red,
                                                ),
                                                errorBorder:
                                                 OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:
                                                 OutlineInputBorder(
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
                                                   BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5.r),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                   BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5.r),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme
                                                    .headline6!
                                                    .copyWith(
                                                    color:  Color(
                                                        0xff303030)),
                                                filled: true,
                                                fillColor:  Color(
                                                    0xffC4C4C4),
                                                contentPadding:
                                                 EdgeInsets.only(
                                                    top: 20,
                                                    left: 10),
                                              ),
                                              keyboardType:
                                              TextInputType.text,
                                              // obscureText: SecureInput_pass,
                                            ),
                                          )  ),
                                    ],
                                  )
                                      :  Text(""),
                                  state.TextfieldSum == 4
                                      ? Column(
                                    children: [
                                       SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          width: w / 1.2,
                                          height: h / 10,
                                          child:   Form(
                                            autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                            key: _Pollkey4,
                                            child: TextFormField(
                                              maxLines: 4,
                                              focusNode:
                                              FoucesNodePollAnswer4,
                                              style: GoogleFonts.roboto().copyWith(
                                                  color:  Color(0xffEAEAEA),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 17.sp
                                              ),
                                              keyboardAppearance:
                                              Brightness.dark,
                                              textInputAction:
                                              TextInputAction.next,
                                              controller:
                                              _PollAnswer4Controller,
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
                                                 TextStyle(
                                                  color: Colors.red,
                                                ),
                                                errorBorder:
                                                 OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:
                                                 OutlineInputBorder(
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
                                                   BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5.r),
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                   BorderSide(
                                                    color:
                                                    Color(0xff303030),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5.r),
                                                ),
                                                hintText: 'Answer',
                                                hintStyle: _TextTheme
                                                    .headline6!
                                                    .copyWith(
                                                    color:  Color(
                                                        0xff303030)),
                                                filled: true,
                                                fillColor:  Color(
                                                    0xffC4C4C4),
                                                contentPadding:
                                                 EdgeInsets.only(
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
                                      :  Text(""),
                                   SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (state.TextfieldSum != 4)
                                        _GroupChatBloc.add(ChangeTextfieldSum((b) => b..num = 1));

                                    },
                                    child: Container(
                                      width: w / 1.2,
                                      height: h / 15,
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5.r),
                                          topRight: Radius.circular(5.r),
                                          bottomLeft: Radius.circular(5.r),
                                          bottomRight: Radius.circular(5.r),
                                        ),
                                        color: Color.fromRGBO(202, 78, 78, 1),
                                      ),
                                      child:  Center(
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
                                           SizedBox(
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
                                           Text(
                                            'Show participants',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    234, 234, 234, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 14.sp,
                                                letterSpacing:
                                                0 ,
                                                fontWeight: FontWeight.w400,
                                                height: 1),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                           SizedBox(
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
                                           Text(
                                            'Multiple Choice',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    234, 234, 234, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 14.sp,
                                                letterSpacing:
                                                0 ,
                                                fontWeight: FontWeight.w400,
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
                                   Text(""),
                                  InkWell(
                                    onTap: () {
                                      if (_PollkeyQuestion.currentState!.validate()) {
                                              List<String> Answers =[];
                                              String Question ="";
                                              Question = _PollQuestionController.text;
                                              Answers.add(_PollAnswer1Controller.text);
                                              Answers.add(_PollAnswer2Controller.text);

                                                if (state.TextfieldSum==3) {

                                                  Answers.add(_PollAnswer3Controller.text);

                                                }else if (state.TextfieldSum==4) {
                                                  Answers.add(_PollAnswer3Controller.text);
                                                  Answers.add(_PollAnswer4Controller.text);

                                                }

                                        SetMyPollFlow(Question, Answers);
                                                Navigator.pop(context);
                                              _PollQuestionController.clear();
                                              _PollAnswer2Controller.clear();
                                              _PollAnswer3Controller.clear();
                                              _PollAnswer4Controller.clear();
                                              _PollAnswer1Controller.clear();
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
                               SizedBox(
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

  Future<void> MediaDumpBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0.r),
          ),
        ),
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
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Wrap(
                        children: [
                      Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          color:  Color(0xff942657),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Text(""),
                              Column(
                                children: [
                                  Container(
                                    width: w / 1.1,
                                    child: Text('Add image',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme.subtitle1!.copyWith(
                                          fontSize: 20.sp,
                                            letterSpacing: .5,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                   SizedBox(
                                    height: 5,
                                  ),
                                   Text(""),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [

                                      InkWell(
                                        onTap: () {
                                          PhotoFlowBottomSheet("MediaOnChat");
                                        },
                                        child: Container(
                                          width: w / 7,
                                          height: h / 13,
                                          decoration:  BoxDecoration(
                                            color: Color.fromRGBO(207, 109, 56, 1),
                                          ),
                                          child:  Center(
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ),
                                      state.MediaImageTaken!?
                                     Container(
                                            width: w/2,
                                              height: h/4,
                                              child: Image.file(Fileee!,fit: BoxFit.fill,))

                                      :   Container(
                                        width: w/2,
                                        height: h / 13,
                                        child:Text(""),),
                                   Text("")

                                    ],
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: h/40,
                              ),
                              Container(
                                width: w / 1.1,
                                child:  Text(
                                  'Write up to 3 keywords',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                            fontSize: 20.sp,
                                      letterSpacing:
                                      0 ,
                                      fontWeight: FontWeight.w400,
                                      height: 1),
                                ),
                              ),
                              Column(
                                children:  [
                                  Text(""),
                                  Text(""),
                                ],
                              ),
                              Column(
                                children: [
                                   SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                      width: w / 1.1,
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey12,
                                        child: TextFormField(
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller: _MediaDumpController,
                                          onChanged: (value) {},
                                          onFieldSubmitted: (value) {

                                          },
                                          cursorColor: Colors.black,
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText: "Required"),
                                          ]),
                                          decoration: InputDecoration(
                                              errorStyle:  TextStyle(
                                                color: Colors.red,
                                              ),
                                              errorBorder:
                                               OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder:
                                               OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5.r)),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide:  BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5.r),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide:  BorderSide(
                                                  color: Color(0xff303030),
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(5.r),
                                              ),
                                              filled: true,
                                              fillColor:
                                               Color(0xff303030),
                                              contentPadding:
                                               EdgeInsets.symmetric(
                                                  horizontal: 12.w),
                                              hintText: "keywords",
                                              hintStyle: _TextTheme.headline6!.copyWith(
                                                fontSize: 15.sp
                                              )),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),
                                ],
                              ),
                               Text(""),
                               SizedBox(
                                height: h/50,
                              ),
                              Container(
                                width: w / 1.1,
                                child:  Text(
                                  'Examples',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                            fontSize: 15.sp,
                                      letterSpacing:
                                      0 ,
                                      fontWeight: FontWeight.w400,
                                      height: 1),
                                ),
                              ),
                              SizedBox(
                                height: h/50,
                              ),
                              Container(
                                width: w,
                                height: h/10,
                                margin: EdgeInsets.only(left: h/50),
                                child: ListView.separated(
                                cacheExtent : 500,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: TEMP.length,
                                itemBuilder: (BuildContext context,
                                int index2) {
                                  return
                                    InkWell(
                                      onTap: ()async{
                                        await Clipboard.setData(
                                            ClipboardData(
                                                text: TEMP[index2]));
                                        _MediaDumpController.text = _MediaDumpController.text + " " +  TEMP[index2];
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                              height: h/10.5,
                                              decoration: BoxDecoration(
                                                borderRadius : BorderRadius.only(
                                                  topLeft: Radius.circular(5.r),
                                                  topRight: Radius.circular(5.r),
                                                  bottomLeft: Radius.circular(5.r),
                                                  bottomRight: Radius.circular(5.r),
                                                ),
                                                color : Color.fromRGBO(196, 196, 196, 1),
                                              ),
                                            child:

                                            Container(
                                              margin: EdgeInsets.all(10.w),
                                              child: Center(
                                                child: Text(TEMP[index2].toString(), textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(148, 38, 87, 1),
                                                    fontFamily: 'Red Hat Text',
                                                    fontSize: 15.sp,
                                                    letterSpacing: 0 ,
                                                    fontWeight: FontWeight.normal,
                                                    height: 1
                                                ),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                }, separatorBuilder: (BuildContext context, int index) {  return SizedBox(width: 10,);},
                                ),
                              ),
                              SizedBox(
                                height: h/50,
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
                                                FontWeight.w400,fontSize: 20.sp)),
                                      ),
                                    ),
                                  ),
                                   Text(""),
                                  InkWell(
                                    onTap: () {
                                      var my_string =_MediaDumpController.text;
                                      if (_formkey12.currentState!.validate() && 3 >= (my_string.split(" ").length - 1) ){
                                       if (_MediaDumpController.text.isNotEmpty){
                                         if (state.MediaImageTaken!){
                                           SetMyMediaDump(base64Image, _MediaDumpController.text);
                                           Navigator.pop(context);
                                           _MediaDumpController.clear();
                                         }
                                       }
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
                                            fontSize: 20.sp,
                                                letterSpacing: .5,
                                                fontWeight:
                                                FontWeight.w400)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                    ),
                  ),
                );
              });
        }).then((value) {
      _GroupChatBloc.add(ChangeMediaImageTaken((b) => b..status = false));
      _MediaDumpController.clear();
    });
  }


  Widget TopicFlowWidget(GroupChatState state, int index,int message_id) {
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
                radius: 20.w,
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
                              fontSize: 13.sp,
                    ),
                  ),
                  Text(state.messages![index].time!,
                      textAlign: TextAlign.right,
                      style: _TextTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w300,
                        color:  Color(0xffEAEAEA),
                          fontSize: 9.sp
                      ))
                ],
              ),
               SizedBox(
                height: 7,
              ),
              Container(
                width: w / 1.3,
                height: h / 4.8,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
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
                            style: GoogleFonts.roboto().copyWith(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                      fontSize: 13.sp,
                                letterSpacing: 0.2,
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
                        style: GoogleFonts.roboto().copyWith(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontSize: 17.sp,
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
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r),
                                bottomLeft: Radius.circular(50.r),
                                bottomRight: Radius.circular(50.r),
                              ),
                              color:  Color(widget.Bubble_Color),
                            ),
                            child: InkWell(
                              onTap: (){
                                bool GetInStatus = false;
                                for(int j =0;j<AllBubblesIDS!.length;j++){
                                  if (widget.bubble_id==AllBubblesIDS![j]){
                                    if (AllBubblesStatus![j]==1)
                                      GetInStatus = true;
                                  }
                                }

                                if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                  FlowData data = FlowData();
                                  data.Title = state.messages![index].TopicFlowTitle.toString();
                                  data.Content = state.messages![index].TopicFlowDescription.toString();
                                  data.Flow_type = "TopicFlow";
                                  data.FlowMessage_id = state.messages![index].ID;
                                  data.ISMediaDump = false;
                                  data.Color = widget.Bubble_Color;
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute( //receiver_id: ,my_ID: ,
                                          builder: (context) =>
                                              FlowsChat(
                                                Plan_Description: widget.Plan_Description,
                                                flow: data,
                                                plan_Title: widget.plan_Title,
                                                bubble_id: widget.bubble_id,
                                                MY_ID: widget.MY_ID,
                                              ),),));
                                }else{
                                  OutsideBubbleAlreat();
                                }
                              },
                              child:  Center(
                                child: Text(
                                  'Join Flow',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(47, 47, 47, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 11.sp,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
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
      children: [
    Container(
    height: h / 4.44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
          onTap: (){
      //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

    },
      child:
          CircleAvatar(
            backgroundColor:
            Color(state.messages![index].background_Color!),
            backgroundImage:
            NetworkImage(state.messages![index].Avatar.toString()),
            radius: 20.w,
          ),
          )
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
      fontSize: 13.sp,
    ),
    ),
    Text(state.messages![index].time!,
    textAlign: TextAlign.right,
    style: _TextTheme.headline2!.copyWith(
    fontWeight: FontWeight.w300,
    color:  Color(0xffEAEAEA),
        fontSize: 9.sp
    ))
       ],
    ),
     SizedBox(
    height: 7,
    ),
      Container(
        width: w/1.37,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(6.147541046142578),
            topRight: Radius.circular(6.147541046142578),
            bottomLeft: Radius.circular(6.147541046142578),
            bottomRight: Radius.circular(6.147541046142578),
          ),
          boxShadow : [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
              offset: Offset(0,0),
              blurRadius: 13.088312149047852
          )],
          color : Color.fromRGBO(96, 96, 96, 1),
        ),
        child: Column(
          children: [
            SizedBox(height: h/50,),
            Container(
              width: w/1.5,
              child: Text(state.messages![index].PollQuestion!,
                textAlign: TextAlign.left,
                  style: GoogleFonts.roboto().copyWith(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15.159509658813477.sp,
                    letterSpacing: 0 ,
                    fontWeight: FontWeight.w300,
                  )
          ),
            ),
            SizedBox(height: h/50,),
            Container(
              width: w/1.8,
              decoration: BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(5.191571235656738),
                  topRight: Radius.circular(5.191571235656738),
                  bottomLeft: Radius.circular(5.191571235656738),
                  bottomRight: Radius.circular(5.191571235656738),
                ),
                color : Color.fromRGBO(47, 47, 47, 1),
              ),
              child:  ListView.separated(
                  cacheExtent : 500,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  itemCount: state.messages![index].PollAnswers.length,
                  itemBuilder: (BuildContext context,
                      int index2) {
                    return InkWell(
                        onTap: (){
                    print("Hello");
                    },
                    child: Container(
                      width: w/2,
                      child: Column(
                        children: [
                          SizedBox(height: 5,),
                          Row(
                              children: [
                                SizedBox(width: 5,),
                                CircleAvatar(
                            backgroundColor: Color(0xff837DE2),
                                  radius: 0.24.sp,
                    ),

                                SizedBox(width: 5,),
                                Container(
                                  width: w/2.3,
                                  child: Text(state.messages![index].PollAnswers[index2],
                                    textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto().copyWith(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 14.282208442687988.sp,
                                        letterSpacing: 0 ,
                                        fontWeight: FontWeight.w300,
                                      )
                               ),
                                )
                              ],
                            ),
                          SizedBox(height: 5,),
                        ],
                      ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 1,); },
              )
            ),
            SizedBox(height: h/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: w / 4.5,
                  height: h / 20,
                  margin: EdgeInsets.only(bottom: h/100),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
                    ),
                    color:  Color(widget.Bubble_Color),
                  ),
                  child: InkWell(
                    onTap: (){
                      if (state.messages![index].FlowSettledWithID!) {
                      bool GetInStatus = false;
                      for(int j =0;j<AllBubblesIDS!.length;j++){
                        if (widget.bubble_id==AllBubblesIDS![j]){
                          if (AllBubblesStatus![j]==1)
                            GetInStatus = true;
                        }
                      }

                      if ( GetInStatus || !widget.Want_LOcation_cHECK!) {

                          FlowData data = FlowData();
                          data.Title =
                              state.messages![index].TopicFlowTitle.toString();
                          data.Content =
                              state.messages![index].TopicFlowDescription
                                  .toString();
                          data.Flow_type = "NewPoll";
                          data.FlowMessage_id = state.messages![index].ID;
                          data.ISMediaDump = false;
                          data.Color = widget.Bubble_Color;
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) =>
                              Navigator.push(
                                context,
                                MaterialPageRoute( //receiver_id: ,my_ID: ,
                                  builder: (context) =>
                                      FlowsChat(
                                        Plan_Description: widget
                                            .Plan_Description,
                                        flow: data,
                                        plan_Title: widget.plan_Title,
                                        bubble_id: widget.bubble_id,
                                        MY_ID: widget.MY_ID,
                                      ),),));
                        } else {
                          OutsideBubbleAlreat();
                        }
                      }
                    },
                    child:  Center(
                      child: Text(
                        'Join Flow',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(47, 47, 47, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 13.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                    ),
                  ),
                ),
                Text(""),
                !state.messages![index].FlowSettledWithID!?
                SpinKitDualRing(
                  color: Colors.white,
                  size: h/80.0,
                ):Text(""),
              ],
            )
          ],
        ),
      )
    ]
    )
    )
      ]
    );
  }

  Widget MediaDumpWidget(GroupChatState state, int index) {
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
                InkWell(
                onTap: (){
      //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);

    },
      child:
                CircleAvatar(
                  backgroundColor:
                  Color(state.messages![index].background_Color!),
                  backgroundImage:
                  NetworkImage(state.messages![index].Avatar.toString()),
                  radius: 20.w,
                ),
                )
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
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(state.messages![index].time!,
                            textAlign: TextAlign.right,
                            style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w300,
                              color:  Color(0xffEAEAEA),
                                fontSize: 9.sp
                            ))
                      ],
                    ),
                     SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: w/1.4,
                      height: h/3.6,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(6.147541046142578),
                          topRight: Radius.circular(6.147541046142578),
                          bottomLeft: Radius.circular(6.147541046142578),
                          bottomRight: Radius.circular(6.147541046142578),
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                            offset: Offset(0,0),
                            blurRadius: 13.088312149047852
                        )],
                        color : Color.fromRGBO(96, 96, 96, 1),
                      ),
                      child: Column(
                        children: [
              Expanded(
                child: Container(
                  width: w/1.4,
                  height: h/6,
                  child:
                  Column(
                    children: [
                    Container(
                    width: w/1.4,
                    height: h/6,
                    child:
                      ClipRRect(
                      borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)),
                              child:state.messages![index].Image_type=="File"
                                  ?Image.file(Fileee!,fit: BoxFit.fill,)
                                  :state.messages![index].Image_type.toString() =="backend"
                                  ? CachedNetworkImage(
    imageUrl:state.messages![index].MediaDumpImagePath!,
    imageBuilder: (context, imageProvider) => Container(
    width: w/1.4,
    height: h/6,

    decoration: BoxDecoration(
    image:DecorationImage(image: imageProvider,
      fit: BoxFit.fill
    ),

    ),

    ),
    placeholder: (context, url) => Container(
    width: w/1.4,
    height: h/6,child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    CircularProgressIndicator(),
    ],
    )),
    errorWidget: (context, url, error) => Container(
    width: w/1.4,
    height: h/6,child: Icon(Icons.error)),
    )

                                  :Image.memory(state.messages![index].MediaDumpImageuntil64!,fit: BoxFit.fill,),
                          ),
                    )
                    ],
                  )
                ),
              ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: w/1.9,
                                margin: EdgeInsets.only(left: h/70),
                                child: Text(state.messages![index].MediaDumpTitle!,
                                  textAlign: TextAlign.left,
                              style: GoogleFonts.roboto().copyWith(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontSize: 13.sp,
                                letterSpacing: 0 ,
                                fontWeight: FontWeight.w300,
                              )
                                    ),
                              ),
                              Text(""),
                              Text("")
                            ],
                          ),
                          SizedBox(height: 5,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: w / 4.5,
                                height: h / 20,
                                margin: EdgeInsets.only(bottom: h/100),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.r),
                                    topRight: Radius.circular(50.r),
                                    bottomLeft: Radius.circular(50.r),
                                    bottomRight: Radius.circular(50.r),
                                  ),
                                  color:  Color(widget.Bubble_Color),
                                ),
                                child: InkWell(
                                  onTap: (){
                                    if (state.messages![index].FlowSettledWithID!) {
                                    bool GetInStatus = false;
                                    for(int j =0;j<AllBubblesIDS!.length;j++){
                                      if (widget.bubble_id==AllBubblesIDS![j]){
                                        if (AllBubblesStatus![j]==1)
                                          GetInStatus = true;
                                      }
                                    }

                                    if ( GetInStatus || !widget.Want_LOcation_cHECK!) {

                                        FlowData data = FlowData();
                                        data.Title = state.messages![index]
                                            .MediaDumpTitle.toString();
                                        // data.Content = state.messages![index].TopicFlowDescription.toString();
                                        data.Flow_type = "MediaDump";
                                        data.FlowMessage_id =
                                            state.messages![index].ID;
                                        data.ISMediaDump = true;
                                        data.Color = widget.Bubble_Color;
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) =>
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute( //receiver_id: ,my_ID: ,
                                                builder: (context) =>
                                                    FlowsChat(
                                                      Plan_Description: widget
                                                          .Plan_Description,
                                                      flow: data,
                                                      plan_Title: widget
                                                          .plan_Title,
                                                      bubble_id: widget
                                                          .bubble_id,
                                                      MY_ID: widget.MY_ID,
                                                    ),),));
                                      } else {
                                        OutsideBubbleAlreat();
                                      }
                                    }
                                  },
                                  child:  Center(
                                    child: Text(
                                      'Join Flow',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(47, 47, 47, 1),
                                          fontFamily: 'Red Hat Text',
                                          fontSize: 13.sp,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                          height: 1),
                                    ),
                                  ),
                                ),
                              ),
                              Text(""),
                              Text(""),
                              !state.messages![index].FlowSettledWithID!?
                              SpinKitDualRing(
                                color: Colors.white,
                                size: h/80.0,
                              ):Text(""),
                            ],
                          )
                        ],
                      ),
                    )
                  ]
              )
          )
        ]
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



 TopicFlowDialog(FlowData data, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (Context)
    {
      return
      AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(h / 50),
          content:
          Container(
            width: w / 1.1,

            height: h / 3.8,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.r),
                topRight: Radius.circular(5.r),
                bottomLeft: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r),
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

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: w/30,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                      Color(data.Who_Made_it_Color!),
                      backgroundImage:
                      NetworkImage(data.Who_Made_it_Avatar!),
                      radius: 20.w,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      data.Who_Made_it_Alias!,
                      textAlign: TextAlign.left,
                      style: _TextTheme.headline3!.copyWith(
                        color: ColorS.errorContainer,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                    SizedBox(width: w/3,),
                    Text(data.time!,
                        textAlign: TextAlign.right,
                        style: _TextTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w300,
                          color:  Color(0xffEAEAEA),
                            fontSize: 9.sp
                        )),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: h / 22,
                      width: w / 1.4,
                      padding: EdgeInsets.only(top: h / 100),
                      child: Text(
                        data.Title!,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto().copyWith(
                            color: Color.fromRGBO(234, 234, 234, 1),
                                  fontSize: 17.sp,
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
                    data.Content!,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto().copyWith(
                        color: Color.fromRGBO(234, 234, 234, 1),
                        fontSize: 17.sp,
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.r),
                            topRight: Radius.circular(50.r),
                            bottomLeft: Radius.circular(50.r),
                            bottomRight: Radius.circular(50.r),
                          ),
                          color: Color(widget.Bubble_Color),
                        ),
                        child: InkWell(
                          onTap: () {
                            bool GetInStatus = false;
                            for (int j = 0; j < AllBubblesIDS!.length; j++) {
                              if (widget.bubble_id == AllBubblesIDS![j]) {
                                if (AllBubblesStatus![j] == 1)
                                  GetInStatus = true;
                              }
                            }

                            if ( GetInStatus || !widget.Want_LOcation_cHECK!) {

                              data.Flow_type = "TopicFlow";
                              data.FlowMessage_id = data.FlowMessage_id;
                              data.ISMediaDump = false;
                              data.Color = widget.Bubble_Color;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute( //receiver_id: ,my_ID: ,
                                      builder: (context) =>
                                          FlowsChat(
                                            Plan_Description: widget
                                                .Plan_Description,
                                            flow: data,
                                            plan_Title: widget.plan_Title,
                                            bubble_id: widget.bubble_id,
                                            MY_ID: widget.MY_ID,
                                          ),),));
                            } else {
                              OutsideBubbleAlreat();
                            }
                          },
                          child:  Center(
                            child: Text(
                              'Join Flow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 11.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      );
    }
    );





      Row(
      children: [
        Container(
          height: h / 4.44,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


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

               SizedBox(
                height: 7,
              ),

            ],
          ),
        )
      ],
    );
  }

   PollFlowDialog(FlowData data, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (Context)
        {
          var length =    data.Answers.length;
          print(length);
          return
            AlertDialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(h / 50),
                content:
                Container(
                  width: w/1.37,
                  height: h /(
                      length==2
                      ?3
                      :length==3
                      ?2.8
                      :2.5),


                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(6.147541046142578.r),
                      topRight: Radius.circular(6.147541046142578.r),
                      bottomLeft: Radius.circular(6.147541046142578.r),
                      bottomRight: Radius.circular(6.147541046142578.r),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                        offset: Offset(0,0),
                        blurRadius: 13.088312149047852
                    )],
                    color : Color.fromRGBO(96, 96, 96, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: w/30,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                Color(data.Who_Made_it_Color!),
                                backgroundImage:
                                NetworkImage(data.Who_Made_it_Avatar!),
                                radius: 20.w,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                data.Who_Made_it_Alias!,
                                textAlign: TextAlign.left,
                                style: _TextTheme.headline3!.copyWith(
                                  color: ColorS.errorContainer,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: w/3,),
                          Text(data.time!,
                              textAlign: TextAlign.right,
                              style: _TextTheme.headline2!.copyWith(
                                fontWeight: FontWeight.w300,
                                color:  Color(0xffEAEAEA),
                                  fontSize: 9.sp
                              )),

                        ],
                      ),
                      SizedBox(height: h/50,),
                      Container(
                        width: w/1.5,
                        child: Text("      ${data.Title!}",
                          textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 15.159509658813477.sp,
                              letterSpacing: 0 ,
                              fontWeight: FontWeight.w300,
                              height: 1
                          ),),
                      ),
                      SizedBox(height: h/50,),
                      Container(
                          width: w/1.8,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(5.191571235656738.r),
                              topRight: Radius.circular(5.191571235656738.r),
                              bottomLeft: Radius.circular(5.191571235656738.r),
                              bottomRight: Radius.circular(5.191571235656738.r),
                            ),
                            color : Color.fromRGBO(47, 47, 47, 1),
                          ),
                          child:  ListView.separated(
                            cacheExtent : 500,
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            itemCount: data.Answers.length,
                            itemBuilder: (BuildContext context,
                                int index2) {
                              return InkWell(
                                onTap: (){
                                  print("Hello");
                                },
                                child: Container(
                                  width: w/2,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          SizedBox(width: 5,),
                                          CircleAvatar(
                                            backgroundColor: Color(0xff837DE2),
                                            radius: 0.24.sp,
                                          ),

                                          SizedBox(width: 5,),
                                          Container(
                                            width: w/2.3,
                                            child: Text(data.Answers[index2],
                                              textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
                                                  fontFamily: 'Red Hat Text',
                                                  fontSize: 14.282208442687988.sp,
                                                  letterSpacing: 0 ,
                                                  fontWeight: FontWeight.w300,
                                                  height: 1
                                              ),),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                    ],
                                  ),
                                ),
                              );

                            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 1,); },
                          )
                      ),
                      SizedBox(height: h/50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: w / 4.5,
                            height: h / 20,
                            margin: EdgeInsets.only(bottom: h/100),
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r),
                                bottomLeft: Radius.circular(50.r),
                                bottomRight: Radius.circular(50.r),
                              ),
                              color:  Color(widget.Bubble_Color),
                            ),
                            child: InkWell(
                              onTap: (){
                                bool GetInStatus = false;
                                for(int j =0;j<AllBubblesIDS!.length;j++){
                                  if (widget.bubble_id==AllBubblesIDS![j]){
                                    if (AllBubblesStatus![j]==1)
                                      GetInStatus = true;
                                  }
                                }

                                if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
                                  print(data.FlowMessage_id);
                                  data.ISMediaDump = false;
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute( //receiver_id: ,my_ID: ,
                                          builder: (context) =>
                                              FlowsChat(
                                                Plan_Description: widget.Plan_Description,
                                                flow: data,
                                                plan_Title: widget.plan_Title,
                                                bubble_id: widget.bubble_id,
                                                MY_ID: widget.MY_ID,
                                              ),),));
                                }else{
                                  OutsideBubbleAlreat();
                                }
                              },
                              child:  Center(
                                child: Text(
                                  'Join Flow',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(47, 47, 47, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 13.sp,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                          Text(""),
                          Text("")
                        ],
                      )
                    ],
                  ),
                )
            );
        }
    );
  }

 MediaDumpDialog(FlowData data, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (Context)
          {
            return
              AlertDialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.all(h / 50),
                  content: Container(
                    width: w/1.1,
                    height: h/2.5,
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.only(
                        topLeft: Radius.circular(6.147541046142578.r),
                        topRight: Radius.circular(6.147541046142578.r),
                        bottomLeft: Radius.circular(6.147541046142578.r),
                        bottomRight: Radius.circular(6.147541046142578.r),
                      ),
                      boxShadow : [BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                          offset: Offset(0,0),
                          blurRadius: 13.088312149047852
                      )],
                      color : Color.fromRGBO(96, 96, 96, 1),
                    ),
                    child: Column(
                      children: [

                        Expanded(
                          child: Container(
                              width: w/1.1,
                              height: h/6,
                              child:
                              Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: w/30,),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                            Color(data.Who_Made_it_Color!),
                                            backgroundImage:
                                            NetworkImage(data.Who_Made_it_Avatar!),
                                            radius: 20.w,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            data.Who_Made_it_Alias!,
                                            textAlign: TextAlign.left,
                                            style: _TextTheme.headline3!.copyWith(
                                              color: ColorS.errorContainer,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15.sp
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: w/3,),
                                      Text(data.time!,
                                          textAlign: TextAlign.right,
                                          style: _TextTheme.headline2!.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color:  Color(0xffEAEAEA),
                                              fontSize: 9.sp
                                          )),

                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: w/1.1,
                                    height: h/5,
                                    child:
                                    ClipRRect(

                                      child:data.Image_type=="File"
                                          ?Image.file(Fileee!,fit: BoxFit.fill,)
                                          :data.Image_type =="backend"
                                          ? CachedNetworkImage(
                                        imageUrl: data.Image!,
                                        imageBuilder: (context, imageProvider) => Container(
                                            width: w/1.1,
                                            height: h/5,

                                            decoration: BoxDecoration(
                                              image:DecorationImage(image: imageProvider,
                                                  fit: BoxFit.fill
                                              ),
                                            ))
                                        ,
                                        placeholder: (context, url) => Container(
                                            width: w/1.1,
                                            height: h/5,child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                          ],
                                        )),
                                        errorWidget: (context, url, error) => Container(
                                            width: w/1.1,
                                            height: h/5,child: Icon(Icons.error)),
                                      )
                                          :Image.memory(data.Uint8_Image!,fit: BoxFit.fill,),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: w/1.9,
                              margin: EdgeInsets.only(left: h/70),
                              child: Text(
                             data.Title!
                                , textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
                                  color: Color.fromRGBO(234, 234, 234, 1),
                                  fontSize: 13.sp,
                                  letterSpacing: 0 ,
                                  fontWeight: FontWeight.w300,
                                  height: 1
                              ),),
                            ),
                            Text(""),
                            Text("")
                          ],
                        ),
                        SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: w / 4.5,
                              height: h / 20,
                              margin: EdgeInsets.only(bottom: h/100),
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.r),
                                  topRight: Radius.circular(50.r),
                                  bottomLeft: Radius.circular(50.r),
                                  bottomRight: Radius.circular(50.r),
                                ),
                                color:  Color(widget.Bubble_Color),
                              ),
                              child: InkWell(
                                onTap: (){
                                  bool GetInStatus = false;
                                  for(int j =0;j<AllBubblesIDS!.length;j++){
                                    if (widget.bubble_id==AllBubblesIDS![j]){
                                      if (AllBubblesStatus![j]==1)
                                        GetInStatus = true;
                                    }
                                  }

                                  if ( GetInStatus || !widget.Want_LOcation_cHECK!) {

                                    data.ISMediaDump = true;
                                    data.Color = widget.Bubble_Color;
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) =>
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute( //receiver_id: ,my_ID: ,
                                            builder: (context) =>
                                                FlowsChat(
                                                  Plan_Description: widget.Plan_Description,
                                                  flow: data,
                                                  plan_Title: widget.plan_Title,
                                                  bubble_id: widget.bubble_id,
                                                  MY_ID: widget.MY_ID,
                                                ),),));
                                  }else{
                                    OutsideBubbleAlreat();
                                  }
                                },
                                child:  Center(
                                  child: Text(
                                    'Join Flow',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(47, 47, 47, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 13.sp,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
                                  ),
                                ),
                              ),
                            ),
                            Text(""),
                            Text("")
                          ],
                        )
                      ],
                    ),
                  )

              );
          }
      );







  }

  Widget PhotoFlowDialog(GroupChatState state, int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [],
    );
  }






  Future<void> OnRefresh() async {

  }

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
  CommingSoonPopup(
      BuildContext Context,
      double h,
      double w,
      String Value,
      String buttonValue,
      int FontSize
      ) async {
    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098),
                    topRight: Radius.circular(8.285714149475098),
                    bottomLeft: Radius.circular(8.285714149475098),
                    bottomRight: Radius.circular(8.285714149475098),
                  ),
                  color: Colors.transparent,
                ),


                child: Stack(
                  children: [

                    Positioned(
                      top: h/12.5,
                      child: Container(
                        width: w/1.4,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),


                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: FontSize.toDouble(),
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: h/15.5,
                                      width: w/2,
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
                                        Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 14.sp,
                                            letterSpacing: 0 ,
                                            fontWeight: FontWeight.w400,
                                            height: 1
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: h/8,
                      bottom: h/5,
                      child: SvgPicture.asset(
                        "Assets/images/widget.svg",
                        width: 90,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
  }

  Future<String> _createFileFromString(String Base64) async {
    final encodedStr = Base64;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".aac");
    await file.writeAsBytes(bytes);
    return file.path;
  }


  void ListenForWhoJoinedBUbble() async {
    socket!.on("join_bubble", (msg) {
      print("Listenting");
      print(msg);
      print(msg["username"]);
      if (MyAlias ==msg["username"]){
        print("set to true");
      }
    });
  }

  void ListenForTopicFlows() async {
    socket!.on("receive_topic_message_send", (msg) {
      print(msg);
      if (widget.MY_ID!.toString()!=msg["user_id"])
        SetHisTopicFlow(
          msg["title"],
          msg["content"],
          msg["avatar"],
          msg["username"],
          msg["color"],
          msg["message_id"],
        );
//{username: Saed, user_id: 475, title: good , content: you , message_id: 30, type: TopicFlow, color: 0xffff9800, avatar: https://admin.bubbles.app/public/storage/avatar/5L0NBaw6dcN51MI2hCmtzNnEoH0LAdTyqB5Wa0va.png}
//{username: Saed, user_id: 475, title: good , content: bgg , message_id: 31, type: TopicFlow, color: 0xffff9800, avatar: https://admin.bubbles.app/public/storage/avatar/5L0NBaw6dcN51MI2hCmtzNnEoH0LAdTyqB5Wa0va.png}
    });
  }


  void ListenForMediaDumpFlows() async{
    socket!.on("receive_media_message_send", (msg) {
      print(msg);
      if (widget.MY_ID!.toString()!=msg["user_id"])
        SetHisMediaDump(
          msg["image"],
          msg["title"],
          msg["avatar"],
          msg["username"],
          msg["color"],
          msg["message_id"],
          msg["type"],
        );

//{username: Saed, user_id: 475, title: good , content: you , message_id: 30, type: TopicFlow, color: 0xffff9800, avatar: https://admin.bubbles.app/public/storage/avatar/5L0NBaw6dcN51MI2hCmtzNnEoH0LAdTyqB5Wa0va.png}
//{username: Saed, user_id: 475, title: good , content: bgg , message_id: 31, type: TopicFlow, color: 0xffff9800, avatar: https://admin.bubbles.app/public/storage/avatar/5L0NBaw6dcN51MI2hCmtzNnEoH0LAdTyqB5Wa0va.png}
    });
  }

  void ListenForPollFlows() async{
    socket!.on("receive_poll_message_send", (msg) {
      print(msg);

      if (widget.MY_ID!.toString()!=msg["user_id"])
        SetHisPollFlow(
          msg["title"],
          msg["answers"],
          msg["avatar"],
          msg["username"],
          msg["color"],
          msg["message_id"],
        );
    });
  }


  void ListenForWhoLeftBUbble() async{
    socket!.on("leave_bubble", (msg) {
      print("Listenting");
      print(msg);
      print(msg["username"]);
      print(msg["username"].toString().substring(17));

      if (MyAlias==msg["username"].toString().substring(17))
      {

      }


    });
  }

  void SetMyMediaDump(String MediaDumpImage, String MediaDumpTitle){
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.MediaDumpImageFile = Fileee;
    messageModel.MediaDumpTitle = MediaDumpTitle;
    messageModel.ModelType = "MediaDump";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Image_type = "File";
    messageModel.Type = "sender";
    messageModel.IsBackEnd = false;
    messageModel.ID = 0;
    messageModel.CanReply = false;
    messageModel.FlowSettledWithID = false;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    FlowData data = FlowData();

    int x = Random().nextInt(Colorss.length);
    String Colorr = Colorss[x];

    data.Color = int.parse(Colorr);
    data.Flow_Icon =  "Assets/images/Layer_1-2_1_.svg";
    data.ISMediaDump = true;
    data.Title = MediaDumpTitle;
    data.File_Image = Fileee;
    data.Who_Made_it_Alias =MyAlias;
    data.Who_Made_it_Avatar = MyAvatar;
    data.Who_Made_it_ID = 0;
    data.Flow_type ="MediaDump";

    data.Who_Made_it_Color = MYbackGroundColor;
    data.Image_type = "File";
    data.time = DateFormat.jm().format(DateTime.now());


    _GroupChatBloc.add(
        SendMediaDumpFlow((b) =>
        b   ..title =MediaDumpTitle
          ..Bubble_id =widget.bubble_id
          ..image = MediaDumpImage
          ..Flow = data
        ));
  }

  void SetHisMediaDump(String MediaDumpImage, String MediaDumpTitle,String avatar
      ,String Alias ,String background_Color ,int Message_id,String type){

    print("Settled ");
    print("Settled ");
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: avatar,
        Alias: Alias,
        ISreply: false);

    if (type=="Base64") {
      Uint8List?  _bytesImage = Base64Decoder().convert(MediaDumpImage);
      messageModel.MediaDumpImageuntil64 = _bytesImage;
      messageModel.Image_type = "Uint8List";
    }else if (type=="backend"){
      messageModel.MediaDumpImagePath = MediaDumpImage;
      messageModel.Image_type = "backend";
    }

    messageModel.CanReply = false;
    messageModel.IsBackEnd = false;

    messageModel.MediaDumpTitle = MediaDumpTitle;
    messageModel.ModelType = "MediaDump";

    messageModel.background_Color = int.parse(background_Color);
    messageModel.Type = "receiver";
    messageModel.FlowSettledWithID = true;
    messageModel.ID = Message_id;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    FlowData data = FlowData();
    int x = Random().nextInt(Colorss.length);

    String Colorr = Colorss[x];
    data.Color = int.parse(Colorr);
    data.Flow_type ="MediaDump";
    data.ISMediaDump = true;
    data.Title = MediaDumpTitle;
    data.time = DateFormat.jm().format(DateTime.now());
    if (type=="Base64") {
      Uint8List?  _bytesImage = Base64Decoder().convert(MediaDumpImage);
      data.Uint8_Image = _bytesImage;
      data.Image_type = "Uint8List";
    }else if (type=="backend"){
      data.BACKEND_PATH = MediaDumpImage;
      data.Image_type = "backend";
    }

    data.Who_Made_it_Alias =Alias;
    data.SettledWithID =true;
    data.Who_Made_it_Avatar = avatar;
    data.Flow_Icon = "Assets/images/notifiy.svg";
    data.Who_Made_it_Color = int.parse(background_Color);
    data.Who_Made_it_ID = Message_id;





    _GroupChatBloc.add(AddFlowModel((b) => b..Flow = data));
  }

  void SetMyPollFlow(String Question, List<String> Answers){
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.CanReply = false;
    messageModel.PollAnswers = Answers;
    messageModel.PollQuestion = Question;
    messageModel.ModelType = "PollFlow";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";
    messageModel.FlowSettledWithID = false;
    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    FlowData data = FlowData();
    data.Flow_Icon =  "Assets/images/123323232.svg";
    data.ISMediaDump = false;
    int x = Random().nextInt(Colorss.length);
    String Colorr = Colorss[x];
    data.Color = int.parse(Colorr);
    data.Title = Question;
    for(int j=0;j<Answers.length;j++)
      data.Answers.add(Answers[j].toString());
    data.time = DateFormat.jm().format(DateTime.now());
    data.Flow_type ="PollFlow";
    data.Who_Made_it_Alias =MyAlias;

    data.Who_Made_it_Avatar = MyAvatar;
    data.Who_Made_it_ID = 0;
    data.Who_Made_it_Color = MYbackGroundColor;

    _GroupChatBloc.add(
        SendPollFloww((b) =>
        b ..bubble_id =widget.bubble_id
          ..answers = Answers
          ..Question = Question
          ..Flow = data
        ));


  }

  void SetHisPollFlow(String Question, List<dynamic> Answers ,String avatar
      ,String Alias ,String background_Color ,int Message_id){
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: avatar,
        Alias: Alias,
        ISreply: false);
    messageModel.CanReply = false;
    for(int i=0;i<Answers.length;i++)
      messageModel.PollAnswers.add(Answers[i].toString());
    messageModel.PollQuestion = Question;
    messageModel.ModelType = "PollFlow";
    messageModel.FlowSettledWithID = true;
    messageModel.background_Color = int.parse(background_Color);
    messageModel.Type = "receiver";

    messageModel.ID = Message_id;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    FlowData data = FlowData();
    data.Flow_Icon =  "Assets/images/123323232.svg";
    data.ISMediaDump = false;
    int x = Random().nextInt(Colorss.length);
    String Colorr = Colorss[x];
    data.Color = int.parse(Colorr);
    data.Title = Question;
    for(int j=0;j<Answers.length;j++)
      data.Answers.add(Answers[j].toString());

    data.Flow_type ="PollFlow";
    data.Who_Made_it_Alias =Alias;
    data.Who_Made_it_Avatar = avatar;
    data.Who_Made_it_ID = Message_id;
    data.Who_Made_it_Color = int.parse(background_Color);
    data.time = DateFormat.jm().format(DateTime.now());
    _GroupChatBloc.add(AddFlowModel((b) => b..Flow = data));
  }

  void SetMyTopicFlow(String Title, String Description){
    print(Title);
    print("im here");
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: MyAvatar,
        Alias: MyAlias,
        ISreply: false);
    messageModel.CanReply = false;
    messageModel.FlowSettledWithID = false;
    messageModel.TopicFlowDescription = Description;
    messageModel.TopicFlowTitle = Title;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = MYbackGroundColor;
    messageModel.Type = "sender";

    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    FlowData data = FlowData();

    int x = Random().nextInt(Colorss.length);
    String Colorr = Colorss[x];
    data.Color = int.parse(Colorr);
    data.Flow_type ="TopicFlow";
    data.ISMediaDump = false;
    data.Title = Title;
    data.Content =Description;
    data.Who_Made_it_Alias =MyAlias;
    data.Who_Made_it_Avatar = MyAvatar;
    data.Flow_Icon = "Assets/images/notifiy.svg";
    data.Who_Made_it_Color = MYbackGroundColor;
    data.time = DateFormat.jm().format(DateTime.now());


    _GroupChatBloc.add(
        SendTopicFlow((b) =>
        b ..Bubble_id = widget.bubble_id
          ..Title =Title
          ..Content =Description
          ..Flow= data
        ));



  }

  void SetHisTopicFlow(String Title , String Description ,String avatar, String Alias ,String background_Color
      ,int Message_id){
    print("SETTLED");
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: avatar,
        Alias: Alias,
        ISreply: false);
    messageModel.FlowSettledWithID = true;
    messageModel.CanReply = false;
    messageModel.TopicFlowDescription = Description;
    messageModel.TopicFlowTitle = Title;
    messageModel.ModelType = "TopicFlow";
    messageModel.background_Color = int.parse(background_Color);

    messageModel.ID = Message_id;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));


    FlowData data = FlowData();

    int x = Random().nextInt(Colorss.length);
    String Colorr = Colorss[x];
    data.Color = int.parse(Colorr);
    data.Flow_type ="TopicFlow";
    data.ISMediaDump = false;
    data.Title = Title;
    data.Content =Description;
    data.Who_Made_it_Alias =Alias;
    data.Who_Made_it_Avatar = avatar;
    data.Flow_Icon = "Assets/images/notifiy.svg";
    data.Who_Made_it_Color = int.parse(background_Color);
    data.Who_Made_it_ID = Message_id;
    data.time = DateFormat.jm().format(DateTime.now());



    _GroupChatBloc.add(AddFlowModel((b) => b..Flow = data));

  }

  void SetHisReplyToVoice(
      String message,
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor,
      String replierAvatar,
      String ReplierAlias,
      String ReplierColor,
      int ReplyMessage_id){
    var Colore1 = int.parse(RepliedTo_BackGroundColor);
    var Colore2 = int.parse(ReplierColor);

    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.CanReply = false;
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyVoice";
    InstanceMessages.RepliedTOAlias =RepliedTOAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.ReplieDtobackground_Color = Colore1;
    InstanceMessages.MessageSettledWIthID = true;


    InstanceMessages.ReplierAlias = ReplierAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = replierAvatar;
    InstanceMessages.Replierbackground_Color = Colore2;
    InstanceMessages.ID = 0;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void SetmyReplyToVoice(
      String Comment,
      String RepliedTOAlias,
      String repliedToAvatar,
      String RepliedTo_BackGroundColor
      ,int ReplyMessage_id,
      ){
    var Colore = int.parse(RepliedTo_BackGroundColor);
    GroupChatMessage InstanceMessages = GroupChatMessage();
    InstanceMessages.CanReply = false;
    InstanceMessages.ModelType = "ReplyVoice";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias =  RepliedTOAlias;
    InstanceMessages.RepliedTOMessage = "Sticker..";
    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.MessageSettledWIthID = false;
    InstanceMessages.ReplieDtobackground_Color =Colore;


    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;
    //
    // InstanceMessages.ID = ReplyMessage_id;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());
    print("model added");
    _GroupChatBloc.add(AddModel((b) => b..message = InstanceMessages));


    _GroupChatBloc.add(
        addReply((b) => b
          ..comment =_SendMessageController .text
          ..message_id = Message_id
          ..Message = "Sticker..."
          ..Bubble_id = widget.bubble_id
          ..RepliedToColor = RepliedTo_BackGroundColor
          ..RepliedToAvatar = repliedToAvatar
          ..RepliedToAlias = RepliedTOAlias
          ..type = "ReplyVoice"
        ));

  }

  void SetMyVoiceMessage(String Path){

    File filee = File(Path);
    Uint8List bytes = filee.readAsBytesSync();
    base64String = base64Encode(bytes);
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
    messageModel.MessageSettledWIthID = false;
    messageModel.ID = 0;
    _GroupChatBloc.add(AddModel((b) => b..message = messageModel));

    _GroupChatBloc.add(
        SendMessage((b) =>
        b
          ..type = "audio"
          ..message = base64String
          ..bubble_id = widget.bubble_id
          ..main_type = 1
        ));

  }

  void SetHisVoiceMessage(
      String Path,
      String Sender_id,
      int Message_id,
      String Avatar,
      String Alias,
      String Color,)async {

    String file = await _createFileFromString(Path);
    var Colore = int.parse(Color);
    GroupChatMessage messageModel = GroupChatMessage(
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: Avatar,
        Alias: Alias,
        ISreply: false);
    messageModel.message = file;
    messageModel.ModelType = "Voice";
    messageModel.ISNOdeJS = true;
    messageModel.background_Color = Colore;
    messageModel.Type = "receiver";
    messageModel.MessageSettledWIthID = true;
    messageModel.ID = Message_id;
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
    InstanceMessages.CanReply = false;
    InstanceMessages.ModelType = "ReplyImage";
    InstanceMessages.ISreply = true;
    InstanceMessages.RepliedTOAlias = RepliedTOAlias;
    InstanceMessages.Image_type = type;
    InstanceMessages.MessageSettledWIthID = false;

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

    InstanceMessages.CanReply = false;
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
    InstanceMessages.MessageSettledWIthID = true;



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
    messageModel.MessageSettledWIthID = false;
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
    messageModel.MessageSettledWIthID = true;

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
    InstanceMessages.CanReply = false;
    InstanceMessages.ModelType = "ReplyMessage";
    InstanceMessages.ISreply = true;
    InstanceMessages.is_base64 = false;
    InstanceMessages.IsBackEnd = false;
    InstanceMessages.RepliedTOAlias= RepliedTOAlias;
    InstanceMessages.RepliedTOMessage = message;
    InstanceMessages.RepliedTOAvatar =repliedToAvatar;
    InstanceMessages.ID = Message_id;
    InstanceMessages.ReplieDtobackground_Color =Colore;
    InstanceMessages.MessageSettledWIthID = false;
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
    InstanceMessages.CanReply = false;
    InstanceMessages.MessageSettledWIthID = true;
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
      messageModel.MessageSettledWIthID = true;




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
    messageModel.MessageSettledWIthID = false;
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

}






class HeroImage extends StatefulWidget {
   HeroImage({Key? key, this.path, this.Image,required this.Image_Type, this.Uint8List2,this.id,required this.Sender_Alias,required this.Sender_Avatar,required this.Sender_Color,required this.Message_Time}) : super(key: key);
    File? Image;
    String? path;
    String Image_Type;
    Uint8List? Uint8List2;
    int? id;
    String? Sender_Avatar;
    String? Sender_Alias;
    int? Sender_Color;
    String Message_Time;


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
    return  Scaffold(
      body: SafeArea(
        child: Hero(
          tag: "Image${widget.id}",
          child:Material(
          type: MaterialType.transparency,
          child :Container(
            color: Colors.black,
              width: w,
              height: h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: w / 50),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                "Assets/images/Frame 11.svg",
                                width: 30.w,
                                color: ColorS.surface),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                      Text(""),
                      Text(""),
                    ],
                  ),

                  widget.Image_Type=="Uint8List"
                      ?Container(
                      width: w,
                      height: h/2,
                      child :
                      PhotoView(
                        imageProvider: MemoryImage(widget.Uint8List2!,),
                      ))
                      :widget.Image_Type=="Backend"
                      ?      Container(
                      width: w,
                      height: h/2,
                      child : PhotoView(
                        imageProvider: NetworkImage(widget.path!),
                      ))

                      : Container(
                      width: w,
                      height: h/2,
                      child :  PhotoView(
                        imageProvider: FileImage(widget.Image!),

                      )),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                Row(

                      children: [
                        SizedBox(width: 5,),
                        CircleAvatar(
                          backgroundColor:
                          Color(widget.Sender_Color!),
                          backgroundImage:
                          NetworkImage(widget.Sender_Avatar!),
                          radius: 17,
                        ),
                        SizedBox(width: 5,),
                        Text(
                         widget.Sender_Alias!,
                          textAlign: TextAlign.left,
                          style: _TextTheme.headline3!.copyWith(
                            color: ColorS.errorContainer,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp
                          ),
                        ),

                      ],
                ),
                          Row(
                            children: [
                              Text(
                                  widget.Message_Time,
                                  textAlign: TextAlign.right,
                                  style: _TextTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color:  Color(0xffEAEAEA),
                                      fontSize: 9.sp
                                  )),
                              SizedBox(width: 5,),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      );
  }
}