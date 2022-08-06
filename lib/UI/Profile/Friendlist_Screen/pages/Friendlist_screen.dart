import 'dart:async';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/App/bloc/appbloc.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Sprints/Pages/SprintChat.dart';
import 'package:bubbles/UI/DirectMessages/ChatDirect_Screen/pages/ChatUi_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/FindFriends_Screen/pages/FindFriends_Screen.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/bloc/FriendList_bloc.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/bloc/FriendList_event.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/bloc/FriendList_state.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_bloc.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/core/theme/theme_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../Profile_Screen/pages/Porfile_Screen.dart';

class Friendlist extends StatefulWidget {
   Friendlist({Key? key,required this.is_WithoutTopBar}) : super(key: key);
bool is_WithoutTopBar;
  @override
  State<Friendlist> createState() => _FriendlistState();
}
Timer? timer12;
class _FriendlistState extends State<Friendlist> {
  final _FriendlistBloc = sl<FriendListBloc>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  late FocusNode FocuseNODE;
  List<int> FrinedsID=[];
  List<int> FrinedsStatus=[];
  final ScrollController controllerTwo = ScrollController();

  int Freindid = 0;
  int index = 0;
  bool Checknow = false;
  bool Diditonce = true;
  int COUNTERDiditonce = 0;
  int Index =0;
  void ListenForONlineFriends() {
    try {
      if (socket!.disconnected != null && !socket!.disconnected) {
        socket!.on("friend_online", (value) {
          print(value);
          if (value["status"] != "offline") {
            FrinedsStatus[value["index"]] = 1;
          }
          _FriendlistBloc.add(RefreshState());
        });
      }
    }catch(e){
      print(e);
    }
  }



