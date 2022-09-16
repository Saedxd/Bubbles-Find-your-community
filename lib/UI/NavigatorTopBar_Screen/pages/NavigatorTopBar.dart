import 'dart:async';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_Event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_State.dart';
import 'package:bubbles/UI/Notifications/pages/Notifications_Screen.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Login_Page.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/Porfile_Screen.dart';
import 'package:bubbles/main.dart';
import 'package:bubbles/models/UserDataModel/User.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../Home/Home_Screen/pages/HomeScreen.dart';
import '../bloc/TopBar_bloc.dart';
import 'package:move_to_background/move_to_background.dart';


class NavigatorTopBar extends StatefulWidget {
   NavigatorTopBar({Key? key, this.GOtoDirect,required this.GotToHomeAndOpenPanel}) : super(key: key);
   bool GotToHomeAndOpenPanel = true;
  int? GOtoDirect = 0;
  @override
  State<NavigatorTopBar> createState() => _NavigatorTopBarState();
}

Timer? timer2;
Timer? timer23 ;
Socket? socket;

class _NavigatorTopBarState extends State<NavigatorTopBar>  with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController controller = PageController();
  Profile Profil =Profile();
  final pref = sl<IPrefsHelper>();
  final _TopBarBloc = sl<TopBarBloc>();
  int dot = 0;
  int BackGroundCounter = 0;
  bool DiditONCE = false;
  String ColoRR = "";
  int USER_ID = 0;
  int selected = 0;
  int PageIndex = 0;
  List<int>? FrinedsID=[];
  double User_lat = 0;
  double User_long = 0;
  final List<Widget> buildScreens = [
    const DirectMessages(),
    const Notifications(),
    Profile(),
  ];
