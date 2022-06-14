// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';
import 'dart:developer';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_event.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_state.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../SignUp_Screen/pages/signup.dart';
import '../bloc/login_bloc.dart';
import 'Login_Page.dart';

class Login2 extends StatefulWidget {
  late final String Email;

  Login2({required this.Email});

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _PassController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final pref = sl<IPrefsHelper>();
  final _loginBloc = sl<loginBloc>();
  late FocusNode _PasswordFocusNode;
  bool SecureInput_pass = false;
  bool ISloading = false;
  bool Changed3 = false;
  bool DIALOG = false;
  bool? DiDitOnce = true;
  bool? isLogedin;
  String? Lat;
  String? Lng;
  String? token;
  var Fcmtoken;
  var email;
  var isLOgedin;
  final snackBar = SnackBar(
    content: const Text('Oppreation is Done Successfuly'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  // Future<void> getEmail() async {
  //   email = await pref.GetEmail();
  //   print(" User Email ??! : $email ");
  // }
  //
  // Future<void> getislogin() async {
  //   isLOgedin = await pref.getIsLogin();
  //   print("IS User logedin ??! : $isLOgedin ");
  //   // Navigate();
  // }
  //
  // Future<void> setislogin() async {
  //   await pref.setIsLogin();
  // }
  //
  // Future<void> Setpass(String pass) async {
  //   await pref.Setpass(pass);
  // }
  //
  // Future<void> gettoken() async {
  //   token = await pref.getToken();
  // }
  //

  Future<void> getFcmToken() async {
    FirebaseMessaging.instance.getToken().then((FcmTOken) {
      print(FcmTOken);
      print(Fcmtoken);
       Fcmtoken = FcmTOken;
      print(Fcmtoken);
    });
  }

  @override
  void initState() {
    super.initState();
    _PasswordFocusNode = FocusNode();
    getFcmToken();
  }


  @override
  void dispose() {
    super.dispose();
    _PasswordFocusNode.dispose();
    _PassController.dispose();
  }

  @override
  Widget build(BuildContext Context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;

    return WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
          onTap: () {
            Changed3 = false;
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocBuilder(
              bloc: _loginBloc,
              builder: (BuildContext context, loginState state) {
                if (state.success == true &&
                    _formkey1.currentState!.validate() &&
                    DiDitOnce == true) {
                  if (state.data!.msg == "success") {
                    pref.saveUser(
                      state.data as UserData,
                      state.data!.user!.token!,
                      true,
                    );
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return  NavigatorTopBar();
                          },
                        ),
                      );
                   //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                    DiDitOnce = false;
                  } else if (state.data!.msg == "Email or password incorrect") {
                    Future.delayed(Duration.zero, () {
                      Page2().method(_scaffoldKey.currentContext!, "Error",
                          state.data!.msg!, "Back");
                    });
                    DiDitOnce = false;
                  }
                }
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  key: _scaffoldKey,
                  backgroundColor: Color(0xff942657),
                  body: SafeArea(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());

                          },
                          child: Container(
                              width: w,
                              height: h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: w / 1.39,
                                    height: h / 13,
                                    child: SvgPicture.asset(
                                        "Assets/images/Logo.svg",
                                        fit: BoxFit.fill),
                                  ),
                                  Column(
                                    children: [
                                      const Text(""),
                                      Column(
                                        children: [
                                          Container(
                                              width: w / 1.30,
                                              height: h/10,
                                              child: Form(
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                key: _formkey1,
                                                child: TextFormField(
                                                  keyboardAppearance:
                                                      Brightness.dark,
                                                  textInputAction:
                                                      TextInputAction.next,

                                                  controller: _PassController,
                                                  onChanged: (value) {
                                                  },
                                                  onFieldSubmitted: (value) {
                                                  },
                                                  validator: MultiValidator([
                                                    RequiredValidator(
                                                        errorText: "Required"),
                                                  ]),
                                                  // cursorColor: Colors.black,
                                                  cursorHeight: 21,
                                                  // cursorRadius:const Radius.circular(2),
                                                //  textAlignVertical: TextAlignVertical.top,
                                              //    textAlignVertical: TextAlignVertical.center,
                                                  style: const TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.3 //Add this
                                                      ,
                                                      color: Colors.brown),
                                                  decoration: InputDecoration(

                                                      errorStyle: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.white,
                                                            width: 0.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.white,
                                                            width: 0.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,

                                                      contentPadding: EdgeInsets.only(left: h/100),
                                                      hintText: "Password",
                                                      hintStyle: _TextTheme.headline6!.copyWith(
                                                        fontSize: 3.6 *
                                                            SizeConfig
                                                                .blockSizeVertical!
                                                                .toDouble(),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: true,
                                                ),
                                              )),
                                          InkWell(
                                            onTap: () async {
                                              if (_formkey1.currentState!
                                                  .validate()) {
                                                bool result =
                                                    await InternetConnectionChecker()
                                                        .hasConnection;
                                                if (result == true) {
                                                  print(
                                                      'YAY! Free cute dog pics!');
                                                  _loginBloc
                                                      .add(PostLOgin((b) => b
                                                        ..Email = widget.Email
                                                        ..password =
                                                            _PassController.text
                                                        ..fcmToken = Fcmtoken));
                                                  DiDitOnce = true;
                                                } else {
                                                  print(
                                                      'No internet :( Reason:');
                                                  Page2().method(
                                                      _scaffoldKey
                                                          .currentContext!,
                                                      "Connection Failed",
                                                      """Something went Wrong 
                                                            Check your internet Connection""",
                                                      "back");
                                                }
                                              }
                                            },
                                            child: Container(
                                                width: w / 1.30,
                                                height: h / 13.9,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0,
                                                            0,
                                                            0,
                                                            0.15000000596046448),
                                                        offset: Offset(0, 0),
                                                        blurRadius: 6)
                                                  ],
                                                  color: Color.fromRGBO(
                                                      207, 109, 56, 1),
                                                ),
                                                child: // Figma Flutter Generator LoginWidget - TEXT
                                                    Center(
                                                  child: Text('Continue',
                                                      textAlign:
                                                          TextAlign.center,
                                                    style:
                                                    _TextTheme.headline1!.copyWith(
                                                        fontWeight: FontWeight.w600,
                                                      fontSize: 3 *
                                                          SizeConfig
                                                              .blockSizeVertical!
                                                              .toDouble(),
                                                    ),),
                                                )),
                                          ),
                                          const Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              WidgetsBinding.instance!
                                                  .addPostFrameCallback((_) {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const Text(
                                              '< Back',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontFamily: 'Red Hat Text',
                                                  fontSize: 20,
                                                  letterSpacing:
                                                      0,
                                                  fontWeight: FontWeight.w300,
                                                  height: 1),
                                            ),
                                          ),

                                          const Text(""),
                                          const Text(""),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text(""),
                                ],
                              )),
                        ),
                        state.isLoading == true
                            ? Center(child: listLoader(context: context))
                            : Container(),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }
