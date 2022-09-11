import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Bubbles/Sprints/SprintsMatch/pages/SprintMatch.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import '../../DirectChat/bloc/Sprints_Event.dart';
class SprintLobby extends StatefulWidget  {

   SprintLobby({Key? key,
     required this.plan_title,
     required this.Bubble_id,
     required this.my_id,
     required this.Color
   })
       : super(key: key);
String? plan_title;
int Bubble_id;
int my_id;
int? Color;
  @override
  State<SprintLobby> createState() => _SprintLobbyState();
}

class _SprintLobbyState extends State<SprintLobby>  with TickerProviderStateMixin {
  final _SprintsChatBloc = sl<SprintsBloc>();
  late AnimationController _controller;
  var spinkit;
  @override
  void initState(){
    super.initState();
    _SprintsChatBloc.add(GetUsersInsideBubble((b) =>b
    ..Bubble_id = widget.Bubble_id
        ..MY_id = widget.my_id
    ));
    _SprintsChatBloc.add(Get_MYAlias((b) => b..My_ID = widget.my_id));
    _controller =  AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
  }



bool Diditonce = true;
  int? Choosen_ID;
  String? Choosen_Avatar;
  String? Choosen_Alias;
  int? Choosen_Color;

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _SprintsChatBloc,
        builder: (BuildContext Context, SprintsState state) {

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


          void GetRandomUser(int length){
            Random random =  Random();
            int randomNumber = random.nextInt(length);
            Choosen_ID= state.InsideBubbleUsers![randomNumber].ID!;
            Choosen_Avatar = state.InsideBubbleUsers![randomNumber].Avatar;
            Choosen_Color = int.parse(state.InsideBubbleUsers![randomNumber].Background_Color!);
            Choosen_Alias = state.InsideBubbleUsers![randomNumber].Alias.toString();
            print(randomNumber);

            Future.delayed(const Duration(milliseconds: 5000), () {

                WidgetsBinding.instance
                    .addPostFrameCallback((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SprintMatch(Image1: state.GetAliasMinee!.friend!.avatar.toString(), BackgroundColor1:  int.parse( state.GetAliasMinee!.friend!.background_color!), BackgroundColor2: Choosen_Color!, Image2: Choosen_Avatar!, His_Alias:Choosen_Alias!, MY_ID: widget.my_id, His_ID: Choosen_ID!, Bubble_id: widget.Bubble_id, Plan_title: widget.plan_title!, bubble_Color: widget.Color ,)),
                ));


            });
          }

          if (state.GetInsideUsersSuccess! && Diditonce && state.AliasISsuccess!){
            GetRandomUser(state.InsideBubbleUsers!.length,);
            Diditonce = false;
          }

      return
      Scaffold(
      backgroundColor: Color(0xff303030),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                      children: [

                        Container(
                          width: w,
                          height: h / 14.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4
                            )
                            ],
                            color: Color(widget.Color!)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                             Flexible(
                               child: Row(
                                 children: [
                                   SizedBox(width: h/40,),
                                   IconButton(
                                     icon: SvgPicture.asset(
                                         "Assets/images/Frame 11.svg",
                                         width: 33.w,
                                         color: Color(0xff303030),),
                                     onPressed: () {
                                       Navigator.pop(context);
                                     },
                                   ),
                                  SizedBox(width: h/20,),
                                  Container(
                                         child: Text(widget.plan_title!,
                                           textAlign: TextAlign.left,
                                           overflow: TextOverflow.ellipsis,
                                           style: TextStyle(
                                               color: Color(0xff303030),
                                               fontFamily: 'Red Hat Display',
                                               fontSize: 22.sp,
                                               letterSpacing: 0.2,
                                               fontWeight: FontWeight.w600,
                                               height: 1
                                           ),),
                                       ),
                                 ],
                               ),
                             ),
                              Text(""),
                              Text(""),
                            ],
                          ),

                        ),
                      ]
                  ),
                  SizedBox(height: h/10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SpinKitDualRing(
                    color: Colors.white,
                    size: h/80.0,
                    controller: _controller

                    ),


                      SizedBox(width: 10.w,),
                      Text('Matchmaking...', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Red Hat Display',
                          fontSize: 23.729999542236328.sp,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600,
                          height: 1
                      ),),
                    ],
                  ),
                  SizedBox(height: h/10,),
                  Container(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:state.GetInsideUsersSuccess!?state.GetUsersInsideBubble!.users!.length.toString():"0",
                            style: TextStyle(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontFamily: 'Red Hat Text',
                                fontSize: 25.sp,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w900,
                                height: 1
                            ),
                            children: [
                              TextSpan(
                                text: " users in Lobby",
                                style: TextStyle(
                                    color: Color(widget.Color!),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 25.sp,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w900,
                                    height: 1
                                ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h/40,),

                  state.GetInsideUsersSuccess!
                      ? Container(
                    width: w/1.05,
                    height: h/1.8,
                    child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: state.InsideBubbleUsers!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 5.h,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {

                            var myInt = int.parse(state.InsideBubbleUsers![index].Background_Color.toString());
                            var BackgroundColor= myInt;


                            return

                            Column(
                                  children: [
                                    Container(
                                      width: w / 1.1,
                                      height: h / 10,
                                      decoration: BoxDecoration(
                                        color: ColorS.secondaryContainer,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(40.r),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(40.r),
                                          topRight: Radius.circular(5),
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
                                              //FrinedsStatus
                                              Stack(
                                                  children:[
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Text("  "),
                                                        Container(
                                                          width: w/6,
                                                          height: h / 12,
                                                          child:   CachedNetworkImage(
                                                            imageUrl:
                                                            state.InsideBubbleUsers![index].Avatar!,
                                                            errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                            imageBuilder: (context, imageProvider) => CircleAvatar(
                                                              radius: 12.w,
                                                              backgroundImage: imageProvider,
                                                              backgroundColor:   Color(BackgroundColor),
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
                                          SizedBox(width: 10.h,),

                                          Text(
                                              state.InsideBubbleUsers![index].Alias!,
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
                                );




                          },
                        ),
                    ),
                  )
                      : state.GetInsideUsersISloading!
                          ? Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: listLoader(
                                          context: context)),
                                ],
                              )
                          : Text("Error"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
        }
    );
  }
  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }



}