// ignore_for_file: non_constant_identifier_names, file_names
import 'dart:io';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fire;
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_event.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_state.dart';
import 'package:bubbles/UI/Onboarding/Permissions_Screen/pages/Permission1_Screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/Birthday_screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/SignUp2.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/Language/localization/demo_localization.dart';
import 'package:bubbles/core/Language/localization/language_constants.dart';

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
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../SignUp_Screen/pages/signup.dart';
import '../bloc/login_bloc.dart';
import 'Login_page2.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}



final RegExp regExpEmail = RegExp(

    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

// final RegExp regExpPhone = RegExp(
//     r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)');
class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pref = sl<IPrefsHelper>();
  final _Loginbloc = sl<loginBloc>();
  bool Selected = false;
  final TextEditingController _EmailController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>(); //password
  bool DiDitOnce = false;
  String? token;
  var Fcmtoken;
  GoogleSignInAccount? googleSignInAccount;
  bool Changed3 = false;
  late FocusNode _EmailFocusNode;
  final snackBar = SnackBar(
    content: const Text('Oppreation is Done Successfuly'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  void SignOutGOogle() {
    googleSignIn!.signOut();
  }

  GoogleSignIn? googleSignIn;

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

  Future<void> setlogout() async {
    await pref.logout();
  }

  Future<void> SetToken(String Token) async {
    await pref.SetToken(Token);
  }

  Future<void> getFcmToken() async {
    fire.FirebaseMessaging.instance.getToken().then((FcmTOken) {
      print(FcmTOken);
      return Fcmtoken = FcmTOken;
    });
  }

  Future<void> signInWithFacebook() async {
    try {
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        final LoginResult loginResult = await FacebookAuth.instance.login();
        print(loginResult.message.toString());
        print(loginResult.accessToken!.token);
        if (loginResult.accessToken!.token != null) {
          print("token  : ${loginResult.accessToken!.token}");
          SetToken(loginResult.accessToken!.token);
          DiDitOnce = true;
          _Loginbloc.add(LoginSocial((b) => b
            ..Token = loginResult.accessToken!.token
            ..fcmToken = Fcmtoken));
        }
      } else {
        print('No internet :( Reason:');
        Page2().method(
            _scaffoldKey.currentContext!,
            "Connection Failed",
            """Something went Wrong 
                                                            Check your internet Connection""",
            "back");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    try {
      String Email;
      String PhotoUrl;
      String Name;
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        googleSignIn = GoogleSignIn();
        //  googleSignIn.signOut();
        googleSignInAccount = await googleSignIn!.signIn();

        if (googleSignInAccount != null) {
          googleSignInAccount!.authentication.then((value) {});

          Email = googleSignInAccount!.email;
          PhotoUrl = googleSignInAccount!.photoUrl.toString();
          Name = googleSignInAccount!.displayName.toString();
          print(Email);
          print(PhotoUrl);
          print(Name);

          _Loginbloc.add(LoginGoogle((b) => b
            ..Email = Email
            ..avatar = PhotoUrl
            ..name = Name
            ..fcmToken = Fcmtoken));

          DiDitOnce = true;
        }
      } else {
        print('No internet :( Reason:');
        Page2().method(
            _scaffoldKey.currentContext!,
            "Connection Failed",
            """Something went Wrong 
                                                            Check your internet Connection""",
            "back");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
    } catch (e) {
      print(e);
    }
  }

  signinApple() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      if (!await TheAppleSignIn.isAvailable()) {
        print(
            'This Device is not eligible for Apple Sign in'); //todo message pop up
        return null; //Break from the program
      }

      final res = await TheAppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);

      switch (res.status) {
        case AuthorizationStatus.authorized:
          try {
            final AppleIdCredential? appleIdCredential = res.credential;
            print(appleIdCredential!.identityToken.toString());
          } on PlatformException catch (error) {
            print(error);
          } on FirebaseAuthException catch (error) {
            print(error);
          }
          break;
        case AuthorizationStatus.error:
          print('Apple authorization failed');
          break;
        case AuthorizationStatus.cancelled:
          print('Apple authorization cancelled');
          break;
      }
    } else {
      print('No internet :( Reason:');
      Page2().method(
          _scaffoldKey.currentContext!,
          "Connection Failed",
          """Something went Wrong 
                                                            Check your internet Connection""",
          "back");
    }
  }

  @override
  void initState() {
    super.initState();
    _EmailFocusNode = FocusNode();
    getFcmToken();

    // googleSignIn = GoogleSignIn();
    // googleSignIn!.isSignedIn().then((value) =>     SignOutGOogle());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _EmailController.dispose();
  }

  @override
  Widget build(BuildContext Context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return BlocBuilder(
        bloc: _Loginbloc,
        builder: (BuildContext context, loginState state) {
          if (state.success == true && DiDitOnce == true) {
            pref.saveUser(
              state.data as UserData,
              state.data!.user!.token!,
              true,
            );
            if (state.data!.user!.data!.gender == null) {
              UsersData Users = UsersData();

              WidgetsBinding.instance!
                  .addPostFrameCallback((_) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp2(
                            Users: Users,
                          ),
                        ),
                      ));
            } else {
              WidgetsBinding.instance!
                  .addPostFrameCallback((_) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigatorTopBar(),
                        ),
                      ));
            }
            DiDitOnce = false;
          }
