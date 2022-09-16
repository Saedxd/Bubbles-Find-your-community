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
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                                              left: h / 50),
                                          child:
                                         widget.data[index].Flow_type=="TopicFlow"
                                            ? TopicFlowWidget( widget.data[index],index)
                                            :       widget.data[index].Flow_type == "PollFlow"
                                        ? PollFlowWidget(widget.data[index], index)
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
                              )
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
                                    style:  TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 22.sp,
                                        letterSpacing: 0.2,
                                        fontWeight: FontWeight.w600,
                                        height: 1),
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
                Color(state.Who_Made_it_Color!),
                backgroundImage:
                NetworkImage(state.Who_Made_it_Avatar!),
                radius: 23.w,
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
                    state.Who_Made_it_Alias!,
                    textAlign: TextAlign.left,
                    style: _TextTheme.headline3!.copyWith(
                      color: ColorS.errorContainer,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp
                    ),
                  ),
                  Text(state.time!,
                      textAlign: TextAlign.right,
                      style: _TextTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w300,
                        color:  Color(0xffEAEAEA),
                          fontSize:9.sp
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
                    topRight:  Radius.circular(5.r),
                    bottomLeft:  Radius.circular(5.r),
                    bottomRight:  Radius.circular(5.r),
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
                            state.Title!,
                            textAlign: TextAlign.left,
                              style: GoogleFonts.roboto().copyWith(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontSize: 20.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w700,
                              )
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: w / 1.4,
                      child: Text(
                        state.Content!,
                        textAlign: TextAlign.left,
                          style: GoogleFonts.roboto().copyWith(
                            color: Color.fromRGBO(234, 234, 234, 1),
                            fontSize: 17.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          )

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

                                if ( GetInStatus) {
                                  FlowData data = FlowData();
                                  data.Title = state.Title;
                                  data.Content =    state.Content!;
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
    );
  }

  Widget PollFlowWidget(FlowData state, int index) {
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
                  Color(state.Who_Made_it_Color!),
                  backgroundImage:
                  NetworkImage(state.Who_Made_it_Avatar!),
                  radius: 23.w,
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
                          state.Who_Made_it_Alias!,
                          textAlign: TextAlign.left,
                          style: _TextTheme.headline3!.copyWith(
                            color: ColorS.errorContainer,
                            fontWeight: FontWeight.w400,
                              fontSize: 13.sp
                          ),
                        ),
                        Text( state.time!,
                            textAlign: TextAlign.right,
                            style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w300,
                              color:  Color(0xffEAEAEA),
                                fontSize:9.sp
                            ))
                      ],
                    ),
                     SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      width: w/1.37,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(6.147541046142578.r),
                          topRight:Radius.circular(6.147541046142578.r),
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
                          SizedBox(height: h/50,),
                          Container(
                            width: w/1.5,
                            child: Text(state.Title!,
                                style: GoogleFonts.roboto().copyWith(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 15.159509658813477.sp,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.w300,
                                    height: 1
                                )),
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
                                scrollDirection: Axis.vertical,
                                itemCount:state.Answers.length,
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
                                          SizedBox(height: 5.h,),
                                          Row(
                                            children: [
                                              SizedBox(width: 5.w,),
                                              CircleAvatar(
                                                backgroundColor: Color(0xff837DE2),
                                                radius: 10.r,
                                              ),

                                              SizedBox(width: 5.w,),
                                              Container(
                                                width: w/2.3,
                                                child: Text(state.Answers[index2],
                                                  textAlign: TextAlign.left,
                                                    style: GoogleFonts.roboto().copyWith(
                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                        fontSize: 14.282208442687988.sp,
                                                        letterSpacing: 0 ,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1.h
                                                    )
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 5.h,),
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
                                    topRight:Radius.circular(50.r),
                                    bottomLeft:Radius.circular(50.r),
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

                                    if ( GetInStatus) {
                                      FlowData data = FlowData();
                                      data.Title = state.Title;
                                    //  data.Content = state.messages![index].TopicFlowDescription.toString();
                                      data.Flow_type = "NewPoll";
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
                  ]
              )
          )
        ]
    );
  }

  Widget MediaDumpWidget(FlowData state, int index) {
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
                  Color(state.Who_Made_it_Color!),
                  backgroundImage:
                  NetworkImage(state.Who_Made_it_Avatar!),
                  radius: 23.w,
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
                        state.Who_Made_it_Alias!,
                          textAlign: TextAlign.left,
                          style: _TextTheme.headline3!.copyWith(
                            color: ColorS.errorContainer,
                            fontWeight: FontWeight.w400,
                              fontSize: 13.sp
                          ),
                        ),
                        Text(state.time!,
                            textAlign: TextAlign.right,
                            style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w300,
                              color:  Color(0xffEAEAEA),
                                fontSize:9.sp

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
                                            ?Image.file(state.File_Image!,fit: BoxFit.fill,)
                                            :state.Image_type=="backend"
                                            ?Image.network(state.Image!,fit: BoxFit.fill,)
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
                                child: Text(state.Title!, textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto().copyWith(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontSize: 13.sp,
                                      letterSpacing: 0 ,
                                      fontWeight: FontWeight.w300,
                                      height: 1
                                      )),
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
                                    topLeft:Radius.circular(50.r),
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

                                    if ( GetInStatus) {
                                      FlowData data = FlowData();
                                      data.Title = state.Title;
                                     // data.Content =    state.Content!;
                                      data.Flow_type = "TopicFlow";
                                      data.FlowMessage_id = state.FlowMessage_id;
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
                  ]
              )
          )
        ]
    );



  }

  Widget PhotoFlowWidget(FlowData state, int index) {
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
                          fontSize: 12.sp,
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

}