  void LoopONfrinedsId()async{
    if(socket!=  null &&!socket!.disconnected) {
     for (int i = 0; i < FrinedsID.length; i++) {
       index = i;
        socket!.emit('report_friends_online', {
          'friend_id': FrinedsID[i].toString(),
          'index': i,
        },);
     }
    }
  }




  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    _FriendlistBloc.add(GetFreinds());
    _FriendlistBloc.add(FreindsRequests());
    ListenForONlineFriends();
    timer12 = Timer.periodic(Duration(seconds: 10), (Timer t)async => LoopONfrinedsId());
  }

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    FrinedsID.clear();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _FriendlistBloc,
        builder: (BuildContext Context, FriendListState state) {


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
          //



          Future<void> OnRefresh()async{
            COUNTERDiditonce++;
            Checknow = false;
            _FriendlistBloc.add(IsRefresh());
            _FriendlistBloc.add(GetFreinds());
            Diditonce = true;
            FrinedsID.clear();
            return state.isLoading!
                ?  Future.delayed(const Duration(milliseconds: 20000000), () {   })


             : Future.delayed(const Duration(milliseconds: 2000), () {
              _FriendlistBloc.add(IsRefresh());
               Checknow = true;
              print("get friends");
            });
          }


          if (state.success! && Diditonce ){
           for(int i=0;i<state.GetFriends!.friends!.length;i++){
             FrinedsID.add(state.GetFriends!.friends![i].id!);
           }
               FrinedsStatus = List.filled(
               10000,
               0);
           LoopONfrinedsId();
           print(FrinedsID);


            Checknow = true;
            Diditonce = false;
          }


          alreatDialogBuilder(
              BuildContext Context,
              String Title,
              String body,
              String BottonTxt,
              double h,
              double w,
              int index
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
                          topLeft: Radius.circular(8.285714149475098),
                          topRight: Radius.circular(8.285714149475098),
                          bottomLeft: Radius.circular(8.285714149475098),
                          bottomRight: Radius.circular(8.285714149475098),
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
                                  fontSize: 20.571428298950195,
                                  letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
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
                                        topLeft: Radius.circular(4.142857074737549),
                                        topRight: Radius.circular(4.142857074737549),
                                        bottomLeft: Radius.circular(4.142857074737549),
                                        bottomRight: Radius.circular(4.142857074737549),
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
                                          fontSize: 19.571428298950195,
                                          letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          height: 1
                                      ),),
                                    )
                                ),
                              ),

                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  _FriendlistBloc.add(RemoveFriend((b) => b
                                    ..friend_id = Freindid
                                      ..index = index
                                  ));
                                  FrinedsID.removeAt(Index);
                                },
                                child: Container(
                                  width: w/3,
                                  height: h/15,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(4.142857074737549),
                                      topRight: Radius.circular(4.142857074737549),
                                      bottomLeft: Radius.circular(4.142857074737549),
                                      bottomRight: Radius.circular(4.142857074737549),
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
                                        fontSize: 19.571428298950195,
                                        letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
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


          return WillPopScope(
            onWillPop: () async =>true,
            child:
            Scaffold(
              resizeToAvoidBottomInset: false,
              body :  Column(
                  children: [
                    SizedBox(
                      height:widget.is_WithoutTopBar?h/21: h/14,
                    ),
                    !widget.is_WithoutTopBar?
                    Text(""):Container(),
// Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                 widget.is_WithoutTopBar?
//                 Container(
//                 child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                 Container(
//                 margin: EdgeInsets.only(
//                 left: h / 100),
//                 child: IconButton(
//                   icon: SvgPicture.asset(
//                       "Assets/images/Frame 11.svg",
//                       width: h/20,
//                       color: ColorS.surface),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 )),
//
//
//             ],
//           ),
//           ):
//           Text(""),
//
//           ],
//           ),
                    //     Navigator.push(
                    //                                                                               context,
                    //                                                                               MaterialPageRoute(//receiver_id: ,my_ID: ,
                    //                                                                                   builder: (context) => Sprints(my_ID:state.FrinedRequestsList![index].my_id!, IS_sprints: false, receiver_id:state.FrinedRequestsList![index].ID!,His_Alias: state.FrinedRequestsList![index].Alias.toString())   ))
                    state.FrinedRequestsList!.length!=0?
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Container(
                             margin: EdgeInsets.only(right: h/5),
                             child: Row(
                               children: [
                                 Container(
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         // margin: EdgeInsets.only(
                                         //     left: h / 100),
                                           child: IconButton(
                                             icon: SvgPicture.asset(
                                                 "Assets/images/Frame 11.svg",
                                                 width: h/20,
                                                 color: ColorS.surface),
                                             onPressed: () {
                                               Navigator.pop(context);
                                             },
                                           )),


                                     ],
                                   ),
                                 ),
                                 Container(
                                   child: Center(
                                     child:  Text('Friend Requests', textAlign: TextAlign.left,    style: _TextTheme.headlineLarge!.copyWith(
                                         fontWeight: FontWeight.w600, fontSize: 23),
                                     )
                                     ,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Expanded(
                             child: Container(
                                 margin: EdgeInsets.only(right: h/35),
                                 child:
                                 Text(state.FrinedRequestsList!.length.toString(), textAlign: TextAlign.right, style: TextStyle(
                                     color: Color.fromRGBO(234, 234, 234, 1),
                                     fontFamily: 'Red Hat Display',
                                     fontSize: 20,
                                     letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                     fontWeight: FontWeight.normal,
                                     height: 1
                                 ),)
                             ),
                           )
                         ],
                       ),
                       SizedBox(height: 10,),
                       Container(
                         width: w,
                         margin: EdgeInsets.only(right: h/50,),
                         child: ScrollConfiguration(
                           behavior: MyBehavior(),
                           child: ListView.separated(
                             shrinkWrap: true,
                             padding: EdgeInsets.zero,
                             physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()
                             ),
                             scrollDirection: Axis.vertical,
                             itemCount:state.FrinedRequestsList!.length,
                             separatorBuilder: (BuildContext context, int index) {
                               return SizedBox(
                                 height: 5,
                               );
                             },
                             itemBuilder: (BuildContext context, int index) {

                               String Value = state.FrinedRequestsList![index].Color.toString();
                               var myInt = int.parse(Value);
                               var BackgroundColor= myInt;


                               return
                                 Container(
                                   width: w / 1.3,
                                   margin: EdgeInsets.only(left: h/60),

                                   child: Column(
                                     children: [
                                       Stack(
                                         children: [
                                           Container(
                                             width: w / 1.15,
                                             height: h / 12,
                                             decoration: BoxDecoration(
                                               borderRadius : BorderRadius.only(
                                                 topLeft: Radius.circular(38.38095474243164),
                                                 topRight: Radius.circular(3.8380954265594482),
                                                 bottomLeft: Radius.circular(38.38095474243164),
                                                 bottomRight: Radius.circular(3.8380954265594482),
                                               ),
                                               boxShadow : [BoxShadow(
                                                   color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                                   offset: Offset(0,0),
                                                   blurRadius: 12.19047737121582
                                               )],
                                               color : Color.fromRGBO(186, 71, 77, 1),
                                             ),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.only(right: h/50),
                                                   child: Center(
                                                       child: IconButton(
                                                         onPressed: (){
                                                           _FriendlistBloc.add(DenyRequest((b) => b..index = index..friend_id =  state.FrinedRequestsList![index].ID ));
                                                         },
                                                         icon: SvgPicture.asset("Assets/images/Delete_trash.svg",color: Colors.white,width: w/20,),
                                                       )
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Container(
                                               width: w / 1.48,
                                               height: h / 12,
                                               decoration: BoxDecoration(
                                                 borderRadius : BorderRadius.only(
                                                   topLeft: Radius.circular(38.38095474243164),
                                                   topRight: Radius.circular(3.8380954265594482),
                                                   bottomLeft: Radius.circular(38.38095474243164),
                                                   bottomRight: Radius.circular(3.8380954265594482),
                                                 ),
                                                 boxShadow : [BoxShadow(
                                                     color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                                     offset: Offset(0,0),
                                                     blurRadius: 12.19047737121582
                                                 )],
                                                 color : Color.fromRGBO(207, 109, 56, 1),
                                               ),
                                               child:Row(
                                                 mainAxisAlignment: MainAxisAlignment.end,

                                                 children: [
                                                   Container(
                                                     margin: EdgeInsets.only(right: h/50),
                                                     child:
                                                     IconButton(
                                                       onPressed: (){
                                                         _FriendlistBloc.add(AceeptRequest((b) => b..index = index..friend_id =  state.FrinedRequestsList![index].ID ..daata =  state.FrinedRequestsList![index]));
                                                       },
                                                       icon: SvgPicture.asset("Assets/images/Frame(1).svg",color: Colors.white,width: w/15,),
                                                     ),
                                                   )
                                                 ],
                                               )
                                           ),
                                           Container(
                                             width: w / 2.04,
                                             height: h / 12,
                                             decoration: BoxDecoration(
                                               borderRadius : BorderRadius.only(
                                                 topLeft: Radius.circular(38.38095474243164),
                                                 topRight: Radius.circular(3.8380954265594482),
                                                 bottomLeft: Radius.circular(38.38095474243164),
                                                 bottomRight: Radius.circular(3.8380954265594482),
                                               ),
                                               boxShadow : [BoxShadow(
                                                   color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                                   offset: Offset(0,0),
                                                   blurRadius: 12.19047737121582
                                               )],
                                               color : Color.fromRGBO(96, 96, 96, 1),
                                             ),
                                             child: Row(
                                               children: [
                                                 Container(
                                                   margin: EdgeInsets.only(
                                                       left: h / 60),
                                                   child: CircleAvatar(
                                                     backgroundColor: Color(
                                                         int.parse( state.FrinedRequestsList![index].Color!)),
                                                     backgroundImage:
                                                     NetworkImage(   state.FrinedRequestsList![index].Avatar.toString()),
                                                     radius: h / 35.5,
                                                   ),
                                                 ),
                                                 SizedBox(width: h/40,),
                                                 Container(
                                                   child: Text(
                                                       state.FrinedRequestsList![index].Alias.toString(),
                                                       textAlign:
                                                       TextAlign
                                                           .left,
                                                       style: _TextTheme
                                                           .headline3!
                                                           .copyWith(
                                                         color: Colors.white,
                                                         fontWeight:
                                                         FontWeight
                                                             .w400,
                                                         fontSize: 2.5 *
                                                             SizeConfig
                                                                 .blockSizeVertical!
                                                                 .toDouble(),
                                                       )),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 );



                             },
                           ),
                         ),
                       ),
                       SizedBox(height: 10,),
                     ],
                   ):Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                     Row(
                       children: [
                         state.FrinedRequestsList!.length==0?
                         Container(
                           // margin: EdgeInsets.only(
                           //     left: h / 100),
                             child: IconButton(
                               icon: SvgPicture.asset(
                                   "Assets/images/Frame 11.svg",
                                   width: h/20,
                                   color: ColorS.surface),
                               onPressed: () {
                                 Navigator.pop(context);
                               },
                             )):
                         Container(
                           width: h/20,
                           child: Text(""),
                         ),

                         Container(
                           child :
                           Center(
                             child: Text(
                               '   Friend list',
                               textAlign: TextAlign.left,
                               style: _TextTheme.headlineLarge!.copyWith(
                                   fontWeight: FontWeight.w600, fontSize: 23),
                             ),
                           ),
                         ),
                       ],
                     ),
                        SizedBox(height: 10,),
                     Container(
                              width: w / 2,
                              height: h / 20,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                Container(
                                  margin: EdgeInsets.only(right: h/50),
                                  child: IconButton(
                                        icon:SvgPicture.asset(
                                          "Assets/images/Frame(1).svg",
                                          width: w / 5,
                                          height: h / 40,
                                          color: ColorS.onSurface,
                                        ),
                                        onPressed:(){
                                          WidgetsBinding.instance!
                                              .addPostFrameCallback((_) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ShowCaseWidget(
                                                    builder: Builder(
                                                      builder: (context) =>
                                                          FindFriends_screen(),
                                                    ))),
                                          ));
                                        },
                                      ),
                                ),
                                ],
                              ),
                            )

                      ],
                    ),
                    Text(""),

                    ( Checknow?(state.success!): false)
                        ?state.FrinedList!.length==0
                    ?Container(
                      width: w,
                      height: h/(state.FrinedRequestsList!.length!=0?1.6:1.266),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: w,
                              height: h/(state.FrinedRequestsList!.length!=0?2.5:1.7),
                              child: Image.asset("Assets/images/Friendlist.png",fit: BoxFit.fill,)),
                           Column(
                             children: [
                               Text('Your friend list is empty.', textAlign: TextAlign.left, style: TextStyle(
                                   color: Color.fromRGBO(96, 96, 96, 1),
                                   fontFamily: 'Red Hat Display',
                                   fontSize: 18.105409622192383,
                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                   fontWeight: FontWeight.w400,
                                   height: 1
                               ),),
                               SizedBox(height: h/40,),
                               InkWell(
                                 onTap: (){
                                   WidgetsBinding.instance!
                                       .addPostFrameCallback((_) => Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => ShowCaseWidget(
                                             builder: Builder(
                                               builder: (context) =>
                                                   FindFriends_screen(),
                                             ))),
                                   ));
                                 },
                                 child: Container(
                                     width: w / 1.5,
                                     height: h / 13.9,
                                     decoration: BoxDecoration(
                                       borderRadius : BorderRadius.only(
                                         topLeft: Radius.circular(20.5),
                                         topRight: Radius.circular(20.5),
                                         bottomLeft: Radius.circular(20.5),
                                         bottomRight: Radius.circular(20.5),
                                       ),
                                       boxShadow : [BoxShadow(
                                           color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                           offset: Offset(0,0),
                                           blurRadius: 10
                                       )],
                                       color : Color.fromRGBO(207, 109, 56, 1),
                                     ),
                                     child:
                                     Center(
                                         child:
                                         Text('Add/Find Friends', textAlign: TextAlign.left, style: TextStyle(
                                             color: Color.fromRGBO(255, 255, 255, 1),
                                             fontFamily: 'Red Hat Text',
                                             fontSize: 20,
                                             letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                             fontWeight: FontWeight.w400,
                                             height: 1
                                         ),)
                                     )

                                 ),
                               ),


                               SizedBox(height: h/40,),
                               SizedBox(height: h/40,),
                             ],
                           )
                        ],
                      ),
                    )
                        :

                    Column(
                      children: [
                        Container(
                          width: w,
                          height: h/1.5,
                          margin: EdgeInsets.only(right: h/45,),
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount:state.FrinedList!.length,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {

                                String Value = state.FrinedList![index].Color.toString();
                                var myInt = int.parse(Value);
                                var BackgroundColor= myInt;


                                return
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(//receiver_id: ,my_ID: ,
                                              builder: (context) => Sprints(my_ID:state.FrinedList![index].my_id!, IS_sprints: false, receiver_id:state.FrinedList![index].ID!,His_Alias: state.FrinedList![index].Alias.toString())   ));
                                    },
                                    child: Slidable(
                                      closeOnScroll: true,
                                      key: const ValueKey(0),
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        dismissible: DismissiblePane(onDismissed: () {
                                          Index = index;
                                          Freindid = state.FrinedList![index].ID!;
                                          print("Dissmissed");
                                          alreatDialogBuilder(context,"lol1","lol2","lol3",h,w,Index);
                                        }),
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                        builder: (context) => Sprints(my_ID:state.FrinedList![index].my_id!, IS_sprints: false, receiver_id:state.FrinedList![index].ID!,His_Alias: state.FrinedList![index].Alias.toString())   ));
                                              },
                                              child: Container(
                                                width: w / 5,
                                                height: h / 9,
                                                decoration: const BoxDecoration(
                                                  color: const Color(0xffCF6D38),
                                                  borderRadius: BorderRadius.only(
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                        "Assets/images/Vector2.svg",
                                                        width: h / 22,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Freindid = state.FrinedList![index].ID!;
                                                alreatDialogBuilder(context,"lol1","lol2","lol3",h,w,Index);
                                              },
                                              child: Container(
                                                width: w / 5,
                                                height: h / 9,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffA83063),
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight: const Radius.circular(5),
                                                    topRight: Radius.circular(5),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      "Assets/images/Group 38.svg",
                                                      width: h / 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: Column(children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: h / 30,
                                            ),
                                            width: w / 1.15,
                                            height: h / 12,
                                            decoration: BoxDecoration(
                                              color: ColorS.background,
                                              borderRadius:
                                              const BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(40),
                                                bottomRight:
                                                const Radius.circular(5),
                                                topLeft:
                                                Radius.circular(
                                                    40),
                                                topRight:
                                                Radius.circular(5),
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
                                            child: Row(
                                              children: [
                                              //  SizedBox(width: h/100,),

                                                Stack(
                                                  children: [
                                                    Hero(
                                                        tag:"Image${state.FrinedList![index].ID}",
                                                        child: Material(
                                                            type: MaterialType.transparency,
                                                            child :
                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(//receiver_id: ,my_ID: ,
                                                                    builder: (context) => HeroImage(path: state.FrinedList![index].Avatar,color:   int.parse(state.FrinedList![index].Color!),id:state.FrinedList![index].ID ,),),
                                                                );
                                                              },
                                                              child:
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    left: h / 60),
                                                                child: CircleAvatar(
                                                                  backgroundColor: Color(
                                                                     int.parse( state.FrinedList![index].Color!)),
                                                                  backgroundImage:
                                                                  NetworkImage(   state.FrinedList![index].Avatar.toString()),
                                                                  radius: h / 35.5,
                                                                ),
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
                                                          backgroundColor:ColorS.secondaryContainer,
                                                          radius: 8,
                                                          child:  const CircleAvatar(backgroundColor: const Color(0xff34A853),radius: 5.5,)),
                                                    )
                                                        :const Text("")
                                                        :const Text("")

                                                  ],

                                                ),
                                                SizedBox(width: h/40,),
                                                Container(
                                                  width: w/1.82,
                                                  child: Text(
                                                      state.FrinedList![index].Alias.toString(),
                                                      textAlign:
                                                      TextAlign
                                                          .left,
                                                      style: _TextTheme
                                                          .headline3!
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontSize: 2.7*
                                                            SizeConfig
                                                                .blockSizeVertical!
                                                                .toDouble(),
                                                      )),
                                                ),
                                              ],
                                            ),
                                           )
                                      ]),


                                     //  InkWell(
                                     //    onTap: () {
                                     // },
                                     //    child: Column(
                                     //      children: [
                                     //        Container(
                                     //          margin: EdgeInsets.only(left: h/30),
                                     //
                                     //          width: w / 1.01,
                                     //          height: h / 10,
                                     //          decoration: BoxDecoration(
                                     //            color: ColorS.secondaryContainer,
                                     //            borderRadius: BorderRadius.only(
                                     //              bottomLeft: Radius.circular(40),
                                     //              bottomRight: Radius.circular(5),
                                     //              topLeft: Radius.circular(40),
                                     //              topRight: Radius.circular(5),
                                     //            ),
                                     //            boxShadow: [
                                     //              BoxShadow(
                                     //                  color: ColorS.primaryVariant ,
                                     //                  offset: Offset(0, 0),
                                     //                  blurRadius: 2)
                                     //            ],
                                     //          ),
                                     //          child: Row(
                                     //            children: [
                                     //              Column(
                                     //                mainAxisAlignment:
                                     //                MainAxisAlignment.center,
                                     //                children: [
                                     //                  //FrinedsStatus
                                     //                  Stack(
                                     //                      children:[
                                     //                        Row(
                                     //                          mainAxisAlignment:
                                     //                          MainAxisAlignment.center,
                                     //                          children: [
                                     //                            Text("  "),
                                     //                            Hero(
                                     //
                                     //                                child:        Material(
                                     //                                  type: MaterialType.transparency,
                                     //                                  child : Container(
                                     //                                    width: w/6,
                                     //                                    height: h/11.7,
                                     //                                    child:   InkWell(
                                     //                                      onTap: (){
                                     //                                        // Navigator.push(
                                     //                                        //   context,
                                     //                                        //   MaterialPageRoute(//receiver_id: ,my_ID: ,
                                     //                                        //     builder: (context) => HeroImage(path:    state.FrinedList![index].Avatar.toString(),color:    int.parse(state.FrinedList![index].Color!),id:state.FrinedList![index].ID,),),
                                     //                                        // );
                                     //                                      },
                                     //                                      child: CachedNetworkImage(
                                     //                                        imageUrl:     state.FrinedList![index].Avatar.toString(),
                                     //                                        errorWidget: (context, url, error) => Center(child: Text("Error")),
                                     //                                        imageBuilder: (context, imageProvider) => CircleAvatar(
                                     //                                          radius: 30,
                                     //                                          backgroundImage: imageProvider,
                                     //                                          backgroundColor:   Color(BackgroundColor),
                                     //                                        ),
                                     //                                      ),
                                     //                                    ),
                                     //
                                     //                                  ),
                                     //                                )
                                     //
                                     //                            )
                                     //                          ],
                                     //                        ),
                                     //                        state.ChangeStateSuccess!?
                                     //                        FrinedsStatus[index]==1?
                                     //                        Positioned(
                                     //                          bottom: 0,
                                     //                          right: 0,
                                     //                          child:
                                     //                          CircleAvatar(
                                     //                              backgroundColor:ColorS.secondaryContainer,
                                     //                              radius: 10,
                                     //                              child:  CircleAvatar(backgroundColor: Color(0xff34A853),radius: 8,)),
                                     //                        )
                                     //                            :Text("")
                                     //                            :Text("")
                                     //
                                     //                      ]
                                     //
                                     //
                                     //                  ),
                                     //                ],
                                     //              ),
                                     //              SizedBox(width: 10,),
                                     //
                                     //              Text(
                                     //                  state.FrinedList![index].Alias.toString(),
                                     //                  textAlign: TextAlign.left,
                                     //                  style: _TextTheme.headline3!.copyWith(
                                     //                      fontFamily: 'Red Hat Display',
                                     //                      fontWeight: FontWeight.w400
                                     //                      ,fontSize: 22
                                     //                  )
                                     //
                                     //              ),
                                     //
                                     //            ],
                                     //          ),
                                     //        ),
                                     //      ],
                                     //    ),
                                     //  ),
                                    ),
                                  );


                              },
                            ),
                          ),
                        )

                      ],
                    )
                        :Container(child: Text("Loading.."),),
                    COUNTERDiditonce==0?
                         state.isLoading!
                        ? Container(
                             width: w,
                             height: h/1.5,
                        child: Center(child: listLoader(context: context)))
                        : SizedBox()
                    :SizedBox(),
                  ],
                ),

            ),
          );
        });
  }
  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
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

class FrinedsData{
  String? Color;
  String? Avatar;
  String? Alias;
  String? boi;
  int? ID;
  int? my_id;
  bool? is_Frined;

}
