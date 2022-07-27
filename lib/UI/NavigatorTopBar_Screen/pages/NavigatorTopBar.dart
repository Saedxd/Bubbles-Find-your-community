import 'dart:async';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_Event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_State.dart';
import 'package:bubbles/UI/Notifications/pages/Notifications_Screen.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/Porfile_Screen.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../Home/Home_Screen/pages/HomeScreen.dart';
import '../bloc/TopBar_bloc.dart';
import 'package:move_to_background/move_to_background.dart';

int BackGroundCounter = 0;
class NavigatorTopBar extends StatefulWidget {
   NavigatorTopBar({Key? key, this.GOtoDirect}) : super(key: key);
int? GOtoDirect = 0;
  @override
  State<NavigatorTopBar> createState() => _NavigatorTopBarState();
}
Timer? timer2;
Timer? timer23 ;


Socket? socket;
class _NavigatorTopBarState extends State<NavigatorTopBar>  with WidgetsBindingObserver  {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController controller = PageController();
  Profile Profil =Profile();
  final _TopBarBloc = sl<TopBarBloc>();
  int dot = 0;
  bool DiditONCE = false;
  String Alias = "";
  String Avatar = "";
  String ColoRR = "";
  int USER_ID = 0;
  int selected = 0;
  int PageIndex = 0;
  List<int>? FrinedsID=[];


