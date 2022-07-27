// import 'package:bubbles/App/app.dart';
// import 'package:bubbles/Injection.dart';
// import 'package:bubbles/UI/Profile/FreindRequests_screen/bloc/FriendRequest_Bloc.dart';
// import 'package:bubbles/UI/Profile/FreindRequests_screen/bloc/FriendRequest_state.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:conditional_questions/conditional_questions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../bloc/FriendRequest_event.dart';
//
// class FreindRequests extends StatefulWidget {
//   const FreindRequests({Key? key}) : super(key: key);
//
//   @override
//   State<FreindRequests> createState() => _FreindRequestsState();
// }
//
// class _FreindRequestsState extends State<FreindRequests> {
//   final _FriendRequest_Bloc = sl<FriendRequestBloc>();
//
//   @override
//   void initState() {
//     super.initState();
//     _FriendRequest_Bloc.add(FreindsRequests());
//   }
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _TextTheme = Theme.of(context).textTheme;
//     ColorScheme ColorS = Theme.of(context).colorScheme;
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return  BlocBuilder(
//
//         bloc: _FriendRequest_Bloc,
//         builder: (BuildContext Context, FreindRequestState state) {
//
//           // alreatDialogBuilder2(
//           //     BuildContext Context,
//           //     double h,
//           //     double w,
//           //     int Frined_id,
//           //     ) async {
//           //   return showDialog(
//           //       context: Context,
//           //       barrierDismissible: false,
//           //       builder: (Context) {
//           //         return AlertDialog(
//           //           backgroundColor: Colors.transparent,
//           //           insetPadding: EdgeInsets.all(h/50),
//           //           content:
//           //           Container(
//           //             width: w/1.1,
//           //             height: h/4.2,
//           //             decoration: BoxDecoration(
//           //               borderRadius : BorderRadius.only(
//           //                 topLeft: Radius.circular(8.285714149475098),
//           //                 topRight: Radius.circular(8.285714149475098),
//           //                 bottomLeft: Radius.circular(8.285714149475098),
//           //                 bottomRight: Radius.circular(8.285714149475098),
//           //               ),
//           //               color : Color.fromRGBO(47, 47, 47, 1),
//           //             ),
//           //             child: Column(
//           //               crossAxisAlignment: CrossAxisAlignment.center,
//           //               mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //               children: [
//           //                 Container(
//           //                   padding: EdgeInsets.only(left: h/50,top: h/50),
//           //                   child: Text('Are you sure you want to remove this user from your friendlist?',
//           //                     textAlign: TextAlign.left, style: TextStyle(
//           //                         color: Color.fromRGBO(234, 234, 234, 1),
//           //                         fontFamily: 'Sofia Pro',
//           //                         fontSize: 20.571428298950195,
//           //                         letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
//           //                         fontWeight: FontWeight.normal,
//           //                         height: 1
//           //                     ),),
//           //                 ),
//           //                 Text(""),
//           //                 Row(
//           //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //                   children: [
//           //
//           //                     InkWell(
//           //                       onTap: (){
//           //                         Navigator.pop(context);
//           //                       },
//           //                       child: Container(
//           //                           width: w/3,
//           //                           height: h/15,
//           //                           decoration: BoxDecoration(
//           //                             borderRadius : BorderRadius.only(
//           //                               topLeft: Radius.circular(4.142857074737549),
//           //                               topRight: Radius.circular(4.142857074737549),
//           //                               bottomLeft: Radius.circular(4.142857074737549),
//           //                               bottomRight: Radius.circular(4.142857074737549),
//           //                             ),
//           //                             boxShadow : [BoxShadow(
//           //                                 color: Color.fromRGBO(0, 0, 0, 0.25),
//           //                                 offset: Offset(0,0),
//           //                                 blurRadius: 6.628571510314941
//           //                             )],
//           //                             color : Color.fromRGBO(207, 109, 56, 1),
//           //                           ),
//           //                           child: Center(
//           //                             child:
//           //                             Text('No', textAlign: TextAlign.center, style: TextStyle(
//           //                                 color: Color.fromRGBO(234, 234, 234, 1),
//           //                                 fontFamily: 'Sofia Pro',
//           //                                 fontSize: 19.571428298950195,
//           //                                 letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
//           //                                 fontWeight: FontWeight.w500,
//           //                                 height: 1
//           //                             ),),
//           //                           )
//           //                       ),
//           //                     ),
//           //
//           //                     InkWell(
//           //                       onTap: (){
//           //                         Navigator.pop(context);
//           //                         _GroupChatBloc.add(RemoveFriend((b) => b
//           //                           ..friend_id = Frined_id
//           //                         ));
//           //                       },
//           //                       child: Container(
//           //                         width: w/3,
//           //                         height: h/15,
//           //                         decoration: BoxDecoration(
//           //                           borderRadius : BorderRadius.only(
//           //                             topLeft: Radius.circular(4.142857074737549),
//           //                             topRight: Radius.circular(4.142857074737549),
//           //                             bottomLeft: Radius.circular(4.142857074737549),
//           //                             bottomRight: Radius.circular(4.142857074737549),
//           //                           ),
//           //                           boxShadow : [BoxShadow(
//           //                               color: Color.fromRGBO(0, 0, 0, 0.25),
//           //                               offset: Offset(0,0),
//           //                               blurRadius: 6.628571510314941
//           //                           )],
//           //                           color : Color.fromRGBO(168, 48, 99, 1),
//           //                         ),
//           //                         child: Center(
//           //                           child:
//           //                           Text('Yes', textAlign: TextAlign.center, style: TextStyle(
//           //                               color: Color.fromRGBO(234, 234, 234, 1),
//           //                               fontFamily: 'Sofia Pro',
//           //                               fontSize: 19.571428298950195,
//           //                               letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
//           //                               fontWeight: FontWeight.w500,
//           //                               height: 1
//           //                           ),),
//           //                         ),
//           //                       ),
//           //                     )
//           //                   ],
//           //                 )
//           //               ],
//           //             ),
//           //           ),
//           //         );
//           //       });
//           // }
//           //
//           //
//           // alreatDialogBuilder(
//           //     BuildContext Context,
//           //     double h,
//           //     double w,
//           //     int myINdex,
//           //     bool is_frined,
//           //     bool is_me,
//           //     int frined_id,
//           //     ) async {
//           //   return showDialog(
//           //       context: Context,
//           //       barrierDismissible: false,
//           //       builder: (Context) {
//           //
//           //
//           //
//           //         var myInt = int.parse(state.FilteredInsideBubbleUsers![myINdex].Background_Color.toString());
//           //         var BackgroundColor= myInt;
//           //
//           //
//           //         return AlertDialog(
//           //             backgroundColor: Colors.transparent,
//           //             insetPadding: EdgeInsets.all(h/50),
//           //             content:GestureDetector(
//           //               onTap: (){
//           //                 Navigator.pop(context,true);
//           //               },
//           //               child: Container(
//           //                 color: Colors.transparent,
//           //                 width: w,
//           //                 height: h,
//           //                 child :
//           //                 Stack(
//           //                     children:[
//           //
//           //                       Center(
//           //                         child: Container(
//           //                           width: w/1.1,
//           //                           height: h/2.3,
//           //                           decoration: BoxDecoration(
//           //                             borderRadius : BorderRadius.only(
//           //                               topLeft: Radius.circular(8.285714149475098),
//           //                               topRight: Radius.circular(8.285714149475098),
//           //                               bottomLeft: Radius.circular(8.285714149475098),
//           //                               bottomRight: Radius.circular(8.285714149475098),
//           //                             ),
//           //                             color : Color.fromRGBO(47, 47, 47, 1),
//           //                           ),
//           //                           child: Column(
//           //                             crossAxisAlignment: CrossAxisAlignment.center,
//           //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //                             children: [
//           //                               Row(
//           //                                 mainAxisAlignment:
//           //                                 MainAxisAlignment.spaceAround,
//           //                                 children:  [
//           //
//           //
//           //                                   Container(
//           //                                     margin: EdgeInsets.only(left: h/60),
//           //                                     child: CircleAvatar(
//           //
//           //                                       backgroundImage: NetworkImage(state.FilteredInsideBubbleUsers![myINdex].Avatar.toString()),
//           //                                       radius:40,
//           //                                       backgroundColor:Color(BackgroundColor),
//           //                                     ),
//           //                                   ),
//           //                                   Container(
//           //                                     margin: EdgeInsets.only(left: h/60),
//           //                                     child: Column(
//           //                                       children: [
//           //                                         Container(
//           //                                           child: Text(
//           //                                               state.FilteredInsideBubbleUsers![myINdex].Alias
//           //                                                   .toString(),
//           //                                               overflow: TextOverflow.ellipsis,
//           //                                               style: _TextTheme.headline6!.copyWith(
//           //                                                   color: Color(
//           //                                                       0xffEAEAEA),
//           //                                                   fontWeight:
//           //                                                   FontWeight
//           //                                                       .w400,
//           //                                                   fontSize:
//           //                                                   20)),
//           //                                         ),
//           //                                         Row(
//           //                                           children: [
//           //
//           //                                             Text(
//           //                                                 state.FilteredInsideBubbleUsers![myINdex].Serial_number!,
//           //                                                 textAlign: TextAlign.left,
//           //                                                 style: _TextTheme
//           //                                                     .headline6!
//           //                                                     .copyWith(
//           //                                                     color: Color(
//           //                                                         0xffEAEAEA),
//           //                                                     fontWeight:
//           //                                                     FontWeight
//           //                                                         .w300,
//           //                                                     fontSize:
//           //                                                     13)),
//           //                                           ],
//           //                                         ),
//           //                                       ],
//           //                                     ),
//           //                                   ),
//           //                                   Container(
//           //                                     height: h/6,
//           //                                     child: Column(
//           //                                       children: [
//           //                                         Container(
//           //                                           //  color: Colors.pink,
//           //                                           child: IconButton(
//           //                                             onPressed: (){
//           //                                               Navigator.pop(context,true);
//           //                                             },
//           //                                             icon: Icon(Icons.clear),
//           //                                           ),
//           //                                         ),
//           //                                       ],
//           //                                     ),
//           //                                   )
//           //                                 ],
//           //                               ),
//           //                               Container(
//           //                                   padding: EdgeInsets.only(left: h/50,top: h/50),
//           //                                   child:
//           //                                   Text(   state.FilteredInsideBubbleUsers![myINdex].boi.toString(), textAlign: TextAlign.left, style: TextStyle(
//           //                                       color: Color.fromRGBO(255, 255, 255, 1),
//           //                                       fontFamily: 'Red Hat Text',
//           //                                       fontSize: 12,
//           //                                       letterSpacing: 0 ,
//           //                                       fontWeight: FontWeight.w300,
//           //                                       height: 1.4166666666666667
//           //                                   ),)
//           //                               ),
//           //                               Text(""),
//           //                               Row(
//           //                                 mainAxisAlignment:
//           //                                 is_me?    MainAxisAlignment.center:
//           //                                 MainAxisAlignment.spaceAround,
//           //                                 children: [
//           //                                   is_me
//           //                                       ?Text("")
//           //                                       :InkWell(
//           //                                     onTap: (){
//           //                                       //DirectChat
//           //                                       WidgetsBinding.instance!
//           //                                           .addPostFrameCallback((_) =>     Navigator.push(
//           //                                         context,
//           //                                         MaterialPageRoute(//receiver_id: ,my_ID: ,
//           //                                           builder: (context) => Sprints(my_ID: widget.MY_ID!, IS_sprints: false, receiver_id: state.FilteredInsideBubbleUsers![index].id!,His_Alias: state.FilteredInsideBubbleUsers![index].Alias!,),),   ));
//           //                                     },
//           //                                     child: Container(
//           //                                         width: w/3,
//           //                                         height: h/15,
//           //                                         decoration: BoxDecoration(
//           //                                           borderRadius : BorderRadius.only(
//           //                                             topLeft: Radius.circular(4.142857074737549),
//           //                                             topRight: Radius.circular(4.142857074737549),
//           //                                             bottomLeft: Radius.circular(4.142857074737549),
//           //                                             bottomRight: Radius.circular(4.142857074737549),
//           //                                           ),
//           //                                           boxShadow:[
//           //                                             BoxShadow(
//           //                                                 color: Color.fromRGBO(0, 0, 0, 0.25),
//           //                                                 offset: Offset(0,0),
//           //                                                 blurRadius: 6.628571510314941
//           //                                             )
//           //                                           ],
//           //                                           color : Color.fromRGBO(207, 109, 56, 1),
//           //                                         ),
//           //                                         child: Center(
//           //                                             child:
//           //                                             SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
//           //
//           //                                         )
//           //                                     ),
//           //                                   ),
//           //                                   InkWell(
//           //                                     onTap: (){
//           //                                       if ( !is_frined) {
//           //                                         Navigator.pop(context);
//           //                                         _GroupChatBloc.add(AddFrined((b) =>
//           //                                         b ..serial = state.FilteredInsideBubbleUsers![myINdex].Serial.toString()
//           //                                         ));
//           //                                       }else{
//           //                                         alreatDialogBuilder2(context,h,w,frined_id);
//           //                                       }
//           //                                     },
//           //                                     child: Container(
//           //                                       width: w/3,
//           //                                       height: h/15,
//           //                                       decoration: BoxDecoration(
//           //                                         borderRadius : BorderRadius.only(
//           //                                           topLeft: Radius.circular(4.142857074737549),
//           //                                           topRight: Radius.circular(4.142857074737549),
//           //                                           bottomLeft: Radius.circular(4.142857074737549),
//           //                                           bottomRight: Radius.circular(4.142857074737549),
//           //                                         ),
//           //                                         boxShadow : [BoxShadow(
//           //                                             color: Color.fromRGBO(0, 0, 0, 0.25),
//           //                                             offset: Offset(0,0),
//           //                                             blurRadius: 6.628571510314941
//           //                                         )],
//           //                                         color : is_frined?Color(0xff939393):Color.fromRGBO(168, 48, 99, 1),
//           //                                       ),
//           //                                       child: Center(
//           //                                           child:
//           //                                           //
//           //                                           //   SvgPicture.asset(
//           //                                           // "Assets/images/Add_friend.svg",
//           //                                           // color: Colors.white,
//           //                                           // width: h / 26,
//           //                                           // )
//           //                                           is_me
//           //                                               ? Icon(Icons.person)
//           //                                               :  is_frined
//           //                                               ? SvgPicture.asset(
//           //                                             "Assets/images/True_Mark.svg",
//           //                                             color: Colors.white,
//           //                                             width: h / 26,
//           //                                           )
//           //                                               :SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
//           //
//           //
//           //                                       ),
//           //                                     ),
//           //                                   )
//           //                                 ],
//           //                               ),
//           //                               SizedBox(height: 7,),
//           //                             ],
//           //                           ),
//           //                         ),
//           //                       ),
//           //
//           //                     ]
//           //                 ),
//           //
//           //               ),
//           //             )
//           //
//           //         );
//           //       });
//           // }
//           //
//
//
//           return  WillPopScope(
//             onWillPop: () async =>true,
//             child:
//
//             SafeArea(
//               child: Scaffold(
//                 body : SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: h/100),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                                 margin: EdgeInsets.only(
//                                     right: h / 20),
//                                 child: IconButton(
//                                   icon: SvgPicture.asset(
//                                       "Assets/images/Frame 11.svg",
//                                       width: 30,
//                                       color: ColorS.surface),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 )),
//                             Text('Friend Requests', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 23
//                             ),),
//                             Text(""),
//                             Text(""),
//
//                           ],
//                         ),
//                       ),
//                       const Text(""),
//                       const Text(""),
//                      state.success!
//                           ? Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: h/20,),
//                             child: ScrollConfiguration(
//                               behavior: MyBehavior(),
//                               child: ListView.separated(
//                                 shrinkWrap: true,
//                                 padding: EdgeInsets.zero,
//                                 physics: const NeverScrollableScrollPhysics(
//                                     parent: BouncingScrollPhysics()),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: state.FreindRequests!.users!.length,
//                                 separatorBuilder: (BuildContext context, int index) {
//                                   return const SizedBox(
//                                     height: 5,
//                                   );
//                                 },
//                                 itemBuilder: (BuildContext context, int index) {
//
//                                   var BackgroundColor;
//                                   try {
//                                     String Value = state.FreindRequests!.users![index].background_color.toString();
//                                     var myInt = int.parse(Value);
//                                     BackgroundColor = myInt;
//                                   }catch(e){
//                                     print(e);
//                                   }
//
//
//                                   return   Column(
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(left: h/30),
//
//                                           width: w / 1.01,
//                                           height: h / 10,
//                                           decoration: BoxDecoration(
//                                             color: ColorS.secondaryContainer,
//                                             borderRadius: const BorderRadius.only(
//                                               bottomLeft: Radius.circular(40),
//                                               bottomRight: Radius.circular(5),
//                                               topLeft: Radius.circular(40),
//                                               topRight: Radius.circular(5),
//                                             ),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: ColorS.primaryVariant ,
//                                                   offset: const Offset(0, 0),
//                                                   blurRadius: 5)
//                                             ],
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 margin: EdgeInsets.only(left: h/70),
//                                                   width: w/6,
//                                                   height: h/11.7,
//
//
//                                                   child:    CachedNetworkImage(
//                                                     imageUrl:
//                                                     state.FreindRequests!.users![index].avatar!!=null
//                                                         ?   state.FreindRequests!.users![index].avatar.toString():  "Assets/images/DefaultAvatar.png",
//
//                                                     errorWidget: (context, url, error) => Center(child: Text("Error")),
//                                                     imageBuilder: (context, imageProvider) => CircleAvatar(
//                                                       radius: 30,
//                                                       backgroundImage: imageProvider,
//                                                       backgroundColor:   Color(BackgroundColor),
//                                                     ),
//                                                   ),
//                                               ),
//
//
//                                               Flexible(
//                                                 child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//
//                                                         Flexible(
//                                                           child: Container(
//                                                             margin: EdgeInsets.only(left: h/70),
//                                                             child: Text(
//
//                                                               state.FreindRequests!.users![index].alias.toString(),
//                                                               textAlign: TextAlign.left,
//                                                               overflow: TextOverflow.ellipsis,
//                                                               style: TextStyle(
//                                                                   color:
//                                                                   ColorS.onSurface,
//                                                                   fontFamily: 'Futura',
//                                                                   fontSize:24,
//                                                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                                                   fontWeight: FontWeight.w400,
//                                                                   height: 1
//                                                               ),
//
//                                                             ),
//                                                           ),
//                                                         ),
//
//                                                         Expanded(
//                                                           child: Row(
//                                                             children: [
//                                                               InkWell(
//                                                                 onTap: (){
//                                                                   _FriendRequest_Bloc.add(DenyRequest((b) => b
//                                                                   ..friend_id = state.FreindRequests!.users![index].id
//                                                                   ));
//                                                                   _FriendRequest_Bloc.add(FreindsRequests());
//                                                                 },
//                                                                 child: const Text(
//                                                                   "Deniy",
//                                                                   textAlign: TextAlign.left,
//                                                                   style: TextStyle(
//                                                                       color:
//                                                                       Colors.red,
//
//                                                                       fontFamily: 'Futura',
//                                                                       fontSize:18,
//                                                                       letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                                                       fontWeight: FontWeight.w400,
//                                                                       height: 1
//                                                                   ),
//
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(width: 10,),
//                                                               InkWell(
//                                                                 onTap: (){
//                                                                   _FriendRequest_Bloc.add(AceeptRequest((b) => b
//                                                                     ..friend_id = state.FreindRequests!.users![index].id));
//                                                                   _FriendRequest_Bloc.add(FreindsRequests());
//                                                                 },
//                                                                 child: const Text(
//                                                                   "Accept",
//                                                                   textAlign: TextAlign.left,
//                                                                   style: TextStyle(
//                                                                       color:
//                                                                       Colors.green,
//                                                                       fontFamily: 'Futura',
//                                                                       fontSize:18,
//                                                                       letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//                                                                       fontWeight: FontWeight.w400,
//                                                                       height: 1
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                               ),
//
//
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     );
//
//
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                          : state.isLoading == true
//                           ?Container(
//                           width: w / 1.1,
//                           height: h/1.3,
//                           child: Center(child: listLoader(context: context)))
//                           : const SizedBox(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//
//
//
//   }
//   Widget listLoader({context}) {
//     return const SpinKitThreeBounce(
//       color: Colors.blue,
//       size: 30.0,
//     );
//   }
// }
