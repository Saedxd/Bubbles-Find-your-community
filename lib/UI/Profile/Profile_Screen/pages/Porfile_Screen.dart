// ignore_for_file: file_names

import 'package:bubbles/App/app.dart';
import 'package:bubbles/App/bloc/App_bloc.dart';
import 'package:bubbles/App/bloc/appbloc.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/DirectMessages/DirectMessages_Screen/pages/DirectMessages_screen.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/Home_Screen/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Login_Page.dart';

import 'package:bubbles/UI/Profile/BecomeCreator_screen/pages/BecomeCreator_screen.dart';
import 'package:bubbles/UI/Profile/Challenges_Screen/pages/Challenges_Screen.dart';
import 'package:bubbles/UI/Profile/FindFriends_Screen/pages/FindFriends_Screen.dart';
import 'package:bubbles/UI/Profile/Followed_Screen/pages/Followed_Screen.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_bloc.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_event.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/bloc/profile_state.dart';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/VerifyProfile.dart';
import 'package:bubbles/UI/Profile/Saved_Screen/Pages/SavedBubbles_Screen.dart';
import 'package:bubbles/UI/Profile/Settings_screen/pages/Settings_screen.dart';
import 'package:bubbles/core/Colors/constants.dart';

import 'package:bubbles/core/theme/theme_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:theme_manager/theme_manager.dart';

import 'ChangeAvatar.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

bool GOtoFrined = false;

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _BoiController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _ProfileBloc = sl<ProfileBloc>();
  final pref = sl<IPrefsHelper>();


  HomeScreen Instance = HomeScreen();
  MyTheme theme = MyTheme();
  MyApp app = MyApp();
  Login login = Login();
  late FocusNode FoucesNodeUserName;
  late FocusNode FoucesNodeBoi;
  bool selected1 = false;
  XFile? Image2;
  bool selected2 = false;
  bool status2 = false;
  bool SecureInput_pass = false;
  bool SecureInput_pass2 = false;
  bool DIALOG = false;
  bool? DiditOnce = true;
  bool ShowText = true;
  bool done = false;
  bool Status = false;
  bool? theme2;
  bool diditonce = false;
  bool Done = false;
  int BackgroundColor = 0;

  Future<void> SetThemeOn() async {
    await pref.SetThemeON();
  }

  Future<void> GetTHEME() async {
    theme2 = await pref.GetThemeON();
    Status = theme2!;
    _ProfileBloc.add(Toggle((b) => b..Status = theme2));
    done = true;
  }

  void setAsLight() => ThemeManager.of(context)
      .setBrightnessPreference(BrightnessPreference.light);

  void setAsDark() => ThemeManager.of(context)
      .setBrightnessPreference(BrightnessPreference.dark);

  @override
  void dispose() {
    super.dispose();
    FoucesNodeUserName.dispose();
    FoucesNodeBoi.dispose();
    _UsernameController.dispose();
    _BoiController.dispose();
  }

  @override
  void initState() {
    FoucesNodeUserName = FocusNode();
    FoucesNodeBoi = FocusNode();
    super.initState();
    GetTHEME();
    _ProfileBloc.add(GetProfile());
    diditonce = true;
  }




  alreatDialogBuilder(
    BuildContext Context,
    double h,
    double w,
    profileState state,
  ) async {
    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(h / 120),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: w / 1.2,
                      height: h / 1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: w / 1.2,
                            height: h / 2.22,
                            child: Hero(
                                tag: "Avatar",
                                child: CircleAvatar(
                                  backgroundColor: Color(BackgroundColor),
                                  backgroundImage: NetworkImage(state
                                      .ProfileDate!.user!.avatar
                                      .toString()),
                                  radius: h / 11,
                                )),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          );
        });
  }
