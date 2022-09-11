
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Bloc.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';
import 'package:bubbles/core/Classes/Classes.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Events_Screen extends StatefulWidget {
  Events_Screen({Key? key, required this.Bubble ,required this.Type,required this.my_id});
  List<BubbleData> Bubble;
  String Type;
  int my_id;
  @override
  State<Events_Screen> createState() => _Events_ScreenState();
}
List<int>? Event_IDS=[];
List<bool>? Event_Statuses=[];
String Type ="";
class _Events_ScreenState extends State<Events_Screen> {

  final _formKey3 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool>? Saved_Status=[];
  final _SeeAllBloc = sl<SeeAllBloc>();

@override
  void initState() {
    super.initState();


    Type  = widget.Type;
    if (widget.Type!='Nearby Primes') {
      Event_Statuses = List.filled(widget.Bubble.length,false);
      Event_IDS = List.filled(widget.Bubble.length,0);
      for (int i = 0; i < widget.Bubble.length; i++) {
        Saved_Status!.add(widget.Bubble[i].is_Saved!);
        Event_IDS![i] = widget.Bubble[i].id!;
       Event_Statuses![i] = widget.Bubble[i].is_Saved!;
      }


      _SeeAllBloc.add(GiveHimListOfBoolean((b) =>b
      ..List_Saved_Status = Saved_Status
      ));
    }
}

  @override
  void dispose() {
    super.dispose();
    print(Event_Statuses);
  }



