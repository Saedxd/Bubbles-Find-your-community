import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_Event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_State.dart';
import 'package:bubbles/UI/Notifications/pages/Notifications_Screen.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/Porfile_Screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/Colors/constants.dart';
import '../../Home/Home_Screen/pages/HomeScreen.dart';
import '../bloc/TopBar_bloc.dart';

class NavigatorTopBar extends StatefulWidget {
   NavigatorTopBar({Key? key, this.GOtoDirect}) : super(key: key);
int? GOtoDirect = 0;
  @override
  State<NavigatorTopBar> createState() => _NavigatorTopBarState();
}


IO.Socket? socket;
class _NavigatorTopBarState extends State<NavigatorTopBar>  with WidgetsBindingObserver  {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _TopBarBloc = sl<TopBarBloc>();
  //final PageController _pageController = PageController();
  int dot = 0;
 // List<int> TopBarItemSelected = [1, 0, 0, 0];

  bool DiditONCE = false;
  String Alias = "";
  int USER_ID = 0;
  int selected = 0;
  int PageIndex = 0;

  final List<Widget> _buildScreens = [
    HomeScreen(),
    const DirectMessages(),
    const Notifications(),
    Profile(),
  ];




@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  print(state);
  switch (state) {
    case AppLifecycleState.resumed:
      connect();
      break;
    case AppLifecycleState.inactive:
   //   Disconnect();
      break;
    case AppLifecycleState.paused:
    //  Disconnect();
      break;
    case AppLifecycleState.detached:
     // Disconnect();
      break;
  }
}

  // IOo.Socket? socket;
  //<String, dynamic>{
  //       "transports": ["websocket"],
  //       "autoConnect": false,
  //     },

  //"websocket",
  //"polling"

  void connect()async {

    try {
      print("connected with alias : $Alias");
      print("connected with USER_ID :$USER_ID ");
      socket =  IO.io("https://chatapp.salnoyapp.store/",
        OptionBuilder()
            .setTransports(["websocket", "polling"])
            .disableAutoConnect()
            .setQuery({
          "user_id": USER_ID,
          "username": Alias,
        }).build(),
      );

      socket!.connect();
      print("Tried");
      socket!.onConnect((data) {
        print(socket!.connected);
        print("Connected");
        print(data);
        socket!.on("receive_message_send", (msg) {
          //   setHisMessage( msg["message"]);
        });
        socket!.onDisconnect((_) => print('disconnected'));


        socket!.on("connected_status", (msg) {
          print(msg);
          print("Listening");
          // setHisMessage( msg["message"]);
        });

        socket!.on("receive_message_send", (msg) {
          //   setHisMessage( msg["message"]);
        });
      });


      socket!.on("connected_status", (msg) {
        print(msg);
        print("Listening");
        // setHisMessage( msg["message"]);
      });
      // socket!.onDisconnect((data) =>
      // print("Disconnected")
      // );


      print(socket!.connected);
    }catch(e){
      print(e);
    }
  }




  // void Disconnect(){
  //  // socket!.disconnect();
  //   print("DIsconnected");
  //   socket!.onDisconnect((data) =>
  //       print("Disconnected IN SIDE ONDISCONNECT")
  //   );
  //
  // }

