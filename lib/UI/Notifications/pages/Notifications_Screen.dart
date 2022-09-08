import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Notifications/bloc/Notifications_Bloc.dart';
import 'package:bubbles/UI/Notifications/bloc/Notifications_State.dart';
import 'package:bubbles/UI/Notifications/bloc/Notifications_event.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Login_Page.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:bubbles/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bubbles/App/app.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/Colors/constants.dart';
import 'package:timeago/timeago.dart' as timeago;
class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late FocusNode FocuseNODE;
  final _NotificationBloc = sl<NotificationsBloc>();
  final pref = sl<IPrefsHelper>();
  Future<void> setlogout() async {
    await pref.logout();
  }
  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    _NotificationBloc.add(GetNotifications());
    Diditonce2 = true;
    _removeBadge();
  }

  void _removeBadge() {
    FlutterAppBadger.removeBadge();
  }
  Future<void> OnRefresh() async {
    return Future.delayed(const Duration(milliseconds: 2000), () {});
  }
bool diditonce = false;
bool Diditonce2 = true;

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _NotificationBloc,
        builder: (BuildContext Context, NotificationsState state) {
          if (state.success! && Diditonce2){

            _NotificationBloc.add(ClearBadge());
            Diditonce2 = false;
          }else if (state.error=="Something went wrong" ) {
            if (state.Getbadge == null) {
              AllBubblesStatus = List.filled(100000,0);
              AllBubblesJoinStatusTry = List.filled(10000,false);
              AllBubblesLeftStatusTry = List.filled(10000,true);
              AllNearBubblesStatusTry = List.filled(10000,true);
              AllBubblesIDS = List.filled(10000,0);
              setlogout();
              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      Login()), (Route<dynamic> route) => false));
            }
          }


          // alreatDialogBuilder2(
          //     BuildContext Context,
          //     double h,
          //     double w,
          //     int Frined_id,
          //     ) async {
          //   return showDialog(
          //       context: Context,
          //       barrierDismissible: false,
          //       builder: (Context) {
          //         return AlertDialog(
          //           backgroundColor: Colors.transparent,
          //           insetPadding: EdgeInsets.all(h/50),
          //           content:
          //           Container(
          //             width: w/1.1,
          //             height: h/4.2,
          //             decoration: BoxDecoration(
          //               borderRadius : BorderRadius.only(
          //                 topLeft: Radius.circular(8.285714149475098),
          //                 topRight: Radius.circular(8.285714149475098),
          //                 bottomLeft: Radius.circular(8.285714149475098),
          //                 bottomRight: Radius.circular(8.285714149475098),
          //               ),
          //               color : Color.fromRGBO(47, 47, 47, 1),
          //             ),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: [
          //                 Container(
          //                   padding: EdgeInsets.only(left: h/50,top: h/50),
          //                   child: Text('Are you sure you want to remove this user from your friendlist?',
          //                     textAlign: TextAlign.left, style: TextStyle(
          //                         color: Color.fromRGBO(234, 234, 234, 1),
          //                         fontFamily: 'Sofia Pro',
          //                         fontSize: 20.571428298950195,
          //                         letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                         fontWeight: FontWeight.normal,
          //                         height: 1
          //                     ),),
          //                 ),
          //                 Text(""),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: [
          //
          //                     InkWell(
          //                       onTap: (){
          //                         Navigator.pop(context);
          //                       },
          //                       child: Container(
          //                           width: w/3,
          //                           height: h/15,
          //                           decoration: BoxDecoration(
          //                             borderRadius : BorderRadius.only(
          //                               topLeft: Radius.circular(4.142857074737549),
          //                               topRight: Radius.circular(4.142857074737549),
          //                               bottomLeft: Radius.circular(4.142857074737549),
          //                               bottomRight: Radius.circular(4.142857074737549),
          //                             ),
          //                             boxShadow : [BoxShadow(
          //                                 color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                 offset: Offset(0,0),
          //                                 blurRadius: 6.628571510314941
          //                             )],
          //                             color : Color.fromRGBO(207, 109, 56, 1),
          //                           ),
          //                           child: Center(
          //                             child:
          //                             Text('No', textAlign: TextAlign.center, style: TextStyle(
          //                                 color: Color.fromRGBO(234, 234, 234, 1),
          //                                 fontFamily: 'Sofia Pro',
          //                                 fontSize: 19.571428298950195,
          //                                 letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                                 fontWeight: FontWeight.w500,
          //                                 height: 1
          //                             ),),
          //                           )
          //                       ),
          //                     ),
          //
          //                     InkWell(
          //                       onTap: (){
          //                         Navigator.pop(context);
          //                         _GroupChatBloc.add(RemoveFriend((b) => b
          //                           ..friend_id = Frined_id
          //                         ));
          //                       },
          //                       child: Container(
          //                         width: w/3,
          //                         height: h/15,
          //                         decoration: BoxDecoration(
          //                           borderRadius : BorderRadius.only(
          //                             topLeft: Radius.circular(4.142857074737549),
          //                             topRight: Radius.circular(4.142857074737549),
          //                             bottomLeft: Radius.circular(4.142857074737549),
          //                             bottomRight: Radius.circular(4.142857074737549),
          //                           ),
          //                           boxShadow : [BoxShadow(
          //                               color: Color.fromRGBO(0, 0, 0, 0.25),
          //                               offset: Offset(0,0),
          //                               blurRadius: 6.628571510314941
          //                           )],
          //                           color : Color.fromRGBO(168, 48, 99, 1),
          //                         ),
          //                         child: Center(
          //                           child:
          //                           Text('Yes', textAlign: TextAlign.center, style: TextStyle(
          //                               color: Color.fromRGBO(234, 234, 234, 1),
          //                               fontFamily: 'Sofia Pro',
          //                               fontSize: 19.571428298950195,
          //                               letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
          //                               fontWeight: FontWeight.w500,
          //                               height: 1
          //                           ),),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       });
          // }
          //
          //
          // alreatDialogBuilder(
          //     BuildContext Context,
          //     double h,
          //     double w,
          //     int myINdex,
          //     bool is_frined,
          //     bool is_me,
          //     int frined_id,
          //     ) async {
          //   return showDialog(
          //       context: Context,
          //       barrierDismissible: false,
          //       builder: (Context) {
          //
          //
          //
          //         var myInt = int.parse(state.FilteredInsideBubbleUsers![myINdex].Background_Color.toString());
          //         var BackgroundColor= myInt;
          //
          //
          //         return AlertDialog(
          //             backgroundColor: Colors.transparent,
          //             insetPadding: EdgeInsets.all(h/50),
          //             content:GestureDetector(
          //               onTap: (){
          //                 Navigator.pop(context,true);
          //               },
          //               child: Container(
          //                 color: Colors.transparent,
          //                 width: w,
          //                 height: h,
          //                 child :
          //                 Stack(
          //                     children:[
          //
          //                       Center(
          //                         child: Container(
          //                           width: w/1.1,
          //                           height: h/2.3,
          //                           decoration: BoxDecoration(
          //                             borderRadius : BorderRadius.only(
          //                               topLeft: Radius.circular(8.285714149475098),
          //                               topRight: Radius.circular(8.285714149475098),
          //                               bottomLeft: Radius.circular(8.285714149475098),
          //                               bottomRight: Radius.circular(8.285714149475098),
          //                             ),
          //                             color : Color.fromRGBO(47, 47, 47, 1),
          //                           ),
          //                           child: Column(
          //                             crossAxisAlignment: CrossAxisAlignment.center,
          //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                             children: [
          //                               Row(
          //                                 mainAxisAlignment:
          //                                 MainAxisAlignment.spaceAround,
          //                                 children:  [
          //
          //
          //                                   Container(
          //                                     margin: EdgeInsets.only(left: h/60),
          //                                     child: CircleAvatar(
          //
          //                                       backgroundImage: NetworkImage(state.FilteredInsideBubbleUsers![myINdex].Avatar.toString()),
          //                                       radius:40,
          //                                       backgroundColor:Color(BackgroundColor),
          //                                     ),
          //                                   ),
          //                                   Container(
          //                                     margin: EdgeInsets.only(left: h/60),
          //                                     child: Column(
          //                                       children: [
          //                                         Container(
          //                                           child: Text(
          //                                               state.FilteredInsideBubbleUsers![myINdex].Alias
          //                                                   .toString(),
          //                                               overflow: TextOverflow.ellipsis,
          //                                               style: _TextTheme.headline6!.copyWith(
          //                                                   color: Color(
          //                                                       0xffEAEAEA),
          //                                                   fontWeight:
          //                                                   FontWeight
          //                                                       .w400,
          //                                                   fontSize:
          //                                                   20)),
          //                                         ),
          //                                         Row(
          //                                           children: [
          //
          //                                             Text(
          //                                                 state.FilteredInsideBubbleUsers![myINdex].Serial_number!,
          //                                                 textAlign: TextAlign.left,
          //                                                 style: _TextTheme
          //                                                     .headline6!
          //                                                     .copyWith(
          //                                                     color: Color(
          //                                                         0xffEAEAEA),
          //                                                     fontWeight:
          //                                                     FontWeight
          //                                                         .w300,
          //                                                     fontSize:
          //                                                     13)),
          //                                           ],
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ),
          //                                   Container(
          //                                     height: h/6,
          //                                     child: Column(
          //                                       children: [
          //                                         Container(
          //                                           //  color: Colors.pink,
          //                                           child: IconButton(
          //                                             onPressed: (){
          //                                               Navigator.pop(context,true);
          //                                             },
          //                                             icon: Icon(Icons.clear),
          //                                           ),
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                               Container(
          //                                   padding: EdgeInsets.only(left: h/50,top: h/50),
          //                                   child:
          //                                   Text(   state.FilteredInsideBubbleUsers![myINdex].boi.toString(), textAlign: TextAlign.left, style: TextStyle(
          //                                       color: Color.fromRGBO(255, 255, 255, 1),
          //                                       fontFamily: 'Red Hat Text',
          //                                       fontSize: 12,
          //                                       letterSpacing: 0 ,
          //                                       fontWeight: FontWeight.w300,
          //                                       height: 1.4166666666666667
          //                                   ),)
          //                               ),
          //                               Text(""),
          //                               Row(
          //                                 mainAxisAlignment:
          //                                 is_me?    MainAxisAlignment.center:
          //                                 MainAxisAlignment.spaceAround,
          //                                 children: [
          //                                   is_me
          //                                       ?Text("")
          //                                       :InkWell(
          //                                     onTap: (){
          //                                       //DirectChat
          //                                       WidgetsBinding.instance!
          //                                           .addPostFrameCallback((_) =>     Navigator.push(
          //                                         context,
          //                                         MaterialPageRoute(//receiver_id: ,my_ID: ,
          //                                           builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),   ));
          //                                     },
          //                                     child: Container(
          //                                         width: w/3,
          //                                         height: h/15,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius : BorderRadius.only(
          //                                             topLeft: Radius.circular(4.142857074737549),
          //                                             topRight: Radius.circular(4.142857074737549),
          //                                             bottomLeft: Radius.circular(4.142857074737549),
          //                                             bottomRight: Radius.circular(4.142857074737549),
          //                                           ),
          //                                           boxShadow:[
          //                                             BoxShadow(
          //                                                 color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                                 offset: Offset(0,0),
          //                                                 blurRadius: 6.628571510314941
          //                                             )
          //                                           ],
          //                                           color : Color.fromRGBO(207, 109, 56, 1),
          //                                         ),
          //                                         child: Center(
          //                                             child:
          //                                             SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
          //
          //                                         )
          //                                     ),
          //                                   ),
          //                                   InkWell(
          //                                     onTap: (){
          //                                       if ( !is_frined) {
          //                                         Navigator.pop(context);
          //                                         _GroupChatBloc.add(AddFrined((b) =>
          //                                         b ..serial = state.FilteredInsideBubbleUsers![myINdex].Serial.toString()
          //                                         ));
          //                                       }else{
          //                                         alreatDialogBuilder2(context,h,w,frined_id);
          //                                       }
          //                                     },
          //                                     child: Container(
          //                                       width: w/3,
          //                                       height: h/15,
          //                                       decoration: BoxDecoration(
          //                                         borderRadius : BorderRadius.only(
          //                                           topLeft: Radius.circular(4.142857074737549),
          //                                           topRight: Radius.circular(4.142857074737549),
          //                                           bottomLeft: Radius.circular(4.142857074737549),
          //                                           bottomRight: Radius.circular(4.142857074737549),
          //                                         ),
          //                                         boxShadow : [BoxShadow(
          //                                             color: Color.fromRGBO(0, 0, 0, 0.25),
          //                                             offset: Offset(0,0),
          //                                             blurRadius: 6.628571510314941
          //                                         )],
          //                                         color : is_frined?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
          //                                       ),
          //                                       child: Center(
          //                                           child:
          //                                           //
          //                                           //   SvgPicture.asset(
          //                                           // "Assets/images/Add_friend.svg",
          //                                           // color: Colors.white,
          //                                           // width: h / 26,
          //                                           // )
          //                                           is_me
          //                                               ? Icon(Icons.person)
          //                                               :  is_frined
          //                                               ? SvgPicture.asset(
          //                                             "Assets/images/True_Mark.svg",
          //                                             color: Colors.white,
          //                                             width: h / 26,
          //                                           )
          //                                               :SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
          //
          //
          //                                       ),
          //                                     ),
          //                                   )
          //                                 ],
          //                               ),
          //                               SizedBox(height: 7,),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //
          //                     ]
          //                 ),
          //
          //               ),
          //             )
          //
          //         );
          //       });
          // }


          // List<String> StringBackGroundColor =[];
          // List<int> intBackGroundColor =[];
          // if (state.success! &&
          // diditonce == true) {
          //   for (int i =0;i<state.Getnotifcations!.notifications!.length;i++){
          //     StringBackGroundColor.add(state.Getnotifcations!.notifications![i].background_color.toString())  ;
          //   }
          //
          //   var myInt = int.parse(value);
          //   BackgroundColor = myInt;
          //   Done = true;
          //   diditonce = false;
          // }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            body:

              Column(
                    children: [
                       SizedBox(
                        height: h/9.7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Notifications',
                            textAlign: TextAlign.left,
                            style: _textthem.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp
                            ),
                          ),
                          const Text(""),
                          const Text(""),
                        ],
                      ),

                      const Text(""),
                      (state.success == true)
                          ? state.Getnotifcations!.notifications!.length==0
                              ?       Container(
                        width: w,
                        height: h/1.24,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                     Image.asset("Assets/images/Rectangle 257.png"),
                            Text('I’m so sorry..you don’t have any notifications yet', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize:  16.sp,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w600,
                                height: 1
                            ),),
                            SizedBox(height: h/6,)

                          ],
                        ),
                      )
                               :

                      Container(
                        width: w,
                            height: h/1.24,
                            child:ScrollConfiguration(
                              behavior: MyBehavior(),
                              child:
                              ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const AlwaysScrollableScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    state.Getnotifcations!.notifications!.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 7);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  var BackgroundColor;
                                  try {
                                    String Value = state.Getnotifcations!
                                        .notifications![index].background_color
                                        .toString();
                                    var myInt = int.parse(Value);

                                    BackgroundColor = myInt;
                                  }catch(e){
                                    print(e);
                                  }
                                  DateTime datee = DateTime.parse(state.Getnotifcations!.notifications![index].created_at.toString());
                                  return InkWell(
                                    onTap: () {

                                      if(state.Getnotifcations!.notifications![index].title=="Friend Request")
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) =>     Navigator.push(
                                          context,
                                          MaterialPageRoute(//receiver_id: ,my_ID: ,
                                            builder: (context) => Friendlist(is_WithoutTopBar: true,),),
                                        ));
                                      else if (state .Getnotifcations!.notifications![index] .title=="Accepted Friend")
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) =>     Navigator.push(
                                          context,
                                          MaterialPageRoute(//receiver_id: ,my_ID: ,
                                            builder: (context) => Friendlist(is_WithoutTopBar: true,),),
                                        ));


                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: h / 40, left: h / 40),
                                          decoration: BoxDecoration(
                                            color: COLOR.onError,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: COLOR.primaryVariant,
                                                  offset: Offset(0, 0),
                                                  blurRadius: 5)
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      width: w / 1.3,
                                                      margin: EdgeInsets.only(
                                                          top: h / 50,
                                                          right: h / 50,
                                                          left: h / 20,
                                                          bottom: h / 50),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              state
                                                                  .Getnotifcations!
                                                                  .notifications![index]
                                                                  .title
                                                                  .toString(),
                                                              style: _textthem
                                                                  .headlineLarge!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight.w600,
                                                                      fontSize: 20.sp
                                                              ),
                                                            ),
                                                          ),
                                                          Hero(
                                                            tag : "Image${index}",
                                                            child:
                                                        Material(
                                                        type: MaterialType.transparency,
                                                        child :
                                                          InkWell(
                                                            onTap: (){
                                                              WidgetsBinding.instance
                                                                  .addPostFrameCallback((_) =>     Navigator.push(
                                                                context,
                                                                MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                  builder: (context) => HeroImage(path:  state.Getnotifcations!.notifications![index].avatar.toString(),color: BackgroundColor,id :  index),),
                                                              ));

                                                            },
                                                            child: CachedNetworkImage(
                                                                imageUrl:
                                                              state.Getnotifcations!.notifications![index].avatar.toString(),
                                                                errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                                imageBuilder: (context, imageProvider) => CircleAvatar(
                                                                  radius: 30.w,
                                                                  backgroundImage: imageProvider,
                                                                  backgroundColor:   Color(BackgroundColor??0),
                                                                ),
                                                              ),
                                                            ),
                                  )
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Container(
                                                      width: w / 1.3,
                                                      margin: EdgeInsets.only(
                                                          top: h / 50,
                                                          right: h / 50,
                                                          left: h / 30,
                                                          bottom: h / 50),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                         Container(
                                                              width: w/1.7,
                                                              child: Text(
                                                                state
                                                                    .Getnotifcations!
                                                                    .notifications![
                                                                        index]
                                                                    .body
                                                                    .toString(),
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                style: _textthem
                                                                    .headlineLarge!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w300,
                                                                    fontSize: 15.sp
                                                                ),
                                                                maxLines: 10,
                                                              ),
                                                            ),
                                                          Flexible(
                                                            child: Text(
                                                              timeago.format(datee),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              style: _textthem
                                                                  .headlineLarge!
                                                                  .copyWith(
                                                                  fontWeight:FontWeight .normal,
                                                                    fontSize: 12.sp
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    // CircleAvatar(
                                                    //   backgroundImage:
                                                    //       NetworkImage(state
                                                    //           .Getnotifcations!
                                                    //           .notifications![
                                                    //               index]
                                                    //           .avatar
                                                    //           .toString()),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),)
                          )
                          : state.isLoading == true
                              ? Container(
                                  width: w,
                                  height: h / 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: listLoader(context: context)),
                                    ],
                                  ))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: w,
                                        height: h / 10,
                                        child: const Text("Error"),
                                      ),
                                    ),
                                  ],
                                ),
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
// Container(
//                 width: w/1.1,
//                 height: h/2.5,
//                 child:Image.network(,fit: BoxFit.fill,)
//               ),
