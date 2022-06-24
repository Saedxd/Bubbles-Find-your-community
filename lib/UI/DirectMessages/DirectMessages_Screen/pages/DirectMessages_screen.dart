import 'dart:async';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_Bloc.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_State.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/bloc/DirectMessages_event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/FindFriends_Screen/pages/FindFriends_Screen.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../ChatDirect_Screen/pages/ChatUi_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class DirectMessages extends StatefulWidget {
  const DirectMessages({Key? key}) : super(key: key);

  @override
  State<DirectMessages> createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {
  bool Diditonce = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //
  final _DirectMessages_Bloc = sl<DirectMessagesBloc>();
  late FocusNode FocuseNODE;
  List<int> Selected = [0, 0];
  bool done = false;
  List<int> FrinedsID=[];
  List<int> FrinedsStatus=[];
  int index = 0;
  Timer? timer;

  void ListenForONlineFriends() {
    if(socket!=null &&!socket!.disconnected) {

      socket!.on("friend_online", (value) {
        if (value["status"] != "offline") {
       FrinedsStatus[value["index"]] = 1;
        }


        if (value["index"] == FrinedsID.length - 1) {
          _DirectMessages_Bloc.add(RefreshState());
        }
      });

    }
  }

  void LoopONfrinedsId()async{
    if(socket!= null &&!socket!.disconnected) {
      for (int i = 0; i < FrinedsID.length; i++) {
        socket!.emit('report_friends_online', {
          'friend_id': FrinedsID[i].toString(),
          'index':i
        },);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Diditonce = true;
    FocuseNODE = FocusNode();
    ListenForONlineFriends();
    _DirectMessages_Bloc.add(GetLastMessageWithAllUsers());
      timer = Timer.periodic(Duration(seconds: 10), (Timer t){
    return LoopONfrinedsId();
    });
  }



  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
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


          if (state.success! && Diditonce ){
            for(int i=0;i<state.OldMessages!.messages!.length;i++){
              FrinedsID.add(state.OldMessages!.messages![i].receiver_id!);
            }
            FrinedsStatus = List.filled(
                state.OldMessages!.messages!.length,
                0);
            LoopONfrinedsId();

            Diditonce = false;
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            body: Stack(children: [
              Selected[0] == 1
                  ? Container(width: w, height: h, child: const Friendlist())
                  : Column(
                      children: [
                        SizedBox(
                          height: h / 11,
                        ),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            width: w / 1.2,
                            height: h / 15,
                            child: Form(
                              key: _formkey1,
                              child: TextFormField(
                                textInputAction: TextInputAction.search,
                                controller: _SearchController,
                                focusNode: FocuseNODE,
                                onFieldSubmitted: (value) {},
                                cursorColor: Colors.grey,
                                style: const TextStyle(
                                    color: Colors.orange, fontSize: 16.5),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xff939393), width: 10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xff939393), width: 2),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        color: Color(0xff939393), width: 2),
                                  ),
                                  prefixIcon: IconButton(
                                      icon: SvgPicture.asset(
                                        'Assets/images/Vector(1).svg',
                                      ),
                                      onPressed: null //do something,
                                      ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 20),
                                  hintText: "Search for Users",
                                  hintStyle: const TextStyle(
                                      color: Color.fromRGBO(147, 147, 147, 1),
                                      fontFamily: 'Sofia Pro',
                                      fontSize: 12.51075267791748,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            )),
                        const Text(""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                '       Direct Messages',
                                textAlign: TextAlign.left,
                                style: _textthem.headlineLarge!.copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 23),
                              ),
                            ),
                            Row(
                              children: const [
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  const Text(""),
                                  Container(
                                      width: w / 10,
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
                                                Selected = List.filled(3, 0);
                                                Selected[0] = 1;
                                                setState(() {});
                                              },
                                            ),
                                          )
                                        ],
                                      )),
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
                                              WidgetsBinding.instance!
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
                        (state.success == true)
                            ? Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                      right: h / 20,
                                    ),
                                    width: w,
                                    height: h / 1.4,
                                    child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: BouncingScrollPhysics(
                                            parent:
                                                AlwaysScrollableScrollPhysics()),
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            state.OldMessages!.messages!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          DateTime datee = DateTime.parse(state
                                              .OldMessages!
                                              .messages![index]
                                              .CreatAt
                                              .toString());
                                       //   print(timeago.format(datee));
                                          String Value = "";
                                          Value = state
                                              .OldMessages!
                                              .messages![index]
                                              .receiver_background_color
                                              .toString();

                                          var myInt = int.parse(Value);
                                          var BackgroundColor = myInt;

                                          return InkWell(
                                            onTap: () {
                                              int MyID = state.OldMessages!.messages![index].me!;
                                              WidgetsBinding.instance!
                                                  .addPostFrameCallback(
                                                      (_) => Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      DirectChat(
                                                                receiver_id: state
                                                                    .OldMessages!
                                                                    .messages![
                                                                        index]
                                                                    .receiver_id!,
                                                                        my_ID: MyID,
                                                              ),
                                                            ),
                                                          ));
                                            },
                                            child: Column(children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: h / 30,
                                                      bottom: h / 120,
                                                      top: h / 120),
                                                  width: w / 1.2,
                                                  height: h / 8,
                                                  decoration: BoxDecoration(
                                                    color: COLOR.background,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(40),
                                                      bottomRight:
                                                          Radius.circular(5),
                                                      topLeft:
                                                          const Radius.circular(
                                                              40),
                                                      topRight:
                                                          Radius.circular(5),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                        offset: Offset(0, 0),
                                                        blurRadius: 2.0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Row(children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              left: h / 60),
                                                          child: CircleAvatar(
                                                            backgroundColor: Color(
                                                                BackgroundColor),
                                                            backgroundImage:
                                                            NetworkImage(state
                                                                .OldMessages!
                                                                .messages![
                                                            index]
                                                                .receiver_image
                                                                .toString()),
                                                            radius: h / 20,
                                                          ),
                                                        ),
                                                        state.ChangeStateSuccess!?
                                                        FrinedsStatus[index]==1?
                                                        Positioned(
                                                          bottom: 0,
                                                          right: 0,
                                                          child:
                                                          CircleAvatar(
                                                              backgroundColor:COLOR.secondaryContainer,
                                                              radius: 10,
                                                              child:  CircleAvatar(backgroundColor: Color(0xff34A853),radius: 8,)),
                                                        )
                                                            :Text("")
                                                            :Text("")

                                                      ],
                                                    ),

                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                  state
                                                                      .OldMessages!
                                                                      .messages![
                                                                          index]
                                                                      .receiver_name
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: _textthem
                                                                      .headline3!
                                                                      .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize: 4 *
                                                                        SizeConfig
                                                                            .blockSizeVertical!
                                                                            .toDouble(),
                                                                  )),
                                                              Text(""),
                                                              Text(""),
                                                              Text(""),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
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
                                                                  width: w / 3,
                                                                  //  height: h/40,
                                                                  child: Text(
                                                                      state
                                                                          .OldMessages!
                                                                          .messages![
                                                                              index]
                                                                          .message
                                                                          .toString(),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: _textthem.headline5!.copyWith(
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize: 2.5 *
                                                                              SizeConfig.blockSizeVertical!
                                                                                  .toDouble(),
                                                                          color:
                                                                              Color(0xff939393))),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: w / 6,
                                                                  height:
                                                                      h / 30,
                                                                  child: Center(
                                                                    child: Text(
                                                                        timeago.format(
                                                                            datee),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .right,
                                                                        style: _textthem
                                                                            .headline4!
                                                                            .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              2 * SizeConfig.blockSizeVertical!.toDouble(),
                                                                          color:
                                                                              Color(0xff939393),

                                                                          // ,fontWeight: FontWeight.bold
                                                                        )),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ]))
                                            ]),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: h / 1000,
                                          );
                                        },
                                      ),
                                    )),
                              )
                            : state.isLoading == true
                                ? Container(
                                    width: w,
                                    height: h / 3,
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
                                      margin: EdgeInsets.only(
                                        right: h / 20,
                                      ),
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
                                              child: const Text("Error"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                      ],
                    ),
            ]),
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
