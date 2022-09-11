import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Plan_Screen extends StatefulWidget {
  Plan_Screen({Key? key,
    required  this.Bubble,
    required  this.my_id,
    required  this.is_saved
    ,this.List_Type
  }) : super(key: key);
  BubbleData? Bubble;
  int? my_id;
  bool? is_saved = false;

 String? List_Type = "";
  @override
  State<Plan_Screen> createState() => _Plan_ScreenState();
}


class _Plan_ScreenState extends State<Plan_Screen> {
bool selected = false;
final _PlanPage_Bloc = sl<PlanPageBloc>();
bool is_Saved= false;
@override
  void initState() {
    super.initState();
    _PlanPage_Bloc.add(GiveMeifItsSaved((b) => b..is_saved =widget.is_saved! ));
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
        statusBarColor: Color(widget.Bubble!.Color!),
     //   systemNavigationBarColor: Color(widget.Bubble!.Color!),
      ),
    );
    socket!.io..disconnect()..connect();
    // _PlanPage_Bloc.add(GetDetailedPlan((b) => b
    // ..Event_id=widget.Event_id
    // ));
}

final PanelController PanelControllerr = PanelController();
@override
  void dispose() {
    super.dispose();

}
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  WillPopScope(
        onWillPop: () async {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: Color(0xff303030),
                systemNavigationBarColor: Color(0xff303030)
            ),
          );
          return true;
        },
    child:

    BlocBuilder(
        bloc: _PlanPage_Bloc,
        builder: (BuildContext Context, PlanPageState state){

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


          alreatDialogBuilder(
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
                barrierDismissible: false,
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
                                                    builder: (context) => Sprints(my_ID: id, IS_sprints: false, receiver_id: UserData.ID!,His_Alias:UserData.Alias!,),),   ));
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


          String Value = widget.Bubble!.Color.toString();
      if (Value.contains("#", 0)) {
        Value = Value.substring(1);
        Value = "0xff$Value";
      }
      var BackgroundColor;
      var myInt = int.parse(Value);
      BackgroundColor  = myInt;

      return

        Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  width: w,
                  height: h/1.2,
                  child: Stack(
                    children: [
                      Container(
                              width: w,
                        height: h/1.2,
                              child: Stack(
                                children: [
                                  Container(
                                    width: w,
                                    height: h / 2,
                                    margin: EdgeInsets.only(top: h / 50),
                                    child:  CachedNetworkImage(
                                      imageUrl: widget.Bubble!.image.toString(),
                                      imageBuilder: (context, imageProvider) => Container(
                                        width: w,
                                        height: h / 2.5,

                                        decoration: BoxDecoration(
                                          image:DecorationImage(image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),

                                        ),

                                      ),
                                      placeholder: (context, url) => Container(
                                          width: w,
                                          height: h / 2.5,child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(),
                                        ],
                                      )),
                                      errorWidget: (context, url, error) => Container(
                                          width: w,
                                          height: h / 2.5,child: Icon(Icons.error)),
                                    )


                                  ),

                                  SlidingUpPanel(
                                    controller: PanelControllerr,
                                    color: Colors.transparent,

                                    maxHeight:  h,
                                    minHeight: h/2.5,
                                    onPanelOpened:(){
                                    },
                                    borderRadius:  BorderRadius.only(
                                      topLeft: Radius.circular(h/40),
                                      topRight: Radius.circular(h/40),
                                    ),
                                    panel:  Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 42.h,
                                              child:Container(
                                                width: w,
                                                height: h/1.31,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff303030),
                                                  borderRadius : BorderRadius.only(
                                                    topLeft:  Radius.circular(17.r),
                                                    topRight:  Radius.circular(17.r),
                                                  ),
                                                ),
                                                child:    Column(
                                                    children: [

                                                        SizedBox(height: h / 25,),
                                                        Container(
                                                          width: w/1.16,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: w/20,
                                                                child:
                                                                Image.network(widget.Bubble!.Cateogory_Icon!),
                                                              ),
                                                              SizedBox(width: 5.w,),
                                                              Text("${widget.Bubble!.Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Text',
                                                                  fontSize: 14.sp,
                                                                  letterSpacing: 0.3,
                                                                  fontWeight: FontWeight.w300,
                                                                  height: 1
                                                              ),),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: h / 50,),
                                                        Container(
                                                          width: w/1.16,
                                                          child: Text("At ${widget.Bubble!.location.toString()}",
                                                            style : GoogleFonts.roboto().copyWith(
                                                                color: Color(BackgroundColor),
                                                                fontSize: 23.sp,
                                                                letterSpacing: 0.4,
                                                                fontWeight: FontWeight.w600,
                                                                height: 1
                                                            ),),
                                                        ),
                                                      Expanded(
                                                          child: Container(
                                                              width: w,
                                                              height: h / 1.9,
                                                              child: ScrollConfiguration(
                                                                  behavior: MyBehavior(),
                                                                  child: SingleChildScrollView(
                                                                  child:Column(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.start,
                                                                      children: [
                                                        SizedBox(height: h / 50,),

                                                        Container(
                                                          width: w/1.16,
                                                          child: Text("${widget.Bubble!.Description.toString()}",
                                                            textAlign: TextAlign.left,
                                                            style : GoogleFonts.roboto().copyWith(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontSize: 13.sp,
                                                                letterSpacing: 0.5,
                                                                fontWeight: FontWeight.w300,
                                                                height: 1.6363636363636365
                                                            ),),
                                                        ),
                                                        SizedBox(height: h / 50,),
                                                        // widget.Bubble!.User_type=="user"
                                                        //     ? Container(
                                                        //     width: w,
                                                        //     child: Row(
                                                        //         children: [
                                                        //           Container(
                                                        //               width: w / 2.7,
                                                        //               // color: Colors.black,
                                                        //               margin:EdgeInsets.only(
                                                        //                   right: h / 100,left: h/23),
                                                        //               child:
                                                        //               Text(
                                                        //                   'Bubble Duration:',
                                                        //                   textAlign: TextAlign.left,
                                                        //                   style: _TextTheme
                                                        //                       .headlineLarge!
                                                        //                       .copyWith(
                                                        //                     fontFamily: 'Red Hat Display',
                                                        //                     fontWeight: FontWeight
                                                        //                         .w400,
                                                        //                     fontSize: 15,
                                                        //                   ))
                                                        //           )
                                                        //           ,
                                                        //           Container(
                                                        //               width: w / 2.7,
                                                        //               margin: EdgeInsets.only(
                                                        //                   left: h / 40),
                                                        //               child :
                                                        //               Text('Event Date:',
                                                        //                   textAlign: TextAlign.left,
                                                        //                   style: _TextTheme
                                                        //                       .headlineLarge!
                                                        //                       .copyWith(
                                                        //                     fontFamily: 'Red Hat Display',
                                                        //                     fontWeight: FontWeight
                                                        //                         .w400,
                                                        //                     fontSize: 15,
                                                        //                   ))
                                                        //           ),
                                                        //
                                                        //
                                                        //         ]
                                                        //     )
                                                        // )
                                                        //     : Text(""),
                                                        // widget.Bubble!.User_type=="user"
                                                        //     ?Container(
                                                        //   width: w,
                                                        //   child: Row(
                                                        //     children: [
                                                        //       Container(
                                                        //         width: w / 2.7,
                                                        //         height: h / 5,
                                                        //         // color: Colors.black,
                                                        //         margin:EdgeInsets.only(
                                                        //             right: h / 100,left: h/23),
                                                        //         child: Column(
                                                        //           mainAxisAlignment:
                                                        //           MainAxisAlignment.start,
                                                        //           children: [
                                                        //             Row(
                                                        //               children: [
                                                        //                 const SizedBox(
                                                        //                   width: 10,
                                                        //                 ),
                                                        //                 SizedBox(
                                                        //                   height: h / 13,
                                                        //                   child: Column(
                                                        //                     mainAxisAlignment:
                                                        //                     MainAxisAlignment
                                                        //                         .spaceAround,
                                                        //                     children: [
                                                        //                       Image.asset(
                                                        //                           "Assets/images/Group 229.png"),
                                                        //                       Image.asset(
                                                        //                           "Assets/images/Group 229.png"),
                                                        //                     ],
                                                        //                   ),
                                                        //                 ),
                                                        //                 Text(
                                                        //                     ' ${widget.Bubble!.StartDate.toString()}\n'
                                                        //                         '  To \n'
                                                        //                         ' ${widget.Bubble!.endDate.toString()}',
                                                        //                     textAlign:
                                                        //                     TextAlign.left,
                                                        //                     style: _TextTheme
                                                        //                         .headline5),
                                                        //               ],
                                                        //             ),
                                                        //
                                                        //
                                                        //           ],
                                                        //         ),
                                                        //       ),
                                                        //
                                                        //       Container(
                                                        //         width: w / 2.7,
                                                        //         height: h / 5,
                                                        //         margin: EdgeInsets.only(
                                                        //             left: h / 40,top: h/50),
                                                        //         child: ListView.separated(
                                                        //           shrinkWrap: true,
                                                        //           padding: EdgeInsets.zero,
                                                        //           physics:
                                                        //           const BouncingScrollPhysics(),
                                                        //           scrollDirection:
                                                        //           Axis.vertical,
                                                        //           itemCount: widget.Bubble!.dates!.length,
                                                        //           itemBuilder:
                                                        //               (BuildContext context,
                                                        //               int index) {
                                                        //             return Row(
                                                        //               children: [
                                                        //                 Image.asset(
                                                        //                     "Assets/images/Group 229.png"),
                                                        //                 const SizedBox(
                                                        //                   width: 5,
                                                        //                 ),
                                                        //                 Flexible(
                                                        //                   child: Text(
                                                        //                       widget.Bubble!.dates![index].date.toString(),
                                                        //                       textAlign:
                                                        //                       TextAlign
                                                        //                           .left,
                                                        //                       style: _TextTheme
                                                        //                           .headline5),
                                                        //                 ),
                                                        //               ],
                                                        //             );
                                                        //           },
                                                        //           separatorBuilder:
                                                        //               (BuildContext context,
                                                        //               int index) {
                                                        //             return const SizedBox(
                                                        //               height: 3,
                                                        //             );
                                                        //           },
                                                        //         ),
                                                        //       ),
                                                        //     ],
                                                        //   ),
                                                        // )
                                                        //     :Text(""),
                                                        //
                                                        SizedBox(height: 10.h,),
                                                        Container(
                                                          width: w/1.16,
                                                          child:
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Organizers:', textAlign: TextAlign.left, style: TextStyle(
                                                                  color:     Color(BackgroundColor),
                                                                  fontFamily: 'Red Hat Text',
                                                                  fontSize: 18.sp,
                                                                  fontStyle: FontStyle.italic,
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),),
                                                              Text('   ${widget.Bubble!.saved_users!.length} people saved it:',
                                                                textAlign: TextAlign.left, style: TextStyle(
                                                                    color:   Color(BackgroundColor),
                                                                    fontFamily: 'Red Hat Text',
                                                                    fontSize: 18.sp,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                              Text(""),

                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10.h,),
                                                        Row(
                                                          children: [
                                                            SizedBox(width: h/30,),
                                                            widget.Bubble!.Organizers!.length!=0?
                                                            Container(
                                                              width: w/4,height: h/15,
                                                              child: ListView.builder(
                                                                itemCount: widget.Bubble!.Organizers!.length<3?widget.Bubble!.Organizers!.length:3,
                                                                scrollDirection: Axis.horizontal,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  String Value = widget.Bubble!.Organizers![index].background_color.toString();
                                                                  if (Value.contains("#",0)){
                                                                    Value = Value.substring(1);
                                                                    Value = "0xff$Value";
                                                                  }
                                                                  var myInt = int.parse(Value);
                                                                  var BackgroundColor= myInt;
                                                                  return    Row(
                                                                    children: [
                                                                      index==0
                                                                          ? SizedBox(width: 5.w,)
                                                                          : Container(),
                                                                      Align(
                                                                          widthFactor: 0.75,
                                                                          alignment: Alignment.topCenter,
                                                                          child:
                                                                          Container(
                                                                            child: Column(
                                                                              children: [
                                                                                Wrap(
                                                                                  children: [
                                                                                    CircleAvatar(
                                                                                      backgroundColor: Color(BackgroundColor),
                                                                                      backgroundImage: NetworkImage(widget.Bubble!.Organizers![index].avatar.toString()),
                                                                                    )
                                                                                  ],

                                                                                ),
                                                                              ],

                                                                            ),
                                                                          )
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            )
                                                                :Container(width: w/5,height: h/15,child: Center(child: Text(""))),
                                                            Text("+${widget.Bubble!.Organizers!.length.toString()}"
                                                              , textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Text',
                                                                  fontSize: 19.sp,
                                                                  fontStyle: FontStyle.italic,
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w500,
                                                                  height: 1
                                                              ),),
                                                            SizedBox(width: h/30,),
                                                            Container(
                                                              width: w/3.5,height: h/15,
                                                              margin: EdgeInsets.only(left: h/50),
                                                              child: ListView.builder(
                                                                itemCount: widget.Bubble!.saved_users!.length<3? widget.Bubble!.saved_users!.length:3,
                                                                scrollDirection: Axis.horizontal,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  String Value =  widget.Bubble!.saved_users![index].background_color.toString();
                                                                  if (Value.contains("#",0)){
                                                                    Value = Value.substring(1);
                                                                    Value = "0xff$Value";
                                                                  }
                                                                  var myInt = int.parse(Value);
                                                                  var BackgroundColor= myInt;
                                                                  return    Row(
                                                                    children: [
                                                                      index==0
                                                                          ? SizedBox(width: 5.w,)
                                                                          : Container(),
                                                                      Align(
                                                                          widthFactor: 0.75,
                                                                          alignment: Alignment.topCenter,
                                                                          child:
                                                                          Container(
                                                                            child: Column(
                                                                              children: [
                                                                                Wrap(
                                                                                  children: [
                                                                                    CircleAvatar(
                                                                                      backgroundColor: Color(BackgroundColor),
                                                                                      backgroundImage: NetworkImage( widget.Bubble!.saved_users![index].avatar.toString()),
                                                                                    )
                                                                                  ],

                                                                                ),
                                                                              ],

                                                                            ),
                                                                          )
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),


                                                            Container(
                                                              margin: EdgeInsets.only(left: h/20),
                                                              child: Text("+${ widget.Bubble!.saved_users!.length}"
                                                                , textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Text',
                                                                    fontSize: 19.sp,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w500,
                                                                    height: 1
                                                                ),),
                                                            )

                                                          ],
                                                        ),
                                                        ]
                                                    )
                                                  )
                                                              )
                                                )
                                                )


                                                      //SizedBox(height: h / 5,),
                                                    ],
                                                  ),
                                                ),
                                              ),



                                          widget.Bubble!.User_type=="user"
                                              ? Positioned(
                                            right: 40.w,
                                            top:0,
                                            child: CircleAvatar(
                                              radius: 40.w,
                                              backgroundColor: Color(int.parse(widget.Bubble!.Creator_Color!)),
                                              backgroundImage: NetworkImage(widget.Bubble!.Creator_Avatar!),
                                            ),
                                          )
                                              : Text(""),
                                        ],
                                      ),
                                    )


                                  ),
                                ],
                              ),
                            ),



                      Positioned(
                        top: 0,
                        child: Container(
                          width: w,
                          height: h/14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(h/40),
                                bottomRight:  Radius.circular(h/40),
                              ),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                  blurRadius: 4
                              )
                              ],
                              color:
                              Color(  BackgroundColor)



                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: w/7,
                                margin: EdgeInsets.only(top: h/500,left: 10.w),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/Frame 11.svg",
                                      width: 30.w,
                                      color: Colors.white),
                                  onPressed: () {
                                    SystemChrome.setSystemUIOverlayStyle(
                                      const SystemUiOverlayStyle(
                                          statusBarColor: Color(0xff303030),
                                          systemNavigationBarColor: Color(0xff303030)
                                      ),
                                    );
                                    Navigator.pop(context,"${state.is_Saved!}");
                                  },
                                ),
                              ),

                              Flexible(
                                child: Container(
                                  child:
                                      Text(
                                        widget.Bubble!.Title!,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style : GoogleFonts.roboto().copyWith(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontSize: 19.sp,
                                            letterSpacing: 0.2,
                                            fontWeight: FontWeight.w600,
                                            height: 1
                                        ),),

                                ),
                              ),

                              Container(
                                width: w/5,
                                child: InkWell(
                                  onTap: (){
                                    _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                                    b..Bubble_id = widget.Bubble!.id
                                    ));
                                  },
                                  child: SvgPicture.asset(
                                   state.is_Saved!
                                        ?"Assets/images/Save_Marker(1).svg"
                                        :"Assets/images/Save_outline.svg",
                                    color: Colors.white,
                                    width: w/24,

                                  ),
                                ),
                              ),



                            ],
                          ),

                        ),
                      ),
                      // widget.Bubble!.User_type=="user"
                      //     ? Positioned(
                      //   left: w/1.4,
                      //   top: h/2.3,
                      //   child: CircleAvatar(
                      //     radius: 40.w,
                      //     backgroundColor: Color(int.parse(widget.Bubble!.Creator_Color!)),
                      //     backgroundImage: NetworkImage(widget.Bubble!.Creator_Avatar!),
                      //   ),
                      // )
                      //     : Text(""),
                    ],
                  )
              ),

              !widget.Bubble!.isAvailable!
             ?  Container(
                decoration: BoxDecoration(
                  color: Color(0xff303030),
                  // boxShadow: [BoxShadow(
                  //     color: Color.fromRGBO(0, 0, 0, 0.25),
                  //     offset: Offset(0, -20),
                  //     blurRadius: 10
                  // )
                  // ],
                ),
               child: Column(children: [
                      Text("UTC",
                        textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 20.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            height: 1
                        ),),
                      SizedBox(height: 2.h,),
                      Text('Bubble will be activated in ${DateTime.parse(widget.Bubble!.StartDate!).difference(DateTime.now()).inDays} days - ${DateTime.parse(widget.Bubble!.StartDate!)}',
                        textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 15.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            height: 1
                        ),),
                      SizedBox(height: 2.h,),
                      Text('Save the bubble to keep up with all bubble news',
                        textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(147, 147, 147, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 13.5.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                            height: 1
                        ),),
                      SizedBox(height: 2.h,),

                    ],),
             )
              : Container(
                decoration: BoxDecoration(
                  color: Color(0xff303030),
                    // boxShadow: [BoxShadow(
                    //     color: Color.fromRGBO(0, 0, 0, 0.25),
                    //     offset: Offset(0, -20),
                    //     blurRadius: 10
                    // )
                   // ],
                ),
                child: Column(

                  children: [
                    Center(
                      child: Container(
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Active Users:",
                                style:TextStyle(
                                    color:     Color(BackgroundColor),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 15.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ${widget.Bubble!.users_in_bubble!.length}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 14.sp,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),)

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Center(
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance
                              .addPostFrameCallback(
                                  (_) =>

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GroupChat(plan_Title:widget.Bubble!.Title!,
                                              MY_ID: widget.my_id,
                                              bubble_id: widget.Bubble!.id!,
                                              Plan_Description: widget.Bubble!.Description!,
                                              Bubble_Color: BackgroundColor,
                                              Want_LOcation_cHECK : true
                                          ),),
                                  ));
                        },
                        child:Container(
                          width: w / 2.3,
                          height: h / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular( h/10.5),
                              topRight:Radius.circular( h/10.5),
                              bottomLeft: Radius.circular( h/10.5),
                              bottomRight:Radius.circular( h/10.5),
                            ),
                            color:   Color(BackgroundColor),
                          ),
                          child:   Center(
                            child:
                            Text('Enter Bubble', textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 18.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                              ),)
                            ,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



            ],
          ),
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




