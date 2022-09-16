import 'dart:async';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_State.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Login_Page.dart';
import 'package:bubbles/UI/Profile/FindFriends_Screen/pages/FindFriends_Screen.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../Home/Home_Screen/pages/HomeScreen.dart';
import '../../ChatDirect_Screen/pages/ChatUi_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class DirectMessages extends StatefulWidget {
  const DirectMessages({Key? key}) : super(key: key);

  @override
  State<DirectMessages> createState() => _DirectMessagesState();
}
List<int> Selected = [0, 0];
Timer? timer1212;
class _DirectMessagesState extends State<DirectMessages> {
  bool Diditonce = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  final _DirectMessages_Bloc = sl<DirectMessagesBloc>();
  late FocusNode FocuseNODE;
  bool done = false;
  List<int> FrinedsID=[];
  List<int> FrinedsStatus=[];
  int index = 0;





  void ListenForONlineFriends() {
    if(socket!=null &&!socket!.disconnected) {
      socket!.on("friend_online", (value) {
        print(value);
        if (value["status"] != "offline") {
        FrinedsStatus[value["index"]] = 1;
        }
          _DirectMessages_Bloc.add(RefreshState());
      });
    }
  }


  void LoopONfrinedsId()async{
    if(socket!= null &&!socket!.disconnected) {
      for (int i = 0; i < FrinedsID.length; i++) {
        print("Looping");
        socket!.emit('report_friends_online', {
          'friend_id': FrinedsID[i].toString(),
          'index':i
        },);
      }
    }
  }
  final pref = sl<IPrefsHelper>();
  @override
  void initState() {
    super.initState();
    Diditonce = true;
    FocuseNODE = FocusNode();
    FrinedsStatus = List.filled(
        1000,
        0);
    ListenForONlineFriends();
    socket!.io..disconnect()..connect();
    _DirectMessages_Bloc.add(GetLastMessageWithAllUsers(

    ));
    timer1212 = Timer.periodic(const Duration(seconds: 20), (Timer t)async{
    return LoopONfrinedsId();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
  }
  Future<void> setlogout() async {
    await pref.logout();
  }
  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    // COLOR.copyWith(
    //   onBackground: Colors.black
    // );
    // _textthem.copyWith(
    //   headline2: TextStyle(  )
    //
    //
    // );
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _DirectMessages_Bloc,
        builder: (BuildContext Context, DirectMessagesState state) {

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


          if (state.success! && Diditonce ){
            for(int i=0;i<state.OldMessages!.messages!.length;i++){
              FrinedsID.add(state.OldMessages!.messages![i].receiver_id!);
            }
            FrinedsStatus = List.filled(
                1000,
                0);
            LoopONfrinedsId();

            Diditonce = false;

          }
          // else if (state.error=="Something Went Wrong"){
          //   if (state.OldMessages==null){
          //     AllBubblesStatus = List.filled(100000,0);
          //     AllBubblesJoinStatusTry = List.filled(10000,false);
          //     AllBubblesLeftStatusTry = List.filled(10000,true);
          //     AllNearBubblesStatusTry = List.filled(10000,true);
          //     AllBubblesIDS = List.filled(10000,0);
          //     setlogout();
          //     WidgetsBinding.instance
          //         .addPostFrameCallback((_) =>
          //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          //             Login()), (Route<dynamic> route) => false));
          //
          //   }
          // }
          //


          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            body:
             Column(
                      children: [
                        SizedBox(
                          height: h / 10.99,
                        ),
                        // Container(
                        //     decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(15),
                        //         bottomRight: Radius.circular(15),
                        //         topLeft: Radius.circular(15),
                        //         topRight: Radius.circular(15),
                        //       ),
                        //     ),
                        //     width: w / 1.2,
                        //     height: h / 15,
                        //     child: Form(
                        //       key: _formkey1,
                        //       child: TextFormField(
                        //         textInputAction: TextInputAction.search,
                        //         controller: _SearchController,
                        //         focusNode: FocuseNODE,
                        //         onFieldSubmitted: (value) {},
                        //         onChanged: (value){
                        //           _DirectMessages_Bloc.add(SearchDMlist((b) => b
                        //           ..Keyword = value
                        //           ));
                        //         },
                        //         cursorColor: Colors.grey,
                        //         style: const TextStyle(
                        //             color: Colors.orange, fontSize: 16.5),
                        //         decoration: InputDecoration(
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30.0),
                        //             borderSide: const BorderSide(
                        //                 color: Color(0xff939393), width: 10),
                        //           ),
                        //           focusedBorder: const OutlineInputBorder(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(30.0)),
                        //             borderSide: BorderSide(
                        //                 color: Color(0xff939393), width: 2),
                        //           ),
                        //           enabledBorder: const OutlineInputBorder(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(30.0)),
                        //             borderSide: BorderSide(
                        //                 color: Color(0xff939393), width: 2),
                        //           ),
                        //           prefixIcon: IconButton(
                        //               icon: SvgPicture.asset(
                        //                 'Assets/images/Vector(1).svg',
                        //               ),
                        //               onPressed: null //do something,
                        //               ),
                        //           filled: true,
                        //           fillColor: Colors.transparent,
                        //
                        //           contentPadding: const EdgeInsets.symmetric(
                        //               horizontal: 12, vertical: 20),
                        //           hintText: "Search",
                        //           hintStyle:  TextStyle(
                        //               color: Color.fromRGBO(147, 147, 147, 1),
                        //               fontFamily: 'Red Hat Text',
                        //               fontSize: 15,
                        //               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        //               fontWeight: FontWeight.w500,
                        //               height: 1
                        //           )
                        //         ),
                        //         keyboardType: TextInputType.text,
                        //       ),
                        //     )),
                        // const Text(""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                '       Direct Messages',
                                textAlign: TextAlign.left,
                                style: _textthem.headlineLarge!.copyWith(
                                    fontWeight: FontWeight.w600,   fontSize: 20.sp
                                ),
                              ),
                            ),
                            Row(
                              children:  [
                                SizedBox(
                                  width: 10.w,
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  const Text("        "),
                                  Container(
                                      width: w / 14,
                                      height: h / 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                size: h / 34,
                                              ),
                                              onPressed: () {

                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                          Friendlist(is_WithoutTopBar: true,)
                                                    )));
                                              },
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(width: h/100,),
                                  Container(
                                    width: w / 10,
                                    height: h / 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                              "Assets/images/Frame(1).svg",
                                              width: w / 5,
                                              height: h / 40,
                                              color: COLOR.onSurface,
                                            ),
                                            onPressed: () {
                                              Selected = List.filled(3, 0);
                                              Selected[1] = 1;
                                              setState(() {});
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback(
                                                      (_) => Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ShowCaseWidget(
                                                                        builder:
                                                                            Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              const FindFriends_screen(),
                                                                    ))),
                                                          ));
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text(""),
                        (state.success!)
                            ?   state.FilteredDmlist!.length==0
                        ?Expanded(
                          child: Container(
                            width: w,
                            height: h /1.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: w/1.32,
                                  child :
                                  AspectRatio(
                                    aspectRatio: 2/2.1,
                                    child:  Image.asset("Assets/images/DirectEmpty.png",fit: BoxFit.fill,),
                                  ),
                                ),



                                SizedBox(height: h/40,),
                                InkWell(
                                  onTap: (){
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Friendlist(is_WithoutTopBar: true,)
                                        )));
                                  },
                                  child: Container(
                                      width: w/1.4,
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
                                            blurRadius: 10.r
                                        )],
                                        color : Color.fromRGBO(207, 109, 56, 1),
                                      ),
                                    child: Center(
                                      child:
                                      Text('Create Message', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Red Hat Text',
                                          fontSize: 20.sp,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                          height: 1.h
                                      ),),
                                    ),
                                  ),
                                ),
                                SizedBox(height: h/40,),
                                Container(
                                  width: w/1.6,
                                  child: Text('There are no messages. Find friends and start a chat with them!', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(96, 96, 96, 1),
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 18.11.sp,
                                      letterSpacing: 0.3 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w400,
                                      height: 1.h
                                  ),),
                                ),


                              ],
                            ),
                          ),
                        )
                            :!state.isLoading!?

                        Expanded(
                                child: Container(
                                    width: w,
                                    height: h / 1.4,
                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: const BouncingScrollPhysics( parent: AlwaysScrollableScrollPhysics()),
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                        state.FilteredDmlist!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return

                                      Slidable(
                                          closeOnScroll: true,
                                          key:  ValueKey(state.FilteredDmlist![index].receiver_id!),
                                          endActionPane: ActionPane(
                                            motion:   const ScrollMotion(),
                                            dismissible:
                                            DismissiblePane(
                                                onDismissed:  () {
                                                  FrinedsID.removeAt(index);
                                                  FrinedsStatus = List.filled(
                                                      1000,
                                                      0);
                                                  _DirectMessages_Bloc.add(DeleteFromList((b) =>
                                                  b..index = index
                                                      ..receiver_id =state.FilteredDmlist![index].receiver_id
                                                  ));
                                                }),
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    FrinedsID.removeAt(index);
                                                    FrinedsStatus = List.filled(
                                                        1000,
                                                        0);
                                                    _DirectMessages_Bloc.add(DeleteFromList((b) =>
                                                    b..index = index
                                                      ..receiver_id =state.FilteredDmlist![index].receiver_id
                                                    ));
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 8,
                                                    margin: EdgeInsets.only(

                                                        bottom: h / 750,
                                                        top: h / 120),
                                                    decoration:
                                                     BoxDecoration(
                                                      color:  Color(
                                                          0xff942657),
                                                      borderRadius:
                                                      BorderRadius
                                                          .only(
                                                     //   topLeft: Radius.circular( h/20.5),
                                                        topRight:Radius.circular( h/162.5),
                                                      //  bottomLeft: Radius.circular( h/20.5),
                                                        bottomRight:Radius.circular( h/162.5),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            "Assets/images/Delete_trash.svg",
                                                            width: h /
                                                                30,
                                                            color: Colors
                                                                .white),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          child:
                                          InkWell(
                                            onTap: () {
          var test =Navigator.push(
            context,
            MaterialPageRoute(
                builder:(context) =>
                    Sprints(
                      my_ID: state.FilteredDmlist![index].MY_id!,
                      receiver_id: state.FilteredDmlist![index].receiver_id!,
                      IS_sprints: false,
                      His_Alias: state.FilteredDmlist![index].alias.toString(),
                      Send_by: state.FilteredDmlist![index].send_by.toString(),
                    )
            ),
          ).then((value) {
            if (value == "Yes") {
              FrinedsID.removeAt(index);
              FrinedsStatus = List.filled(
                  1000,
                  0);
              _DirectMessages_Bloc.add(DeleteFromList((b) =>
              b..index = index
                ..receiver_id =state.FilteredDmlist![index].receiver_id
              ));
              _DirectMessages_Bloc.add(
                  DeleteChat((b) => b
                    ..send_by = "sprint"
                    ..Reciver_id = state.FilteredDmlist![index].receiver_id
                  )
              );
            }
          }
          );


                                            },
                                            child: Column(children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: h / 50,
                                                      bottom: h / 750,
                                                      top: h / 120),
                                                  width: w / 1.1,
                                                  height: h / 9,
                                                  decoration: BoxDecoration(
                                                    color: COLOR.background,
                                                    borderRadius:
                                                     BorderRadius.only(
                                                      bottomLeft:  Radius.circular( h/8),
                                                      topLeft: Radius.circular(h/8),
                                                      topRight:Radius.circular( h/70.5),
                                                      bottomRight:Radius.circular( h/70.5),
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                        offset: Offset(0, 0),
                                                        blurRadius: 2.0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(children: [
                                                    SizedBox(width: w/50,),
                                                    
                                                  Stack(
                                                          children: [
                                                  Hero(
                                                  tag:"Image${state.OldMessages!.messages![index].id}",
                                                      child: Material(
                                                          type: MaterialType.transparency,
                                                          child :
                                                          InkWell(
                                                        onTap: (){
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                              builder: (context) => HeroImage(path:
                                                              state.FilteredDmlist![index].Avatar.toString(),
                                                                color:    state.FilteredDmlist![index].backgroundColor!,
                                                                id:state.OldMessages!.messages![index].id
                                                                ,),),
                                                          );
                                                        },
                                                        child:
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  left: h / 109),
                                                              child: CircleAvatar(
                                                                backgroundColor: state.FilteredDmlist![index].send_by=="sprint"? Colors.green:Colors.transparent,
                                                                radius: h / 20.5,
                                                                child:CircleAvatar(
                                                                  backgroundColor: Color(0xff606060),
                                                                  radius: h / 22.5,
                                                                  child:CircleAvatar(
                                                                    backgroundColor: Color(
                                                                        state.FilteredDmlist![index].backgroundColor!),
                                                                    backgroundImage:
                                                                    NetworkImage(   state.FilteredDmlist![index].Avatar.toString()),
                                                                    radius: h / 25.5,
                                                                  ),
                                                                )

                                                              )


                                                            ),
                                                      )
                                                      )
                                                  ),


                                                            state.ChangeStateSuccess!?
                                                            FrinedsStatus[index]==1?
                                                            Positioned(
                                                              bottom: 6,
                                                              right: 0,
                                                              child:
                                                              CircleAvatar(
                                                                  backgroundColor:COLOR.secondaryContainer,
                                                                  radius: 8,
                                                                  child:  const CircleAvatar(backgroundColor: const Color(0xff34A853),radius: 5.5,)),
                                                            )
                                                                :const Text("")
                                                                :const Text("")

                                                          ],

                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [

                                                              Container(
                                                                width: w / 1.6,
                                                                    child: Text(
                                                                        state.FilteredDmlist![index].alias.toString(),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                        style: _textthem
                                                                            .headline3!
                                                                            .copyWith(
                                                                          color: Colors.white,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                          fontSize: 16.sp,
                                                                        )),
                                                                  ),

                                                           SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              Container(
                                                                width: w / 20,
                                                              ),
                                                              Flexible(
                                                                child:
                                                                Container(
                                                                  width: w / 1.2,
                                                                  //  height: h/40,
                                                                  child: Text(
                                                                      state.FilteredDmlist![index].Replies==""?
                                                                      state.FilteredDmlist![index].lastMessage.toString():
                                                                      state.FilteredDmlist![index].Replies.toString()
                                                                      ,
                                                                      overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                      textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                      style : GoogleFonts.roboto().copyWith(
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize: 11.sp,
                                                                          color:
                                                                          const Color(0xffC4C4C4))),
                                                                ),
                                                              ),

                                                                Container(
                                                                  width: w / 4,
                                                                  height:h / 25,

                                                                  margin: EdgeInsets.only(right: w/50),
                                                                  child: Center(
                                                                    child: Text(
                                                                        state.FilteredDmlist![index].time.toString(),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                        style: _textthem
                                                                            .headline4!
                                                                            .copyWith(
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                            fontSize: 14.sp,
                                                                            color:
                                                                            const Color(0xffC4C4C4)

                                                                          // ,fontWeight: FontWeight.bold
                                                                        )),
                                                                  ),
                                                                ),

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ]))
                                            ]),
                                          ) );

                                                //



                                                //
                                                //

                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: h / 1500,
                                          );
                                        },
                                      ),
                                    )),
                              )
                        :Container()
                            : state.isLoading == true
                                ? Container(
                                    width: w,
                                    height: h /1.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child:
                                                listLoader(context: context)),
                                      ],
                                    ))
                                : Expanded(
                                    child: Container(
                                      width: w,
                                      height: h / 1.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Container(
                                              width: w,
                                              height: h / 10,
                                              child: Center(child: const Text("Waiting..")),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                      ],
                    ),
          );
        });
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}



class HeroImage extends StatefulWidget {
  HeroImage({Key? key, this.path,this.color,this.id}) : super(key: key);
  int? color;
  String? path;
  int? id;


  @override
  State<HeroImage> createState() => _HeroImageState();
}



class _HeroImageState extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: w,
          height: h,
          color: Colors.transparent,
          child: Hero(
            tag: "Image${widget.id}",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl:
                      widget.path!,
                      errorWidget: (context, url, error) => Center(child: Text("Error")),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: w/2,
                        backgroundImage: imageProvider,
                        backgroundColor:   Color(widget.color!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}