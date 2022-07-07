import 'dart:async';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/App/bloc/appbloc.dart';
import 'package:bubbles/Injection.dart';
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
  const Friendlist({Key? key}) : super(key: key);

  @override
  State<Friendlist> createState() => _FriendlistState();
}

class _FriendlistState extends State<Friendlist> {
  final _FriendlistBloc = sl<FriendListBloc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  late FocusNode FocuseNODE;
  List<int> FrinedsID=[];
  List<int> FrinedsStatus=[];
  final ScrollController controllerTwo = ScrollController();
  Timer? timer;
  int Freindid = 0;
  int index = 0;
  bool Checknow = false;
  bool Diditonce = true;
  int COUNTERDiditonce = 0;
  int Index =0;
  void ListenForONlineFriends() {
    if(socket!.disconnected!=  null &&!socket!.disconnected) {
      //
      // socket!.on("new_friend_online", (value) {
      //   print("Yes im in Frined list : $value");
      //   if (value["status"] != "offline") {
      //     FrinedsStatus[value["index"]] = 1;
      //   }
      //     _FriendlistBloc.add(RefreshState());
      // });
      //
      socket!.on("friend_online", (value) {
        print(value);
        if (value["status"] != "offline") {
          FrinedsStatus[value["index"]] = 1;
        }
        _FriendlistBloc.add(RefreshState());
      });
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
    ListenForONlineFriends();
   timer = Timer.periodic(Duration(seconds: 10), (Timer t) => LoopONfrinedsId());
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
               state.GetFriends!.friends!.length,
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
                                  ));
                                  _FriendlistBloc.add(GetFreinds());
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
                      height: 55,
                    ),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(""),
                        Text(
                          'Friend list',
                          textAlign: TextAlign.left,
                          style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 23),
                        ),
                     Text(""),
                     Text(""),
                     Container(
                              width: w / 5,
                              height: h / 20,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
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
                                  )
                                ],
                              ),
                            )

                      ],
                    ),
                    Text(""),

                    ( Checknow?(state.success!): false)
                        ?state.GetFriends!.friends!.length==0
                    ?Container(
                      width: w,
                      height: h/1.266,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: w,
                              height: h/1.7,
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
                        RefreshIndicator(
                          onRefresh: OnRefresh,
                          backgroundColor: Colors.white,
                          color: Colors.blue,
                          child:    Container(
                            width: w,
                            height: h/1.266,
                            margin: EdgeInsets.only(right: h/20,),
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: AlwaysScrollableScrollPhysics(
                                    ),
                                scrollDirection: Axis.vertical,
                                itemCount: state.GetFriends!.friends!.length,
                                separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 5,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {

                                  String Value = state.GetFriends!.friends![index].background_color.toString();
                                  var myInt = int.parse(Value);
                                  var BackgroundColor= myInt;


                                  return
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DirectChat(receiver_id: state.GetFriends!.friends![index].id!,my_ID: state.GetFriends!.friends![index].me_id!,),),
                                        );
                                      },
                                      child: Slidable(
                                        closeOnScroll: true,
                                        key: const ValueKey(0),
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          dismissible: DismissiblePane(onDismissed: () {
                                             Index = index;
                                            Freindid = state.GetFriends!.friends![index].id!;
                                            print("Dissmissed");
                                            alreatDialogBuilder(context,"lol1","lol2","lol3",h,w,Index);
                                          }),
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => DirectChat(receiver_id: state.GetFriends!.friends![index].id!,my_ID:state.GetFriends!.friends![index].me_id!,),),
                                                  );
                                                },
                                                child: Container(
                                                  width: w / 5,
                                                  height: h / 9,
                                                  decoration: const BoxDecoration(
                                                    color: const Color(0xffCF6D38),
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
                                                  Freindid = state.GetFriends!.friends![index].id!;
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
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DirectChat(receiver_id: state.GetFriends!.friends![index].id!,my_ID: state.GetFriends!.friends![index].me_id!,),),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: h/30),

                                                width: w / 1.01,
                                                height: h / 10,
                                                decoration: BoxDecoration(
                                                  color: ColorS.secondaryContainer,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(40),
                                                    bottomRight: Radius.circular(5),
                                                    topLeft: Radius.circular(40),
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
                                                                height: h/11.7,
                                                                child:   CachedNetworkImage(
                                                                  imageUrl:
                                                                  state.GetFriends!.friends![index].avatar.toString()!=null
                                                                      ? state.GetFriends!.friends![index].avatar.toString():"Assets/images/DefaultAvatar.png",

                                                                  errorWidget: (context, url, error) => Center(child: Text("Error")),
                                                                  imageBuilder: (context, imageProvider) => CircleAvatar(
                                                                    radius: 30,
                                                                    backgroundImage: imageProvider,
                                                                    backgroundColor:   Color(BackgroundColor),
                                                                  ),
                                                                ),

                                                              )
                                                            ],
                                                          ),
                                                          state.ChangeStateSuccess!?
                                                          FrinedsStatus[index]==1?
                                                          Positioned(
                                                            bottom: 0,
                                                            right: 0,
                                                            child:
                                                          CircleAvatar(
                                                            backgroundColor:ColorS.secondaryContainer,
                                                              radius: 10,
                                                            child:  CircleAvatar(backgroundColor: Color(0xff34A853),radius: 8,)),
                                                          )
                                                              :Text("")
                                                              :Text("")

                                                ]


                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 10,),

                                                    Text(
                                                        state.GetFriends!.friends![index].alias.toString(),
                                                        textAlign: TextAlign.left,
                                                        style: _TextTheme.headline3!.copyWith(
                                                            fontFamily: 'Red Hat Display',
                                                            fontWeight: FontWeight.w400
                                                            ,fontSize: 22
                                                        )

                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );


                                },
                              ),
                            ),
                          )
                        ),

                      ],
                    )
                        :Container(child: Text("Loading.."),),
                    COUNTERDiditonce==0?
                         state.isLoading!
                        ? Container(
                        width: w / 1.1,
                        height: h/1.3,
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