bool DidItOnce = false;

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

  Future<void> GetUserData() async {

    User_lat = await pref.Getlat();
    User_long = await pref.GetLng();
    UserModel user = await pref.getUser();
    // print(user.user!.data!.id);
    // print("Gotten");

    id = user.data!.id!;
    Avatar = user.data!.avatar!;
    Alias = user.data!.alias!;
    Background_Color = user.data!.background_color!;
    IS_Creator = user.data!.is_creator!;
    boi = user.data!.bio!;

    // if (IS_Creator==1 && !DidItOnce){
    //   buildScreens.insert(2,   MyCreatorPage(),);
    //   DidItOnce = true;
    // }

    _TopBarBloc.add(Change_Is_Creator((b) => b..ChangeISCreator = IS_Creator==1));
  }

  @override
  void dispose() {
  super.dispose();
  WidgetsBinding.instance.removeObserver(this);
  controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    BackGroundCounter = 0;
    _TopBarBloc.add(GetProfile());
    DiditONCE =true;
    WidgetsBinding.instance.addObserver(this);
    _TopBarBloc.add(GetFreinds());
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
          }
          return false;
        },
    child:BlocBuilder(
        bloc: _TopBarBloc,
        builder: (BuildContext Context, TopBarState state) {

          if (state.GetprofileSuccess!){
            print("Success1");
            if (DiditONCE && state.success!) {
              print("Success2");
              for (int i = 0; i <   state.ProfileDate!.user!.interests!.length; i++) {
                Interests!.add(state.ProfileDate!.user!.interests![i].image.toString());

              }
              for(int i=0;i<state.GetFriends!.friends!.length;i++){
                FrinedsID!.add(state.GetFriends!.friends![i].id!);
              }
              connect();

              DiditONCE = false;
            }
          }

          else if (state.error=="Something went wrong") {
            if (state.GetFriends == null) {
              AllBubblesStatus = List.filled(100000, 0);
              AllBubblesJoinStatusTry = List.filled(10000, false);
              AllBubblesLeftStatusTry = List.filled(10000, true);
              AllNearBubblesStatusTry = List.filled(10000, true);
              AllBubblesIDS = List.filled(10000, 0);
              setlogout();
              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>
                          Login()), (Route<dynamic> route) => false));
            }
          }


          return  Scaffold(
              key: _scaffoldKey,
              body:  SafeArea(
                child: Stack(
                  children: [
                  //  _buildScreens[state.INDEX!],
                    state.INDEX==0?
                    HomeScreen(OpenPanel:false):

                    Container(
                      width: w,
                      height: h,
                      child:ScrollConfiguration(
                        behavior: MyBehavior(),
                        child:  PageView.builder(
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
                              state.Index5==true
                                  ? _TopBarBloc.add(ChangeIndex5())
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
                              state.Index5==true
                                  ? _TopBarBloc.add(ChangeIndex5())
                                  :null;


                            }

                            else if (index==2){
                              state.Index2==true
                                  ? _TopBarBloc.add(ChangeIndex2())
                                  :null;

                              state.Index3==true
                                  ? _TopBarBloc.add(ChangeIndex3())
                                  :null;

                              state.Index4==true
                                  ? _TopBarBloc.add(ChangeIndex4())
                                  :null;
                              state.Index5==false
                                  ? _TopBarBloc.add(ChangeIndex5())
                                  :null;

                            //  todo : under is wanted for Creator
                            //   state.Index2==true
                            //       ? _TopBarBloc.add(ChangeIndex2())
                            //       :null;
                            //
                            //   state.Index3==true
                            //       ? _TopBarBloc.add(ChangeIndex3())
                            //       :null;
                            //
                            //   state.Index4==false
                            //       ? _TopBarBloc.add(ChangeIndex4())
                            //       :null;
                            //   state.Index5==true
                            //       ? _TopBarBloc.add(ChangeIndex5())
                            //       :null;
                            }else if (index==3){



                              state.Index2==true
                                  ? _TopBarBloc.add(ChangeIndex2())
                                  :null;

                              state.Index3==true
                                  ? _TopBarBloc.add(ChangeIndex3())
                                  :null;

                              state.Index4==true
                                  ? _TopBarBloc.add(ChangeIndex4())
                                  :null;
                              state.Index5==false
                                  ? _TopBarBloc.add(ChangeIndex5())
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
                          })),
                    ),

                    Container(
                      width: w,
                      height: h / 13,

                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(
                          // topLeft:  Radius.circular(0),
                          // topRight:  Radius.circular(0),
                          bottomLeft:   Radius.circular(h/30),
                          bottomRight:   Radius.circular(h/30),
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
                                print(h);
                                print(w);
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

                                state.Index5==true
                                    ? _TopBarBloc.add(ChangeIndex5())
                                    :null;

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
                          width:
                              w/3,
                          // state.is_Creator!? w / 2.5:w/3,
                            child: Stack(
                            children: [
                              Row(
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
                                          state.Index5==true
                                              ? _TopBarBloc.add(ChangeIndex5())
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
                                                ..num = 1
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

                                          state.Index5==true
                                              ? _TopBarBloc.add(ChangeIndex5())
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




                                                ],

                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                  // state.is_Creator!?
                                  // Expanded(
                                  //   child: InkWell(
                                  //       onTap: () {
                                  //
                                  //         _TopBarBloc.add(
                                  //             ChangePAGEINDEX((b) =>  b
                                  //               ..num = 3
                                  //             ));
                                  //         state.Index2==true
                                  //             ? _TopBarBloc.add(ChangeIndex2())
                                  //             :null;
                                  //
                                  //         state.Index3==true
                                  //             ? _TopBarBloc.add(ChangeIndex3())
                                  //             :null;
                                  //
                                  //         state.Index4==false
                                  //             ? _TopBarBloc.add(ChangeIndex4())
                                  //             :null;
                                  //         state.Index5==true
                                  //             ? _TopBarBloc.add(ChangeIndex5())
                                  //             :null;
                                  //
                                  //         // Selected = List.filled(
                                  //         //     2,
                                  //         //     0);
                                  //         // print(Selected);
                                  //         //
                                  //         Future.delayed(const Duration(milliseconds: 200), () {
                                  //
                                  //           controller.animateToPage(
                                  //             2,
                                  //             duration: const Duration(milliseconds: 300),
                                  //             curve: Curves.easeInOut,
                                  //           );
                                  //
                                  //
                                  //          });
                                  //       },
                                  //       child: Container(
                                  //           height: h / 13,
                                  //           child: Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //             children: [
                                  //               SvgPicture.asset(
                                  //                   "Assets/images/CreatorPage.svg",
                                  //                   width: h / 30,
                                  //                   color: state.Index4!
                                  //                       ? const Color(0xffCF6D38)
                                  //                       :ColorS.tertiary
                                  //               ),
                                  //             ],
                                  //           ))),
                                  // ):Container(),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        //Profil.ChangeFromFrinedScreen(false);
                                        //  Profile().ChangeProfileStatus( false);

                                        _TopBarBloc.add(
                                            ChangePAGEINDEX((b) =>  b
                                              ..num = 4
                                            )
                                        );
                                        state.Index2==true
                                            ? _TopBarBloc.add(ChangeIndex2())
                                            :null;

                                        state.Index3==true
                                            ? _TopBarBloc.add(ChangeIndex3())
                                            :null;

                                        state.Index4==true
                                            ? _TopBarBloc.add(ChangeIndex4())
                                            :null;
                                        state.Index5==false
                                            ? _TopBarBloc.add(ChangeIndex5())
                                            :null;
                                        Future.delayed(const Duration(milliseconds: 200), () {


                                          controller.animateToPage(
                                           2,
                                          //  3,
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
                                                color:  state.Index5!
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
                              !state.isLoading!
                                  ?state.BadgeCounter!.toString()!="0"?
                              Positioned(
                                top: h/50,
                                left: w/5.9,
                                child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Text(state.BadgeCounter.toString(),style: TextStyle(
                                      fontSize: 0.18.sp,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ),
                              ):Text("")
                                  :Text("")
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
  //
  // Future<void> GetUserData() async {
  //   User_lat = await pref.Getlat();
  //   User_long = await pref.GetLng();
  //   UserModel user = await pref.getUser();
  //   id = user.data!.id!;
  //   Avatar = user.data!.avatar!;
  //   Alias = user.data!.alias!;
  //   Background_Color = user.data!.background_color!;
  //   IS_Creator = user.data!.is_creator!;
  //   print(id);
  //   print(Avatar);
  //   print(Alias);
  //   print(Background_Color);
  //   print(IS_Creator);
  // }
  void connect()async{
    //https://chat.bubbles.app/
    //http://50.60.40.108:3000'
    //'https://50.60.40.102:3000',
    //'https://tranquil-castle-10002.herokuapp.com',
    //'https://chatapp.salnoyapp.store/',
    //'http://10.0.2.2:3000',
    //'http://50.60.40.102:3000',
    //'https://chat.bubbles.app',
    await GetUserData();
    socket =io(
  "http://134.122.50.245:3000/",
      //  "http://0.0.0.0:3000",
     //  "http://192.168.1.10:3000",
     // "http://50.60.40.106:3000",
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setQuery({
        "user_id": id,
        "username": Alias,
        "friendsList": FrinedsID,
        "color": Background_Color,
        "avatar": Avatar,
        "boi": boi,
        "interests": Interests,
        "serial": "saed",
        "serial_number": "saed123",
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


  Future<void> setlogout() async {
    await pref.logout();
  }
}
