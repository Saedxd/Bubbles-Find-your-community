import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_Bloc.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_State.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/bloc/Saved_event.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class SavedBubbles extends StatefulWidget {
   SavedBubbles({Key? key,this.User_id}) : super(key: key);
  int? User_id;
  @override
  State<SavedBubbles> createState() => _SavedBubblesState();
}

class _SavedBubblesState extends State<SavedBubbles> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  //
  final _SavedBloc = sl<SavedBubblesBloc>();
  late FocusNode FocuseNODE;

  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    _SavedBloc.add(GetSavedBubbles((b) =>b..User_id = widget.User_id));


  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
  }
  //
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return  WillPopScope(
        onWillPop: ()async{
          _SavedBloc.add(ShowHomePage((b) => b..HomePageStatus = false));
          return true;
        },
        child:

      BlocBuilder(
        bloc:   _SavedBloc,
        builder: (BuildContext Context, SavedBubblesState state)
    {

      alreatDialogBuilder2(
          BuildContext Context,
          double h,
          double w,
          int Frined_id,
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


      alreatDialogBuilder3(
          BuildContext Context,
          double h,
          double w,
          bool is_frined,
          bool is_me,
          int frined_id,
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
                                                        UserData.Serial!,
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
                                            Text(UserData.boi.toString(), textAlign: TextAlign.left, style: TextStyle(
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
                                            if (id== UserData.ID!) {
                                              if (!is_frined) {
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

      // alreatDialogBuilder2(
      //     BuildContext Context,
      //     double h,
      //     double w,
      //     int Frined_id,
      //     ) async {
      //   return showDialog(
      //       context: Context,
      //          barrierDismissible: true,
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
      //                         letterSpacing: 0.5 ,
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
      //                                 letterSpacing: 0.5 ,
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
      //                               letterSpacing: 0.5 ,
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
      //          barrierDismissible: true,
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

      return
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorS.onInverseSurface,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(
          children: [
            state.ShowHomePage!?
            HomeScreen(OpenPanel:true):
            Container(
              width: w,
              height: h,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: h / 100),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                right: h / 20),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                  "Assets/images/Frame 11.svg",
                                  width: 30.w,
                                  color: ColorS.surface),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )),
                        Text('Saved Bubbles', textAlign: TextAlign.left,
                          style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),),
                        Text(""),
                        Text(""),
                        state.SavedBubbleList!.length!=0?
                        IconButton(
                            icon: SvgPicture.asset(
                                state.ShapStatus! ?
                                "Assets/images/reshap1.svg"
                                    : "Assets/images/reshap2.svg"
                                , width: w / 18
                            ),
                            onPressed: () async {
                              _SavedBloc.add(ChangeShapStatus());
                            }
                        ):Text("")
                      ],
                    ),
                  ),



                  state.success! ?
                  state.SavedBubbleList!.length!=0
                      ?  Center(
                      child: Container(
                        width: w/1.1,
                        height: h/1.141,
                        child :
                        ScrollConfiguration(
                            behavior: MyBehavior(),
                            child:
                            GridView.builder(
                                itemCount: state.SavedBubbleList!.length,
                                scrollDirection: Axis.vertical,
                                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
                                state.ShapStatus!? 2:1,
                                  childAspectRatio: (5 / 5),),
                                itemBuilder: (BuildContext context, int index) {

                                  return
                                    state.ShapStatus!
                                        ?InkWell(
                                      onTap: (){
                              if (state.SavedBubbleList![index].type=="Prime") {
                                WidgetsBinding
                                    .instance
                                    .addPostFrameCallback((_) =>
                                    Navigator
                                        .push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PrimePlan_page(
                                                Bubble: state.SavedBubbleList![index],
                                                my_id: widget.User_id,
                                              is_saved:true,
                                            ),
                                      ),
                                    ));
                              }else {
                                WidgetsBinding
                                    .instance
                                    .addPostFrameCallback(
                                        (_) =>
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Plan_Screen(
                                                    Bubble: state
                                                        .SavedBubbleList![index],
                                                    my_id: widget.User_id,
                                                  is_saved:true,

                                                ),
                                          ),
                                        ));
                              }
                                      },
                                          child: Container(
                                            width: w/2.2,
                                            height:  h / 3.5,
                                            margin:  EdgeInsets.all(6.w),
                                            decoration:  BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(7.r),
                                                topRight: Radius.circular(7.r),
                                                bottomLeft: Radius.circular(7.r),
                                                bottomRight: Radius.circular(7.r),
                                              ),
                                              color : Color.fromRGBO(96, 96, 96, 1),
                                            ),
                                            child:
                                            Column(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: w/2.2,
                                                      height: h/6.2,
                                                      child: ClipRRect(
                                                        borderRadius:  BorderRadius.only(topRight:Radius.circular(h/97),topLeft:Radius.circular(h/97) ),
                                                        child:CachedNetworkImage(
                                                          fit: BoxFit.fitWidth,
                                                          imageUrl:
                                                          state.SavedBubbleList![index].image.toString(),

                                                          placeholder: (context, url) => Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Container(width:w/8,height:h/20,child: const Center(child: CircularProgressIndicator())),
                                                            ],
                                                          ),
                                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        width: w/2.2,
                                                        height: h/14.2,

                                                        decoration: BoxDecoration(
                                                          borderRadius : BorderRadius.only(topRight:Radius.circular(h/97),topLeft:Radius.circular(h/97) ),
                                                          color: Colors.transparent,
                                                          boxShadow : [BoxShadow(
                                                              color: Color(state.SavedBubbleList![index].Color!).withOpacity(.4),
                                                              offset: Offset(0,1),
                                                              blurRadius: 5.628571510314941
                                                          )],

                                                        )
                                                    ),
                                                    // Transform.rotate(
                                                    //   angle: -179.99999499104388 * (math.pi / 180),
                                                    //   child: Container(
                                                    //       width: w/2.2,
                                                    //       height: h/6.2,
                                                    //       decoration: BoxDecoration(
                                                    //         borderRadius : const BorderRadius.only(
                                                    //           topLeft: Radius.circular(7),
                                                    //           //    topRight: Radius.circular(7),
                                                    //           bottomLeft: Radius.circular(7),
                                                    //           bottomRight: Radius.circular(7),
                                                    //         ),
                                                    //         gradient : LinearGradient(
                                                    //             begin: const Alignment(5.730259880964636e-14,-2),
                                                    //             end: const Alignment(2,3.9593861611176705e-16),
                                                    //             colors: [Colors.transparent,Color(state.SavedBubbleList![index].Color!),]
                                                    //         ),
                                                    //       )
                                                    //   ),
                                                    // ),



                                                    Container(
                                                      width: w/2.8,
                                                      height: h/22,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          state.SavedBubbleList![index].User_type=="user"
                                                              ? Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 8,
                                                                backgroundColor: Color(int.parse(state.SavedBubbleList![index].Creator_Color!)),
                                                                backgroundImage: NetworkImage(state.SavedBubbleList![index].Creator_Avatar!),
                                                              ),
                                                              const SizedBox(width: 10,),
                                                              Text(state.SavedBubbleList![index].Creator_Alias!, textAlign: TextAlign.left, style:  TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 5.48.sp,
                                                                  letterSpacing: 0 ,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),),

                                                            ],
                                                          )
                                                              :  Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                              fontFamily: 'Red Hat Display',
                                                              fontSize: 5.48.sp,
                                                              letterSpacing: 0 ,
                                                              fontWeight: FontWeight.w600,
                                                              height: 1
                                                          ),),
                                                          const SizedBox(width: 5,),

                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: h/12,
                                                      bottom: h/10.7,
                                                      child: Container(
                                                        width:w/2.5,
                                                        height: h/10.99,
                                                        child:
                                                        IconButton(
                                                          icon:SvgPicture.asset(
                                                            "Assets/images/BiggerSaved.svg"

                                                            ,width:w/8 ,
                                                          ) ,
                                                          onPressed: (){
                                                            _SavedBloc.add(
                                                                UnSaveBubble((b) => b
                                                             ..Bubble_id = state.SavedBubbleList![index].id
                                                                    ..index = index

                                                                )
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),


                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [



                                                      Flexible(
                                                        child:
                                                        Container(
                                                          margin: EdgeInsets.only(left: h/50),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height:
                                                                6,
                                                              ),


                                                              Container(
                                                                width: w/2.2,
                                                                child:      Text(
                                                                  state.SavedBubbleList![index].Title.toString(),
                                                                  textAlign: TextAlign.left,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style : GoogleFonts.roboto().copyWith(
                                                                    color: Color(state.SavedBubbleList![index].Color!),
                                                                    fontSize: 9.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),

                                                              SizedBox(height: 3,),
                                                              Container(
                                                                width: w/2.2,
                                                                child:  Text(
                                                                  "At ${ state.SavedBubbleList![index].location.toString()}",
                                                                  textAlign: TextAlign.left,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style : GoogleFonts.roboto().copyWith(
                                                                    fontSize: 7.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),

                                                                ),
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Row(
                                                                children:[

                                                                  Container(
                                                                    width: w/55,
                                                                    child:
                                                                    Image.network(state.SavedBubbleList![index].Cateogory_Icon!),
                                                                  ),
                                                                  SizedBox(width: 3,),
                                                                  Container(
                                                                    width: w/4,
                                                                    child:Text(
                                                                      "${state.SavedBubbleList![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Text',
                                                                        fontSize: 7.sp,
                                                                        letterSpacing: 0,
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1
                                                                    ),),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            "Assets/images/Exclude.svg",
                                                            width: w/14,
                                                            color : Color(state.SavedBubbleList![index].Color!),
                                                          ),

                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                )


                                              ],
                                            ),
                                          ),
                                        )
                                        : InkWell(
                                        onTap: (){
                                          if (state.SavedBubbleList![index].type=="Prime") {
                                            WidgetsBinding
                                                .instance
                                                .addPostFrameCallback((_) =>
                                                Navigator
                                                    .push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PrimePlan_page(
                                                            Bubble: state.SavedBubbleList![index],
                                                            my_id: widget.User_id,
                                                          is_saved:true,
                                                        ),
                                                  ),
                                                ));
                                          }else {
                                            WidgetsBinding
                                                .instance
                                                .addPostFrameCallback(
                                                    (_) =>
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Plan_Screen(
                                                                Bubble: state.SavedBubbleList![index],
                                                                my_id: widget.User_id,
                                                              is_saved:true,
                                                            ),
                                                      ),
                                                    ));
                                          }

                                        },
                                        child:Center(
                                          child: Container(
                                              width:w/1.15,
                                              height: h/2.2,
                                              margin:  EdgeInsets.all(h/70),
                                              decoration:  BoxDecoration(
                                                borderRadius : BorderRadius.only(
                                                  topLeft: Radius.circular(h/95),
                                                  topRight: Radius.circular(h/95),
                                                  bottomLeft: Radius.circular(h/95),
                                                  bottomRight: Radius.circular(h/95),
                                                ),
                                                color : Color.fromRGBO(96, 96, 96, 1),
                                              ),
                                              child :Column(
                                                children: [
                                                  Stack(
                                                      children: [
                                                        Container(
                                                          width:w/1.15,
                                                          height: h/2.89,
                                                          child: ClipRRect(
                                                            borderRadius:  BorderRadius.only(topRight:Radius.circular(h/95),topLeft:Radius.circular(h/95)  ),
                                                            child:CachedNetworkImage(
                                                              fit: BoxFit.fill,
                                                              imageUrl:   state.SavedBubbleList![index].image.toString(),
                                                              placeholder: (context, url) => Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(width:w/8,height:h/20,child: const Center(child: CircularProgressIndicator())),
                                                                ],
                                                              ),
                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width:w/1.15,
                                                            height: h/12,
                                                            decoration: BoxDecoration(
                                                              color: Colors.transparent,
                                                              boxShadow : [BoxShadow(
                                                                  color: Color( state.SavedBubbleList![index].Color!).withOpacity(0.4),
                                                                  offset: Offset(0,4),
                                                                  blurRadius: 5.628571510314941
                                                              )],

                                                            )
                                                        ),

                                                        Container(
                                                            width:w/1.8,
                                                            height: h/10.89,
                                                            child:Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                state.SavedBubbleList![index].User_type=="user"
                                                                    ?Row(
                                                                  children: [

                                                                    CircleAvatar(
                                                                      radius: 13.5,
                                                                      backgroundColor: Color(int.parse(state.SavedBubbleList![index].Creator_Color!)),
                                                                      backgroundImage: NetworkImage(state.SavedBubbleList![index].Creator_Avatar!),
                                                                    ),
                                                                    const SizedBox(width: 10,),
                                                                    Text(state.SavedBubbleList![index].Creator_Alias!,
                                                                      textAlign: TextAlign.left, style:  TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Display',
                                                                        fontSize: 7.22.sp,
                                                                        letterSpacing: 0 ,
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1
                                                                    ),),

                                                                  ],
                                                                )
                                                                    :  Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 7.22.sp,
                                                                    letterSpacing: 0 ,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),

                                                                const Text(""),
                                                                const Text(""),

                                                              ],
                                                            )






                                                        ),

                                                        Positioned(
                                                          left: w/1.7,
                                                          child: Container(
                                                            width:w/3,
                                                            height: h/10.89,
                                                            child:
                                                            Center(
                                                                child: InkWell(
                                                                  onTap: (){
                                                                    _SavedBloc.add(UnSaveBubble((b) =>
                                                                    b..Bubble_id = state.SavedBubbleList![index].id
                                                                      ..index = index
                                                                    ));
                                                                  },
                                                                  child:
                                                                  SvgPicture.asset(
                                                                     "Assets/images/BiggerSaved.svg"
                                                                  ) ,
                                                                )
                                                            ),
                                                          ),
                                                        ),

                                                      ]
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Flexible(
                                                        child:
                                                        Container(
                                                          margin: EdgeInsets.only(left: h/50),
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height:
                                                                10,
                                                              ),

                                                              Container(
                                                                width:w/1.5,
                                                                child: Text(
                                                                  state.SavedBubbleList![index].Title.toString(),
                                                                  textAlign: TextAlign.left,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style : GoogleFonts.roboto().copyWith(
                                                                    color: Color(state.SavedBubbleList![index].Color!),
                                                                    fontSize:  12.22.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),

                                                              ),

                                                              const SizedBox(height: 4,),
                                                              Container(
                                                                width:w/1.15,
                                                                child:  Text(
                                                                  "At ${ state.SavedBubbleList![index].location.toString()}",
                                                                  textAlign: TextAlign.left,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style : GoogleFonts.roboto().copyWith(
                                                                    fontSize:  9.44.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),

                                                                ),
                                                              ),
                                                              const SizedBox(height: 8,),
                                                              Row(
                                                                children:[
                                                                  Container(
                                                                    width: w/25,
                                                                    child:
                                                                    Image.network(state.SavedBubbleList![index].Cateogory_Icon!),
                                                                  ),
                                                                  SizedBox(width: 3,),
                                                                  Container(
                                                                    width:w/2,
                                                                    child: Text(state.SavedBubbleList![index].Category.toString(),textAlign: TextAlign.left, style: TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Text',
                                                                        fontSize:  7.22.sp,
                                                                        letterSpacing: 0 ,
                                                                        fontWeight: FontWeight.w300,
                                                                        height: 1
                                                                    ),),
                                                                  )
                                                                ],
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5,),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(""),
                                                          SvgPicture.asset(
                                                            "Assets/images/Exclude.svg",
                                                            width: w/8,
                                                            color : Color(state.SavedBubbleList![index].Color!),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10,),

                                                    ],
                                                  )
                                                ],
                                              )

                                          ),
                                        ));

                                  //   InkWell(
                                  //     onTap: (){
                                  //
                                  // },
                                  // child: Center(
                                  //     child: Container(
                                  //         width:w/1.15,
                                  //         height: h/2.1,
                                  //         margin: EdgeInsets.all(10),
                                  //         decoration: BoxDecoration(
                                  //           borderRadius : BorderRadius.only(
                                  //             topLeft: Radius.circular(7.777777194976807),
                                  //           //  topRight: Radius.circular(7.777777194976807),
                                  //             bottomLeft: Radius.circular(7.777777194976807),
                                  //             bottomRight: Radius.circular(7.777777194976807),
                                  //           ),
                                  //           color : Color.fromRGBO(96, 96, 96, 1),
                                  //         ),
                                  //         child : Column(
                                  //           children: [
                                  //             Stack(
                                  //                 children: [
                                  //                   Container(
                                  //                     width:w/1.15,
                                  //                     height: h/2.89,
                                  //                     child: ClipRRect(
                                  //                       borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                  //                       child:CachedNetworkImage(
                                  //                         fit: BoxFit.fill,
                                  //                         imageUrl:  state.SavedBubbleList![index].image.toString(),
                                  //                         placeholder: (context, url) => Row(
                                  //                           mainAxisAlignment: MainAxisAlignment.center,
                                  //                           children: [
                                  //                             Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                  //                           ],
                                  //                         ),
                                  //                         errorWidget: (context, url, error) => Icon(Icons.error),
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                   Transform.rotate(
                                  //                     angle: -179.99999499423683 * (math.pi / 180),
                                  //                     child: Container(
                                  //                         width:w/1.15,
                                  //                         height: h/2.89,
                                  //                         decoration: BoxDecoration(
                                  //                           borderRadius : BorderRadius.only(
                                  //                             topLeft: Radius.circular(7),
                                  //                             //    topRight: Radius.circular(7),
                                  //                             bottomLeft: Radius.circular(7),
                                  //                             bottomRight: Radius.circular(7),
                                  //                           ),
                                  //                           gradient : LinearGradient(
                                  //                               begin: Alignment(5.730259880964636e-14,-2),
                                  //                               end: Alignment(2,3.9593861611176705e-16),
                                  //                               colors: [
                                  //                                 Colors.transparent,
                                  //                                 Color(state.SavedBubbleList![index].Color!),
                                  //                               ]
                                  //                           ),
                                  //                         )
                                  //                     ),
                                  //                   ),
                                  //                   Container(
                                  //                     width:w/1.15,
                                  //                     height: h/6.89,
                                  //                     child:Row(
                                  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //                       children: [
                                  //                         state.SavedBubbleList![index].User_type=="user"
                                  //                             ? Row(
                                  //                           children: [
                                  //                             CircleAvatar(
                                  //                               radius: 17,
                                  //                               backgroundColor: Color(state.SavedBubbleList![index].Color!),
                                  //                               backgroundImage: NetworkImage(state.SavedBubbleList![index].Creator_Avatar!),
                                  //                             ),
                                  //                             SizedBox(width: 10,),
                                  //                             Text(state.SavedBubbleList![index].Creator_Alias!,
                                  //                               textAlign: TextAlign.left, style: TextStyle(
                                  //                                 color: Color.fromRGBO(255, 255, 255, 1),
                                  //                                 fontFamily: 'Red Hat Display',
                                  //                                 fontSize: 14.477987289428711,
                                  //                                 letterSpacing: 0 ,
                                  //                                 fontWeight: FontWeight.w600,
                                  //                                 height: 1
                                  //                             ),),
                                  //
                                  //
                                  //                           ],
                                  //                         )
                                  //                             : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                  //                             color: Color.fromRGBO(255, 255, 255, 1),
                                  //                             fontFamily: 'Red Hat Display',
                                  //                             fontSize: 10.477987289428711,
                                  //                             letterSpacing: 0 ,
                                  //                             fontWeight: FontWeight.w600,
                                  //                             height: 1
                                  //                         ),),
                                  //
                                  //                         Text(""),
                                  //                         Text(""),
                                  //
                                  //                       ],
                                  //                     )
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //                   ),
                                  //                   Positioned(
                                  //                     left: h/9,
                                  //                     child: Container(
                                  //                         width:w,
                                  //                         height: h/6.89,
                                  //                       child:
                                  //                       IconButton(
                                  //                         icon: SvgPicture.asset("Assets/images/BiggerSaved.svg",width: w/5.6,),
                                  //                         onPressed: (){
                                  //                           _SavedBloc.add(UnSaveBubble((b) =>
                                  //                           b..Bubble_id = state.SavedBubbleList![index].id
                                  //                             ..index = index
                                  //                           ));
                                  //                         },
                                  //                       ),
                                  //                     ),
                                  //                   )
                                  //
                                  //                 ]
                                  //             ),
                                  //             Row(
                                  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //               children: [
                                  //
                                  //                 Flexible(
                                  //                   child:
                                  //                   Container(
                                  //                     margin: EdgeInsets.only(left: h/50),
                                  //                     child: Column(
                                  //                       children: [
                                  //                         const SizedBox(
                                  //                           height:
                                  //                           10,
                                  //                         ),
                                  //                         Container(
                                  //
                                  //                           child: Text(
                                  //                             state.SavedBubbleList![index].Title.toString(),
                                  //                             textAlign: TextAlign.left,
                                  //                             overflow: TextOverflow.ellipsis,
                                  //                             style: _TextTheme.headlineLarge!.copyWith(
                                  //                               color: Color(state.SavedBubbleList![index].Color!),
                                  //                               fontSize: 25,
                                  //                               letterSpacing: 0,
                                  //                               fontWeight: FontWeight.w600,
                                  //                             ),
                                  //                           ),
                                  //
                                  //                         ),
                                  //                         SizedBox(height: 5,),
                                  //                         Container(
                                  //                           child:  Text(
                                  //                             "At ${ state.SavedBubbleList![index].location.toString()}",
                                  //                             textAlign: TextAlign.left,
                                  //                             overflow: TextOverflow.ellipsis,
                                  //                             style: _TextTheme.headlineLarge!.copyWith(
                                  //                               fontSize: 17,
                                  //                               letterSpacing: 0,
                                  //                               fontWeight: FontWeight.w600,
                                  //                             ),
                                  //
                                  //                           ),
                                  //                         ),
                                  //                         SizedBox(height: 5,),
                                  //                         Text('Music Event', textAlign: TextAlign.left, style: TextStyle(
                                  //                             color: Color.fromRGBO(255, 255, 255, 1),
                                  //                             fontFamily: 'Red Hat Text',
                                  //                             fontSize: 12.222221851348877,
                                  //                             letterSpacing: 0 ,
                                  //                             fontWeight: FontWeight.normal,
                                  //                             height: 1
                                  //                         ),)
                                  //                       ],
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(width: 5,),
                                  //                 SvgPicture.asset(
                                  //                   "Assets/images/Exclude.svg",
                                  //                   width: w/8,
                                  //                   color : Color(state.SavedBubbleList![index].Color!),
                                  //                 ),
                                  //
                                  //               ],
                                  //             )
                                  //           ],
                                  //         )
                                  //
                                  //     ),
                                  //   ));
                                }
                            )
                        ),
                      )
                  )
                      : Container(
                    width: w/1.1,
                    height: h/1.141,
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SizedBox(height: h/20,),
                            Container(
                    width: w,
                    child: Image.asset("Assets/images/Be_There 2 v2.png",fit: BoxFit.fill,),
                  ),
                            Text('You haven’t saved any Bubbles', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(96, 96, 96, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize: 18.11.sp,
                                letterSpacing: 0 ,
                                fontWeight: FontWeight.w400,
                                height: 1
                            ),),
                            InkWell(
                              onTap: (){
                                _SavedBloc.add(ShowHomePage((b) => b..HomePageStatus = true));

                                // WidgetsBinding.instance!
                                //     .addPostFrameCallback((_) =>
                                //     Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                //         NavigatorTopBar(GotToHomeAndOpenPanel: true,))));
                              },
                              child: Container(
                                  width: w/1.2,
                                  height: h/13,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular( h/20.5),
                                      topRight:Radius.circular( h/20.5),
                                      bottomLeft: Radius.circular( h/20.5),
                                      bottomRight:Radius.circular( h/20.5),
                                    ),
                                    boxShadow : [BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                        offset: Offset(0,0),
                                        blurRadius: 10
                                    )],
                                    color : Color.fromRGBO(207, 109, 56, 1),
                                  ),
                                child: Center(
                                  child:
                                  Text('Browse Bubbles', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 20.sp,
                                      letterSpacing: 0 ,
                                      fontWeight: FontWeight.w400,
                                      height: 1
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                
                      : state.isLoading == true
                      ? Container(
                      width: w,
                      height: h / 1.5,
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
                      ))
                      : Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: w,
                          height: h / 10,
                          child:
                          const Text("Error"),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            //    state.UnSaveIsloading == true
            //   ? Container(
            //   width: w,
            //   height: h,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //       mainAxisAlignment:
            //       MainAxisAlignment
            //           .center,
            //       children: [
            //       Center(
            //       child: listLoader(
            //       context:
            //       context)),
            // ],
            // ),
            //     ],
            //   )) :Text("")
          ],
            )
        ),
      );
    }
    ));

  }
  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}