  bool Diditonce = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _SeeAllBloc,
        builder: (BuildContext Context, SeeAllState state)
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
      return
      SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorS.onInverseSurface,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Container(
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
                                  Navigator.pop(context,"Yes!");
                                },
                              )),
                          Text('${widget.Type}', textAlign: TextAlign.left,
                            style: _TextTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp
                            ),),
                          const Text(""),
                          const Text(""),
                          widget.Type=="Nearby Primes"?Container():      IconButton(
                        icon: SvgPicture.asset(
                          state.ShapStatus!?
                            "Assets/images/reshap1.svg"
                              : "Assets/images/reshap2.svg"
                            ,width:w/18
                        ),
                          onPressed:() async {
                            _SeeAllBloc.add(ChangeShapStatus());
                               }
                            )
                        ],
                      ),
                    ),
                    Center(
                        child: Container(
                          width: w/1.1,
                          height: h/1.141,
                          child :
                          ScrollConfiguration(
                              behavior: MyBehavior(),
                              child:
                              GridView.builder(
                                  itemCount: widget.Bubble.length,
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
                                  state.ShapStatus!? 2:1,
                                    childAspectRatio: (5 / (widget.Type!="Nearby Primes"?4.8: 4.9)),),
                                  itemBuilder: (BuildContext context, int index) {
                                    return
                                      state.ShapStatus!
                                              ?widget.Type!="Nearby Primes"
                                                  ? InkWell(
                                                onTap: (){

                                                  WidgetsBinding
                                                      .instance
                                                      .addPostFrameCallback(
                                                          (_) =>   Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (
                                                              context) =>

                                                              Plan_Screen(
                                                                Bubble:widget.Bubble[index],
                                                                my_id: widget.my_id,
                                                                is_saved:widget.Bubble[index].is_Saved,
                                                              ),
                                                        ),
                                                      ));

                                                },
                                                child: Container(
                                                  width: w/2.2,
                                                  height:  h / 3.5,
                                                  margin:  EdgeInsets.all(h/90.9),
                                                  decoration:  BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(h/90.5),
                                                      topRight: Radius.circular(h/90.5),
                                                      bottomLeft:Radius.circular(h/90.5),
                                                      bottomRight: Radius.circular(h/90.5),
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
                                                            height: h/6.8,
                                                            child: ClipRRect(
                                                              borderRadius:  BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5),),
                                                              child:CachedNetworkImage(
                                                                fit: BoxFit.fitWidth,
                                                                imageUrl:
                                                                widget.Bubble[index].image.toString(),

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
                                                              height: h/15.2,

                                                              decoration: BoxDecoration(
                                                                borderRadius :  BorderRadius.only(
                                                                  topLeft: Radius.circular(h/90.5),
                                                                  topRight:  Radius.circular(h/90.5),

                                                                ),
                                                                color: Colors.transparent,
                                                                boxShadow : [BoxShadow(
                                                                    color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                    offset: Offset(0,2),
                                                                    blurRadius: 8.628571510314941.r
                                                                )],

                                                              )
                                                          ),

                                                          Container(
                                                            width: w/2.8,
                                                            height: h/22,
                                                            margin: EdgeInsets.only(left: w/20,top: h/100),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                widget.Bubble[index].User_type=="user"
                                                                    ? Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                      radius: 8.r,
                                                                      backgroundColor: Color(int.parse(widget.Bubble[index].Creator_Color!)),
                                                                      backgroundImage: NetworkImage(widget.Bubble[index].Creator_Avatar!),
                                                                    ),
                                                                     SizedBox(width: 10.w,),
                                                                    Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left, style:  TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Display',
                                                                        fontSize: 5.48.sp,
                                                                        letterSpacing: 0 ,
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1.h
                                                                    ),),

                                                                  ],
                                                                )
                                                                    :  Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 10.477987289428711,
                                                                    letterSpacing: 0 ,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1.h
                                                                ),),
                                                                Text(""),
                                                                IconButton(
                                                                  icon:SvgPicture.asset(
                                                                    state.success!?
                                                                    state.Saved_Status![index]
                                                                        ?"Assets/images/Save_Marker(1).svg"
                                                                        :"Assets/images/Save_outline.svg"
                                                                        :""
                                                                    ,color: Colors.white,
                                                                    width: w/25,
                                                                  ) ,
                                                                  onPressed: (){
                                                                    if (state.Saved_Status![index]) {
                                                                      Event_Statuses![index] =false;
                                                                    }else{
                                                                      Event_Statuses![index] =true;
                                                                    }
                                                                    _SeeAllBloc.add(
                                                                        ToggleSaveBubbleEventScreen((b) => b
                                                                          ..Bubble_id = widget.Bubble[index].id
                                                                          ..index = index
                                                                          ..List_type = widget.Type
                                                                          ..Saved_Status =state.Saved_Status![index]
                                                                        )
                                                                    );
                                                                  },
                                                                ),

                                                              ],
                                                            ),
                                                          ),
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
                                                                     SizedBox(
                                                                      height:
                                                                      4.h,
                                                                    ),


                                                                        Container(
                                                                          width: w/2.8,
                                                                          child:      Text(
                                                                            widget.Bubble[index].Title.toString(),
                                                                            textAlign: TextAlign.left,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style : GoogleFonts.roboto().copyWith(
                                                                              color: Color(widget.Bubble[index].Color!),
                                                                              fontSize: 9.sp,
                                                                              letterSpacing: 0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                    SizedBox(height: 3.h,),
                                                                    Container(
                                                                      width: w/2.8,
                                                                      child:  Text(
                                                                        "At ${ widget.Bubble[index].location.toString()}",
                                                                        textAlign: TextAlign.left,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style : GoogleFonts.roboto().copyWith(
                                                                          fontSize: 7.sp,
                                                                          letterSpacing: 0,
                                                                          fontWeight: FontWeight.w600,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 3.h,),
                                                                    Row(
                                                                      children:[

                                                                        Container(
                                                                          width: w/55,
                                                                          child:
                                                                          Image.network(widget.Bubble[index].Cateogory_Icon!),
                                                                        ),
                                                                        SizedBox(width: 3.w,),
                                                                Container(
                                                                    width: w/4,
                                                                    child:Text(
                                                                       "${widget.Bubble[index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Red Hat Text',
                                                                              fontSize: 5.5.sp,
                                                                                letterSpacing: 0,
                                                                                fontWeight: FontWeight.w600,
                                                                              height: 1.h
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
                                                                  width: w/12,
                                                                  color : Color(widget.Bubble[index].Color!),
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
                                                  :   InkWell(
                                        onTap: () {

                                          WidgetsBinding
                                              .instance
                                              .addPostFrameCallback(
                                                  (_) =>   Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      context) =>
                                                      PrimePlan_page(
                                                        Bubble:widget.Bubble[index],   my_id:widget.my_id ,     List_Type: "PRIME",is_saved: widget.Bubble[index].is_Saved,  ),
                                                ),
                                              ));

                                        },
                                        child:



                                        Container(
                                          width: w/2.5,
                                          margin: EdgeInsets.all( 6.w,),
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(h/1.233),
                                              topRight: Radius.circular(h/1.233),
                                              bottomRight: Radius.circular(h/10),
                                              bottomLeft:  Radius.circular(h/10),

                                            ),
                                            color: Colors.white,
                                          ),child:
                                        Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl:widget.Bubble[index].image!,
                                                    imageBuilder: (context, imageProvider) => Container(
                                                      width: w/2.2,
                                                      height: h / 6,
                                                      margin: EdgeInsets.only(left: w/500,right: w/500,top: h/600),
                                                      decoration: BoxDecoration(
                                                        borderRadius : BorderRadius.only(
                                                          topLeft: Radius.circular(364.2384033203125.r),
                                                          topRight: Radius.circular(364.2384033203125.r),
                                                        ),
                                                        image:DecorationImage(image: imageProvider
                                                            ,fit: BoxFit.fill
                                                        ),

                                                      ),

                                                    ),
                                                    placeholder: (context, url) => Container(    width: w/2.5,
                                                        height: h/6.5,child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            CircularProgressIndicator(),
                                                          ],
                                                        )),
                                                    errorWidget: (context, url, error) => Container(    width: w/2.5,
                                                        height: h/6.5,child: Icon(Icons.error)),
                                                  ),

                                                  Positioned(
                                                    top: h/7,
                                                    child: Container(
                                                        width: w/2.5,
                                                        height: h/12,
                                                        padding: EdgeInsets.only(top: h/2),
                                                        decoration: BoxDecoration(
                                                          color: Colors.transparent,
                                                          boxShadow : [BoxShadow(
                                                              color: Colors.black54,
                                                              offset: Offset(0,0),
                                                              blurRadius: 15.628571510314941.r
                                                          )],

                                                        )
                                                    ),
                                                  ),

                                                  Positioned(
                                                      left: h/40,
                                                      top: h/30,
                                                      child: Image.asset("Assets/images/icon.png")
                                                  ),
                                                  Positioned(
                                                    left: w/3.9,
                                                    top: h/7.1,
                                                    child:
                                                    Container(
                                                      width: w/3.7,height: h/15,
                                                      margin: EdgeInsets.only(left:widget.Bubble[index].users_in_bubble!.length==1
                                                          ?  w/20
                                                          :widget.Bubble[index].users_in_bubble!.length==2
                                                          ?w/50
                                                          :    w/130
                                                          ,bottom: h/10),   child: ListView.builder(
                                                        itemCount: widget.Bubble[index].users_in_bubble!.length<3?  widget.Bubble[index].users_in_bubble!.length:3,
                                                        scrollDirection: Axis.horizontal,
                                                        itemBuilder: (BuildContext context, int index2) {
                                                          String Value =   widget.Bubble[index].users_in_bubble![index2].background_color.toString();
                                                          if (Value.contains("#",0)){
                                                            Value = Value.substring(1);
                                                            Value = "0xff$Value";
                                                          }
                                                          var myInt = int.parse(Value);
                                                          var BackgroundColor= myInt;
                                                          return    Row(
                                                            children: [
                                                              index2==0
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
                                                                              radius: 6.w,
                                                                              backgroundColor: Color(BackgroundColor),
                                                                              backgroundImage: NetworkImage( widget.Bubble[index].users_in_bubble![index2].avatar.toString()),
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
                                                    ),),
                                                  Positioned(
                                                    left: w/2.8,
                                                    top: h/6.8,
                                                    child: Text("+${ widget.Bubble[index].users_in_bubble!.length.toString()}", textAlign: TextAlign.left, style: TextStyle(
                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Red Hat Text',
                                                        fontSize: 0.184.sp,
                                                        letterSpacing: 0 ,
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.h
                                                    ),),
                                                  )
                                                ],
                                              ),

                                              Expanded(
                                                child: Container(


                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      bottomRight: Radius.circular(6.569536209106445.r),
                                                      bottomLeft: Radius.circular(6.569536209106445.r),
                                                    ),
                                                    color: Color(0xff606060),
                                                  ),
                                                  child:
                                                  Row(
                                                    children: [
                                                      SizedBox(height: 2.h,),
                                                      Column(
                                                        children: [
                                                          SizedBox(height: 3.h,),
                                                          Stack(
                                                            children:[
                                                              SvgPicture.asset(
                                                                "Assets/images/Exclude.svg",
                                                                color : Color(widget.Bubble[index].Color!),
                                                                width: w/9.5,
                                                              ),
                                                              Positioned(
                                                                  left: 0,
                                                                  right: 0,
                                                                  top: 2.h,
                                                                  bottom: 0,
                                                                  child:  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Container(
                                                                        width: w/45,
                                                                        child:
                                                                        Image.network(widget.Bubble[index].Cateogory_Icon!,  fit: BoxFit.fill,),
                                                                      )
                                                                    ],
                                                                  ))

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Flexible(
                                                            child: Container(
                                                              width: w/4.2,
                                                              color: Colors.transparent,
                                                              child: Text( widget.Bubble[index].Title.toString(),
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style : GoogleFonts.roboto().copyWith(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontSize: 11.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1.h
                                                                ),),
                                                            ),
                                                          ),
                                                          SizedBox(height: 2.h,),
                                                          Container(
                                                            width: w/4.2,
                                                            child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Red Hat Text',
                                                                fontSize: 6.5.sp,
                                                                letterSpacing: 0 ,
                                                                fontWeight: FontWeight.w300,
                                                                height: 1.h
                                                            ),),
                                                          ),
                                                        ],
                                                      )


                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]





                                        ),
                                        ),
                                      )
                                          :widget.Type!="Nearby Primes"
                                          ?InkWell(
                                        onTap: (){
                                      WidgetsBinding
                                          .instance
                                          .addPostFrameCallback(
                                              (_) =>   Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) =>
                                                  Plan_Screen(
                                                    Bubble:widget.Bubble[index],my_id: widget.my_id,                is_saved:widget.Bubble[index].is_Saved, ),
                                            ),
                                          ));

                                    },
                                    child:Center(
                                        child: Container(
                                            width:w/1.15,
                                            height: h/2.2,
                                            margin:  EdgeInsets.all(h/85.5),
                                            decoration:  BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(h/90.5),
                                                topRight: Radius.circular(h/90.5),
                                                bottomLeft: Radius.circular(h/90.5),
                                                bottomRight: Radius.circular(h/90.5),
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
                                                          borderRadius:  BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
                                                          child:CachedNetworkImage(
                                                            fit: BoxFit.fill,
                                                            imageUrl:  widget.Bubble[index].image.toString(),
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
                                                          height: h/8.2,

                                                          decoration: BoxDecoration(
                                                            borderRadius :  BorderRadius.only(
                                                              topLeft: Radius.circular(h/90.5),
                                                              topRight:  Radius.circular(h/90.5),

                                                            ),
                                                            color: Colors.transparent,
                                                            boxShadow : [BoxShadow(
                                                                color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                offset: Offset(0,2),
                                                                blurRadius: 8.628571510314941.r
                                                            )],

                                                          )
                                                      ),
                                                      Container(
                                                          width:w/1.3,
                                                          height: h/13.89,
                                                          margin: EdgeInsets.only(left: w/20),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              widget.Bubble[index].User_type=="user"
                                                                  ?Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 13.5.w,
                                                                    backgroundColor: Color(int.parse(widget.Bubble[index].Creator_Color!)),
                                                                    backgroundImage: NetworkImage(widget.Bubble[index].Creator_Avatar!),
                                                                  ),
                                                                   SizedBox(width: 10.w,),
                                                                  Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left,
                                                                    style:  TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Display',
                                                                      fontSize: 7.22.sp,
                                                                      letterSpacing: 0 ,
                                                                      fontWeight: FontWeight.w600,
                                                                      height: 1.h
                                                                  ),),

                                                                ],
                                                              )
                                                                  :  Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 7.22.sp,
                                                                  letterSpacing: 0 ,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1.h
                                                              ),),
                                                              Text(""),

                                                              IconButton(
                                                                icon:SvgPicture.asset(
                                                                    state.success!?
                                                                    state.Saved_Status![index]
                                                                        ?"Assets/images/Save_Marker(1).svg"
                                                                        :"Assets/images/Save_outline.svg"
                                                                        :""
                                                                        ,color: Colors.white,
                                                                  width: w/25,
                                                                ) ,
                                                                onPressed: (){
                                                                  _SeeAllBloc.add(
                                                                      ToggleSaveBubbleEventScreen((b) => b
                                                                        ..Bubble_id = widget.Bubble[index].id
                                                                        ..index = index
                                                                        ..List_type = widget.Type
                                                                        ..Saved_Status =state.Saved_Status![index]
                                                                      )
                                                                  );
                                                                },
                                                              ),

                                                            ],
                                                          )






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
                                                             SizedBox(
                                                              height:
                                                              5.h,
                                                            ),
                                                                Container(
                                                                  width:w/1.15,
                                                                  child: Text(
                                                                    widget.Bubble[index].Title.toString(),
                                                                    textAlign: TextAlign.left,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style : GoogleFonts.roboto().copyWith(
                                                                      color: Color(widget.Bubble[index].Color!),
                                                                      fontSize: 12.22.sp,
                                                                      letterSpacing: 0,
                                                                      fontWeight: FontWeight.w600,
                                                                    ),
                                                                  ),

                                                                ),

                                                             SizedBox(height: 3.h,),
                                                            Container(
                                                              width:w/1.5,
                                                              child:  Text(
                                                                "At ${ widget.Bubble[index].location.toString()}",
                                                                textAlign: TextAlign.left,
                                                                overflow: TextOverflow.ellipsis,
                                                                style : GoogleFonts.roboto().copyWith(
                                                                  fontSize: 9.44.sp,
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                ),

                                                              ),
                                                            ),
                                                             SizedBox(height: 4.h,),
                                                            Row(
                                                              children:[

                                                                Container(
                                                                  width: w/25,
                                                                  child:
                                                                  Image.network(widget.Bubble[index].Cateogory_Icon!),
                                                                ),
                                                                SizedBox(width: 3.w,),
                                                                Container(
                                                                  width:w/2,
                                                                  child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Text',
                                                                      fontSize: 7.22.sp,
                                                                      letterSpacing: 0 ,
                                                                      fontWeight: FontWeight.w300,
                                                                      height: 1.h
                                                                  ),),
                                                                )
                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                     SizedBox(width: 5.w,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(""),
                                                        SvgPicture.asset(
                                                          "Assets/images/Exclude.svg",
                                                          width: w/8,
                                                          color : Color(widget.Bubble[index].Color!),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 5.w,),
                                                     SizedBox(width: 5.w,),

                                                  ],
                                                )
                                              ],
                                            )

                                        ),
                                      ))
                                          :Container();
                                  }
                              )
                          ),
                        )
                    )
                  ],
                ),
              )
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
