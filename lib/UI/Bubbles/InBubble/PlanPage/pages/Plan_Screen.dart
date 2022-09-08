import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
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
                                                              SizedBox(width: 5,),
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
                                                        SizedBox(height: 10,),
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
                                                        SizedBox(height: 10,),
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
                                                                          ? SizedBox(width: 5,)
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
                                                                          ? SizedBox(width: 5,)
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
                      SizedBox(height: 2,),
                      Text('Bubble will be activated in ${DateTime.parse(widget.Bubble!.StartDate!).difference(DateTime.now()).inDays} days - ${DateTime.parse(widget.Bubble!.StartDate!)}',
                        textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 15.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            height: 1
                        ),),
                      SizedBox(height: 2,),
                      Text('Save the bubble to keep up with all bubble news',
                        textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(147, 147, 147, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 13.5.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                            height: 1
                        ),),
                      SizedBox(height: 2,),

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
                    SizedBox(height: 7,),
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




