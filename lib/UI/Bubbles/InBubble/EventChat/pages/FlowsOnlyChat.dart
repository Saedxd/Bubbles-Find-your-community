import 'dart:io';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/bloc/GroupChat_state.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/FlowChat/pages/FlowsChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FlowPostsChat extends StatefulWidget {
  FlowPostsChat({Key? key,
    this.plan_Title,
    this.MY_ID,required
    this.bubble_id,required
    this.Plan_Description,
    required this.data,
    required  this.Bubble_Color
  }) : super(key: key);
  String? plan_Title = "";
  String Plan_Description = "";
  int? MY_ID;
  int bubble_id;
  int Bubble_Color;

  List<FlowData> data;
  @override
  State<FlowPostsChat> createState() => _FlowPostsChatState();
}

class _FlowPostsChatState extends State<FlowPostsChat> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _GroupChatBloc = sl<GroupChatBloc>();
  File? Fileee;

  @override
  void initState() {
    // TODO: implement initState
print(widget.data.length);
    super.initState();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        _GroupChatBloc.add(ShowFloatingActionButton((b) =>
        b..status = false
        ));
      } else {
        _GroupChatBloc.add(ShowFloatingActionButton((b) =>
        b..status = true
        ));
      }
    });



        }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _GroupChatBloc,
        builder: (BuildContext Context, GroupChatState state) {

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
                                                    builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: UserData.ID!,His_Alias:UserData.Alias!,Send_by: "dm",),),   ));
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
                                                if (widget.MY_ID!= UserData.ID!) {
                                                  if (!is_frined) {
                                                    Navigator.pop(context);
                                                    _GroupChatBloc.add(
                                                        AddFrined((b) =>
                                                        b
                                                          ..serial =UserData
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


          return Scaffold(
                  key: _scaffoldKey,
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          children: [

                           Expanded(
                              child: ScrollConfiguration(
                                  behavior: MyBehavior(),
                                  child: Container(
                                    margin: EdgeInsets.only(top: h/14),
                                    child: ListView.separated(
                                      cacheExtent : 500,
                                      controller: _controller,
                                      shrinkWrap: true,
                                      reverse: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: widget.data.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        return  Container(
                                          padding: EdgeInsets.only(
                                              left: w / 50),
                                          child:
                                         widget.data[index].Flow_type=="TopicFlow"
                                            ? TopicFlowWidget( widget.data[index],index)
                                        //     :       widget.data[index].Flow_type == "PollFlow"
                                        // ? PollFlowWidget(widget.data[index], index)
                                            :       widget.data[index].Flow_type == "MediaDump"
                                        ? MediaDumpWidget(widget.data[index], index)
                                            :  Text("")

                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context,
                                          int index) {
                                        return SizedBox(
                                          height: h / 50,
                                        );
                                      },
                                    ),
                                  )),
                              ),
                            SizedBox(height: 7.h,)
                          ],
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
                                    margin: EdgeInsets.only(left: 15.w),
                                    child: Row(
                                      children: [
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
              floatingActionButton: state.ShowFloatingActionButtonn!?Container(

                  margin: EdgeInsets.only(bottom: h/50),
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

              ):Text("")
              );
        });
  }
  Widget TopicFlowWidget(FlowData state, int index) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  Container(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        //  alreatDialogBuilder(context,h,w,state.messages![index].Sender_data!.is_Frined!,state.messages![index].Sender_data!.His_id==widget.MY_ID,state.messages![index].Sender_data!.His_id!,index,state.messages![index].Sender_data!);
                      },
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child : CircleAvatar(
                          backgroundColor: Color(state.Who_Made_it_Color!),
                          backgroundImage: NetworkImage(state.Who_Made_it_Avatar!),
                          radius: 20.w,
                        ),)
                  ),
                  SizedBox(width: 10.w,),
                  Container(
                    margin: EdgeInsets.only(bottom: h/50),
                    child: Text(
                      state.Who_Made_it_Alias!,
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                        state.time!,
                        textAlign: TextAlign.right,
                        style: _textthem.headline2!.copyWith(
                            fontWeight: FontWeight.w300,
                            color:  Color(0xffEAEAEA),
                            fontSize: 9.sp
                        )),
                  ),
                  SizedBox(width: 10.w,),
                ],
              )
            ],
          ),


          SizedBox(height: 5.h,),
          Container(
            margin: EdgeInsets.only(right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: w / 1.3,
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
                          blurRadius: 10.645160675048828.r)
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
                            width: w / 1.4,
                            padding: EdgeInsets.only(top: h / 100),
                            child: Text(
                              state.Title!,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.roboto().copyWith(
                                  color: Color.fromRGBO(234, 234, 234, 1),
                                  fontSize: 13.sp,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w700,
                                  height: 1.h),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Container(
                        width: w / 1.4,
                        child: Text(
                          state.Content!,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto().copyWith(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              fontSize: 10.sp,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1.h),
                        ),
                      ),
                      SizedBox(height: 16.h,),
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
                                      if (AllBubblesStatus![j]==1) {
                                        GetInStatus = true;
                                      }
                                    }
                                  }

                                  if ( GetInStatus )
                                    //      || !widget.Want_LOcation_cHECK!
                                      {
                                    FlowData data = FlowData();
                                    data.Title = state.Title;
                                    data.Content = state.Content;
                                    data.Flow_type = "TopicFlow";
                                    data.FlowMessage_id = state.FlowMessage_id;
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
      ),
    );
  }
  //
  // Widget PollFlowWidget(FlowData state, int index) {
  //   TextTheme _TextTheme = Theme.of(context).textTheme;
  //   TextTheme _textthem = Theme.of(context).textTheme;
  //   ColorScheme ColorS = Theme.of(context).colorScheme;
  //   ColorScheme COLOR = Theme.of(context).colorScheme;
  //   var h = MediaQuery.of(context).size.height;
  //   var w = MediaQuery.of(context).size.width;
  //   return
  //     Container(
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Row(
  //                 children: [
  //                   InkWell(
  //                       onTap: (){
  //                         // alreatDialogBuilder(context,h,w,state.messages![index].Sender_data!.is_Frined!,state.messages![index].Sender_data!.His_id==widget.MY_ID,state.messages![index].Sender_data!.His_id!,index,state.messages![index].Sender_data!);
  //                       },
  //                       child: Theme(
  //                         data: ThemeData(
  //                           splashColor: Colors.transparent,
  //                           highlightColor: Colors.transparent,
  //                         ),
  //                         child : CircleAvatar(
  //                           backgroundColor: Color(state
  //                               .messages![index]
  //                               .background_Color!),
  //                           backgroundImage: NetworkImage(state
  //                               .messages![index]
  //                               .Avatar
  //                               .toString()),
  //                           radius: 20.w,
  //
  //                         ),)
  //                   ),
  //                   SizedBox(width: 10.w,),
  //
  //                   Container(
  //                     margin: EdgeInsets.only(bottom: h/50),
  //                     child: Text(
  //                       state.messages![index].Alias.toString(),
  //                       textAlign:
  //                       TextAlign.left,
  //                       style:
  //                       _textthem.headline3!.copyWith(
  //                         color: COLOR.errorContainer,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 13.sp,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Row(
  //                 children: [
  //                   Container(
  //                     margin: EdgeInsets.only(bottom: 10.h),
  //                     child: Text(
  //                         state.messages![index].time!,
  //                         textAlign: TextAlign.right,
  //                         style: _textthem.headline2!.copyWith(
  //                             fontWeight: FontWeight.w300,
  //                             color:  Color(0xffEAEAEA),
  //                             fontSize: 9.sp
  //                         )),
  //                   ),
  //                   SizedBox(width: 10.w,),
  //                 ],
  //               )
  //             ],
  //           ),
  //           SizedBox(height: 5.h,),
  //           Container(
  //             margin: EdgeInsets.only(right: 22.w),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Container(
  //                   width: w/1.37,
  //                   decoration: BoxDecoration(
  //                     borderRadius : BorderRadius.only(
  //                       topLeft: Radius.circular(6.147541046142578.r),
  //                       topRight:  Radius.circular(6.147541046142578.r),
  //                       bottomLeft:  Radius.circular(6.147541046142578.r),
  //                       bottomRight: Radius.circular(6.147541046142578.r),
  //                     ),
  //                     boxShadow : [BoxShadow(
  //                         color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
  //                         offset: Offset(0,0),
  //                         blurRadius: 13.088312149047852.r
  //                     )],
  //                     color : Color.fromRGBO(96, 96, 96, 1),
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       SizedBox(height: 7.h,),
  //                       Container(
  //                         margin: EdgeInsets.only(left: 19.w),
  //                         child: Text(state.Title!,
  //                             textAlign: TextAlign.left,
  //                             style: GoogleFonts.roboto().copyWith(
  //                               color: Color.fromRGBO(255, 255, 255, 1),
  //                               fontSize: 13.16.sp,
  //                               letterSpacing: 0 ,
  //                               fontWeight: FontWeight.w300,
  //                             )
  //                         ),
  //                       ),
  //
  //                       SizedBox(height: h/50,),
  //                       Container(
  //                           width: w/1.4,
  //                           margin: EdgeInsets.only(left: 13.w,right: 13.w,bottom: 13.h),
  //                           decoration: BoxDecoration(
  //                             borderRadius : BorderRadius.only(
  //                               topLeft: Radius.circular(5.191571235656738.r),
  //                               topRight:  Radius.circular(5.191571235656738.r),
  //                               bottomLeft:  Radius.circular(5.191571235656738.r),
  //                               bottomRight:  Radius.circular(5.191571235656738.r),
  //                             ),
  //                             color : Color.fromRGBO(47, 47, 47, 1),
  //                           ),
  //                           child:ListView.separated(
  //
  //                             cacheExtent : 500,
  //                             shrinkWrap: true,
  //                             reverse: false,
  //                             physics: NeverScrollableScrollPhysics(),
  //                             scrollDirection: Axis.vertical,
  //                             itemCount: state.PollAnswers!.length,
  //                             itemBuilder: (BuildContext context,
  //                                 int index2) {
  //
  //                               return
  //
  //                                 Row(
  //                                   children: [
  //                                     InkWell(
  //                                       onTap: (){
  //                                         //TODO : FIX
  //                                         // int Flow_Index = 0;
  //                                         // for(int i=0;i<state.FlowList!.length;i++){
  //                                         //   if (state.FlowList![i].FlowMessage_id==state.messages![index].ID){
  //                                         //     Flow_Index = i;
  //                                         //   }
  //                                         // }
  //                                         //
  //                                         // print(state.messages![index].Total_Rate);
  //
  //
  //                                         // if (state.messages![index].FlowSettledWithID!) {
  //                                         //   bool GetInStatus = false;
  //                                         //   for(int j =0;j<AllBubblesIDS!.length;j++){
  //                                         //     if (widget.bubble_id==AllBubblesIDS![j]){
  //                                         //       if (AllBubblesStatus![j]==1) {
  //                                         //         GetInStatus = true;
  //                                         //       }
  //                                         //     }
  //                                         //   }
  //                                         //
  //                                         //   if ( GetInStatus || !widget.Want_LOcation_cHECK!) {
  //                                         //
  //                                         //     FlowData data = FlowData();
  //                                         //     data.Title =
  //                                         //         state.messages![index].TopicFlowTitle.toString();
  //                                         //     data.Content =
  //                                         //         state.messages![index].TopicFlowDescription
  //                                         //             .toString();
  //
  //                                         //     data.Flow_type = "NewPoll";
  //                                         //     data.FlowMessage_id = state.messages![index].ID;
  //                                         //     data.ISMediaDump = false;
  //                                         //     data.Color = widget.Bubble_Color;
  //                                         //     WidgetsBinding.instance
  //                                         //         .addPostFrameCallback((_) =>
  //                                         //         Navigator.push(
  //                                         //           context,
  //                                         //           MaterialPageRoute( //receiver_id: ,my_ID: ,
  //                                         //             builder: (context) =>
  //                                         //                 FlowsChat(
  //                                         //                   Plan_Description: widget
  //                                         //                       .Plan_Description,
  //                                         //                   flow: data,
  //                                         //                   plan_Title: widget.plan_Title,
  //                                         //                   bubble_id: widget.bubble_id,
  //                                         //                   MY_ID: widget.MY_ID,
  //                                         //                 ),),));
  //                                         //   } else {
  //                                         //     OutsideBubbleAlreat();
  //                                         //   }
  //                                         // }
  //                                         // if (!state.messages![index].is_Chosen!) {
  //
  //                                         _GroupChatBloc.add(
  //                                             ChoosePollFlowAnswer((b) =>
  //                                             b
  //                                               ..Flow_Index = Flow_Index
  //                                               ..Chat_index = index
  //                                               ..ANswers_index = index2
  //                                               ..Answer_id = state.messages![index] .PollAnswers![index2].id
  //                                               ..bubble_id =widget.bubble_id
  //                                               ..Want_Request = true
  //                                             ));
  //                                         //  }
  //
  //                                       },
  //                                       child: Container(
  //
  //                                         width: state.messages![index].PollAnswers![index2].Presentage==0?w/1.9.w:
  //                                         (w/2.1)*(state.messages![index].PollAnswers![index2].Presentage/100),
  //                                         // color: Colors.red,
  //                                         child: Column(
  //                                           children: [
  //                                             SizedBox(height: 5.h,),
  //
  //                                             Stack(
  //                                               children: [
  //                                                 SizedBox(width: 5.w,),
  //                                                 !state.messages![index].is_Chosen!
  //                                                     ?   Container(
  //                                                   margin: EdgeInsets.only(left: 8.5.w),
  //                                                   child: Row(
  //                                                     children: [
  //                                                       CircleAvatar(
  //                                                         backgroundColor: Color(widget.Bubble_Color),
  //                                                         radius: 8.sp,
  //                                                       ),
  //                                                     ],
  //                                                   ),
  //                                                 )
  //                                                     :   Container(),
  //                                                 SizedBox(width: 10.w,),
  //
  //                                                 Container(
  //                                                   width:   state.messages![index].PollAnswers![index2].Presentage==0
  //                                                       ?w/1.9
  //                                                       :   (w/2.1)*(state.messages![index].PollAnswers![index2].Presentage/100),
  //
  //
  //                                                   margin: EdgeInsets.only(top: 1.h,bottom: 1.h,left: 8.w),
  //                                                   decoration: BoxDecoration(
  //                                                     borderRadius : BorderRadius.only(
  //                                                       topLeft: Radius.circular(10.383140563964844.r),
  //                                                       topRight: Radius.circular(10.383140563964844.r),
  //                                                       bottomLeft: Radius.circular(10.383140563964844.r),
  //                                                       bottomRight: Radius.circular(10.383140563964844.r),
  //                                                     ),
  //                                                     color: Color(
  //                                                         state.PollFlow_AnsweredSuccess!?
  //                                                         state.messages![index].is_Chosen!
  //                                                             ? widget.Bubble_Color
  //                                                             :00000000
  //                                                             :00000000
  //                                                     ),
  //                                                   ),
  //                                                   child:
  //                                                   Container(
  //                                                     width:state.messages![index].PollAnswers![index2].Presentage==0?w/1.9.w:
  //                                                     (w/2.1)*(state.messages![index].PollAnswers![index2].Presentage/100),
  //                                                     margin: EdgeInsets.only(left: 15.w,right: 15.w),
  //                                                     child:
  //
  //                                                     Container(
  //                                                       margin: EdgeInsets.only(top: 5.h),
  //                                                       child: Text(
  //                                                         state.messages![index].PollAnswers![index2].Presentage!=0?
  //                                                         state.messages![index].PollAnswers![index2].Answer!:"",
  //                                                         textAlign: TextAlign.left,
  //                                                         style: GoogleFonts.roboto().copyWith(
  //                                                           color:Colors.transparent,
  //                                                           fontSize: 12.28.sp,
  //                                                           letterSpacing: 0 ,
  //                                                           fontWeight: FontWeight.w300,
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //
  //
  //                                                   ),
  //
  //
  //                                                 ),
  //
  //
  //
  //                                                 Container(
  //                                                   width: state.messages![index].PollAnswers![index2].Presentage==0?w/1.9.w:
  //                                                   (w/2.1)*(state.messages![index].PollAnswers![index2].Presentage/100),
  //                                                   margin: EdgeInsets.only(left: 28.w,top: 2.h),
  //
  //                                                   child: Text(state.messages![index].PollAnswers![index2].Answer!,
  //                                                     textAlign: TextAlign.left,
  //                                                     style: GoogleFonts.roboto().copyWith(
  //                                                       color:
  //                                                       ! state.messages![index].is_Chosen!
  //                                                           ?   Colors.white
  //                                                           :   Color(0xffFFFFFF) ,
  //                                                       fontSize: 12.28.sp,
  //                                                       letterSpacing: 0 ,
  //                                                       fontWeight: FontWeight.w300,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //
  //                                               ],
  //                                             ),
  //
  //
  //                                             index2==state.PollAnswers!.length-1?
  //                                             SizedBox(height: 5.h,):Container(),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     state.messages![index].ID!=0?
  //                                     Container(
  //                                       width: w/10,
  //                                       height: h/28,
  //                                       child: ListView.builder(
  //                                         itemCount:state.messages![index].PollAnswers![index2].users_Choose_it!.length<3? state.messages![index].PollAnswers![index2].users_Choose_it!.length:3,
  //                                         scrollDirection: Axis.horizontal,
  //                                         itemBuilder: (BuildContext context, int index3) {
  //                                           String Value = state.messages![index].PollAnswers![index2].users_Choose_it![index3].background_color.toString();
  //                                           if (Value.contains("#",0)){
  //                                             Value = Value.substring(1);
  //                                             Value = "0xff$Value";
  //                                           }
  //                                           var myInt = int.parse(Value);
  //                                           var BackgroundColor= myInt;
  //                                           return    Row(
  //                                             children: [
  //                                               index==0
  //                                                   ? SizedBox(width: 5.w,)
  //                                                   : Container(),
  //                                               Align(
  //                                                   widthFactor: 0.75,
  //                                                   alignment: Alignment.topCenter,
  //                                                   child:
  //                                                   Container(
  //                                                     margin: EdgeInsets.only(top: 5.h),
  //                                                     child: Column(
  //                                                       children: [
  //                                                         Wrap(
  //                                                           children: [
  //                                                             CircleAvatar(
  //                                                               radius: 6.r,
  //                                                               backgroundColor: Color(BackgroundColor),
  //                                                               backgroundImage: NetworkImage(state.messages![index].PollAnswers![index2].users_Choose_it![index3].avatar.toString()),
  //                                                             )
  //                                                           ],
  //
  //                                                         ),
  //                                                       ],
  //
  //                                                     ),
  //                                                   )
  //                                               ),
  //                                             ],
  //                                           );
  //                                         },
  //                                       ),
  //                                     ):Container(),
  //
  //                                   ],
  //                                 );
  //
  //
  //                             }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 3.h,); },
  //                           )
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );
  // }

  Widget MediaDumpWidget(FlowData state, int index) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return   Container(
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        // alreatDialogBuilder(context,h,w,state.messages![index].Sender_data!.is_Frined!,state.messages![index].Sender_data!.His_id==widget.MY_ID,state.messages![index].Sender_data!.His_id!,index,state.messages![index].Sender_data!);
                      },
                      child:  Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child :CircleAvatar(
                          backgroundColor: Color(state

                              .Who_Made_it_Color!),
                          backgroundImage: NetworkImage(state
                              .Who_Made_it_Avatar!),
                          radius: 20.w,

                        ),)
                  ),
                  SizedBox(width: 10.w,),
                  Container(
                    margin: EdgeInsets.only(bottom: h/50),
                    child: Text(
                      state.Who_Made_it_Alias!,
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
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Text(
                        state.time!,
                        textAlign: TextAlign.right,
                        style: _textthem.headline2!.copyWith(
                            fontWeight: FontWeight.w300,
                            color:  Color(0xffEAEAEA),
                            fontSize: 9.sp
                        )),
                  ),
                  SizedBox(width: 10.w,),
                ],
              )
            ],
          ),


          SizedBox(height: 5.h,),
          Container(
            margin: EdgeInsets.only(right: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: w/1.4,
                  height: h/3.6,
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
                        blurRadius: 13.088312149047852.r
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
                                    child:state.Image_type=="File"
                                        ?Image.file(Fileee!,fit: BoxFit.fill,)
                                        :state.Image_type=="backend"
                                        ? CachedNetworkImage(
                                      imageUrl:state.Image!,
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

                                        :Image.memory(state.Uint8_Image!,fit: BoxFit.fill,),
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
                            child: Text(state.Title!,
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
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: w / 5,
                            height: h / 24,
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
                            child:
                            InkWell(
                              onTap: (){
                                if (state.SettledWithID!) {
                                  bool GetInStatus = false;
                                  for(int j =0;j<AllBubblesIDS!.length;j++){
                                    if (widget.bubble_id==AllBubblesIDS![j]){
                                      if (AllBubblesStatus![j]==1) {
                                        GetInStatus = true;
                                      }
                                    }
                                  }

                                  if ( GetInStatus ) {

                                    FlowData data = FlowData();
                                    data.Title = state.Title.toString();
                                    data.Flow_type = "MediaDump";
                                    data.FlowMessage_id =state.FlowMessage_id;
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
                                      fontSize: 11.sp,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                      height: 1.h),
                                ),
                              ),
                            ),
                          ),
                          Text(""),
                          Text(""),
                          !state.SettledWithID!?
                          SpinKitDualRing(
                            color: Colors.white,
                            size: h/80.0,
                          ):Text(""),
                        ],
                      ),

                    ],
                  ),
                )
              ],
            ),
          )



        ],
      ),
    );


    //   Row(
    //     children: [
    //       Container(
    //         height: h / 4.44,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             InkWell(
    //             onTap: (){
    //   //      alreatDialogBuilder(context,h,w,index,state.FilteredInsideBubbleUsers![index].is_frined!,state.FilteredInsideBubbleUsers![index].id==widget.MY_ID,state.FilteredInsideBubbleUsers![index].id!);
    //
    // },
    //   child:
    //             CircleAvatar(
    //               backgroundColor:
    //               Color(state.messages![index].background_Color!),
    //               backgroundImage:
    //               NetworkImage(state.messages![index].Avatar.toString()),
    //               radius: 20.w,
    //             ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         width: h / 100,
    //       ),
    //       Container(
    //           width: w / 1.3,
    //           child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       state.messages![index].Alias.toString(),
    //                       textAlign: TextAlign.left,
    //                       style: _TextTheme.headline3!.copyWith(
    //                         color: ColorS.errorContainer,
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 13.sp,
    //                       ),
    //                     ),
    //                     Text(state.messages![index].time!,
    //                         textAlign: TextAlign.right,
    //                         style: _TextTheme.headline2!.copyWith(
    //                           fontWeight: FontWeight.w300,
    //                           color:  Color(0xffEAEAEA),
    //                             fontSize: 9.sp
    //                         ))
    //                   ],
    //                 ),
    //                  SizedBox(
    //                   height: 7,
    //                 ),
    //                 Container(
    //                   width: w/1.4,
    //                   height: h/3.6,
    //                   decoration: BoxDecoration(
    //                     borderRadius : BorderRadius.only(
    //                       topLeft: Radius.circular(6.147541046142578),
    //                       topRight: Radius.circular(6.147541046142578),
    //                       bottomLeft: Radius.circular(6.147541046142578),
    //                       bottomRight: Radius.circular(6.147541046142578),
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
    //                       Expanded(
    //             child: Container(
    //               width: w/1.4,
    //               height: h/6,
    //               child:
    //               Column(
    //                 children: [
    //                 Container(
    //                 width: w/1.4,
    //                 height: h/6,
    //                 child:
    //                   ClipRRect(
    //                   borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)),
    //                           child:state.messages![index].Image_type=="File"
    //                               ?Image.file(Fileee!,fit: BoxFit.fill,)
    //                               :state.messages![index].Image_type.toString() =="backend"
    //                               ? CachedNetworkImage(
    // imageUrl:state.messages![index].MediaDumpImagePath!,
    // imageBuilder: (context, imageProvider) => Container(
    // width: w/1.4,
    // height: h/6,
    //
    // decoration: BoxDecoration(
    // image:DecorationImage(image: imageProvider,
    //   fit: BoxFit.fill
    // ),
    //
    // ),
    //
    // ),
    // placeholder: (context, url) => Container(
    // width: w/1.4,
    // height: h/6,child: Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: [
    // CircularProgressIndicator(),
    // ],
    // )),
    // errorWidget: (context, url, error) => Container(
    // width: w/1.4,
    // height: h/6,child: Icon(Icons.error)),
    // )
    //
    //                               :Image.memory(state.messages![index].MediaDumpImageuntil64!,fit: BoxFit.fill,),
    //                       ),
    //                 )
    //                 ],
    //               )
    //             ),
    //           ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Container(
    //                             width: w/1.9,
    //                             margin: EdgeInsets.only(left: h/70),
    //                             child: Text(state.messages![index].MediaDumpTitle!,
    //                               textAlign: TextAlign.left,
    //                           style: GoogleFonts.roboto().copyWith(
    //                             color: Color.fromRGBO(234, 234, 234, 1),
    //                             fontSize: 13.sp,
    //                             letterSpacing: 0 ,
    //                             fontWeight: FontWeight.w300,
    //                           )
    //                                 ),
    //                           ),
    //                           Text(""),
    //                           Text("")
    //                         ],
    //                       ),
    //                       SizedBox(height: 5.h,),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Container(
    //                             width: w / 5,
    //                             height: h / 24,
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
    //                             child:
    //                    InkWell(
    //                               onTap: (){
    //                                 if (state.messages![index].FlowSettledWithID!) {
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
    //                                     FlowData data = FlowData();
    //                                     data.Title = state.messages![index]
    //                                         .MediaDumpTitle.toString();
    //                                     // data.Content = state.messages![index].TopicFlowDescription.toString();
    //                                     data.Flow_type = "MediaDump";
    //                                     data.FlowMessage_id =
    //                                         state.messages![index].ID;
    //                                     data.ISMediaDump = true;
    //                                     data.Color = widget.Bubble_Color;
    //                                     WidgetsBinding.instance
    //                                         .addPostFrameCallback((_) =>
    //                                         Navigator.push(
    //                                           context,
    //                                           MaterialPageRoute( //receiver_id: ,my_ID: ,
    //                                             builder: (context) =>
    //                                                 FlowsChat(
    //                                                   Plan_Description: widget
    //                                                       .Plan_Description,
    //                                                   flow: data,
    //                                                   plan_Title: widget
    //                                                       .plan_Title,
    //                                                   bubble_id: widget
    //                                                       .bubble_id,
    //                                                   MY_ID: widget.MY_ID,
    //                                                 ),),));
    //                                   } else {
    //                                     OutsideBubbleAlreat();
    //                                   }
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
    //                           ),
    //                           Text(""),
    //                           Text(""),
    //                           !state.messages![index].FlowSettledWithID!?
    //                           SpinKitDualRing(
    //                             color: Colors.white,
    //                             size: h/80.0,
    //                           ):Text(""),
    //                         ],
    //                       ),
    //
    //                     ],
    //                   ),
    //                 )
    //               ]
    //           )
    //       )
    //     ]
    // );
    //


  }

  Widget PhotoFlowWidget(FlowData state , int index) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [],
    );
  }



  Future OutsideBubbleAlreat()async{
    return       showDialog(
        barrierColor: Colors.white.withOpacity(0),
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
                          height: 1.h
                      ),),
                      SizedBox(height: h/40,),
                      Text('Looks like you are not in this bubble! Please move closer to activate additional features.', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          fontFamily: 'Red Hat Text',
                          fontSize: 11.sp,
                          letterSpacing: 0 ,
                          fontWeight: FontWeight.w600,
                          height: 1.25.h
                      ),)


                    ],
                  ),
                ),

              )
          );
        }, context: context
    );

  }

}