//todo : Email validation
          return

            WillPopScope(
              onWillPop: () async => false,
              child:   GestureDetector(
              onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              },
              child:


              Scaffold(
                  resizeToAvoidBottomInset: false,
                  key: _scaffoldKey,
                  backgroundColor: Color(0xff942657),

                  body: SafeArea(
                    child: Stack(
                      children: [


                           Container(
                                    width: w,
                                    height: h,
                                    child:   ConstrainedBox(
          constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
          child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Text(""),
                                        Container(
                                          width: w / 1.39,
                                          height: h / 13,
                                          child: SvgPicture.asset(
                                              "Assets/images/Logo.svg",
                                              fit: BoxFit.fill),
                                        ),
                                        const Text(""),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                width: w / 1.30,
                                                height:  h / 10,
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
                                                    controller:
                                                        _EmailController,
                                                    cursorHeight: 20,
                                                    onChanged: (value) {
                                                    },
                                                    onFieldSubmitted:
                                                        (value) {},
                                                    validator: MultiValidator([
                                                      RequiredValidator(
                                                          errorText:
                                                              "Required"),
                                                      EmailValidator(
                                                          errorText:
                                                              "Thats not an email")
                                                    ]),

                                                    cursorColor: Colors.black,
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.3,
                                                        color: Colors.brown),
                                                    decoration: InputDecoration(
                                                        errorStyle: TextStyle(
                                                          color: Colors.red,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 0.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
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
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        contentPadding: EdgeInsets.only(left: h/100),
                                                        hintText: "Email",
                                                        hintStyle: _TextTheme.headline6!.copyWith(
                                                          fontSize: 3.6 *
                                                              SizeConfig
                                                                  .blockSizeVertical!
                                                                  .toDouble(),
                                                        )),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    // obscureText: SecureInput_pass,
                                                  ),
                                                )),
                                            InkWell(
                                              onTap: () {
                                                Changed3 = true;
                                                setState(() {});
                                                if (_formkey1.currentState!
                                                    .validate()) {
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                          (_) => Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Login2(
                                                                    Email:
                                                                        _EmailController
                                                                            .text,
                                                                  ),
                                                                ),
                                                              ));
                                                }
                                              },
                                              child: Container(
                                                  width: w / 1.30,
                                                  height: h / 13.9,
                                                  decoration:
                                                       const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5),
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
                                                  child: Center(
                                                    child: Text(
                                                      'Log in',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: _TextTheme
                                                          .headline1!
                                                          .copyWith(
                                                       fontSize: 6.2 *
                                                          SizeConfig
                                                          .blockSizeHorizontal!
                                                          .toDouble(),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  )),
                                            ),
                                            Container(
                                              width: w,
                                              margin: EdgeInsets.only(top: h/28),
                                              child: Center(
                                                  child: Text(
                                                'or',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        234, 234, 234, 1),
                                                    fontFamily: 'Red Hat Text',
                                                    fontSize: 6.1 *
                                                        SizeConfig
                                                            .blockSizeHorizontal!
                                                            .toDouble(),
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.1875),
                                              )),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                           Container(
                                                  width: w / 1.30,
                                                  height: h / 13.9,
                                                  margin: EdgeInsets.only(bottom: h/50),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            6.9275360107421875),
                                                        topRight: Radius.circular(
                                                            6.9275360107421875),
                                                        bottomLeft: Radius.circular(
                                                            6.9275360107421875),
                                                        bottomRight:
                                                            Radius.circular(
                                                                6.9275360107421875),
                                                      ),
                                                      color: Color.fromRGBO(
                                                          24, 119, 242, 1),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal:
                                                            10.391304016113281,
                                                        vertical:
                                                            10.391304016113281),
                                                    child:  InkWell(
                                                      onTap: () async {
                                                        signInWithFacebook();
                                                      },
                                                      child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            "Assets/images/path14.svg",
                                                            width: 20,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        h / 60),
                                                            child: Text(
                                                              'Log In with Facebook',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color:
                                                                      Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),

                                                                  fontFamily:
                                                                      'Helvetica',
                                                                  fontSize: 5 *
                                                                      SizeConfig
                                                                          .blockSizeHorizontal!
                                                                          .toDouble(),
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),

                                         Container(
                                                width: w / 1.30,
                                                height: h / 13.9,
                                                margin: EdgeInsets.only(bottom: h/50),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        6.9275360107421875),
                                                    topRight: Radius.circular(
                                                        6.9275360107421875),
                                                    bottomLeft: Radius.circular(
                                                        6.9275360107421875),
                                                    bottomRight:
                                                        Radius.circular(
                                                            6.9275360107421875),
                                                  ),
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal:
                                                            10.391304016113281,
                                                        vertical:
                                                            10.391304016113281),
                                                child:    InkWell(
                                                  onTap: () {
                                                    signInWithGoogle(
                                                        context: context);
                                                    //  _handleSignIn();
                                                  },
                                                  child: Container(
                                                  width: 16.626087188720703,
                                                  height: 16.626087188720703,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "Assets/images/Google Logo.svg",
                                                          width: 20,
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: h / 60),
                                                          child: Text(
                                                            'Log In with Google',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.5400000214576721),
                                                                fontFamily:
                                                                    'Roboto Medium',
                                                                fontSize: 5 *
                                                                    SizeConfig
                                                                        .blockSizeHorizontal!
                                                                        .toDouble(),
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            (Platform.isIOS)
                                                ? InkWell(
                                                    onTap: () async {
                                                      signinApple();
                                                    },
                                                    child: Container(
                                                        width: w / 1.30,
                                                        height: h / 13.9,
                                                        margin: EdgeInsets.only(bottom: h/50),
                                                        child: Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      6.9275360107421875),
                                                              topRight: Radius
                                                                  .circular(
                                                                      6.9275360107421875),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      6.9275360107421875),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      6.9275360107421875),
                                                            ),
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                          padding: const EdgeInsets
                                                                  .symmetric(
                                                              horizontal:
                                                                  10.391304016113281,
                                                              vertical:
                                                                  10.391304016113281),
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                                SvgPicture
                                                                    .asset(
                                                                  "Assets/images/path4.svg",
                                                                  width: 20,
                                                                ),
                                                                const Text(
                                                                  'Log In with Apple',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      color: const Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          13.855072021484375,
                                                                      letterSpacing:
                                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      height:
                                                                          1),
                                                                ),
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                                const Text(""),
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                  )
                                                : Container(),

                                            Container(
                                              margin: EdgeInsets.only(top: h/50),
                                              child: InkWell(
                                                onTap: () {
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                          (_) => Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SignUp(),
                                                                ),
                                                              ));
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'Don’t have an account?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: _TextTheme
                                                            .headline1!
                                                            .copyWith(
                                                            fontSize:2 *
                                                                SizeConfig
                                                                    .blockSizeVertical!
                                                                    .toDouble(),
                                                                letterSpacing:
                                                                    0.3,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                height: 1)),
                                                    Text("Sign up",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: _TextTheme
                                                            .headline1!
                                                            .copyWith(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                            fontSize: 2.6 *
                                                                SizeConfig
                                                                    .blockSizeVertical!
                                                                    .toDouble(),
                                                                letterSpacing:
                                                                    0.3,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(""),
                                      ],
                                    )))),
                        state.isLoading == true
                            ? Center(child: listLoader(context: context))
                            : Container(),
                      ],
                    ),
                  ))));
        });
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