@override
void dispose() {
super.dispose();
WidgetsBinding.instance?.removeObserver(this);
}

  @override
  void initState() {
    super.initState();
    _TopBarBloc.add(GetProfile());
    DiditONCE =true;
    WidgetsBinding.instance?.addObserver(this);
    if (widget.GOtoDirect==5){
      _TopBarBloc.add(
          ChangePAGEINDEX((b) =>  b
            ..num = 1
          ));
    }
  }


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  WillPopScope(
        onWillPop: ()async=>false,
    child:
      BlocBuilder(
        bloc: _TopBarBloc,
        builder: (BuildContext Context, TopBarState state) {


          if (state.GetprofileSuccess! && DiditONCE){
            Alias = state.ProfileDate!.user!.alias.toString();
            USER_ID = state.ProfileDate!.user!.id!;
            print("called function connect");
            connect();
            DiditONCE = false;
          }




    if (widget.GOtoDirect==5){
      state.Index1==true
          ? _TopBarBloc.add(ChangeIndex1())
          :null;

      state.Index2==false
          ? _TopBarBloc.add(ChangeIndex2())
          :null;

      state.Index3==true
          ? _TopBarBloc.add(ChangeIndex3())
          :null;

      state.Index4==true
          ? _TopBarBloc.add(ChangeIndex4())
          :null;
    }

          return  Scaffold(
              key: _scaffoldKey,
              body:  SafeArea(
                child: Stack(
                  children: [

                    _buildScreens[state.INDEX!],
                    Container(
                      width: w,
                      height: h / 13,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(0),
                          topRight: const Radius.circular(0),
                          bottomLeft: const Radius.circular(20),
                          bottomRight: const Radius.circular(20),
                        ),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                              offset: Offset(0, 0),
                              blurRadius: 10)
                        ],
                        color: ColorS.shadow,
                        //  color: status? Color(0xff303030):Color(0xffEAEAEA),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap:(){
                                print(socket!.connected);
                                _TopBarBloc.add(
                                    ChangePAGEINDEX((b) =>  b
                                      ..num = 0


                                    ));
                           // state.MakeScroll!?_TopBarBloc.add(MakrScroll()):null;
                                state.Index1==false
                                    ? _TopBarBloc.add(ChangeIndex1())
                                    :null;

                                state.Index2==true
                                    ? _TopBarBloc.add(ChangeIndex2())
                                    :null;

                                state.Index3==true
                                    ? _TopBarBloc.add(ChangeIndex3())
                                    :null;

                                state.Index4==true
                                    ? _TopBarBloc.add(ChangeIndex4())
                                    :null;

                                // _pageController.animateToPage(
                                //   0,
                                //   duration: const Duration(milliseconds: 500),
                                //   curve: Curves.easeInOut,
                                // );

                              },
                              child: Container(
                                  width: w / 1.7,
                                  height: h / 7,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: h/30,top: h/100),
                                        child: SvgPicture.asset(
                                            "Assets/images/LGOOO.svg",
                                            width: h / 6,
                                        ),
                                      ),
                                    ],
                                  ))),
                          Container(
                            width: w / 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        _TopBarBloc.add(
                                            ChangePAGEINDEX((b) =>  b
                                              ..num = 1


                                            ));
                                        state.Index1==true
                                            ? _TopBarBloc.add(ChangeIndex1())
                                            :null;

                                        state.Index2==false
                                            ? _TopBarBloc.add(ChangeIndex2())
                                            :null;

                                        state.Index3==true
                                            ? _TopBarBloc.add(ChangeIndex3())
                                            :null;

                                        state.Index4==true
                                            ? _TopBarBloc.add(ChangeIndex4())
                                            :null;


                                        // _pageController.animateToPage(
                                        //   1,
                                        //   duration: const Duration(milliseconds: 500),
                                        //   curve: Curves.easeInOut,
                                        // );
                                      },
                                      child: Container(
                                          height: h / 13,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  "Assets/images/Vector2.svg",
                                                  width: h / 30,
                                                  color: state.Index2!
                                                      ? const Color(0xffCF6D38)
                                                      :ColorS.tertiary
                                              ),
                                            ],
                                          ))),
                                ),
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        _TopBarBloc.add(
                                            ChangePAGEINDEX((b) =>  b
                                              ..num = 2


                                            ));
                                        state.Index1==true
                                            ? _TopBarBloc.add(ChangeIndex1())
                                            :null;

                                        state.Index2==true
                                            ? _TopBarBloc.add(ChangeIndex2())
                                            :null;

                                        state.Index3==false
                                            ? _TopBarBloc.add(ChangeIndex3())
                                            :null;

                                        state.Index4==true
                                            ? _TopBarBloc.add(ChangeIndex4())
                                            :null;

                                        // _pageController.animateToPage(
                                        //   2,
                                        //   duration: const Duration(milliseconds: 500),
                                        //   curve: Curves.easeInOut,
                                        // );
                                      },
                                      child: Container(
                                        height: h / 13,
                                        //  color: Colors.black,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "Assets/images/Vector.svg",
                                                width: h / 30,
                                                color: state.Index3!
                                                    ? const Color(0xffCF6D38)
                                                    :ColorS.tertiary
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      _TopBarBloc.add(
                                          ChangePAGEINDEX((b) =>  b
                                            ..num = 3
                                          )
                                      );
                                 state.Index1==true
                                     ? _TopBarBloc.add(ChangeIndex1())
                                     :null;

                                 state.Index2==true
                                     ? _TopBarBloc.add(ChangeIndex2())
                                     :null;

                                 state.Index3==true
                                     ? _TopBarBloc.add(ChangeIndex3())
                                     :null;

                                 state.Index4==false
                                     ? _TopBarBloc.add(ChangeIndex4())
                                     :null;



                                     //  _pageController.animateToPage(
                                     //    3,
                                     //    duration: const Duration(milliseconds: 500),
                                     //    curve: Curves.easeInOut,
                                     //  );

                                    },
                                    child: Container(
                                      height: h / 13,
                                      // color: Colors.black,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "Assets/images/Group 36.svg",
                                              width: h / 30,
                                              color:  state.Index4!
                                                  ? const Color(0xffCF6D38)
                                                  :ColorS.tertiary
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        })
    );
  }
}
//   Container(
//                       width: w,
//                       height: h,
//                       child: PageView.builder(
//                           allowImplicitScrolling: true,
//                           controller: _pageController,
//                           physics: state.MakeScroll!
//                               ? AlwaysScrollableScrollPhysics()
//                               : NeverScrollableScrollPhysics(),
//                           onPageChanged: (int index) {
//                             if(index==0){
//                               state.Index1==false
//                                   ? _TopBarBloc.add(ChangeIndex1())
//                                   :null;
//
//                               state.Index2==true
//                                   ? _TopBarBloc.add(ChangeIndex2())
//                                   :null;
//
//                               state.Index3==true
//                                   ? _TopBarBloc.add(ChangeIndex3())
//                                   :null;
//
//                               state.Index4==true
//                                   ? _TopBarBloc.add(ChangeIndex4())
//                                   :null;
//
//
//
//                             }else if (index==1){
//                               state.Index1==true
//                                   ? _TopBarBloc.add(ChangeIndex1())
//                                   :null;
//
//                               state.Index2==false
//                                   ? _TopBarBloc.add(ChangeIndex2())
//                                   :null;
//
//                               state.Index3==true
//                                   ? _TopBarBloc.add(ChangeIndex3())
//                                   :null;
//
//                               state.Index4==true
//                                   ? _TopBarBloc.add(ChangeIndex4())
//                                   :null;
//                             }else if (index==2){
//
//                               state.Index1==true
//                                   ? _TopBarBloc.add(ChangeIndex1())
//                                   :null;
//
//                               state.Index2==true
//                                   ? _TopBarBloc.add(ChangeIndex2())
//                                   :null;
//
//                               state.Index3==false
//                                   ? _TopBarBloc.add(ChangeIndex3())
//                                   :null;
//
//                               state.Index4==true
//                                   ? _TopBarBloc.add(ChangeIndex4())
//                                   :null;
//
//                             }else if (index==3){
//                               state.Index1==true
//                                   ? _TopBarBloc.add(ChangeIndex1())
//                                   :null;
//
//                               state.Index2==true
//                                   ? _TopBarBloc.add(ChangeIndex2())
//                                   :null;
//
//                               state.Index3==true
//                                   ? _TopBarBloc.add(ChangeIndex3())
//                                   :null;
//
//                               state.Index4==false
//                                   ? _TopBarBloc.add(ChangeIndex4())
//                                   :null;
//
//                             }
//
//                             _pageController.addListener((){
//
//                            //   Future.delayed(Duration(milliseconds: 500),(){
//                               if (index == 0 && _pageController.position.atEdge &&state.Index1!) {
//                                 state.MakeScroll!?_TopBarBloc.add(MakrScroll()):null;
//                                 print("state.MakeScroll ${state.MakeScroll}  at edge");
//
//                               }else{
//                                 state.MakeScroll!?null:_TopBarBloc.add(MakrScroll());
//                               }
//                               // });
//                             });
//
//
//
//                           },
//                           itemCount: _buildScreens.length,
//                           itemBuilder: (context, index) {
//                             return _buildScreens[index];
//                           }),
//                     ),