//
  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: BlocBuilder(
          bloc: _ProfileBloc,
          builder: (BuildContext Context, profileState state) {
            if (state.success! &&
                state.GetprofileSuccess! &&
                diditonce == true) {
              String value =
                  state.ProfileDate!.user!.background_color.toString();
              var myInt = int.parse(value);
              BackgroundColor = myInt;
              Done = true;
              diditonce = false;
            }


            return Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                body: Stack(
                  children: [
                    SafeArea(
                      child: Container(
                        child: Stack(
                          children: [
                            // !state.isLoadingProfileUpdate!?
                          Column(children: [
                                    SizedBox(
                                      height: h / 17,
                                    ),
                                    Text(""),
                                    Text(""),
                                    (state.success == true)
                                        ? Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: w,
                                              height: h / 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        dIALOG2(state);
                                                      },
                                                      child: Hero(
                                                        tag: "Avatar",
                                                        child:   Container(
                                                            width: w / 1.2,
                                                            height: h / 2.22,
                                                            margin: EdgeInsets.only(left: h/60),
                                                            child: CircleAvatar(
                                                              backgroundColor: Color(BackgroundColor),
                                                              backgroundImage: NetworkImage(state
                                                                  .ProfileDate!.user!.avatar
                                                                  .toString()
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: h/60),
                                                      height: h / 7,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Row(
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    state
                                                                        .ProfileDate!
                                                                        .user!
                                                                        .alias
                                                                        .toString(),
                                                                    style: _textthem.headlineLarge!.copyWith(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            23),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                  state
                                                                      .ProfileDate!
                                                                      .user!
                                                                      .serialnumber
                                                                      .toString(),
                                                                  style: _textthem
                                                                      .headlineLarge!
                                                                      .copyWith(
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontSize:
                                                                              16)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          margin: EdgeInsets.only(right: h/40),
                                                          width: w / 10,
                                                          height: h / 10,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  IconButton(
                                                                    icon: SvgPicture
                                                                        .asset(
                                                                      "Assets/images/Group 37.svg",
                                                                      color: const Color(0xffCF6D38),
                                                                      semanticsLabel:
                                                                          'Label',
                                                                      width:
                                                                          w / 8,
                                                                      height:
                                                                          h / 30,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      _UsernameController.text = state.ProfileDate!.user!.alias.toString();
                                                                      _BoiController.text= state.ProfileDate!.user!.bio.toString();

                                                                      dIALOG();
                                                                    },
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ))),
                                                ],
                                              ),
                                            ),
                                          )
                                        : state.isLoading == true
                                            ? Expanded(
                                                flex: 1,
                                                child: Container(
                                                    width: w,
                                                    height: h / 3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                            child: listLoader(
                                                                context:
                                                                    context)),
                                                      ],
                                                    )))
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      width: w,
                                                      height: h / 10,
                                                      child:
                                                          const Text("Error"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                    ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: Expanded(
                                        flex: 3,
                                        child: Container(
                                          width: w,
                                          height: h / 1.51,
                                          child: SingleChildScrollView(
                                            physics: BouncingScrollPhysics(
                                                parent:
                                                    AlwaysScrollableScrollPhysics()),
                                            child: Column(
                                              children: [
                                                Column(
                                                  children: const [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
            //                                     Stack(
            // children: [
            //   Container(
            //       width: w / 1.2,
            //       height: h / 8,
            //       decoration: BoxDecoration(
            //         borderRadius : BorderRadius.only(
            //           topLeft: Radius.circular(36.5),
            //           topRight: Radius.circular(36.5),
            //           bottomLeft: Radius.circular(36.5),
            //           bottomRight: Radius.circular(36.5),
            //         ),
            //         boxShadow : [BoxShadow(
            //             color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            //             offset: Offset(0,0),
            //             blurRadius: 10
            //         )],
            //         color : Color.fromRGBO(148, 38, 87, 1),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text(""),
            //         Text(""),
            //         Text(""),
            //         InkWell(
            //           onTap: (){
            //             // WidgetsBinding
            //             //   .instance!
            //             //   .addPostFrameCallback((_) =>
            //             //   Navigator
            //             //       .push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //       builder: (context) =>
            //             //           Challenges(),
            //             //     ),
            //             //   ).then((value) {
            //             //     _ProfileBloc.add(GetProfile());
            //             //   }));
            //
            //       },
            //           child: Text('earn', textAlign: TextAlign.center, style: TextStyle(
            //               color: Color.fromRGBO(255, 255, 255, 1),
            //               fontFamily: 'Red Hat Display',
            //               fontSize: 23,
            //               letterSpacing: 0,
            //               fontWeight: FontWeight.w600,
            //               height: 1
            //           ),),
            //         )
            //       ],
            //       ),
            //   ),
            //   Container(
            //     width: w / 1.7,
            //     height: h / 8,
            //     decoration: BoxDecoration(
            //       borderRadius:
            //       BorderRadius.only(
            //         topLeft:
            //         Radius.circular(
            //             36.5),
            //         topRight:
            //         Radius.circular(
            //             36.5),
            //         bottomLeft:
            //         Radius.circular(
            //             36.5),
            //         bottomRight:
            //         Radius.circular(
            //             36.5),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Color.fromRGBO(
            //                 0,
            //                 0,
            //                 0,
            //                 0.4000000059604645),
            //             offset:
            //             Offset(0, 0),
            //             blurRadius: 10)
            //       ],
            //       color: COLOR.onPrimary,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text(""),
            //         SvgPicture.asset(
            //           "Assets/images/BeCoins(1).svg",
            //           width: w / 5,
            //           height: h / 12,
            //         ),
            //      Text("Comming soon",style: TextStyle(
            //          color: Colors.black
            //          ,fontSize: 12
            //      ),)
            //      //    state.success!?
            //      //
            //      // //    Text(
            //      // // //     state.ProfileDate!.user!.points!.toString()
            //      // //      , textAlign: TextAlign.center, style: TextStyle(
            //      // //        color: Color.fromRGBO(47, 47, 47, 1),
            //      // //        fontFamily: 'Red Hat Display',
            //      // //        fontSize: 25,
            //      // //        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            //      // //        fontWeight: FontWeight.w900,
            //      // //        height: 1
            //      // //    ),)
            //      //        : state.isLoading == true
            //      //        ? Container(
            //      //            child: Row(
            //      //              mainAxisAlignment:
            //      //              MainAxisAlignment
            //      //                  .center,
            //      //              children: [
            //      //                Center(
            //      //                    child: listLoader(
            //      //                        context:
            //      //                        context)),
            //      //              ],
            //      //            ))
            //      //    :Container(),
            //      //    Text(""),
            //       ],
            //     ),
            //   ),
            // ],
            //
            //                                     ),
                                                    //
                                                    // Row(
                                                    //     mainAxisAlignment:
                                                    //         MainAxisAlignment
                                                    //             .spaceAround,
                                                    //     children: [
                                                    //
                                                    //       InkWell(
                                                    //         onTap: () {
                                                    //
                                                    //         },
                                                    //         child: Container(
                                                    //           width: w / 4.4,
                                                    //           height: h / 20,
                                                    //           decoration:
                                                    //               const BoxDecoration(
                                                    //             borderRadius:
                                                    //                 BorderRadius
                                                    //                     .only(
                                                    //               topLeft: Radius
                                                    //                   .circular(
                                                    //                       50),
                                                    //               topRight: Radius
                                                    //                   .circular(
                                                    //                       50),
                                                    //               bottomLeft: Radius
                                                    //                   .circular(
                                                    //                       50),
                                                    //               bottomRight: Radius
                                                    //                   .circular(
                                                    //                       50),
                                                    //             ),
                                                    //             color: Color
                                                    //                 .fromRGBO(
                                                    //                     148,
                                                    //                     38,
                                                    //                     87,
                                                    //                     1),
                                                    //           ),
                                                    //           child:
                                                    //               const Center(
                                                    //             child: Text(
                                                    //               'Earn',
                                                    //               textAlign:
                                                    //                   TextAlign
                                                    //                       .center,
                                                    //               style: TextStyle(
                                                    //                   color: Color.fromRGBO(
                                                    //                       234,
                                                    //                       234,
                                                    //                       234,
                                                    //                       1),
                                                    //                   fontFamily:
                                                    //                       'Sofia Pro',
                                                    //                   fontSize:
                                                    //                       20,
                                                    //                   letterSpacing:
                                                    //                       0 /*percentages not used in flutter. defaulting to zero*/,
                                                    //                   fontWeight:
                                                    //                       FontWeight
                                                    //                           .normal,
                                                    //                   height:
                                                    //                       1),
                                                    //             ),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //     ])
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // InkWell(
                                                //   onTap: () async {
                                                //     // if (state.ProfileDate!.user!
                                                //     //             .is_verify ==
                                                //     //         2 ||
                                                //     //     state.ProfileDate!.user!
                                                //     //             .is_verify ==
                                                //     //         3) {
                                                //     //   WidgetsBinding.instance!
                                                //     //       .addPostFrameCallback(
                                                //     //           (_) => Navigator
                                                //     //                   .push(
                                                //     //                 context,
                                                //     //                 MaterialPageRoute(
                                                //     //                   builder:
                                                //     //                       (context) =>
                                                //     //                           VerifyProfile(),
                                                //     //                 ),
                                                //     //               ));
                                                //     // } else if (state
                                                //     //         .ProfileDate!
                                                //     //         .user!
                                                //     //         .is_verify ==
                                                //     //     1) {
                                                //     //   Page2().method(
                                                //     //       _scaffoldKey
                                                //     //           .currentContext!,
                                                //     //       "Verification Message",
                                                //     //       """Your Already Verified!""",
                                                //     //       "back");
                                                //     // } else if (state
                                                //     //         .ProfileDate!
                                                //     //         .user!
                                                //     //         .is_verify ==
                                                //     //     0) {
                                                //     //   Page2().method(
                                                //     //       _scaffoldKey
                                                //     //           .currentContext!,
                                                //     //       "Verification Message",
                                                //     //       """We have gotten your verification request its under view!""",
                                                //     //       "back");
                                                //     // }
                                                //   },
                                                //   child: Container(
                                                //     width: w / 1.2,
                                                //     height: h / 13,
                                                //     decoration:
                                                //         const BoxDecoration(
                                                //       borderRadius:
                                                //           BorderRadius.only(
                                                //         topLeft:
                                                //             Radius.circular(
                                                //                 21.5),
                                                //         topRight:
                                                //             Radius.circular(
                                                //                 21.5),
                                                //         bottomLeft:
                                                //             Radius.circular(
                                                //                 21.5),
                                                //         bottomRight:
                                                //             Radius.circular(
                                                //                 21.5),
                                                //       ),
                                                //       boxShadow: [
                                                //         BoxShadow(
                                                //             color: Color.fromRGBO(
                                                //                 0,
                                                //                 0,
                                                //                 0,
                                                //                 0.4000000059604645),
                                                //             offset:
                                                //                 Offset(0, 0),
                                                //             blurRadius: 2)
                                                //       ],
                                                //       color: Color(0xffCF6D38),
                                                //     ),
                                                //     child: Center(
                                                //       child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceAround,
                                                //         children: [
                                                //           Text('  Verify Profile',
                                                //               textAlign:
                                                //                   TextAlign
                                                //                       .left,
                                                //               style: _textthem
                                                //                   .headline1!
                                                //                   .copyWith(
                                                //                       fontWeight:
                                                //                           FontWeight
                                                //                               .w400,
                                                //                       fontSize:
                                                //                           25)),
                                                //
                                                //           Text(""),
                                                //           Text("Comming soon",style: TextStyle(
                                                //               color: Colors.white
                                                //               ,fontSize: 12
                                                //           ),),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                !state.isLoading!?
                                                state
                                                    .ProfileDate!
                                                    .user!
                                                    .is_creator !=
                                                    1?
                                                InkWell(
                                                  onTap: () {
                                                    // CommingSoonPopup(context,h,w,"We have gotten your Request to beCreator its under view.. thanks for your patients!"
                                                    //     ,"Sounds good!",15);
                                                    if (state.ProfileDate!.user!
                                                                .is_creator ==
                                                            2 ||
                                                        state.ProfileDate!.user!
                                                                .is_creator ==
                                                            3) {
                                                      WidgetsBinding.instance!
                                                          .addPostFrameCallback(
                                                              (_) => Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              CreatorScreen(),
                                                                    ),
                                                                  ));
                                                    } else if (state
                                                            .ProfileDate!
                                                            .user!
                                                            .is_creator ==
                                                        1) {
                                                      CommingSoonPopup(context,h,w,"Your Already Creator!","Yep",24);
                                                      // Page2().method(
                                                      //     _scaffoldKey
                                                      //         .currentContext!,
                                                      //     "Creator Message",
                                                      //     """""",
                                                      //     "back");
                                                    } else if (state
                                                            .ProfileDate!
                                                            .user!
                                                            .is_creator ==
                                                        0) {
                                                      CommingSoonPopup(context,h,w,"We have got your request to be creator its under review, Thanks for your patients!"
                                                          ,"Sounds good!",15);
                                                      // Page2().method(
                                                      //     _scaffoldKey
                                                      //         .currentContext!,
                                                      //     "Creator Service Message",
                                                      //     """We have gotten your Request to beCreator its under view.. thanks for your patients!""",
                                                      //     "back");
                                                    }
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      21.5),
                                                              topRight: Radius
                                                                  .circular(
                                                                      21.5),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      21.5),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          21.5),
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.4000000059604645),
                                                                  offset:
                                                                      Offset(
                                                                          0, 0),
                                                                  blurRadius: 2)
                                                            ],
                                                            color: Color(
                                                                0xff942657)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                            '  Become a Creator',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                            )),
                                                        Text(""),
                                                        Text(""),
                                                      ],
                                                    ),
                                                  ),
                                                ):Container():Container(),
                                                SizedBox(height: h/20,),
                                                InkWell(
                                                  onTap: () {
                                                    CommingSoonPopup(context,h,w,"Coming Soon!","Can't wait",24);
                                            },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          topLeft:
                                                          Radius.circular(
                                                              21.5),
                                                          topRight:
                                                          Radius.circular(
                                                              21.5),
                                                          bottomLeft:
                                                          Radius.circular(
                                                              21.5),
                                                          bottomRight:
                                                          Radius.circular(
                                                              21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                              const Offset(
                                                                  0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                      children: [
                                                        Text('     Send us your feedback', textAlign: TextAlign.left,
                                                        style: _textthem
                                                        .headline1!
                                                        .copyWith(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                      fontSize: 24,
                                                      color:
                                                      Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    )),
                                                        Text(""),
                                                        SvgPicture.asset("Assets/images/sendFeedBack.svg"),
                                                        Text(""),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                             SizedBox(height: h/20,),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  width: w / 1.2,
                                                  height: h / 13,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                21.5),
                                                        topRight:
                                                            Radius.circular(
                                                                21.5),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                21.5),
                                                        bottomRight:
                                                            Radius.circular(
                                                                21.5),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 12)
                                                      ],
                                                      color: COLOR.onPrimary),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text('    Night Mode',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: _textthem
                                                              .headline1!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 25,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                          )),
                                                      const Text(""),
                                                      done
                                                          ? Center(
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                child:
                                                                    FlutterSwitch(
                                                                  activeColor:
                                                                      const Color(
                                                                          0xff303030),
                                                                  inactiveColor:
                                                                      const Color(
                                                                          0xffC4C4C4),
                                                                  inactiveToggleColor:
                                                                      const Color(
                                                                          0xffCF6D38),
                                                                  activeToggleColor:
                                                                      const Color(
                                                                          0xffCF6D38),
                                                                  width:
                                                                      w / 5.0,
                                                                  height:
                                                                      h / 20.0,
                                                                  valueFontSize:
                                                                      25.0,
                                                                  toggleSize:
                                                                      w / 11.0,
                                                                  value: state
                                                                      .ToggleStatus!,
                                                                  borderRadius:
                                                                      20.0,
                                                                  padding: 0.0,
                                                                  showOnOff:
                                                                      false,
                                                                  onToggle:
                                                                      (val) async {
                                                                        CommingSoonPopup(context,h,w,"Coming Soon!","Can't wait",24);
                                                                    // if (done) {
                                                                    //   theme2 =!theme2!;
                                                                    //
                                                                    //
                                                                    //   _ProfileBloc.add(Toggle((b) => b
                                                                    //     ..Status = theme2));
                                                                    //
                                                                    //   print(  theme2);
                                                                    //
                                                                    //
                                                                    //      if (!state.ToggleStatus!) {
                                                                    //
                                                                    //
                                                                    //     SetThemeOn();
                                                                    //     setAsDark();
                                                                    //
                                                                    //   } else if (state.ToggleStatus!) {
                                                                    //
                                                                    //     print("LIGHT");
                                                                    //     SetThemeOn();
                                                                    //     setAsLight();
                                                                    //   }
                                                                    //
                                                                    // }
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                          : Text("")
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    WidgetsBinding.instance!
                                                        .addPostFrameCallback(
                                                            (_) =>
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ShowCaseWidget(
                                                                              builder: Builder(
                                                                            builder: (context) =>
                                                                                const FindFriends_screen(),
                                                                          ))),
                                                                ));
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          topRight:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                            '   Add/Find Friends',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            )),
                                                        Text(""),
                                                        Text(""),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    WidgetsBinding.instance!
                                                        .addPostFrameCallback(
                                                            (_) =>
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Settings()),
                                                                ));
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          topRight:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text('Settings',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            )),
                                                        Text(""),
                                                        Text(""),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: const [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(""),
                                                    Text(""),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),

                                                InkWell(
                                                  onTap: () {
                                                    WidgetsBinding.instance!
                                                        .addPostFrameCallback((_) => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Friendlist(is_WithoutTopBar: true,)
                                                        )));
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          topRight:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text('Friend list',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            )),
                                                        Text(""),
                                                        Text(""),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (state.success!) {
                                                      WidgetsBinding.instance!
                                                          .addPostFrameCallback(
                                                            (_) =>
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                      context) =>
                                                                      SavedBubbles(
                                                                        User_id: state
                                                                            .ProfileDate!
                                                                            .user!
                                                                            .id!,)),
                                                            ),
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          topRight:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [

                                                        Text('  Saved Bubbles',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            )),
                                                        Text(""),
                                                        Text("",style: TextStyle(
                                                            color: Colors.black
                                                            ,fontSize: 12
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    CommingSoonPopup(context,h,w,"Coming Soon!","Can't wait",24);
                                                  },
                                                  child: Container(
                                                    width: w / 1.2,
                                                    height: h / 13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          topRight:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  21.5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  21.5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              offset:
                                                                  const Offset(
                                                                      0, 0),
                                                              blurRadius: 12)
                                                        ],
                                                        color: COLOR.onPrimary),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text('Subscribed',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: _textthem
                                                                .headline1!
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 25,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            )),
                                                        Text(""),
                                                        Text("",style: TextStyle(
                                                            color: Colors.black
                                                            ,fontSize: 12
                                                        ),)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),


                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ])
                                // :Text("")
                          ],
                        ),
                      ),
                    ),
                    // state.isLoadingProfileUpdate == true
                    //     ? Center(child: listLoader(context: context))
                    //     : SizedBox(),

                  ],
                ));
          }),
    );
  }

  CommingSoonPopup(
      BuildContext Context,
      double h,
      double w,
      String Value,
      String buttonValue,
      int FontSize
      ) async {
    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098),
                    topRight: Radius.circular(8.285714149475098),
                    bottomLeft: Radius.circular(8.285714149475098),
                    bottomRight: Radius.circular(8.285714149475098),
                  ),
                  color: Colors.transparent,
                ),


                child: Stack(
                  children: [

                    Positioned(
                      top: h/12.5,
                      child: Container(
                        width: w/1.4,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),


                                Center(
                                  child: Text(Value,
                                    textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: FontSize.toDouble(),
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),),
                                ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: h/15.5,
                                      width: w/2,
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
                                        Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 14,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w400,
                                            height: 1
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: h/8,
                      bottom: h/5,
                      child: SvgPicture.asset(
                        "Assets/images/widget.svg",
                        width: 90,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
  }
  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

  Future<void> dIALOG() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {



          TextTheme _TextTheme = Theme.of(context).textTheme;
          ColorScheme ColorS = Theme.of(context).colorScheme;
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(children: [
              Container(
                color: const Color(0xff942657),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(""),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Edit Username',
                                  textAlign: TextAlign.left,
                                  style: _TextTheme.subtitle1!.copyWith(
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w300)),
                              Text(""),
                              Text(""),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(""),
                          Container(
                              width: w / 1.2,
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formkey1,
                                child: TextFormField(
                                  focusNode: FoucesNodeUserName,
                                  keyboardAppearance: Brightness.dark,
                                  textInputAction: TextInputAction.next,
                                  controller: _UsernameController,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {
                                    FoucesNodeBoi.requestFocus();
                                  },
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required"),
                                    MaxLengthValidator(15,
                                        errorText: "Maximum Characters is 15"),
                                  ]),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xff303030),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xff303030),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xff303030),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12),
                                      hintText: "Alias",
                                      hintStyle: _TextTheme.headline6),
                                  keyboardType: TextInputType.text,
                                  // obscureText: SecureInput_pass,
                                ),
                              )),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(""),
                          Text(""),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Edit Bio',
                                  textAlign: TextAlign.left,
                                  style: _TextTheme.subtitle1!.copyWith(
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w300)),
                              Text(""),
                              Text(""),
                              Text(""),
                            ],
                          ),
                          const Text(""),
                          Container(
                              width: w / 1.2,
                              height: h / 2.5,
                              child: Form(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                key: _formkey2,
                                child: TextFormField(
                                  maxLines: 18,
                                  focusNode: FoucesNodeBoi,
                                  keyboardAppearance: Brightness.dark,
                                  textInputAction: TextInputAction.next,
                                  controller: _BoiController,
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required"),
                                  ]),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff303030),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff303030),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: "Boi",
                                    hintStyle: _TextTheme.headline6,
                                    filled: true,
                                    fillColor: Color(0xff303030),
                                    contentPadding: const EdgeInsets.only(
                                        top: 20, left: 10),
                                  ),
                                  keyboardType: TextInputType.text,
                                  // obscureText: SecureInput_pass,
                                ),
                              )),
                        ],
                      ),
                      const Text(""),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: w / 5,
                              height: h / 20,
                              child: Center(
                                child: Text('Cancel',
                                    textAlign: TextAlign.left,
                                    style: _TextTheme.subtitle1!.copyWith(
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                          const Text(""),
                          InkWell(
                            onTap: () {
                              if (_formkey2.currentState!.validate() &&
                                  _formkey1.currentState!.validate()) {
                                Navigator.pop(context);
                                diditonce = true;
                                _ProfileBloc.add(UpdateProfile((b) => b
                                  ..Boi = _BoiController.text
                                  ..Username = _UsernameController.text));
                                _ProfileBloc.add(GetProfile());
                              }
                            },
                            child: Container(
                              // color: Colors.black87,
                              width: w / 5,
                              height: h / 20,
                              child: Center(
                                child: Text('Save',
                                    textAlign: TextAlign.left,
                                    style: _TextTheme.subtitle1!.copyWith(
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  Future<void> dIALOG2(profileState state) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Color.fromRGBO(148, 38, 87, 1),
            ),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      alreatDialogBuilder(context, h, w, state);
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'View Avatar',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: w,
                  height: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      WidgetsBinding.instance!.addPostFrameCallback((_) =>
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeAvatarScreen(),
                                  ))
                              .then((value) =>   _ProfileBloc.add(GetProfile())));
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Change Avatar',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
