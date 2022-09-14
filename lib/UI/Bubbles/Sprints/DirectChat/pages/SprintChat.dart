// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Bubbles/Sprints/SprintsLobby/pages/SprintLobby.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
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

import '../bloc/Sprints_Event.dart';



class Sprints extends StatefulWidget {
  Sprints({Key? key,
    required this.receiver_id
    , required this.my_ID,
    required this.IS_sprints,
    required this.His_Alias,
    required this.Send_by,
     this.Bubble_id,
     this.Plan_Title,
    this.Color
  })
      : super(key: key);

  int receiver_id = 0;
  int my_ID;
  bool IS_sprints;
  String? His_Alias;
  String? Plan_Title;
  int? Bubble_id;
  String? Send_by;
int? Color;
  @override
  State<Sprints> createState() => _SprintsState();
}

class _SprintsState extends State<Sprints> {
  final pref = sl<IPrefsHelper>();
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






  @override
  void initState() {
    super.initState();
    _Sprints_Bloc.add(
        GetOldMessages((b) => b
          ..receiver_id = widget.receiver_id
          ..send_by =widget.Send_by
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

    _controller.addListener(() {
      if (_controller.position.atEdge){
        _Sprints_Bloc.add(ShowFloatingActionButton((b) =>
        b..status = false
        ));

      }else {
        _Sprints_Bloc.add(ShowFloatingActionButton((b) =>
        b..status = true
        ));
      }



    });

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
    print("socket!.connected : ${socket!.connected}");
  }

  @override
  void dispose() {
    super.dispose();
    _SendMessages.dispose();
    _controller.dispose();
    _SendMessageController.dispose();
    _focus.dispose();
  }
  alreatDialogBuilder4(
      BuildContext Context,
      double h,
      double w,
      ) async {
    return showDialog(
        context: Context,
           barrierDismissible: true,
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/4.5,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098.r),
                    topRight:  Radius.circular(8.285714149475098.r),
                    bottomLeft:  Radius.circular(8.285714149475098.r),
                    bottomRight:  Radius.circular(8.285714149475098.r),
                  ),
                  color: Colors.transparent,
                ),


                child: Container(
                  width: w/1.4,
                  height: h/8.2,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(""),
                      Center(
                        child: Text('Are you sure you want to stop this match? Chat will be Deleted if you click Yes',
                          textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              fontFamily: 'Red Hat Display',
                              fontSize: 17.sp,
                              letterSpacing: 0 ,
                              fontWeight: FontWeight.w300,
                              height: 1.h
                          ),),
                      ),
                      Text(""),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                                ChatSavedPopup(context,h,w);
                              },
                              child: Container(
                                height: h/15.5,
                                width: w/3.7,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft:Radius.circular(4.142857074737549.r),
                                    topRight:Radius.circular(4.142857074737549.r),
                                    bottomLeft: Radius.circular(4.142857074737549.r),
                                    bottomRight: Radius.circular(4.142857074737549.r),
                                  ),
                                  boxShadow : [BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0,0),
                                      blurRadius: 6.628571510314941.r
                                  )],
                                  color : Color(0xffCF6D38)
                                ),
                                child: Center(
                                  child:
                                  Text('No', textAlign: TextAlign.center, style: TextStyle(
                                      color: const Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Sofia Pro',
                                      fontSize: 16.sp,
                                      letterSpacing: 0.5 ,
                                      fontWeight: FontWeight.w500,
                                      height: 1
                                  ),),
                                ),
                              ),
                            ),
                          ),

                                      InkWell(
                                        onTap: (){
                                          Navigator.pop(context);
                                          Navigator.pop(context,"Yes");
                                       //   Navigator.pop(context);
                                          _Sprints_Bloc.add(
                                              DeleteChat((b) => b
                                                ..send_by = "sprint"
                                                ..Reciver_id = widget.receiver_id
                                              )
                                          );
                                        },
                                        child: Container(
                                          width: w/3.7,
                                          height: h/15,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft:  Radius.circular(4.142857074737549.r),
                                              topRight:  Radius.circular(4.142857074737549.r),
                                              bottomLeft:  Radius.circular(4.142857074737549.r),
                                              bottomRight: Radius.circular(4.142857074737549.r),
                                            ),
                                            boxShadow : [const BoxShadow(
                                                color: const Color.fromRGBO(0, 0, 0, 0.25),
                                                offset: const Offset(0,0),
                                                blurRadius: 6.628571510314941
                                            )],
                                            color : const Color.fromRGBO(168, 48, 99, 1),
                                          ),
                                          child: Center(
                                            child:
                                            Text('Yes', textAlign: TextAlign.center, style: TextStyle(
                                                color: const Color.fromRGBO(234, 234, 234, 1),
                                                fontFamily: 'Sofia Pro',
                                                fontSize: 16.sp,
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
              )

          );

          //   AlertDialog(
          //   backgroundColor: Colors.transparent,
          //   insetPadding: EdgeInsets.all(h/50),
          //   content:
          //   Container(
          //     width: w/1.1,
          //     height: h/4.2,
          //     decoration: BoxDecoration(
          //       borderRadius : BorderRadius.only(
          //         topLeft: Radius.circular(8.285714149475098.r),
          //         topRight:  Radius.circular(8.285714149475098.r),
          //         bottomLeft:  Radius.circular(8.285714149475098.r),
          //         bottomRight:  Radius.circular(8.285714149475098.r),
          //       ),
          //       color : const Color.fromRGBO(47, 47, 47, 1),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Container(
          //           padding: EdgeInsets.only(left: h/50,top: h/50),
          //           child: Text('Are you sure you want to stop this match?',
          //             textAlign: TextAlign.left, style: TextStyle(
          //                 color: const Color.fromRGBO(234, 234, 234, 1),
          //                 fontFamily: 'Sofia Pro',
          //                 fontSize: 16.sp,
          //                 letterSpacing: 0.5 ,
          //                 fontWeight: FontWeight.w300,
          //                 height: 1.h
          //             ),),
          //         ),
          //         const Text(""),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //
          //             InkWell(
          //               onTap: (){
          //                 ChatSavedPopup(context,h,w);
          //               },
          //               child: Container(
          //                   width: w/3,
          //                   height: h/15,
          //                   decoration: BoxDecoration(
          //                     borderRadius : BorderRadius.only(
          //                       topLeft: Radius.circular(4.142857074737549.r),
          //                       topRight:  Radius.circular(4.142857074737549.r),
          //                       bottomLeft:  Radius.circular(4.142857074737549.r),
          //                       bottomRight:  Radius.circular(4.142857074737549.r),
          //                     ),
          //                     boxShadow : [const BoxShadow(
          //                         color: const Color.fromRGBO(0, 0, 0, 0.25),
          //                         offset: const Offset(0,0),
          //                         blurRadius: 6.628571510314941
          //                     )],
          //                     color : const Color.fromRGBO(207, 109, 56, 1),
          //                   ),
          //                   child: Center(
          //                     child:
          //                     Text('No', textAlign: TextAlign.center, style: TextStyle(
          //                         color: const Color.fromRGBO(234, 234, 234, 1),
          //                         fontFamily: 'Sofia Pro',
          //                         fontSize: 16.sp,
          //                         letterSpacing: 0.5 ,
          //                         fontWeight: FontWeight.w500,
          //                         height: 1
          //                     ),),
          //                   )
          //               ),
          //             ),
          //
          //             InkWell(
          //               onTap: (){
          //                 Navigator.pop(context);
          //              //   Navigator.pop(context);
          //                 _Sprints_Bloc.add(
          //                     DeleteChat((b) => b
          //                       ..send_by = "sprint"
          //                       ..Reciver_id = widget.receiver_id
          //                     )
          //                 );
          //               },
          //               child: Container(
          //                 width: w/3,
          //                 height: h/15,
          //                 decoration: BoxDecoration(
          //                   borderRadius : BorderRadius.only(
          //                     topLeft:  Radius.circular(4.142857074737549.r),
          //                     topRight:  Radius.circular(4.142857074737549.r),
          //                     bottomLeft:  Radius.circular(4.142857074737549.r),
          //                     bottomRight: Radius.circular(4.142857074737549.r),
          //                   ),
          //                   boxShadow : [const BoxShadow(
          //                       color: const Color.fromRGBO(0, 0, 0, 0.25),
          //                       offset: const Offset(0,0),
          //                       blurRadius: 6.628571510314941
          //                   )],
          //                   color : const Color.fromRGBO(168, 48, 99, 1),
          //                 ),
          //                 child: Center(
          //                   child:
          //                   Text('Yes', textAlign: TextAlign.center, style: TextStyle(
          //                       color: const Color.fromRGBO(234, 234, 234, 1),
          //                       fontFamily: 'Sofia Pro',
          //                       fontSize: 16.sp,
          //                       letterSpacing: 0.5 ,
          //                       fontWeight: FontWeight.w500,
          //                       height: 1
          //                   ),),
          //                 ),
          //               ),
          //             )
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // );
        });
  }

  ChatSavedPopup(
      BuildContext Context,
      double h,
      double w,
      ) async {
    return showDialog(
        context: Context,
           barrierDismissible: true,
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
                color : const Color.fromRGBO(47, 47, 47, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: h/50,top: h/50),
                    child: Text('Match chat is Saved ,Go to direct messages to continue chatting',
                      textAlign: TextAlign.left, style: TextStyle(
                          color: const Color.fromRGBO(234, 234, 234, 1),
                          fontFamily: 'Sofia Pro',
                          fontSize: 17.sp,
                          letterSpacing: 0.5 ,
                          fontWeight: FontWeight.w300,
                          height: 1.h
                      ),),
                  ),
                  const Text(""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              boxShadow : [const BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: const Offset(0,0),
                                  blurRadius: 6.628571510314941
                              )],
                              color : Color(0xffA83063)
                            ),
                            child: Center(
                              child:
                              Text('Sounds good', textAlign: TextAlign.center, style: TextStyle(
                                  color: const Color.fromRGBO(234, 234, 234, 1),
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 16.sp,
                                  letterSpacing: 0.5 ,
                                  fontWeight: FontWeight.w500,
                                  height: 1
                              ),),
                            )
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    TextTheme TextThemee = Theme.of(context).textTheme;

    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    //   alreatDialogBuilder4(
    //                                             context,h,w);
    //
    //
    return  WillPopScope(
        onWillPop: ()async{
          if (widget.Send_by=="sprint") {
            alreatDialogBuilder4(context, h, w);
            return false;
          }else{
            return true;
          }
    },
    child :

      BlocBuilder(
        bloc: _Sprints_Bloc,
        builder: (BuildContext Context, SprintsState state) {
          alreatDialogBuilder2(
              BuildContext Context,
              double h,
              double w,
              int FrinedId,
              int index,
              ) async {
            return showDialog(
                context: Context,
                   barrierDismissible: true,
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
                        color : const Color.fromRGBO(47, 47, 47, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: h/50,top: h/50),
                            child: Text('Are you sure you want to remove this user from your friendlist?',
                              textAlign: TextAlign.left, style: TextStyle(
                                  color: const Color.fromRGBO(234, 234, 234, 1),
                                  fontFamily: 'Sofia Pro',
                                  fontSize: 20.sp,
                                  letterSpacing: 0.5 ,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                          ),
                          const Text(""),
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
                                      boxShadow : [const BoxShadow(
                                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                                          offset: const Offset(0,0),
                                          blurRadius: 6.628571510314941
                                      )],
                                      color : const Color.fromRGBO(207, 109, 56, 1),
                                    ),
                                    child: Center(
                                      child:
                                      Text('No', textAlign: TextAlign.center, style: TextStyle(
                                          color: const Color.fromRGBO(234, 234, 234, 1),
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
                                  // _GroupChatBloc.add(RemoveFriend((b) => b
                                  //   ..friend_id = Frined_id
                                  //   ..index = index
                                  // ));
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
                                    boxShadow : [const BoxShadow(
                                        color: const Color.fromRGBO(0, 0, 0, 0.25),
                                        offset: const Offset(0,0),
                                        blurRadius: 6.628571510314941
                                    )],
                                    color : const Color.fromRGBO(168, 48, 99, 1),
                                  ),
                                  child: Center(
                                    child:
                                    Text('Yes', textAlign: TextAlign.center, style: TextStyle(
                                        color: const Color.fromRGBO(234, 234, 234, 1),
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


          alreatDialogBuilder3(
              BuildContext Context,
              double h,
              double w,
              bool isFrined,
              bool isMe,
              int frinedId,
              int myINdex,
              FrinedsData UserData
              ) async {
            return showDialog(
                context: Context,
                   barrierDismissible: true,
                builder: (Context) {



                  var myInt = int.parse(UserData.Background_Color.toString());
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
                                      color : const Color.fromRGBO(47, 47, 47, 1),
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
                                                  backgroundImage: NetworkImage(UserData.Avatar.toString()),
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
                                                          UserData.Alias
                                                              .toString(),
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextThemee.headline6!.copyWith(
                                                              color: const Color(
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
                                                            UserData.Serial!,
                                                            textAlign: TextAlign.left,
                                                            style: TextThemee
                                                                .headline6!
                                                                .copyWith(
                                                                color: const Color(
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
                                                        icon: const Icon(Icons.clear),
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
                                                Text(UserData.boi.toString(), textAlign: TextAlign.left, style: TextStyle(
                                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                                    fontFamily: 'Red Hat Text',
                                                    fontSize: 12.sp,
                                                    letterSpacing: 0 ,
                                                    fontWeight: FontWeight.w300,
                                                    height: 1.4166666666666667
                                                ),)
                                            ),
                                          ],
                                        ),
                                        const Text(""),
                                        Row(
                                          mainAxisAlignment:
                                          isMe?    MainAxisAlignment.center:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            isMe
                                                ?const Text("")
                                                :InkWell(
                                              onTap: (){
                                                //DirectChat
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) =>     Navigator.push(
                                                  context,
                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                    builder: (context) => Sprints(my_ID: id, IS_sprints: false, receiver_id: UserData.ID!,His_Alias:UserData.Alias!,Send_by: "dm",),),   ));
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
                                                      const BoxShadow(
                                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                                          offset: const Offset(0,0),
                                                          blurRadius: 6.628571510314941
                                                      )
                                                    ],
                                                    color : const Color.fromRGBO(207, 109, 56, 1),
                                                  ),
                                                  child: Center(
                                                      child:
                                                      SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)

                                                  )
                                              ),
                                            ),
                                            isMe
                                                ?const Text("")
                                                :
                                            InkWell(
                                              onTap: (){
                                                if (id== UserData.ID!) {
                                                  if (!isFrined) {
                                                    Navigator.pop(context);
                                                    // _GroupChatBloc.add(
                                                    //     AddFrined((b) =>
                                                    //     b
                                                    //       ..serial =UserData
                                                    //           .Serial.toString()
                                                    //       ..index = myINdex
                                                    //     ));
                                                  } else {
                                                    alreatDialogBuilder2(
                                                        context, h, w,
                                                        frinedId, myINdex);
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
                                                  boxShadow : [const BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                                      offset: const Offset(0,0),
                                                      blurRadius: 6.628571510314941
                                                  )],
                                                  color : isFrined?const Color(0xff939393):const Color.fromRGBO(168, 48, 99, 1),
                                                ),
                                                child: Center(
                                                    child:
                                                    //
                                                    //   SvgPicture.asset(
                                                    // "Assets/images/Add_friend.svg",
                                                    // color: Colors.white,
                                                    // width: h / 26,
                                                    // )

                                                    isFrined
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
                                        SizedBox(height: 7.h,),
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
                            child: Container(
                              //   color: Colors.red,
                              child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
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
                                        margin: EdgeInsets.only(top:index==state.messages!.length-1? h/20:0),
                                        padding: EdgeInsets.only(
                                            left: h / 50,bottom:index==0? h/100:0),
                                        child:  state.success!
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
                                                                  SizedBox(width: 10.w,),
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
                                                                          color:  const Color(0xffEAEAEA),
                                                                          fontSize: 9.sp
                                                                      )),
                                                                  SizedBox(width: 10.w,),
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
                                                    SizedBox(height: 5.h,),



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
                                                          color:  const Color(0xffEAEAEA),
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
                                                          SizedBox(width: 10.w,),
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
                                                                  color:  const Color(0xffEAEAEA),
                                                                  fontSize: 9.sp
                                                              )),
                                                          SizedBox(width: 10.w,),
                                                        ],
                                                      )
                                                    ],
                                                  ),


                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  !state.messages![index].MsgSentSuccessfuly!?
                                                  SpinKitDualRing(
                                                    color: Colors.white,
                                                    size: h/80.0,
                                                  ):const Text(""),
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
                                                                        const CircularProgressIndicator(),
                                                                      ],
                                                                    )),
                                                                    errorWidget: (context, url, error) => Container(
                                                                        height: h / 4,child: const Icon(Icons.error)),
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
                                                          SizedBox(width: 10.w,),
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
                                                                  color:  const Color(0xffEAEAEA),
                                                                  fontSize: 9.sp
                                                              )),
                                                          SizedBox(width: 10.w,),
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
                                                    const Text(""),
                                                    const Text(""),
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
                                                              color:  const Color(0xffEAEAEA),
                                                              width: w / 400,
                                                              height: h / 50,
                                                              margin: EdgeInsets.only(top: h/105,bottom: h/105),
                                                            ),
                                                            Container(
                                                              color:  const Color(0xffEAEAEA),
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
                                                                                width: 3.w,
                                                                              ),
                                                                              Text(
                                                                                state.messages![index].RepliedTOAlias.toString()
                                                                                // state.AliasForRepliedTo.toString()
                                                                                ,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(
                                                                                    color:  const Color.fromRGBO(147, 147, 147, 1),
                                                                                    fontFamily: 'Red Hat Text',
                                                                                    fontSize: 9.sp,letterSpacing: 0
                                                                                    ,
                                                                                    fontWeight: FontWeight.w500, height: 1),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5.w,
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
                                                                                        color:  const Color(0xffEAEAEA),
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
                                                              SizedBox(width: 10.w,),
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
                                                                      color:  const Color(0xffEAEAEA),
                                                                      fontSize: 9.sp
                                                                  )),
                                                              SizedBox(width: 10.w,),
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
                                                            color:  const Color(0xffEAEAEA),
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
                                                                  color:  const Color(0xffEAEAEA),
                                                                  width: w / 400,
                                                                  height: h / 50,
                                                                ),
                                                                Container(
                                                                  color:  const Color(0xffEAEAEA),
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
                                                                                    width: 3.w,
                                                                                  ),
                                                                                  Text(
                                                                                    state.messages![index].RepliedTOAlias.toString()
                                                                                    // state.AliasForRepliedTo.toString()
                                                                                    ,
                                                                                    textAlign: TextAlign.left,
                                                                                    style: TextStyle(
                                                                                        color:  const Color.fromRGBO(147, 147, 147, 1),
                                                                                        fontFamily: 'Red Hat Text',  fontSize: 9.sp,
                                                                                        letterSpacing: 0 , fontWeight: FontWeight.w500, height: 1),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 5.w,
                                                                                  ),
                                                                                  Container(
                                                                                      width: w / 5,
                                                                                      height: h / 10,
                                                                                      margin: EdgeInsets.only(top: h/100),
                                                                                      child:
                                                                                      Text('Sticker...', textAlign: TextAlign.left, style: TextStyle(
                                                                                          color: const Color.fromRGBO(196, 196, 196, 1),
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
                                                                  SizedBox(width: 5.w,),
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
                                                                          color:  const Color(0xffEAEAEA),
                                                                          fontSize: 9.sp
                                                                      )),
                                                                  SizedBox(width: 10.w,),
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
                                                          color:  const Color(0xffEAEAEA),
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
                                                                  color:  const Color(0xffEAEAEA),
                                                                  width: w / 400,
                                                                  height: h / 50,
                                                                ),
                                                                Container(
                                                                  color:  const Color(0xffEAEAEA),
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
                                                                                    width: 3.w,
                                                                                  ),
                                                                                  Text(
                                                                                    state.messages![index].RepliedTOAlias.toString()
                                                                                    // state.AliasForRepliedTo.toString()
                                                                                    ,
                                                                                    textAlign: TextAlign.left,
                                                                                    style: TextStyle(
                                                                                        color:  const Color.fromRGBO(147, 147, 147, 1),
                                                                                        fontFamily: 'Red Hat Text', fontSize: 9.sp,
                                                                                        letterSpacing: 0 , fontWeight: FontWeight.w500, height: 1),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 5.w,
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
                                                                  const SizedBox(width: 5,),
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
                                                                          color:  const Color(0xffEAEAEA),
                                                                          fontSize: 9.sp
                                                                      )),
                                                                  const SizedBox(width: 10,),
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
                                                          color:  const Color(0xffEAEAEA),
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 11.sp
                                                      )),
                                                )

                                              ],
                                            )
                                        )
                                        // Column(
                                        //   children: [
                                        //     Container(
                                        //       height: h / 25,
                                        //       child:  Row(
                                        //         children: [
                                        //           Container(
                                        //             height: w / 400,
                                        //             width: h / 34,
                                        //           ),
                                        //           Container(
                                        //             color: const Color(0xffEAEAEA),
                                        //             width: w / 400,
                                        //             height: h / 50,
                                        //           ),
                                        //           Container(
                                        //             color: const Color(0xffEAEAEA),
                                        //             height: w / 400,
                                        //             width: h / 34,
                                        //             margin: EdgeInsets.only(bottom: h/55),
                                        //           ),
                                        //           Container(
                                        //             width:
                                        //             w / 1.5,
                                        //             height:
                                        //             h / 30,
                                        //             child:
                                        //             Column(
                                        //               mainAxisAlignment: MainAxisAlignment.start,
                                        //               children: [
                                        //
                                        //                 Flexible(
                                        //                   child:    Row(
                                        //                     children: [
                                        //                       SizedBox(width: w/250,),
                                        //
                                        //                       Container(
                                        //                         margin: EdgeInsets.only(bottom: h/150),
                                        //                         child: Row(
                                        //                           children: [
                                        //                             CircleAvatar(
                                        //                               radius: 10,
                                        //                               backgroundImage: NetworkImage(state.messages![index].RepliedTOAvatar.toString()),
                                        //                               backgroundColor: Color(state.messages![index].ReplieDtobackground_Color!),
                                        //                             ),
                                        //                             const SizedBox(
                                        //                               width: 3,
                                        //                             ),
                                        //                             Text(
                                        //                               state.messages![index].RepliedTOAlias.toString()
                                        //                               // state.AliasForRepliedTo.toString()
                                        //                               ,
                                        //                               textAlign: TextAlign.left,
                                        //                               style: TextStyle(color: const Color.fromRGBO(147, 147, 147, 1), fontFamily: 'Red Hat Text', fontSize: 1.7 * SizeConfig.blockSizeVertical!.toDouble(), letterSpacing: 0, fontWeight: FontWeight.w500, height: 1),
                                        //                             ),
                                        //                             const SizedBox(
                                        //                               width: 5,
                                        //                             ),
                                        //                             Container(
                                        //                               width: w / 5,
                                        //                               height: h / 10,
                                        //                               child:
                                        //
                                        //                               state.messages![index].Image_type.toString()=="Uint8List"
                                        //                                   ? InkWell(
                                        //                                 onTap: (){
                                        //
                                        //                                 },
                                        //
                                        //                                 child: Container(
                                        //                                     height: h / 10,
                                        //                                     child:
                                        //                                     Image.memory(state.messages![index].Image1!,)
                                        //                                 ),
                                        //                               )
                                        //                                   : state.messages![index].Image_type.toString()=="Backend"
                                        //                                   ?Row(
                                        //                                     children: [
                                        //                                       InkWell(
                                        //                                       onTap: (){
                                        //
                                        //                                       },
                                        //                                       child:
                                        //                                       Container(
                                        //                                           height: h / 10,
                                        //                                           child:
                                        //                                           Image.network(state.messages![index].RepliedTOMessage!,)
                                        //
                                        //
                                        //                                       )),
                                        //                                     ],
                                        //                                   )
                                        //                                   :Row(
                                        //                                     children: [
                                        //                                       InkWell(
                                        //                                       onTap: (){
                                        //
                                        //                                       },
                                        //                                       child:
                                        //                                       Container(
                                        //                                           height: h / 10,
                                        //                                           child:Image.file(state.messages![index].Image2!,)
                                        //                                       )
                                        //                               ),
                                        //                                     ],
                                        //                                   ),
                                        //                             )
                                        //                           ],
                                        //                         ),
                                        //                       ),
                                        //
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     Row(
                                        //       children: [
                                        //         Column(
                                        //           mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //           children: [
                                        //             InkWell(
                                        //               onTap: (){
                                        //                 //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);
                                        //
                                        //               },
                                        //               child:
                                        //               CircleAvatar(
                                        //                 backgroundColor: Color(state.messages![index].Replierbackground_Color!),
                                        //                 backgroundImage: NetworkImage(state.messages![index].ReplierAvatar.toString()),
                                        //                 radius: 23,
                                        //               ),
                                        //             )
                                        //           ],
                                        //         ),
                                        //         SizedBox(
                                        //           width:
                                        //           h / 100,
                                        //         ),
                                        //         Container(
                                        //           width:
                                        //           w / 1.3,
                                        //           child: Column(
                                        //             children: [
                                        //               Row(
                                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //                 children: [
                                        //                   Text(
                                        //                     state.messages![index].ReplierAlias.toString(),
                                        //                     textAlign: TextAlign.left,
                                        //                     style: _textthem.headline3!.copyWith(
                                        //                       color: COLOR.errorContainer,
                                        //                       fontWeight: FontWeight.w400,
                                        //                       fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                        //                     ),
                                        //                   ),
                                        //                   Text(state.messages![index].Repliertime!,
                                        //                       textAlign: TextAlign.right,
                                        //                       style: _textthem.headline2!.copyWith(
                                        //                         fontWeight: FontWeight.w300,
                                        //                         color: const Color(0xffEAEAEA),
                                        //                         fontSize: 1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                        //                       ))
                                        //                 ],
                                        //               ),
                                        //               const SizedBox(
                                        //                 height: 7,
                                        //               ),
                                        //               Container(
                                        //                 width: w / 1.3,
                                        //                 child: Text(state.messages![index].ReplierMessage.toString(),
                                        //                     textAlign: TextAlign.left,
                                        //                     style: _textthem.headline2!.copyWith(
                                        //                       fontWeight: FontWeight.w300,
                                        //                       color: const Color(0xffEAEAEA),
                                        //                       fontSize : 16
                                        //                     )),
                                        //               )
                                        //
                                        //             ],
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ],
                                        // )
                                            : const Text("empty 111")
                                            : const Text("empty 222 "),

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




                                Container(
                                  height:state.Isreply!?h/7: h / 10,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
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
                                                  left: w / 50,top: h/100,bottom: h/100),
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

                                                          }
                                                        }

                                                      }
                                                      _SendMessageController
                                                          .clear();

                                                    },
                                                    cursorColor: Colors.black,
                                                    style : GoogleFonts.roboto().copyWith(
                                                        fontSize: 19.sp,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.brown),
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30.r)),
                                                      filled: true,
                                                      fillColor:
                                                      const Color(0xffEAEAEA),
                                                      contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: h / 100),
                                                      hintText: 'Sup?..',
                                                      hintStyle:  TextStyle(
                                                          color: const Color.fromRGBO(
                                                              96, 96, 96, 1),
                                                          fontFamily: 'Red Hat Text',
                                                          fontSize: 13.sp,
                                                          letterSpacing:
                                                          0,
                                                          fontWeight: FontWeight.w300,
                                                          height: 1.h
                                                      ),
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
                                                          icon:  Icon(
                                                            Icons.send,
                                                            size: 30.w,
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
                                                          color: widget.IS_sprints? Color(  widget.Color!):const Color(0xffCF6D38)

                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                               SizedBox(
                                                width: 10.w,
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
                            topLeft: const Radius.circular(0),
                            topRight: const Radius.circular(0),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                          boxShadow: [
                             BoxShadow(
                                color:  Color.fromRGBO(0, 0, 0, 0.25),
                                offset:  Offset(0, 4),
                                blurRadius: 4.r)
                          ],
                          color:widget.IS_sprints? Color(widget.Color!): COLOR.shadow,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: h / 100),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/Frame 11.svg",
                                      width: 30.w,
                                      color:widget.IS_sprints? const Color(0xff303030):Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )),
                            Container(
                          margin:
                          !widget.IS_sprints?  EdgeInsets.only(left: w/15):EdgeInsets.only(left: w/5000),
                          child: Row(
                            children: [
                              widget.IS_sprints?Container():
                            state.MYAliasISsuccess!?
                              CircleAvatar(
                                radius: 14.r,
                                backgroundImage: NetworkImage(

                                    state
                                        .GetAlias!.friend!.avatar
                                        .toString()

                                ),
                                backgroundColor:
                                Color(HisBackgroundColor),
                              ):Container(),
                              !widget.IS_sprints?   SizedBox(width: 10.w,):Container(),
                              Text(
                                widget.His_Alias!,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color:widget.IS_sprints? const Color(0xff303030):Colors.white,
                                    fontFamily: 'Futura',
                                    fontSize: 16.sp,
                                    letterSpacing:
                                    0.5,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                             SizedBox(width: 5.w,),
                            widget.IS_sprints?
                                Container(
                                  width: w/3,
                                  padding: EdgeInsets.only(left: w/20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                            "Assets/images/Frame.svg",
                                            width: w/18,
                                            color:const Color(0xff303030)),
                                        onPressed: () {
                                          ChatSavedPopup(context,h,w);

                                        },




                                      ),
                                      IconButton(
                                        icon: SvgPicture.asset(
                                            "Assets/images/Group 252.svg",
                                            width: w/18,
                                            color: const Color(0xff303030)),
                                        onPressed: () {
                                          _Sprints_Bloc.add(
                                              DeleteChat((b) => b
                                                ..send_by = "sprint"
                                                ..Reciver_id = widget.receiver_id
                                              )
                                          );
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) => Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SprintLobby(plan_title: widget.Plan_Title!,Bubble_id: widget.Bubble_id!,my_id: widget.my_ID, Color: widget.Color!,)),
                                          ));
                                        },
                                      )
                                    ],
                                  ),
                                )

                                :
                            state.TypingStatusSuccess!
                                ? state.TypingStatus!
                                ? const Text("Typing...")
                                : const Text("")
                                : const Text(""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                  floatingActionButton: state.ShowFloatingActionButtonn!?Container(

                      margin: EdgeInsets.only(bottom: h/10),
                      child: FloatingActionButton(onPressed: () {
                        _controller.animateTo(
                          _controller.position
                              .minScrollExtent,
                          duration: const Duration(
                              milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                        backgroundColor: COLOR.shadow,
                        child: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: h/20,),
                      )

                  ):const Text("")
              ));
        }));
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
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
                                radius: 10.r,
                                backgroundImage: NetworkImage(
                                    state.AvatarPathForRepliedTo.toString()),
                                backgroundColor:
                                Color(int.parse(state.ColorForRepliedTo!)),
                              ),
                               SizedBox(
                                width: 3.w,
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
                                    0,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              ),
                               SizedBox(
                                width: 5.w,
                              ),



                              state.messages![index].ModelType=="Image"
                                  ?state.Image_type.toString()=="Uint8List"
                                  ?Container(
                                  width: w/8,
                                  height: h/5,child :
                                  Image.memory(state.Image1!)
                                  )
                                  : state.Image_type.toString()=="Backend"
                                  ?Container(
                                  width: w/8,
                                  height: h/5,
                                      child:Image.network(state.RepliedToMessage!)
                                  )
                                  :Container(
                                  width: w/8,
                                  height: h/5,

                                      child:Image.file(state.File_image!)
                                  )
                                  :  state.messages![index].ModelType=="Message"
                                  ?  Container(
                                width: w / 8,
                                height: h / 79,
                                child: Text(
                                  state.RepliedToMessage.toString(),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style:  TextStyle(
                                      color: const Color.fromRGBO(196, 196, 196, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 10.539999961853027.sp,
                                      letterSpacing:
                                      0,
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
                icon:  Icon(
                  Icons.clear,
                  size: 25.w,
                ),
              ))
        ],
      ),
    );
  }

  Future<void> PhotoFlowDialog() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme TextThemee = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0.r),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomLeft: const Radius.circular(0),
                bottomRight: const Radius.circular(0),
              ),
              color: const Color.fromRGBO(148, 38, 87, 1),
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
                          style: TextThemee.headline2!.copyWith(
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
                          style: TextThemee.headline2!.copyWith(
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


    timer = Timer.periodic(const Duration(seconds: 5), (Timer t){
      return
        _Sprints_Bloc.add(ChangeTypingStatus((b) => b..ChangeStatus = false));
    });
  }

  void NotifyTyping(int UserDestinationID) {
    socket!.emit("write_now", {
      "to": UserDestinationID.toString(),
    });
  }

  void SetHisReplyToVoice(String message, String Comment, String type) {
    SprintsChat InstanceMessages = SprintsChat();
    InstanceMessages.ISreply = true;
    InstanceMessages.ModelType = "ReplyVoice";
    InstanceMessages.MsgSentSuccessfuly = true;
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

    InstanceMessages.MsgSentSuccessfuly = false;
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
    Sprints.MsgSentSuccessfuly = false;
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
    Sprints.MsgSentSuccessfuly = true;

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
    InstanceMessages.MsgSentSuccessfuly = false;
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
      String MessageDirectionType,
      String ModelTypeType
      ){
    SprintsChat InstanceMessages = SprintsChat();

    // String type =  (RepliedTo_BackGroundColor.substring(10));

    if (ModelTypeType=="Uint8List") {
      Uint8List?  _bytesImage = const Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (ModelTypeType=="File"){
      Uint8List?  _bytesImage = const Base64Decoder().convert(message);
      InstanceMessages.Image1 = _bytesImage;
    }else if (ModelTypeType=="Backend"){
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
    InstanceMessages.Image_type =ModelTypeType!="File"? ModelTypeType:"Uint8List";
    InstanceMessages.MsgSentSuccessfuly = true;




    InstanceMessages.RepliedTOAlias =MessageDirectionType == "receiver" ? MyAlias : HisAlias;

    InstanceMessages.RepliedTOAvatar =MessageDirectionType == "receiver" ? MyAvatar : HisAvatar;
    InstanceMessages.ReplieDtobackground_Color = MessageDirectionType == "receiver" ? MYbackGroundColor : HisBackgroundColor;
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
    Sprints.MsgSentSuccessfuly = false;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));


    _Sprints_Bloc.add(
        SendMessage((b) =>
        b    ..Type = "image"
          ..message = base64Image
          ..receiver_id = widget.receiver_id
          ..send_by = widget.IS_sprints?"sprint":"dm"

        ));

  }

  void SetHisImage( String Path,int MessageId,){
    Uint8List?  _bytesImage = const Base64Decoder().convert(Path);
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
    Sprints.MsgSentSuccessfuly = true;
    Sprints.ID = MessageId;

    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));
  }

  void SetmyReplyMessage(String message, String Comment, String type, int messageId) {
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

    InstanceMessages.MsgSentSuccessfuly = false;
    InstanceMessages.ReplierAlias = MyAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = MyAvatar;
    InstanceMessages.Replierbackground_Color = MYbackGroundColor;
    InstanceMessages.ID = messageId;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));
    _Sprints_Bloc.add(
        addReply((b) => b
          ..comment = _SendMessageController.text
          ..message_id =messageId
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
    InstanceMessages.MsgSentSuccessfuly = true;

    InstanceMessages.ReplierAlias = HisAlias;
    InstanceMessages.ReplierMessage = Comment;
    InstanceMessages.ReplierAvatar = HisAvatar;
    InstanceMessages.Replierbackground_Color = HisBackgroundColor;

    // InstanceMessages.ID = message_id;
    InstanceMessages.Repliertime = DateFormat.jm().format(DateTime.now());

    _Sprints_Bloc.add(AddModel((b) => b..message = InstanceMessages));
  }

  void setHisMessage(String message,int MESSAGEID) {
    SprintsChat Sprints = SprintsChat(
        message: message,
        time: DateFormat.jm().format(DateTime.now()),
        Avatar: HisAvatar,
        Alias: HisAlias,
        ISreply: false);
    Sprints.ModelType ="Message" ;
    Sprints.background_Color = HisBackgroundColor;
    Sprints.Type = "receiver";
    Sprints.MsgSentSuccessfuly = true;

    Sprints.ID = MESSAGEID;
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
    Sprints.MsgSentSuccessfuly = false;
    _Sprints_Bloc.add(AddModel((b) => b..message = Sprints));
    print("Settled");
    _Sprints_Bloc.add(SendMessage(
            (b) => b
          ..receiver_id =  widget.receiver_id
          ..message =_SendMessageController.text
          ..Type = "text"
          ..send_by = widget.IS_sprints?"sprint":"dm"
    ));
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
    TextTheme TextThemee = Theme.of(context).textTheme;
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
                      const Text(""),
                      const Text(""),
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
                              const SizedBox(width: 5,),
                              CircleAvatar(
                                backgroundColor:
                                Color(widget.Sender_Color!),
                                backgroundImage:
                                NetworkImage(widget.Sender_Avatar!),
                                radius: 17,
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                widget.Sender_Alias!,
                                textAlign: TextAlign.left,
                                style: TextThemee.headline3!.copyWith(
                                  color: ColorS.errorContainer,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 3.2 * SizeConfig.blockSizeVertical!.toDouble(),
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.Message_Time,
                                  textAlign: TextAlign.right,
                                  style: TextThemee.headline2!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xffEAEAEA),
                                    fontSize:
                                    1.5 * SizeConfig.blockSizeVertical!.toDouble(),
                                  )),
                              const SizedBox(width: 5,),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
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