//           Container(
//                                         width: w / 1.1,
//                                         height: h / 10,
//                                         child: Form(
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           key: ,
//                                           child: TextFormField(
//                                             style:
//                                                 TextStyle(color: Colors.brown),
//
//                                             controller: ,
//                                             onChanged: (value) {},
//                                             onFieldSubmitted: (value) {},
//
//                                             validator: MultiValidator([
//
//                                             ]),
//                                             cursorColor: Colors.black,
//                                             decoration: InputDecoration(
//                                                 filled: true,
//                                                 fillColor: textfieldBack,
//                                                 prefixIcon: Icon(Icons.lock),
//                                                 contentPadding:
//                                                     EdgeInsets.symmetric(
//                                                         horizontal: 12),
//                                                 hintText: "password..",
//                                                 labelText: "Password",
//
//                                                 labelStyle: TextStyle(
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.red,
//                                                 ),
//
//                                                 suffixIcon: IconButton(
//
//                                                   icon: Icon((SecureInput_pass
//                                                       ? Icons
//                                                           .remove_red_eye_outlined
//                                                       : Icons.security)),
//
//                                                   onPressed: () {
//                                                     setState(() {
//
//                                                       SecureInput_pass =
//                                                           !SecureInput_pass;
//                                                     });
//                                                   },
//                                                 )),
//                                             keyboardType: TextInputType.text,
//                                             obscureText: SecureInput_pass,
//                                           ),
//                                         )),
}
// InkWell(
//                                           onTap: () {},
//                                           child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 RichText(
//                                                   text: TextSpan(
//                                                     children: <TextSpan>[
//                                                       TextSpan(
//                                                         text:
//                                                             " By signing up you indicate that you have read and\n agreed to the Patch ",
//                                                         style: TextStyle(
//                                                           color: writingONback,
//                                                           fontSize: 10,
//                                                         ),
//                                                       ),
//                                                       TextSpan(
//                                                         text:
//                                                             "Terms of Service",
//                                                         style: TextStyle(
//                                                           color: Colors.pink,
//                                                           fontSize: 10,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )
//                                               ]),
//                                         ),

