import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/Home_Screen/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Plan_Screen extends StatefulWidget {
  Plan_Screen({Key? key,
    required  this.Bubble,
    required  this.my_id
    ,this.List_Type
  }) : super(key: key);
  BubbleData? Bubble;
  int? my_id;

 String? List_Type = "";
  @override
  State<Plan_Screen> createState() => _Plan_ScreenState();
}


class _Plan_ScreenState extends State<Plan_Screen> {
bool selected = false;
final _PlanPage_Bloc = sl<PlanPageBloc>();

@override
  void initState() {
    super.initState();
    // _PlanPage_Bloc.add(GetWhoSavedBubble((b) =>
    // b..Bubble_id = widget.Bubble!.id
    //   ..is_saved = widget.Bubble!.is_Saved
    // ));
    socket!.io..disconnect()..connect();
    // _PlanPage_Bloc.add(GetDetailedPlan((b) => b
    // ..Event_id=widget.Event_id
    // ));

}


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
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


      return Scaffold(
        body: SafeArea(
          child: Container(
              width: w,
              height: h,
              child: Stack(
                children: [
                  Container(
                          width: w,
                          height: h,
                          child: Stack(
                            children: [
                              Container(
                                width: w,
                                height: h / 2.5,
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





                              //
                              // Positioned(
                              //   left: h/2.4,
                              //   bottom: h/2,
                              //   child: IconButton(
                              //     iconSize:  h/10,
                              //     icon:
                              //     SvgPicture.asset(
                              //       state.is_Saved!
                              //           ?"Assets/images/BiggerSaved.svg"
                              //           :"Assets/images/SAVE.svg",
                              //       fit: BoxFit.fill,
                              //     ),
                              //
                              //     onPressed: () {
                              //       _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                              //       b..Bubble_id = widget.Bubble!.id
                              //       ));
                              //     },
                              //   ),
                              // ),

                              // Positioned(
                              //   left: h/2.4,
                              //   bottom: h/2,
                              //   child: IconButton(
                              //     iconSize:  h/10,
                              //     icon:
                              //     SvgPicture.asset(
                              //       state.is_Saved!
                              //           ?"Assets/images/BiggerSaved.svg"
                              //           :"Assets/images/SAVE.svg",
                              //       fit: BoxFit.fill,
                              //     ),
                              //
                              //     onPressed: () {
                              //       _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                              //       b..Bubble_id = widget.Bubble!.id
                              //       ));
                              //     },
                              //   ),
                              // ),

                              Positioned(
                                top: h/2.9,
                                child:Container(
                                  width: w,
                                  height: h/1.6,
                                  decoration: BoxDecoration(
                                    color: Color(0xff303030),
                                    borderRadius : BorderRadius.only(
                                      topLeft:  Radius.circular(17),
                                      topRight:  Radius.circular(17),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                    children: [
                                      SizedBox(height: h / 25,),
                                      Container(
                                        width: w/1.16,
                                        child: Row(
                                          children: [
                                         // Image.network(""),
                                            Image.asset("Assets/images/music i con.png"),
                                            Text('Music Event', textAlign: TextAlign.left, style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 13,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:     Color(BackgroundColor),
                                              fontFamily: 'Red Hat Display',
                                              fontSize: 22,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),),
                                      ),
                                      SizedBox(height: h / 50,),

                                      Container(
                                        width: w/1.16,
                                        child: Text("${widget.Bubble!.Description.toString()}",
                                          textAlign: TextAlign.left,
                                          style:TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontFamily: 'Sofia Sans',
                                              fontSize: 13,
                                              letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('Organizers:', textAlign: TextAlign.left, style: TextStyle(
                                              color:     Color(BackgroundColor),
                                              fontFamily: 'Red Hat Text',
                                              fontSize: 22,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),),

                                          Text('${widget.Bubble!.saved_users!.length} people saved it:', textAlign: TextAlign.left, style: TextStyle(
                                              color:   Color(BackgroundColor),
                                              fontFamily: 'Red Hat Text',
                                              fontSize: 22,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.w600,
                                              height: 1
                                          ),)
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          SizedBox(width: h/30,),
                                          widget.Bubble!.Organizers!.length!=0?
                                          Container(
                                            width: w/3.5,height: h/15,
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
                                              :Container(width: w/4,height: h/15,child: Center(child: Text(""))),
                                          Text("+${widget.Bubble!.Organizers!.length.toString()}"
                                            , textAlign: TextAlign.left, style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontFamily: 'Red Hat Text',
                                                fontSize: 19,
                                                fontStyle: FontStyle.italic,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
                                                  fontSize: 19,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1
                                              ),),
                                          )

                                        ],
                                      ),
                                      SizedBox(height: h / 5,),
                                    ],
                              ),
                                  ),
                                ),),



                            ],
                          ),
                        ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 10,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance!
                              .addPostFrameCallback(
                                  (_) =>
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GroupChat(plan_Title:widget.Bubble!.Title!,
                                            MY_ID: widget.my_id,
                                            bubble_id: widget.Bubble!.id!,
                                            Plan_Description: widget.Bubble!.Description!,
                                            Bubble_Color: BackgroundColor,
                                          ),),
                                  ));
                        },
                        child:Container(
                          width: w / 2.3,
                          height: h / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(27),
                              topRight: Radius.circular(27),
                              bottomLeft: Radius.circular(27),
                              bottomRight: Radius.circular(27),
                            ),
                            color:   Color(BackgroundColor),
                          ),
                          child:   Center(
                            child:
                            Text('Enter Bubble', textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 19,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1
                              ),)
                            ,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: h/9,
                    child:Center(
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
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ${widget.Bubble!.users_in_bubble!.length}',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 14,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: w/7,
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      "Assets/images/Frame 11.svg",
                                      width: 30,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    widget.Bubble!.Title!,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 22,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            child: InkWell(
                              onTap: (){
                                _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                                b..Bubble_id = widget.Bubble!.id
                                ));
                              },
                              child: SvgPicture.asset(
                                state.is_Saved!
                                    ?"Assets/images/BiggerSaved.svg"
                                    :"Assets/images/SAVE.svg",
                              ),
                            ),
                          ),



                        ],
                      ),

                    ),
                  ),
                  widget.Bubble!.User_type=="user"
                      ? Positioned(
                    left: w/1.4,
                    top: h/3.5,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(int.parse(widget.Bubble!.Creator_Color!)),
                      backgroundImage: NetworkImage(widget.Bubble!.Creator_Avatar!),
                    ),
                  )
                      : Text(""),
                ],
              )
          ),
        ),

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
}




