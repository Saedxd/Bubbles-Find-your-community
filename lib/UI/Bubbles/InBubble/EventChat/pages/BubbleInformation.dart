import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BubbleInformation extends StatefulWidget {
   BubbleInformation({Key? key,required this.Bubble}) : super(key: key);
  BubbleData? Bubble;
  @override
  State<BubbleInformation> createState() => _BubbleInformationState();
}

class _BubbleInformationState extends State<BubbleInformation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _GroupChatBloc = sl<GroupChatBloc>();
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: w,
                height: h,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: 70.h,left: 30.w),
                        child: Text(widget.Bubble!.Title!, textAlign: TextAlign.left,
                          style : GoogleFonts.roboto().copyWith(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18.sp,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 1.h
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.h,left: 28.w,bottom: 4.h),
                        child: Row(
                          children: [
                            Container(
                              width: w/20,
                              child:
                              Image.network(widget.Bubble!.Cateogory_Icon!),
                            ),
                            SizedBox(width: 5.w,),
                            Text('Music Event', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 13.sp,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w300,
                              height: 1.h,
                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 28.w,bottom: 9.h),
                        child: Text("At ${widget.Bubble!.location}", textAlign: TextAlign.left,
                          style : GoogleFonts.roboto().copyWith(
                              color: Color.fromRGBO(20, 208, 120, 1),
                              fontSize: 18.sp,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 1.h
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 28.w,bottom: 9.h),
                        child: Text("${widget.Bubble!.Description.toString()}",
                          textAlign: TextAlign.left,
                          style : GoogleFonts.roboto().copyWith(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 11.sp,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w300,
                              height: 1.6363636363636365.h
                          ),),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Organizers:', textAlign: TextAlign.left, style: TextStyle(
                                color:     Color(widget.Bubble!.Color!),
                                fontFamily: 'Red Hat Text',
                                fontSize: 11.sp,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                                height: 1.h
                            ),),
                            Text('   ${widget.Bubble!.saved_users!.length} people saved it:',
                              textAlign: TextAlign.left, style: TextStyle(
                                  color:     Color(widget.Bubble!.Color!),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 11.sp,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1.h
                              ),),
                            Text(""),

                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Container(
                        margin: EdgeInsets.only(left: 28.w),
                        child: Row(
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
                                  fontSize: 11.sp,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  height: 1.h
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
                                    fontSize: 11.sp,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.h
                                ),),
                            )

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16.h,left: 30.w),
                        child: Text('Scheduled Events:', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(20, 208, 120, 1),
                            fontFamily: 'Red Hat Text',
                            fontSize: 11.sp,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            height: 1.h
                        ),),
                      ),
                      Row(
                        children: [
                          Container(
                              width: w/5,
                              height: h/6,

                              margin: EdgeInsets.only(left: 30.w,top: 5.h),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:3,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index){

                                    return
                                      Text('---------',
                                        textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'Sofia Sans',
                                            fontSize: 11.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                            height: 2.272727272727273.h
                                        ),);
                                  }
                              )
                          ),
                          Container(
                              width: w/2,
                              height: h/6,
                              margin: EdgeInsets.only(left: 30.w,top: 5.h),
                              child: ListView.builder(
                                  itemCount:3,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (BuildContext context, int index){

                                    return
                                      Text('-- May  -----------',
                                        textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(196, 196, 196, 1),
                                            fontFamily: 'Sofia Sans',
                                            fontSize: 11.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                            height: 2.272727272727273.h
                                        ),);
                                  }
                              )
                          ),
                        ],
                      )
                      //

                    ],
                  ),
                ),
              ),
              Container(
                width: w,
                height: h / 15,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Color.fromRGBO(0, 0, 0, 0.25),
                    //       offset: Offset(0, 4),
                    //       blurRadius: 4)
                    // ],
                    color: Color(widget.Bubble!.Color!)
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
                          margin: EdgeInsets.only(left: 15.w),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "Assets/images/Frame 11.svg",
                                  width: 30.w,
                                color: Color(0xff303030),),
                            ],
                          )),
                    ),

                    Flexible(
                      child: Container(
                        child: Text(
                            widget.Bubble!.Title!,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto().copyWith(
                                color: Color(0xff303030),
                                fontSize: 18.sp,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.w600,
                                height: 1.h
                            )
                        ),
                      ),
                    ),
                    Text(""),
                    Text(""),

                    // Row(
                    //   children: [
                    //     IconButton(
                    //       icon: SvgPicture.asset(
                    //           "Assets/images/MORE.svg",
                    //           width: 23,
                    //           color: ColorS.surface),
                    //       onPressed: () {
                    //         // _scaffoldKey.currentState!
                    //         //     .openEndDrawer();
                    //         bool GetInStatus = false;
                    //         for(int j =0;j<AllBubblesIDS!.length;j++){
                    //           if (widget.bubble_id==AllBubblesIDS![j]){
                    //             if (AllBubblesStatus![j]==1)
                    //               GetInStatus = true;
                    //           }
                    //         }
                    //
                    //         if ( GetInStatus) {
                    //           _scaffoldKey.currentState!
                    //               .openEndDrawer();
                    //           _GroupChatBloc.add(GetUsersInsideBubble((b) => b
                    //             ..Bubble_id = widget.bubble_id
                    //           ));
                    //         }else{
                    //           OutsideBubbleAlreat();
                    //         }
                    //       },
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),



            ],
          ),
        ),

    );
  }
}