//   Container(
//                 height: 570,
//                   child: GridView.builder(
//                       shrinkWrap: true,
//                       itemCount: 20,
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                       itemBuilder: (context, index) {
//                         return  Container(
//                           width: (MediaQuery.of(context).size.width / 2.4),
//                           height: (MediaQuery.of(context).size.width / 2.4),
//                           child: Card(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset (
//                                   'assets/images/car_ins_btn.svg',
//
//                                   height: 80,
//                                   width: 80,
//                                 ),
//                                 SizedBox(height: 15,),
//                                 Container(
//                                   child: Text('Motor Insurco'),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//
//
//                         // return _tile(data[index].name, data[index].name, Icons.work);
//                       })
//
//               ),
/*
   // Container(
                   //   child: custombtn(
                   //        textt: "Create New Account",
                   //        onPressed: () {
                   //          Navigator.pushNamed(context, "/register");
                   //        },
                   //       // outlinebtn: false,
                   //        IsLoading: false,
                   //     btnColor: constants.blueF,
                   //     outlineColor: Colors.black45,
                   //     TxtColor: constants.white,
                   //
                   //      ),
                   // ),
                            // textfeild(
                        //   Onsubmitted: (value) {
                        //     // when click on submit btn pass info
                        //     _loginEmail = value;
                        //      _PasswordFocusNode.requestFocus();
                        //   },
                        //   Text2: "Email",
                        //   isEMAIL: true,
                        //   Onchanged: (value) {
                        //     _loginEmail = value;
                        //   },
                        //   TextInputaction: TextInputAction.next,
                        // ),
                        // textfeild(
                        //   Text2: "Password",
                        //   isEMAIL: false,
                        //   Onsubmitted: (value) {  SubmitForm(); },
                        //     // when click on submit btn pass info
                        //
                        //
                        //   Onchanged: (value) {_LoginPass = value;  },
                        //
                        //
                        //    FoucesNode: _PasswordFocusNode,
                        // ),

                              // else if(_loginEmail.isEmpty && _LoginPass.isEmpty){
                              //   _alreatDialogBuilder("Email and password Mustn't be Empty","Error");
                              // }else if (_LoginPass.length < 6  ){
                              //   _alreatDialogBuilder("Password must be Above 6 Characters ","Error");
                              // }else if (_loginEmail.isEmpty){
                              //   _alreatDialogBuilder("Email Mustn't be Empty","Error");
                              // }else if (_LoginPass.isEmpty){
                              //   _alreatDialogBuilder("password Mustn't be Empty","Error");
                              // }else if (!RegExp(emailvalidaition).hasMatch(_loginEmail)){
                              //   _alreatDialogBuilder("Thats not an Email","Error");
                              // }else {
                              //   print("user at login screen : $auth");
                              //   SubmitForm();
                              // }
 */
// if (_formkey2.currentState!.validate() &&
//                                   _formkey3.currentState!.validate()) {
//
//
//                                 // If the form is valid, display a snackbar. In the real world,
//                                 // you'd often call a server or save the information in a database.
//                                 // ScaffoldMessenger.of(context).showSnackBar(
//                                 // const SnackBar(content: Text('Processing Data')),
//                                 // );
//                               } else if (_EmailController.text.isEmpty &&
//                                   _PassController.text.isEmpty) {
//                                 _loginEmail = "";
//                                 _LoginPass = "";
//                                 _alreatDialogBuilder(
//                                     "Email and password Mustn't be Empty",
//                                     "Error");
//                               } else if (!RegExp(constants.emailvalidaition.toString())
//                                   .hasMatch(_EmailController.text)) {
//                                 _alreatDialogBuilder(
//                                     "Thats not an Email", "Error");
//                               } else if (_EmailController.text.isEmpty) {
//                                 _loginEmail = "";
//                                 _alreatDialogBuilder(
//                                     "Email must be Above 6 Characters ",
//                                     "Error");
//                               } else if (_PassController.text.isEmpty) {
//                                 _LoginPass = "";
//                                 _alreatDialogBuilder(
//                                     "password Mustn't be Empty", "Error");
//                               } else if (_PassController.text.length < 6) {
//                                 _alreatDialogBuilder(
//                                     "password Must be  Atleast 6 Characters",
//                                     "Error");
//                               }
//                               print(_loginEmail);
//                             },
//                           );