  final List<Widget> buildScreens = [
    const DirectMessages(),
    const Notifications(),
    Profile(),
  ];




  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    switch (state) {
      case AppLifecycleState.resumed:
        BackGroundCounter = 0;
        break;
      case AppLifecycleState.inactive:

        break;
      case AppLifecycleState.paused:

        break;
      case AppLifecycleState.detached:

        break;
    }

  }

  //https://chat.bubbles.app/
  //http://50.60.40.108:3000'
  //'https://50.60.40.102:3000',
  //'https://tranquil-castle-10002.herokuapp.com',
  //'https://chatapp.salnoyapp.store/',
  //'http://10.0.2.2:3000',
  //'http://50.60.40.102:3000',
  //'https://chat.bubbles.app',

  void connect()async{
        socket =io(
        "http://134.122.50.245:3000/",
          OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
               .setQuery({
               "user_id": USER_ID,
               "username": Alias,
               "friendsList": FrinedsID,
               "color": ColoRR,
               "avatar": Avatar,
             }) .build(),

        );

        socket!.connect();
        socket!.io..disconnect()..connect();

        socket!.onConnect((data) {
          print(data);
          print("Connected");
        } );

        socket!.onConnectError((data) {
          print("onConnectError");
          print(data);
        });

  }


  void Disconnect(){
   socket!.disconnect();
  }


  @override
  void dispose() {
  super.dispose();
  WidgetsBinding.instance?.removeObserver(this);
  controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    BackGroundCounter = 0;
    AllBubblesStatus = List.filled(100000,0);
    AllBubblesStatusTry = List.filled(10000,true);
    AllNearBubblesStatusTry = List.filled(10000,true);
    AllBubblesIDS = List.filled(10000,0);
    _TopBarBloc.add(GetProfile());
    DiditONCE =true;
    WidgetsBinding.instance?.addObserver(this);
    _TopBarBloc.add(GetFreinds());
    _TopBarBloc.add(GetBadge());
    if (widget.GOtoDirect==5){
      _TopBarBloc.add(
          ChangePAGEINDEX((b) =>  b
            ..num = 0
          ));
    }
    // timer23 = Timer.periodic(const Duration(seconds: 10), (Timer t)async{
    //   return _TopBarBloc.add(GetBadge());
    // });
  }


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  WillPopScope(
        onWillPop: ()async{
          print(BackGroundCounter);
          if (BackGroundCounter==0) {
            BackGroundCounter++;
            return false;
          } else if  (BackGroundCounter==1) {
           await MoveToBackground.moveTaskToBack();
           //  var _androidAppRetain = MethodChannel("android_app_retain");
            //   _androidAppRetain.invokeMethod("sendToBackground");
          }
          return false;
        },
    child:BlocBuilder(
        bloc: _TopBarBloc,
        builder: (BuildContext Context, TopBarState state) {

          if (state.GetprofileSuccess! && DiditONCE && state.success!){
            Alias = state.ProfileDate!.user!.alias.toString();
            USER_ID = state.ProfileDate!.user!.id!;
            Avatar = state.ProfileDate!.user!.avatar!;
            ColoRR = state.ProfileDate!.user!.background_color!;
            for(int i=0;i<state.GetFriends!.friends!.length;i++){
              FrinedsID!.add(state.GetFriends!.friends![i].id!);
            }
            connect();


            print("called function connect");
            DiditONCE = false;
          }

          // if (widget.GOtoDirect==5){
          //   state.Index1==true
          //       ? _TopBarBloc.add(ChangeIndex1())
          //       :null;
          //
          //   state.Index2==false
          //       ? _TopBarBloc.add(ChangeIndex2())
          //       :null;
          //
          //   state.Index3==true
          //       ? _TopBarBloc.add(ChangeIndex3())
          //       :null;
          //
          //   state.Index4==true
          //       ? _TopBarBloc.add(ChangeIndex4())
          //       :null;
          // }

          return  Scaffold(
              key: _scaffoldKey,
              body:  SafeArea(
                child: Stack(
                  children: [
                  //  _buildScreens[state.INDEX!],
                    state.INDEX==0?
                    HomeScreen():

                    Container(
                      width: w,
                      height: h,
                      child: PageView.builder(
                          allowImplicitScrolling: true,
                          controller: controller,
                          onPageChanged: (int index) {
                            if(index==0){


                              state.Index2==false
                                  ? _TopBarBloc.add(ChangeIndex2())
                                  :null;

                              state.Index3==true
                                  ? _TopBarBloc.add(ChangeIndex3())
                                  :null;

                              state.Index4==true
                                  ? _TopBarBloc.add(ChangeIndex4())
                                  :null;



                            }else if (index==1){

                              state.Index2==true
                                  ? _TopBarBloc.add(ChangeIndex2())
                                  :null;

                              state.Index3==false
                                  ? _TopBarBloc.add(ChangeIndex3())
                                  :null;

                              state.Index4==true
                                  ? _TopBarBloc.add(ChangeIndex4())
                                  :null;
                            }else if (index==2){



                              state.Index2==true
                                  ? _TopBarBloc.add(ChangeIndex2())
                                  :null;

                              state.Index3==true
                                  ? _TopBarBloc.add(ChangeIndex3())
                                  :null;

                              state.Index4==false
                                  ? _TopBarBloc.add(ChangeIndex4())
                                  :null;

                            }
                            //
                            // _pageController.addListener((){
                            //
                            //   //   Future.delayed(Duration(milliseconds: 200),(){
                            //   if (index == 0 && _pageController.position.atEdge &&state.Index1!) {
                            //     state.MakeScroll!?_TopBarBloc.add(MakrScroll()):null;
                            //     print("state.MakeScroll ${state.MakeScroll}  at edge");
                            //
                            //   }else{
                            //     state.MakeScroll!?null:_TopBarBloc.add(MakrScroll());
                            //   }
                            //   // });
                            // });



                          },
                          itemCount: buildScreens.length,
                          itemBuilder: (context, index) {
                            return buildScreens[index];
                          }),
                    ),

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
                              //buildScreens.add(HomeScreen());


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
                                //   duration: const Duration(milliseconds: 200),
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
                                        state.Index2==false
                                            ? _TopBarBloc.add(ChangeIndex2())
                                            :null;

                                        state.Index3==true
                                            ? _TopBarBloc.add(ChangeIndex3())
                                            :null;

                                        state.Index4==true
                                            ? _TopBarBloc.add(ChangeIndex4())
                                            :null;

                                        Selected = List.filled(
                                            2,
                                            0);
                                        print(Selected);

                                        Future.delayed(const Duration(milliseconds: 200), () {

                                          controller.animateToPage(
                                            0,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );


                                        });
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
                                     //  _TopBarBloc.add(ClearBadge());
                                        state.Index2==true
                                            ? _TopBarBloc.add(ChangeIndex2())
                                            :null;

                                        state.Index3==false
                                            ? _TopBarBloc.add(ChangeIndex3())
                                            :null;

                                        state.Index4==true
                                            ? _TopBarBloc.add(ChangeIndex4())
                                            :null;
                                        Future.delayed(const Duration(milliseconds: 200), () {

                                          controller.animateToPage(
                                            1,
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );

                                        });
                                      },
                                      child: Container(
                                        height: h / 13,
                                        //  color: Colors.black,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [

                                                SvgPicture.asset(
                                                    "Assets/images/Vector.svg",
                                                    width: h / 30,
                                                    color: state.Index3!
                                                        ? const Color(0xffCF6D38)
                                                        :ColorS.tertiary
                                                ),
                                                state.success!?
                                                state.Getbadge!.count!=0?
                                                CircleAvatar(
                                                  radius: 7,
                                                  backgroundColor: Colors.red,
                                                  child: Center(
                                                    child: Text(state.Getbadge!.count.toString(),style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                    ),),
                                                  ),
                                                )
                                                        :Text("")
                                                    :Text(""),
                                              ],

                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      //Profil.ChangeFromFrinedScreen(false);
                                      //  Profile().ChangeProfileStatus( false);

                                      _TopBarBloc.add(
                                          ChangePAGEINDEX((b) =>  b
                                            ..num = 3
                                          )
                                      );
                                      state.Index2==true
                                          ? _TopBarBloc.add(ChangeIndex2())
                                          :null;

                                      state.Index3==true
                                          ? _TopBarBloc.add(ChangeIndex3())
                                          :null;

                                      state.Index4==false
                                          ? _TopBarBloc.add(ChangeIndex4())
                                          :null;
                                      Future.delayed(const Duration(milliseconds: 200), () {


                                        controller.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                        );

                                      });



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
