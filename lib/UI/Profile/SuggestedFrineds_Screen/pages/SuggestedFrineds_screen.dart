// import 'package:bubbles/App/app.dart';
// import 'package:bubbles/Injection.dart';
// import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintChat.dart';
// import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/pages/ChatUi_screen.dart';
// import 'package:bubbles/UI/Profile/FindFriends_Screen/pages/FindFriends_Screen.dart';
// import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
// import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/bloc/SuggestedFrineds_Bloc.dart';
// import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/bloc/SuggestedFrineds_event.dart';
// import 'package:bubbles/UI/Profile/SuggestedFrineds_Screen/bloc/SuggestedFrineds_state.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:showcaseview/showcaseview.dart';
//
//
// class SuggestedFreinds_Screen extends StatefulWidget {
//   const SuggestedFreinds_Screen({Key? key}) : super(key: key);
//
//   @override
//   State<SuggestedFreinds_Screen> createState() => _SuggestedFreinds_ScreenState();
// }
//
// class _SuggestedFreinds_ScreenState extends State<SuggestedFreinds_Screen> {
//   bool Diditonce = false;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final TextEditingController _SearchController = TextEditingController();
//   final _formkey1 = GlobalKey<FormState>(); //
//   final SuggestedFrineds_Bloc = sl<SuggestedFrinedsBloc>();
//   late FocusNode FocuseNODE;
//   List<int> Selected = [0, 0];
//
//   @override
//   void initState() {
//     super.initState();
//     FocuseNODE = FocusNode();
//     SuggestedFrineds_Bloc.add(
//         GetSuggestedFriends());
//   }
//   bool done = false;
//
//   void onPressed(BuildContext context) {}
//
//   @override
//   void dispose() {
//     super.dispose();
//     _SearchController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _textthem = Theme.of(context).textTheme;
//     ColorScheme COLOR = Theme.of(context).colorScheme;
//
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return BlocBuilder(
//         bloc: SuggestedFrineds_Bloc,
//         builder: (BuildContext Context, SuggestedFreindsState state) {
//
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
//           // alreatDialogBuilder3(
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
//
//           alreatDialogBuilder(
//               BuildContext Context,
//               double h,
//               double w,
//               int myINdex
//               ) async {
//             return showDialog(
//                 context: Context,
//                 barrierDismissible: false,
//                 builder: (Context) {
//
//
//
//                   var myInt = int.parse(state.ListOFSUggested![myINdex].Color.toString());
//                   var BackgroundColor= myInt;
//
//
//                   return AlertDialog(
//                     backgroundColor: Colors.transparent,
//                     insetPadding: EdgeInsets.all(h/50),
//                     content:GestureDetector(
//                       onTap: (){
//                         Navigator.pop(context,true);
//                       },
//                       child: Container(
//                         color: Colors.transparent,
//                         width: w,
//                         height: h,
//                         child :
//                             Stack(
//                               children:[
//
//                                 Center(
//                                 child: Container(
//                                   width: w/1.1,
//                                   height: h/2.3,
//                                   decoration: BoxDecoration(
//                                     borderRadius : BorderRadius.only(
//                                       topLeft: Radius.circular(8.285714149475098),
//                                       topRight: Radius.circular(8.285714149475098),
//                                       bottomLeft: Radius.circular(8.285714149475098),
//                                       bottomRight: Radius.circular(8.285714149475098),
//                                     ),
//                                     color : Color.fromRGBO(47, 47, 47, 1),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children:  [
//
//
//                                           Container(
//                                             margin: EdgeInsets.only(left: h/60),
//                                             child: CircleAvatar(
//
//                                               backgroundImage: NetworkImage(state.ListOFSUggested![myINdex].AvatarPath.toString()),
//                                               radius:
//                                               40,
//                                               backgroundColor:Color(BackgroundColor),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: EdgeInsets.only(left: h/60),
//                                             child: Column(
//                                               children: [
//                                               Container(
//                                                     child: Text(
//                                                         state.ListOFSUggested![myINdex].Alias
//                                                             .toString(),
//                                                         overflow: TextOverflow.ellipsis,
//                                                         style: _textthem.headline6!.copyWith(
//                                                             color: Color(
//                                                                 0xffEAEAEA),
//                                                             fontWeight:
//                                                             FontWeight
//                                                                 .w400,
//                                                             fontSize:
//                                                             20)),
//                                                   ),
//
//                                                 Row(
//                                                   children: [
//
//                                                     Text(
//                                                         state.ListOFSUggested![myINdex].Serial_Number!,
//                                                         textAlign: TextAlign.left,
//                                                         style: _textthem
//                                                             .headline6!
//                                                             .copyWith(
//                                                             color: Color(
//                                                                 0xffEAEAEA),
//                                                             fontWeight:
//                                                             FontWeight
//                                                                 .w300,
//                                                             fontSize:
//                                                             13)),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             height: h/6,
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                 //  color: Colors.pink,
//                                                   child: IconButton(
//                                                     onPressed: (){
//                                                       Navigator.pop(context,true);
//                                                     },
//                                                     icon: Icon(Icons.clear),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       Container(
//                                           padding: EdgeInsets.only(left: h/50,top: h/50),
//                                           child:
//                                           Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sapien aliquet in nam interdum. Mauris egestas purus in aenean eu ac nibh eget. Diam et in quis cras sagittis id aliquet purus. Justo, nisl rhoncus arcu ullamcorper.', textAlign: TextAlign.left, style: TextStyle(
//                                               color: Color.fromRGBO(255, 255, 255, 1),
//                                               fontFamily: 'Red Hat Text',
//                                               fontSize: 12,
//                                               letterSpacing: 0 ,
//                                               fontWeight: FontWeight.w300,
//                                               height: 1.4166666666666667
//                                           ),)
//                                       ),
//                                       Text(""),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           InkWell(
//                                             onTap: (){
//
//                                               WidgetsBinding.instance
//                                                   .addPostFrameCallback((_) => Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         Sprints(my_ID: state.ListOFSUggested![myINdex].MY_id!, IS_sprints: false, receiver_id:state.ListOFSUggested![myINdex].His_id!,His_Alias: state.ListOFSUggested![myINdex].Alias,)
//                                                 ),
//                                               ));
//                                             },
//
//                                             child: Container(
//                                                 width: w/3,
//                                                 height: h/15,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius : BorderRadius.only(
//                                                     topLeft: Radius.circular(4.142857074737549),
//                                                     topRight: Radius.circular(4.142857074737549),
//                                                     bottomLeft: Radius.circular(4.142857074737549),
//                                                     bottomRight: Radius.circular(4.142857074737549),
//                                                   ),
//                                                   boxShadow:[
//                                                     BoxShadow(
//                                                         color: Color.fromRGBO(0, 0, 0, 0.25),
//                                                         offset: Offset(0,0),
//                                                         blurRadius: 6.628571510314941
//                                                     )
//                                                   ],
//                                                   color : Color.fromRGBO(207, 109, 56, 1),
//                                                 ),
//                                                 child: Center(
//                                                     child:
//                                                     SvgPicture.asset("Assets/images/Vector2.svg",width: w/12,)
//
//                                                 )
//                                             ),
//                                           ),
//                                           InkWell(
//                                             onTap: (){
//                                               SuggestedFrineds_Bloc.add(DeleteFromList((b) =>
//                                               b..index = myINdex
//                                               ));
//                                               Navigator.pop(context);
//                                             SuggestedFrineds_Bloc.add(AddFrined((b) => b
//                                             ..serial = state.SuggestFriends!.users![myINdex].serial.toString()
//                                             ));
//                                             Diditonce = true;
//                                             },
//                                             child: Container(
//                                               width: w/3,
//                                               height: h/15,
//                                               decoration: BoxDecoration(
//                                                 borderRadius : BorderRadius.only(
//                                                   topLeft: Radius.circular(4.142857074737549),
//                                                   topRight: Radius.circular(4.142857074737549),
//                                                   bottomLeft: Radius.circular(4.142857074737549),
//                                                   bottomRight: Radius.circular(4.142857074737549),
//                                                 ),
//                                                 boxShadow : [BoxShadow(
//                                                     color: Color.fromRGBO(0, 0, 0, 0.25),
//                                                     offset: Offset(0,0),
//                                                     blurRadius: 6.628571510314941
//                                                 )],
//                                                 color : Color.fromRGBO(168, 48, 99, 1),
//                                               ),
//                                               child: Center(
//                                                   child:SvgPicture.asset("Assets/images/Add_friend.svg",color: Colors.white,width:  w/12,)
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       SizedBox(height: 7,),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                                 ]
//                             ),
//
//                       ),
//                     )
//
//                   );
//                 });
//           }
//
//           return Scaffold(
//               key: _scaffoldKey,
//               body: SafeArea(
//                 child: ScrollConfiguration(
//                   behavior: MyBehavior(),
//                   child: SingleChildScrollView(
//                     child: Stack(children: [
//
//
//                      Column(
//                     children: [
//
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
//                                       color: COLOR.surface),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 )),
//                             Text('Suggested Friends', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 23
//                             ),),
//                             Text(""),
//                             Text(""),
//
//                           ],
//                         ),
//                       ),
//                     const Text(""),
//
//                     state.success!
//                         ? Column(
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(right: h/20,),
//                             width: w,
//                             height: h / 1.1,
//                             child: ScrollConfiguration(
//                               behavior: MyBehavior(),
//                               child: ListView.separated(
//                                 shrinkWrap: true,
//                                 physics: BouncingScrollPhysics(
//                                     parent:
//                                     AlwaysScrollableScrollPhysics()),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: state.ListOFSUggested!.length,
//                                 itemBuilder: (BuildContext context,
//                                     int index) {
//                                   var BackgroundColor;
//                                   try{
//                                     String Value =     state.ListOFSUggested![index].Color.toString();
//                                     var myInt = int.parse(Value);
//                                      BackgroundColor= myInt;
//                                   }catch(e){
//                                     print(e);
//                                   }
//                                   return
//                                     Column(
//                                       children: [
//                                         Container(
//                                             child: Center(
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   alreatDialogBuilder(context,h,w,index);
//                                                 },
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       margin: EdgeInsets.only(left: h/30),
//
//                                                       width: w / 1.01,
//                                                       height: h / 10,
//                                                       decoration: BoxDecoration(
//                                                         color: COLOR.secondaryContainer,
//                                                         borderRadius: BorderRadius.only(
//                                                           bottomLeft: Radius.circular(40),
//                                                           bottomRight: Radius.circular(5),
//                                                           topLeft: Radius.circular(40),
//                                                           topRight: Radius.circular(5),
//                                                         ),
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                               color: COLOR.primaryVariant ,
//                                                               offset: Offset(0, 0),
//                                                               blurRadius: 5)
//                                                         ],
//                                                       ),
//                                                       child: Row(
//                                                         children: [
//                                                           Hero(
//                                                             tag: "Image${state.SuggestFriends!.users![index].id}",
//                                                             child:        Material(
//                                                               type: MaterialType.transparency,
//                                                               child :
//                                                               InkWell(
//                                                                 onTap: (){
//                                                                   Navigator.push(
//                                                                     context,
//                                                                     MaterialPageRoute(//receiver_id: ,my_ID: ,
//                                                                       builder: (context) => HeroImage(path:   state.SuggestFriends!.users![index].avatar.toString(),color:  BackgroundColor,id:state.SuggestFriends!.users![index].id,),),
//                                                                   );
//                                                                 },
//                                                                 child: Container(
//                                                             margin: EdgeInsets.only(left: h/80),
//                                                             width: w/6,
//                                                             height: h/11.7,
//                                                             child:CachedNetworkImage(
//                                                                 imageUrl:
//                                                                 state.SuggestFriends!.users![index].avatar.toString()!=null
//                                                                     ?state.ListOFSUggested![index].AvatarPath.toString():"Assets/images/DefaultAvatar.png",
//
//                                                                 errorWidget: (context, url, error) => Center(child: Text("Error")),
//                                                                 imageBuilder: (context, imageProvider) => CircleAvatar(
//                                                                   radius: 30,
//                                                                   backgroundImage: imageProvider,
//                                                                   backgroundColor:   Color(BackgroundColor),
//                                                                 ),
//                                                             ),
//                                                           ),
//                                                               ),
//                                   )
//                                                           ),
//
//
//                                                           Container(
//                                                             margin: EdgeInsets.only(left: h/50),
//                                                             child: Text(
//                                                                 state.ListOFSUggested![index].Alias.toString(),
//                                                                 textAlign: TextAlign.left,
//                                                                 style: _textthem.headline1!.copyWith(
//                                                                     fontWeight: FontWeight.w400
//                                                                     ,fontSize: 24
//                                                                     ,height: 1
//                                                                 )
//
//                                                             ),
//                                                           ),
//
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//
//                                                 //
//                                                 // Column(
//                                                 //   children: [
//                                                 //     Container(
//                                                 //       margin: EdgeInsets.only(left: h/30),
//                                                 //       width: w / 1.01,
//                                                 //       height: h / 10,
//                                                 //       decoration:
//                                                 //       BoxDecoration(
//                                                 //         color: COLOR
//                                                 //             .background,
//                                                 //         borderRadius:
//                                                 //         const BorderRadius
//                                                 //             .only(
//                                                 //           bottomLeft: Radius
//                                                 //               .circular(
//                                                 //               40),
//                                                 //           bottomRight: Radius
//                                                 //               .circular(
//                                                 //               5),
//                                                 //           topLeft:
//                                                 //           const Radius
//                                                 //               .circular(40),
//                                                 //           topRight: Radius
//                                                 //               .circular(
//                                                 //               5),
//                                                 //         ),
//                                                 //         boxShadow: const [
//                                                 //           BoxShadow(
//                                                 //             color: Color
//                                                 //                 .fromRGBO(
//                                                 //                 0,
//                                                 //                 0,
//                                                 //                 0,
//                                                 //                 0.25),
//                                                 //             offset:
//                                                 //             Offset(
//                                                 //                 0,
//                                                 //                 0),
//                                                 //             blurRadius:
//                                                 //             8.0,
//                                                 //           )
//                                                 //         ],
//                                                 //       ),
//                                                 //       child: Row(
//                                                 //         children: [
//                                                 //           Column(
//                                                 //             mainAxisAlignment:
//                                                 //             MainAxisAlignment
//                                                 //                 .center,
//                                                 //             children: [
//                                                 //               Row(
//                                                 //                 mainAxisAlignment:
//                                                 //                 MainAxisAlignment.center,
//                                                 //                 children:  [
//                                                 //                   Text(
//                                                 //                       "  "),
//                                                 //                   CircleAvatar(
//                                                 //                     backgroundImage: NetworkImage(
//                                                 //                         state.SuggestFriends!.users![index].avatar.toString()),
//                                                 //                     radius:
//                                                 //                     28,
//                                                 //                   ),
//                                                 //                 ],
//                                                 //               ),
//                                                 //             ],
//                                                 //           ),
//                                                 //           Expanded(
//                                                 //             child:
//                                                 //             Column(
//                                                 //               mainAxisAlignment:
//                                                 //               MainAxisAlignment
//                                                 //                   .center,
//                                                 //               children: [
//                                                 //                 Text(
//                                                 //                     state.SuggestFriends!.users![index].alias.toString(),
//                                                 //                     textAlign:
//                                                 //                     TextAlign.left,
//                                                 //                     style: _textthem.headline1!.copyWith(fontWeight: FontWeight.w400, fontSize: 22)),
//                                                 //                 Row(
//                                                 //                   mainAxisAlignment:
//                                                 //                   MainAxisAlignment.spaceBetween,
//                                                 //                   children: [
//                                                 //                     Text('Lorem Ipsum dolr en ontori an',
//                                                 //                         textAlign: TextAlign.left,
//                                                 //                         style: _textthem.headline4!.copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: const Color(0xff939393))),
//                                                 //                     Container(
//                                                 //                       width: w / 6.6,
//                                                 //                       height: h / 30,
//                                                 //                       child: Center(
//                                                 //                         child: Text('9:32pm',
//                                                 //                             textAlign: TextAlign.right,
//                                                 //                             overflow: TextOverflow.ellipsis,
//                                                 //                             style: _textthem.headline4!.copyWith(
//                                                 //                               fontSize: 15,
//                                                 //                               color: const Color(0xff939393),
//                                                 //
//                                                 //                               // ,fontWeight: FontWeight.bold
//                                                 //                             )),
//                                                 //                       ),
//                                                 //                     )
//                                                 //                   ],
//                                                 //                 ),
//                                                 //               ],
//                                                 //             ),
//                                                 //           ),
//                                                 //         ],
//                                                 //       ),
//                                                 //     ),
//                                                 //   ],
//                                                 // ),
//                                               ),
//                                             )
//                                         ),
//                                       ],
//                                     );
//
//                                 }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: h/50,); },
//                               ),
//                             )),
//                       ],
//                     )
//                         : state.isLoading == true
//                         ? Container(
//                         width: w,
//                         height: h/1.5,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(child: listLoader(context: context)),
//                           ],
//                         ))
//                         : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Container(
//                             width: w,
//                             height: h/10,
//                             child: const Text(""),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ],
//                   ),
//
//                       state.FreindAddlOADING == true
//                           ? Container(
//                           width: w/1.1,
//                           height: h/1.1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Center(child: listLoader(context: context)),
//                             ],
//                           ))
//                           : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Container(
//                               child: const Text(""),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                     ]),
//                   ),
//                 ),
//               ));
//         });
//   }
//   Widget listLoader({context}) {
//     return SpinKitThreeBounce(
//       color: Colors.blue,
//       size: 30.0,
//     );
//   }
//
// }
// class Data{
//   String? Alias;
//   String? Color;
//   String? AvatarPath;
//   String? Serial_Number;
//   int? MY_id;
//   int? His_id;
// }
//
//
//
// class HeroImage extends StatefulWidget {
//   HeroImage({Key? key, this.path,this.color,this.id}) : super(key: key);
//   int? color;
//   String? path;
//   int? id;
//
//
//   @override
//   State<HeroImage> createState() => _HeroImageState();
// }
//
//
//
// class _HeroImageState extends State<HeroImage> {
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _TextTheme = Theme.of(context).textTheme;
//     ColorScheme ColorS = Theme.of(context).colorScheme;
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body:  InkWell(
//         onTap: (){
//           Navigator.pop(context);
//         },
//         child: Container(
//           width: w,
//           height: h,
//           color: Colors.transparent,
//           child: Hero(
//             tag: "Image${widget.id}",
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Center(
//                     child: CachedNetworkImage(
//                       imageUrl:
//                       widget.path!,
//                       errorWidget: (context, url, error) => Center(child: Text("Error")),
//                       imageBuilder: (context, imageProvider) => CircleAvatar(
//                         radius: w/2,
//                         backgroundImage: imageProvider,
//                         backgroundColor:   Color(widget.color!),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }