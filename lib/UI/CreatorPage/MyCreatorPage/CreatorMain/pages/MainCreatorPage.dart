import 'package:bubbles/App/app.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_state.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/pages/FlowsChat_Screen.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/pages/EditPage_Screen.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/ManageBubbles_Screen/pages/ManageBubbles_Screen.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/PageAdmins_Screen/pages/PageAdmins_Screen.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCreatorPage extends StatefulWidget {
   MyCreatorPage({Key? key}) : super(key: key);

  @override
  State<MyCreatorPage> createState() => _MyCreatorPageState();
}

class _MyCreatorPageState extends State<MyCreatorPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: 
        Column(
          children: [
          Container(
          width: w,
          height: h/3.6,
          child:
            Stack(
            children: [
              Container(
                width: w,
                height: h/4,
                child: Image.asset("Assets/images/Rectangle 136.png",fit: BoxFit.fill,),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: w/3.3,
                  child: CircleAvatar(
                    radius: 37.w,
                  ),
                ),
              ),
            ],
            )
          ),
            SizedBox(height: 5,),
            Row(
              children: [
            SizedBox(width: w/20,),
                Container(
                  width: w/3.3,
                child :
                Column(
                  children: [

                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Text('Mariza_Life', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 16.sp,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                              ],
                            ),


                    Text('Creator/Organiser', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(234, 234, 234, 1),
                        fontFamily: 'Red Hat Text',
                        fontSize: 13.sp,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w300,
                        height: 1.7
                    ),),
                  ],
                )
                ),
                SizedBox(width: w/20,),
                Text('138', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 18.sp,
                    letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1.1333333333333333
                ),),
                SvgPicture.asset("Assets/images/widget.svg",width:20,),
                SizedBox(width: w/14,),
                Text('7', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 18.sp,
                    letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1.1333333333333333
                ),),
                Text(' Active', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 11.8.sp,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w300,
                    height: 1.7
                ),),
                SizedBox(width: w/14,),
                Text('4', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 18.sp,
                    letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w600,
                    height: 1.1333333333333333
                ),),
                Text(' Upcoming', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Red Hat Text',
                    fontSize: 11.8.sp,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.w300,
                    height: 1.7
                ),)

              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: w/1.2,
              child:Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sapien aliquet in nam interdum. Mauris egestas purus in nibh. Consectetur adipiscing elit. ', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Red Hat Text',
                  fontSize: 13.sp,
                  letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w300,
                  height: 1.5
              ),),
            ),
            SizedBox(height: 10,),
            Container(
              width: w,
              height: h/10,
              margin: EdgeInsets.only(left: w/18),
              child:ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics:  AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemCount:20,
                    separatorBuilder:(BuildContext context, int index) {
                    return  SizedBox(width: 3);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return CircleAvatar(radius: 27.w,);
                    }
              )
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: w/20,),
                Container(
                  width: w/3.9,
                  child:    Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('20K', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 18.sp,
                              letterSpacing: 0.4 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w500,
                              height: 1
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('subscribers', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 14.sp,
                              letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w500,
                              height: 1
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: (){
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                                    EditPage_Screen(),
                            ),
                    ));
                  },
                  child: Container(
                      width: w/4.7,
                      height: h/16.9,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          topRight: Radius.circular(5.r),
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        ),
                        border : Border.all(
                          color: Color.fromRGBO(130, 125, 226, 1),
                          width: 2,
                        ),
                      ),
                    child:    Container(
                      width: w/6,
                      height: h/15.9,
                      child:

                      Center(
                      child:
                      FittedBox(
                        child: Text('Edit Page', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 12.sp,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w300,
                            height: 1.7
                        ),),
                      )
                      ,
                    ),
                    )
                  ),
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageAdmins_Screen(),
                      ),
                    ));
                  },
                  child: Container(
                      width: w/4.7,
                      height: h/16.9,
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r),
                        bottomLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                      border : Border.all(
                        color: Color.fromRGBO(130, 125, 226, 1),
                        width: 2,
                      ),
                    ),
                    child:Center(
                      child :


                  Text('Admin Deck', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 12.sp,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w300,
                            height: 1.7
                        ),),



                    )
                  ),
                ),
                SizedBox(width: 5,),

                InkWell(
                  onTap: (){
                         WidgetsBinding.instance
                                            .addPostFrameCallback((_) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ManageBubbles_Screen(),
                                          ),
                                        ));
                  },
                  child: Container(
                    width: w/4.7,
                    height: h/16.9,
                    decoration: BoxDecoration(
                      borderRadius : BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r),
                        bottomLeft: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                      border : Border.all(
                        color: Color.fromRGBO(130, 125, 226, 1),
                        width: 2,
                      ),
                    ),
                    child:
              Center(
                        child:
                      Text('Manage', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 12.sp,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w300,
                              height: 1.7
                          ),),


                      ),

                  ),
                ),
                SizedBox(width: 5,),
              ],
            ),
            SizedBox(height: h/30,),
            InkWell(
              onTap: (){
                // WidgetsBinding.instance
                //     .addPostFrameCallback(
                //         (_) =>
                //
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) =>
                //                 GroupChat(
                //                   plan_Title:"Your Bubble",
                //                   MY_ID: id,
                //                   bubble_id:1000000,
                //                   Bubble_Color: 0xff800080,
                //                   Plan_Description:"",
                //                   Want_LOcation_cHECK: false,
                //                 ),),
                //         ));
              },
              child: Container(
                  width: w/1.1,
                  height: h/15,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(5.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(5.r),
                    ),
                    boxShadow : [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.800000011920929),
                        offset: Offset(0,0),
                        blurRadius: 9
                    )],
                    color : Color.fromRGBO(47, 47, 47, 1),
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("Assets/images/Exclude.svg",width:w/8,),
                    Text('Join the community bubble', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Red Hat Display',
                        fontSize: 14.999999046325684.sp,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.w900,
                        height: 1
                    ),),
                    Container(
                      width: w/5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('42'
                      , textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Red Hat Text',
                  fontSize: 17.sp,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w500,
                  height: 0.6
              ),),
                          Text('active', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 14.sp,
                              letterSpacing: 0.4 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w300,
                              height: 0.9
                          ),)
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // TopicFlowDialog(FlowData data, int index) {
  //   TextTheme _TextTheme = Theme.of(context).textTheme;
  //   ColorScheme ColorS = Theme.of(context).colorScheme;
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;
  //   return  showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (Context)
  //       {
  //         return
  //           AlertDialog(
  //               backgroundColor: Colors.transparent,
  //               insetPadding: EdgeInsets.all(h / 50),
  //               content:
  //               Container(
  //                 width: w / 1.1,
  //
  //                 height: h / 3.8,
  //                 decoration:  BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(5.r),
  //                     topRight: Radius.circular(5.r),
  //                     bottomLeft: Radius.circular(5.r),
  //                     bottomRight: Radius.circular(5.r),
  //                   ),
  //                   boxShadow: [
  //                     BoxShadow(
  //                         color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
  //                         offset: Offset(0, 0),
  //                         blurRadius: 10.645160675048828)
  //                   ],
  //                   color: Color.fromRGBO(96, 96, 96, 1),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     Row(
  //
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         SizedBox(width: w/30,),
  //                         Row(
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundColor:
  //                               Color(data.Who_Made_it_Color!),
  //                               backgroundImage:
  //                               NetworkImage(data.Who_Made_it_Avatar!),
  //                               radius: 20.w,
  //                             ),
  //                             SizedBox(width: 10,),
  //                             Text(
  //                               data.Who_Made_it_Alias!,
  //                               textAlign: TextAlign.left,
  //                               style: _TextTheme.headline3!.copyWith(
  //                                 color: ColorS.errorContainer,
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 13.sp,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(width: w/3,),
  //                         Text(data.time!,
  //                             textAlign: TextAlign.right,
  //                             style: _TextTheme.headline2!.copyWith(
  //                                 fontWeight: FontWeight.w300,
  //                                 color:  Color(0xffEAEAEA),
  //                                 fontSize: 9.sp
  //                             )),
  //
  //
  //                       ],
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Container(
  //                           height: h / 22,
  //                           width: w / 1.4,
  //                           padding: EdgeInsets.only(top: h / 100),
  //                           child: Text(
  //                             data.Title!,
  //                             textAlign: TextAlign.left,
  //                             style: GoogleFonts.roboto().copyWith(
  //                                 color: Color.fromRGBO(234, 234, 234, 1),
  //                                 fontSize: 17.sp,
  //                                 letterSpacing: 0,
  //                                 fontWeight: FontWeight.w700,
  //                                 height: 1),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Container(
  //                       width: w / 1.4,
  //                       child: Text(
  //                         data.Content!,
  //                         textAlign: TextAlign.left,
  //                         style: GoogleFonts.roboto().copyWith(
  //                             color: Color.fromRGBO(234, 234, 234, 1),
  //                             fontSize: 17.sp,
  //                             letterSpacing: 0,
  //                             fontWeight: FontWeight.w400,
  //                             height: 1),
  //                       ),
  //                     ),
  //                     Container(
  //                       width: w / 1.4,
  //                       padding: EdgeInsets.only(bottom: h / 100),
  //                       child: Row(
  //                         children: [
  //                           Container(
  //                             width: w / 5,
  //                             height: h / 24,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(50.r),
  //                                 topRight: Radius.circular(50.r),
  //                                 bottomLeft: Radius.circular(50.r),
  //                                 bottomRight: Radius.circular(50.r),
  //                               ),
  //                               color: Color(widget.Bubble_Color),
  //                             ),
  //                             child: InkWell(
  //                               onTap: () {
  //                                 bool GetInStatus = false;
  //                                 for (int j = 0; j < AllBubblesIDS!.length; j++) {
  //                                   if (widget.bubble_id == AllBubblesIDS![j]) {
  //                                     if (AllBubblesStatus![j] == 1)
  //                                       GetInStatus = true;
  //                                   }
  //                                 }
  //
  //                                 if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
  //
  //                                   data.Flow_type = "TopicFlow";
  //                                   data.FlowMessage_id = data.FlowMessage_id;
  //                                   data.ISMediaDump = false;
  //                                   data.Color = widget.Bubble_Color;
  //                                   WidgetsBinding.instance
  //                                       .addPostFrameCallback((_) =>
  //                                       Navigator.push(
  //                                         context,
  //                                         MaterialPageRoute( //receiver_id: ,my_ID: ,
  //                                           builder: (context) =>
  //                                               FlowsChat(
  //                                                 Plan_Description: widget
  //                                                     .Plan_Description,
  //                                                 flow: data,
  //                                                 plan_Title: widget.plan_Title,
  //                                                 bubble_id: widget.bubble_id,
  //                                                 MY_ID: widget.MY_ID,
  //                                               ),),));
  //                                 } else {
  //                                   OutsideBubbleAlreat();
  //                                 }
  //                               },
  //                               child:  Center(
  //                                 child: Text(
  //                                   'Join Flow',
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                       color: Color.fromRGBO(47, 47, 47, 1),
  //                                       fontFamily: 'Red Hat Text',
  //                                       fontSize: 11.sp,
  //                                       letterSpacing: 0,
  //                                       fontWeight: FontWeight.w600,
  //                                       height: 1),
  //                                 ),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //           );
  //       }
  //   );
  //
  //
  //
  //
  //
  //   Row(
  //     children: [
  //       Container(
  //         height: h / 4.44,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //
  //
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         width: h / 100,
  //       ),
  //       Container(
  //         width: w / 1.3,
  //         child: Column(
  //           children: [
  //
  //             SizedBox(
  //               height: 7,
  //             ),
  //
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
  //
  // PollFlowDialog(FlowData data, int index) {
  //   TextTheme _TextTheme = Theme.of(context).textTheme;
  //   ColorScheme ColorS = Theme.of(context).colorScheme;
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;
  //   return  showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (Context)
  //       {
  //         var length =    data.Answers.length;
  //         print(length);
  //         return
  //           AlertDialog(
  //               backgroundColor: Colors.transparent,
  //               insetPadding: EdgeInsets.all(h / 50),
  //               content:
  //               Container(
  //                 width: w/1.37,
  //                 height: h /(
  //                     length==2
  //                         ?3
  //                         :length==3
  //                         ?2.8
  //                         :2.5),
  //
  //
  //                 decoration: BoxDecoration(
  //                   borderRadius : BorderRadius.only(
  //                     topLeft: Radius.circular(6.147541046142578.r),
  //                     topRight: Radius.circular(6.147541046142578.r),
  //                     bottomLeft: Radius.circular(6.147541046142578.r),
  //                     bottomRight: Radius.circular(6.147541046142578.r),
  //                   ),
  //                   boxShadow : [BoxShadow(
  //                       color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
  //                       offset: Offset(0,0),
  //                       blurRadius: 13.088312149047852
  //                   )],
  //                   color : Color.fromRGBO(96, 96, 96, 1),
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     SizedBox(height: 5,),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         SizedBox(width: w/30,),
  //                         Row(
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundColor:
  //                               Color(data.Who_Made_it_Color!),
  //                               backgroundImage:
  //                               NetworkImage(data.Who_Made_it_Avatar!),
  //                               radius: 20.w,
  //                             ),
  //                             SizedBox(width: 10,),
  //                             Text(
  //                               data.Who_Made_it_Alias!,
  //                               textAlign: TextAlign.left,
  //                               style: _TextTheme.headline3!.copyWith(
  //                                 color: ColorS.errorContainer,
  //                                 fontWeight: FontWeight.w400,
  //                                 fontSize: 13.sp,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         SizedBox(width: w/3,),
  //                         Text(data.time!,
  //                             textAlign: TextAlign.right,
  //                             style: _TextTheme.headline2!.copyWith(
  //                                 fontWeight: FontWeight.w300,
  //                                 color:  Color(0xffEAEAEA),
  //                                 fontSize: 9.sp
  //                             )),
  //
  //                       ],
  //                     ),
  //                     SizedBox(height: h/50,),
  //                     Container(
  //                       width: w/1.5,
  //                       child: Text("      ${data.Title!}",
  //                         textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
  //                             color: Color.fromRGBO(255, 255, 255, 1),
  //                             fontSize: 15.159509658813477.sp,
  //                             letterSpacing: 0 ,
  //                             fontWeight: FontWeight.w300,
  //                             height: 1
  //                         ),),
  //                     ),
  //                     SizedBox(height: h/50,),
  //                     Container(
  //                         width: w/1.8,
  //                         decoration: BoxDecoration(
  //                           borderRadius : BorderRadius.only(
  //                             topLeft: Radius.circular(5.191571235656738.r),
  //                             topRight: Radius.circular(5.191571235656738.r),
  //                             bottomLeft: Radius.circular(5.191571235656738.r),
  //                             bottomRight: Radius.circular(5.191571235656738.r),
  //                           ),
  //                           color : Color.fromRGBO(47, 47, 47, 1),
  //                         ),
  //                         child:  ListView.separated(
  //                           cacheExtent : 500,
  //                           shrinkWrap: true,
  //                           reverse: false,
  //                           scrollDirection: Axis.vertical,
  //                           itemCount: data.Answers.length,
  //                           itemBuilder: (BuildContext context,
  //                               int index2) {
  //                             return InkWell(
  //                               onTap: (){
  //                                 print("Hello");
  //                               },
  //                               child: Container(
  //                                 width: w/2,
  //                                 child: Column(
  //                                   children: [
  //                                     SizedBox(height: 5,),
  //                                     Row(
  //                                       children: [
  //                                         SizedBox(width: 5,),
  //                                         CircleAvatar(
  //                                           backgroundColor: Color(0xff837DE2),
  //                                           radius: 0.24.sp,
  //                                         ),
  //
  //                                         SizedBox(width: 5,),
  //                                         Container(
  //                                           width: w/2.3,
  //                                           child: Text(data.Answers[index2],
  //                                             textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
  //                                                 fontFamily: 'Red Hat Text',
  //                                                 fontSize: 14.282208442687988.sp,
  //                                                 letterSpacing: 0 ,
  //                                                 fontWeight: FontWeight.w300,
  //                                                 height: 1
  //                                             ),),
  //                                         )
  //                                       ],
  //                                     ),
  //                                     SizedBox(height: 5,),
  //                                   ],
  //                                 ),
  //                               ),
  //                             );
  //
  //                           }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 1,); },
  //                         )
  //                     ),
  //                     SizedBox(height: h/50,),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         Container(
  //                           width: w / 4.5,
  //                           height: h / 20,
  //                           margin: EdgeInsets.only(bottom: h/100),
  //                           decoration:  BoxDecoration(
  //                             borderRadius: BorderRadius.only(
  //                               topLeft: Radius.circular(50.r),
  //                               topRight: Radius.circular(50.r),
  //                               bottomLeft: Radius.circular(50.r),
  //                               bottomRight: Radius.circular(50.r),
  //                             ),
  //                             color:  Color(widget.Bubble_Color),
  //                           ),
  //                           child: InkWell(
  //                             onTap: (){
  //                               bool GetInStatus = false;
  //                               for(int j =0;j<AllBubblesIDS!.length;j++){
  //                                 if (widget.bubble_id==AllBubblesIDS![j]){
  //                                   if (AllBubblesStatus![j]==1)
  //                                     GetInStatus = true;
  //                                 }
  //                               }
  //
  //                               if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
  //                                 print(data.FlowMessage_id);
  //                                 data.ISMediaDump = false;
  //                                 WidgetsBinding.instance
  //                                     .addPostFrameCallback((_) =>
  //                                     Navigator.push(
  //                                       context,
  //                                       MaterialPageRoute( //receiver_id: ,my_ID: ,
  //                                         builder: (context) =>
  //                                             FlowsChat(
  //                                               Plan_Description: widget.Plan_Description,
  //                                               flow: data,
  //                                               plan_Title: widget.plan_Title,
  //                                               bubble_id: widget.bubble_id,
  //                                               MY_ID: widget.MY_ID,
  //                                             ),),));
  //                               }else{
  //                                 OutsideBubbleAlreat();
  //                               }
  //                             },
  //                             child:  Center(
  //                               child: Text(
  //                                 'Join Flow',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                     color: Color.fromRGBO(47, 47, 47, 1),
  //                                     fontFamily: 'Red Hat Text',
  //                                     fontSize: 13.sp,
  //                                     letterSpacing: 0,
  //                                     fontWeight: FontWeight.w600,
  //                                     height: 1),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         Text(""),
  //                         Text("")
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               )
  //           );
  //       }
  //   );
  // }
  // MediaDumpDialog(FlowData data, int index) {
  //   TextTheme _TextTheme = Theme.of(context).textTheme;
  //   ColorScheme ColorS = Theme.of(context).colorScheme;
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;
  //   return
  //     showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (Context)
  //         {
  //           return
  //             AlertDialog(
  //                 backgroundColor: Colors.transparent,
  //                 insetPadding: EdgeInsets.all(h / 50),
  //                 content: Container(
  //                   width: w/1.1,
  //                   height: h/2.5,
  //                   decoration: BoxDecoration(
  //                     borderRadius : BorderRadius.only(
  //                       topLeft: Radius.circular(6.147541046142578.r),
  //                       topRight: Radius.circular(6.147541046142578.r),
  //                       bottomLeft: Radius.circular(6.147541046142578.r),
  //                       bottomRight: Radius.circular(6.147541046142578.r),
  //                     ),
  //                     boxShadow : [BoxShadow(
  //                         color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
  //                         offset: Offset(0,0),
  //                         blurRadius: 13.088312149047852
  //                     )],
  //                     color : Color.fromRGBO(96, 96, 96, 1),
  //                   ),
  //                   child: Column(
  //                     children: [
  //
  //                       Expanded(
  //                         child: Container(
  //                             width: w/1.1,
  //                             height: h/6,
  //                             child:
  //                             Column(
  //                               children: [
  //                                 SizedBox(height: 5,),
  //                                 Row(
  //                                   mainAxisAlignment: MainAxisAlignment.start,
  //                                   children: [
  //                                     SizedBox(width: w/30,),
  //                                     Row(
  //                                       children: [
  //                                         CircleAvatar(
  //                                           backgroundColor:
  //                                           Color(data.Who_Made_it_Color!),
  //                                           backgroundImage:
  //                                           NetworkImage(data.Who_Made_it_Avatar!),
  //                                           radius: 20.w,
  //                                         ),
  //                                         SizedBox(width: 10,),
  //                                         Text(
  //                                           data.Who_Made_it_Alias!,
  //                                           textAlign: TextAlign.left,
  //                                           style: _TextTheme.headline3!.copyWith(
  //                                               color: ColorS.errorContainer,
  //                                               fontWeight: FontWeight.w400,
  //                                               fontSize: 15.sp
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     SizedBox(width: w/3,),
  //                                     Text(data.time!,
  //                                         textAlign: TextAlign.right,
  //                                         style: _TextTheme.headline2!.copyWith(
  //                                             fontWeight: FontWeight.w300,
  //                                             color:  Color(0xffEAEAEA),
  //                                             fontSize: 9.sp
  //                                         )),
  //
  //                                   ],
  //                                 ),
  //                                 SizedBox(height: 10,),
  //                                 Container(
  //                                   width: w/1.1,
  //                                   height: h/5,
  //                                   child:
  //                                   ClipRRect(
  //
  //                                     child:data.Image_type=="File"
  //                                         ?Image.file(Fileee!,fit: BoxFit.fill,)
  //                                         :data.Image_type =="backend"
  //                                         ? CachedNetworkImage(
  //                                       imageUrl: data.Image!,
  //                                       imageBuilder: (context, imageProvider) => Container(
  //                                           width: w/1.1,
  //                                           height: h/5,
  //
  //                                           decoration: BoxDecoration(
  //                                             image:DecorationImage(image: imageProvider,
  //                                                 fit: BoxFit.fill
  //                                             ),
  //                                           ))
  //                                       ,
  //                                       placeholder: (context, url) => Container(
  //                                           width: w/1.1,
  //                                           height: h/5,child: Row(
  //                                         mainAxisAlignment: MainAxisAlignment.center,
  //                                         children: [
  //                                           CircularProgressIndicator(),
  //                                         ],
  //                                       )),
  //                                       errorWidget: (context, url, error) => Container(
  //                                           width: w/1.1,
  //                                           height: h/5,child: Icon(Icons.error)),
  //                                     )
  //                                         :Image.memory(data.Uint8_Image!,fit: BoxFit.fill,),
  //                                   ),
  //                                 )
  //                               ],
  //                             )
  //                         ),
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Container(
  //                             width: w/1.9,
  //                             margin: EdgeInsets.only(left: h/70),
  //                             child: Text(
  //                               data.Title!
  //                               , textAlign: TextAlign.left,   style: GoogleFonts.roboto().copyWith(
  //                                 color: Color.fromRGBO(234, 234, 234, 1),
  //                                 fontSize: 13.sp,
  //                                 letterSpacing: 0 ,
  //                                 fontWeight: FontWeight.w300,
  //                                 height: 1
  //                             ),),
  //                           ),
  //                           Text(""),
  //                           Text("")
  //                         ],
  //                       ),
  //                       SizedBox(height: 5,),
  //
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Container(
  //                             width: w / 4.5,
  //                             height: h / 20,
  //                             margin: EdgeInsets.only(bottom: h/100),
  //                             decoration:  BoxDecoration(
  //                               borderRadius: BorderRadius.only(
  //                                 topLeft: Radius.circular(50.r),
  //                                 topRight: Radius.circular(50.r),
  //                                 bottomLeft: Radius.circular(50.r),
  //                                 bottomRight: Radius.circular(50.r),
  //                               ),
  //                               color:  Color(widget.Bubble_Color),
  //                             ),
  //                             child: InkWell(
  //                               onTap: (){
  //                                 bool GetInStatus = false;
  //                                 for(int j =0;j<AllBubblesIDS!.length;j++){
  //                                   if (widget.bubble_id==AllBubblesIDS![j]){
  //                                     if (AllBubblesStatus![j]==1)
  //                                       GetInStatus = true;
  //                                   }
  //                                 }
  //
  //                                 if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
  //
  //                                   data.ISMediaDump = true;
  //                                   data.Color = widget.Bubble_Color;
  //                                   WidgetsBinding.instance
  //                                       .addPostFrameCallback((_) =>
  //                                       Navigator.push(
  //                                         context,
  //                                         MaterialPageRoute( //receiver_id: ,my_ID: ,
  //                                           builder: (context) =>
  //                                               FlowsChat(
  //                                                 Plan_Description: widget.Plan_Description,
  //                                                 flow: data,
  //                                                 plan_Title: widget.plan_Title,
  //                                                 bubble_id: widget.bubble_id,
  //                                                 MY_ID: widget.MY_ID,
  //                                               ),),));
  //                                 }else{
  //                                   OutsideBubbleAlreat();
  //                                 }
  //                               },
  //                               child:  Center(
  //                                 child: Text(
  //                                   'Join Flow',
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                       color: Color.fromRGBO(47, 47, 47, 1),
  //                                       fontFamily: 'Red Hat Text',
  //                                       fontSize: 13.sp,
  //                                       letterSpacing: 0,
  //                                       fontWeight: FontWeight.w600,
  //                                       height: 1),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Text(""),
  //                           Text("")
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 )
  //
  //             );
  //         }
  //     );
  //
  //
  //
  //
  //
  //
  //
  // }
  // Widget PhotoFlowDialog(GroupChatState state, int index) {
  //   TextTheme _TextTheme = Theme.of(context).textTheme;
  //   ColorScheme ColorS = Theme.of(context).colorScheme;
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;
  //   return Row(
  //     children: [],
  //   );
  // }



}
