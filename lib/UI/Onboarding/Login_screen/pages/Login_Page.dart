// ignore_for_file: non_constant_identifier_names, file_names
import 'dart:io';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fire;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_event.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_state.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Permission1_Screen.dart';
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
import 'package:animated_snack_bar/animated_snack_bar.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}



final RegExp regExpEmail = RegExp(

    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
// final snackBar = SnackBar(
//
//   duration: Duration(seconds: 2),
//   content: const Text("No internet connection, Try again"),
//   action: SnackBarAction(
//     label: 'Close',
//     snackPosition: SnackPosition.BOTTOM,
//     snackStyle: SnackStyle.FLOATING,
//     onPressed: () {
//
//     },
//   ),
// );


//
// @override
// void didChangeAppLifecycleState(AppLifecycleState state) {
//
//   switch (state) {
//     case AppLifecycleState.resumed:
//       BackGroundCounter = 0;
//       break;
//     case AppLifecycleState.inactive:
//
//       break;
//     case AppLifecycleState.paused:
//
//       break;
//     case AppLifecycleState.detached:
//
//       break;
//   }
//
// }
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
// final RegExp regExpPhone = RegExp(
//     r'(^\+[0-9]{2}|^\+[0-9]{2}\(0\)|^\(\+[0-9]{2}\)\(0\)|^00[0-9]{2}|^0)([0-9]{9}$|[0-9\-\s]{10}$)');
class _LoginState extends State<Login> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _EmailController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final pref = sl<IPrefsHelper>();
  GoogleSignInAccount? googleSignInAccount;
  final _Loginbloc = sl<loginBloc>();
  late FocusNode _EmailFocusNode;
  AnimationController? _controller;
  GoogleSignIn? googleSignIn;
  bool Changed3 = false;
  bool islogedin = false;
  bool First_Time_Login = true;
  Animation<double>? ba;
  AnimationController? _bc;
  Listenable? listenable;
  bool Selected = false;
  bool DiDitOnce = false;
  String? token;
  var Fcmtoken;
  FirebaseAuth auth = FirebaseAuth.instance;

void Verify()async{
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+972568969945',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }

      // Handle other errors
    },
    timeout: const Duration(seconds: 60),
    codeSent: (String verificationId, int? resendToken) async {
      String smsCode = 'xxxx';
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

  void SignOutGOogle() {
    googleSignIn!.signOut();
  }

  Future<void> SetToken(String Token) async {
    await pref.SetToken(Token);
  }

  Future<void> SetNotFirstTime() async {
    await pref.SetisFirstTimeLogin();
  }

  Future<void> getFcmToken() async {
    fire.FirebaseMessaging.instance.getToken().then((FcmTOken) {
      print(FcmTOken);
      return Fcmtoken = FcmTOken;
    });
  }

  Future<void> GetISloggedIN() async {
    islogedin = await pref.getIsLogin();
    First_Time_Login = await pref.GetisFirstTimeLogin();
    String tokenn =  await pref.getToken();
    print("islogedin1 : ${islogedin}");
    print("islogedin2 : ${islogedin}");
    if (!First_Time_Login) {
      if (islogedin && tokenn.isNotEmpty) {
        SetNotFirstTime();
        AnimatedSnackBar.material(
             "Welcome Back!",
          type: AnimatedSnackBarType.info,
          duration: Duration(seconds: 2),
          // mobileSnackBarPosition: MobileSnackBarPosition.bottom, // Position of snackbar on mobile devices
          // desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices

        ).show(context);
        print("islogedin3 : ${islogedin}");
        WidgetsBinding.instance
            .addPostFrameCallback((_) =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavigatorTopBar(GotToHomeAndOpenPanel: false,),
              ),
            ));
      }
      print("islogedin4 : ${islogedin}");
    }else{
      print("Yep first time");
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      var h = MediaQuery.of(context).size.height;
      var w = MediaQuery.of(context).size.width;
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
        AnimatedSnackBar.material(
          'Check your internet connection',
          duration: Duration(seconds: 2),
          type: AnimatedSnackBarType.error,
        ).show(
          context,
        );
        // print('No internet :( Reason:');
        // CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    try {
      var h = MediaQuery.of(context).size.height;
      var w = MediaQuery.of(context).size.width;
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
        AnimatedSnackBar.material(
          'Check your internet connection',
          duration: Duration(seconds: 2),
          type: AnimatedSnackBarType.error,
        ).show(
          context,
        );

        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
       // _scaffoldKey.showSnackBar(snackBar);
   //      print('No internet :( Reason:');
   // CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
    } catch (e) {
      print(e);
    }
  }

  signinApple() async {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
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
      CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
    }
  }

  // Scaffold(
  // body: Container(
  // color: background
  //     .evaluate(AlwaysStoppedAnimation(_controller.value)),
  // ),
  // );
  // });
  // Animatable<Color?> animColorPend = TweenSequence([
  //   TweenSequenceItem(
  //     weight: 1.0,
  //     tween: ColorTween(
  //       begin: smalt.withOpacity(.8),
  //       end: Color(0xffD23756).withOpacity(.8),
  //     ) as Animatable<Color?>,
  //   ),
  //   TweenSequenceItem(
  //     weight: 1.0,
  //     tween: ColorTween(
  //       begin: Colors.pink[200],
  //       end: Colors.purple,
  //     ) as Animatable<Color?>,
  //   ),
  // ]);
  Animatable<Color?> darkBackground =  TweenSequence<Color?>(
    [
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin: Color(0xffA93064).withOpacity(.9),
          end: Color(0xff932557).withOpacity(.9),
        )as Animatable<Color?>,
      ),
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin:Color(0xff932557).withOpacity(.9),
          end: Color(0xffA93064).withOpacity(.9),
        )as Animatable<Color?>,
      ),
    ],
  );

  Animatable<Color?> normalBackground = TweenSequence<Color?>(
    [
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin:Color(0xff932557).withOpacity(.9),
          end: Color(0xffB9484C).withOpacity(.9),
        )as Animatable<Color?>,
      ),
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin: Color(0xffB9484C).withOpacity(.9),
          end:Color(0xff932557).withOpacity(.9),

        )as Animatable<Color?>,
      ),
    ],
  );

  Animatable<Color?>  lightBackground = TweenSequence<Color?>(
    [
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin:Color(0xff932557).withOpacity(.9),
          end: Color(0xffB9484C).withOpacity(.9),
        )as Animatable<Color?>,
      ),
      TweenSequenceItem(
        weight: .5,
        tween: ColorTween(
          begin:Color(0xffB9484C).withOpacity(0.9),
          end: Color(0xff932557).withOpacity(0.9),
        )as Animatable<Color?>,
      ),
    ],
  );
  AlignmentTween aT =
  AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft);
  AlignmentTween aB =
  AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);

  @override
  void initState() {
    super.initState();
    // Verify();
    GetISloggedIN();
    _EmailFocusNode = FocusNode();
    getFcmToken();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 250), value: 1);
    _controller!.repeat(reverse: true);
    // listenable = AnimationController(
    //   duration: const Duration(seconds: 5),
    //   vsync: this,
    // )..repeat();

    _bc = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    // googleSignIn = GoogleSignIn();
    // googleSignIn!.isSignedIn().then((value) =>     SignOutGOogle());
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 10),
    //   vsync: this,
    // )..repeat();
    //
    // ba = CurvedAnimation(parent: ba!, curve: Curves.easeIn);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Color(0xff932557),
          systemNavigationBarColor: Color(0xff303030)
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    switch (state) {
      case AppLifecycleState.resumed:
      //BackGroundCounter = 0;
        break;
      case AppLifecycleState.inactive:

        break;
      case AppLifecycleState.paused:

        break;
      case AppLifecycleState.detached:

        break;
    }

  }

  @override
  void dispose() {
    _controller!.dispose();
    _EmailController.dispose();
    _bc!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext Context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;



    return  BlocBuilder(
        bloc: _Loginbloc,
        builder: (BuildContext context, loginState state) {
          if (state.success == true && DiDitOnce == true) {

            SetNotFirstTime();


            if (state.data!.user!.data!.birth_date == null) {
              SetToken(state.data!.user!.token!);
              UsersData Users = UsersData();

              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUp2(
                            Users: Users,
                          ),
                    ),
                  ));
            } else {
              pref.saveUser(
                state.data!.user!,
                state.data!.user!.token!,
                true,
              );
              AnimatedSnackBar.material(
                'Logged in Successfully',
                duration: Duration(seconds: 2),
                type: AnimatedSnackBarType.success,
              ).show(
                context,
              );
              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavigatorTopBar(GotToHomeAndOpenPanel: false,),
                    ),
                  ));
            }
            DiDitOnce = false;
          }

          return
            WillPopScope(
                onWillPop: () async => true,
                child: GestureDetector(
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

                              ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    minHeight: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                  ),
                                  child: IntrinsicHeight(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 51.h),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [

                                            Container(
                                              width: w/1.32,
                                              child :
                                              AspectRatio(
                                          aspectRatio: 50/10, //aspect ratio for Image
                                            child: SvgPicture.asset(
                                                "Assets/images/Logo.svg",
                                                fit: BoxFit.fill),
                                          ),
                                        ),



                                            Container(
                                              width: w/1.3,
                                              margin: EdgeInsets.only(top: 45.h),
                                              child: Text('   Be around,            Find your bubble!'
                                                 ,textAlign: TextAlign.center, style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                      fontFamily: 'Red Hat Display',
                                                      fontSize: 30.sp,
                                                      letterSpacing: 0.2,
                                                      fontStyle: FontStyle.italic,
                                                      fontWeight: FontWeight.w800,
                                                      height: 1.1785714285714286
                                                  ),
                                                ),
                                            ),
                                                Container(
                                                    width: w / 1.32,
                                                    height: h / 10.5,
                                                    margin: EdgeInsets.only(top: 25.h),
                                                    child: Form(
                                                      autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                      key: _formkey1,
                                                      child: TextFormField(
                                                        keyboardAppearance:
                                                        Brightness.dark,
                                                        textInputAction:
                                                        TextInputAction
                                                            .next,
                                                        controller:
                                                        _EmailController,
                                                        cursorHeight: 20.h,
                                                        // inputFormatters: [
                                                        //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                                        // ],
                                                        onChanged: (
                                                            value) {},
                                                        onFieldSubmitted:
                                                            (value) {},
                                                        validator: MultiValidator(
                                                            [
                                                              RequiredValidator(
                                                                  errorText:
                                                                  "Required"),
                                                              EmailValidator(
                                                                  errorText:
                                                                  "Thats not an email")
                                                            ]),

                                                        cursorColor: Colors.black,
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            height: 1.h,
                                                            color: Colors
                                                                .brown),
                                                        decoration: InputDecoration(
                                                            errorStyle: TextStyle(
                                                              color: Colors
                                                                  .red,
                                                            ),
                                                            errorBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0.0),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r)
                                                            ),
                                                            focusedErrorBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 0.0),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r)
                                                            ),
                                                            border:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5.r),

                                                            ),
                                                            counterText: ' ',
                                                            enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r)
                                                            ),
                                                            focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5.r)
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors
                                                                .white,
                                                            contentPadding: EdgeInsets
                                                                .only(
                                                                left: h /
                                                                    70),
                                                            hintText: "Email",
                                                            hintStyle: _TextTheme
                                                                .headline6!
                                                                .copyWith(
                                                              fontSize: 22.sp,
                                                            )),

                                                        keyboardType:
                                                        TextInputType
                                                            .text,
                                                        // obscureText: SecureInput_pass,
                                                      ),
                                                    )),
                                                InkWell(
                                                  onTap: () async{
                                                    Changed3 = true;
                                                    setState(() {});
                                                    bool result = await InternetConnectionChecker().hasConnection;
                                                    if (result == true) {
                                                      if (_formkey1
                                                          .currentState!
                                                          .validate()) {
                                                        WidgetsBinding
                                                            .instance
                                                            .addPostFrameCallback(
                                                                (_) =>
                                                                Navigator
                                                                    .push(
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
                                                    }else{
                                                      AnimatedSnackBar.material(
                                                        'Check your internet connection',
                                                        duration: Duration(seconds: 2),
                                                        type: AnimatedSnackBarType.error,
                                                      ).show(
                                                        context,
                                                      );       }
                                                  },
                                                  child: Container(
                                                      width: w / 1.32,
                                                      height: h / 13.9,
                                                      decoration:
                                                       BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          topLeft: Radius.circular( 7.r),
                                                          topRight:Radius.circular( 7.r),
                                                          bottomLeft: Radius.circular( 7.r),
                                                          bottomRight:Radius.circular( 7.r),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color
                                                                  .fromRGBO(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0.15000000596046448),
                                                              offset: Offset(
                                                                  0, 0),
                                                              blurRadius: 6)
                                                        ],
                                                        color: Color
                                                            .fromRGBO(
                                                            207, 109, 56,
                                                            1),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Continue',
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                          style: _TextTheme
                                                              .headline1!
                                                              .copyWith(
                                                              fontSize: 18.sp,
                                                              fontWeight:  FontWeight.w600
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                                Container(
                                                  width: w,
                                                  margin: EdgeInsets.only( top:8.h,bottom: 8.h ),

                                                  child: Center(
                                                      child: Text(
                                                        'or',
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(   color: Color .fromRGBO(  234, 234,234, 1),
                                                            fontFamily: 'Red Hat Text',
                                                            fontSize: 16.sp,
                                                            letterSpacing:0 ,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            height: 1.1875),
                                                      )),
                                                ),

                                                Container(
                                                  width: w / 1.32,
                                                  height: h / 13.9,
                                                  margin: EdgeInsets.only(bottom: 8.7.h),
                                                  child: Container(
                                                      decoration:
                                                       BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          topLeft: Radius.circular( 7.r),
                                                          topRight:Radius.circular( 7.r),
                                                          bottomLeft: Radius.circular( 7.r),
                                                          bottomRight:Radius.circular( 7.r),
                                                        ),
                                                        color: Color
                                                            .fromRGBO(
                                                            24, 119, 242,
                                                            1),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async => signInWithFacebook(),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment  .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                "Assets/images/path14.svg",
                                                                width: 20.w,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(left: 11.w,top: 2.h),
                                                                child: Text(
                                                                  'Continue with Facebook',
                                                                  textAlign:TextAlign.left,
                                                                  style: TextStyle(
                                                                      color:
                                                                      Color
                                                                          .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                      fontFamily:
                                                                      'Helvetica',
                                                                      fontSize: 14.sp,
                                                                      letterSpacing:  0.5,
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
                                                  width: w / 1.32,
                                                  height: h / 13.9,
                                                  margin: EdgeInsets.only( bottom: 8.7.h),
                                                  decoration:  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      topLeft: Radius.circular( 7.r),
                                                      topRight:Radius.circular( 7.r),
                                                      bottomLeft: Radius.circular( 7.r),
                                                      bottomRight:Radius.circular( 7.r),
                                                    ),
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  padding:
                                                   EdgeInsets.symmetric( horizontal:10.391304016113281.w,
                                                      vertical: 10.391304016113281.h),

                                                  child: InkWell(
                                                    onTap: () {
                                                      signInWithGoogle(
                                                          context: context);
                                                      //  _handleSignIn();
                                                    },
                                                    child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                    .center,
                                                    children: [
                                                      SvgPicture .asset(
                                                      "Assets/images/Google Logo.svg",
                                                      width: 20.sp,
                                                    ),

                                                      Container(
                                                        margin: EdgeInsets.only(left: 10.4.w),
                                                        child: Text(
                                                          'Log In with Google',
                                                          textAlign:
                                                          TextAlign
                                                              .left,
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0,
                                                                  0,
                                                                  0,
                                                                  0.5400000214576721),
                                                              fontFamily:
                                                              'Roboto Medium',
                                                              fontSize: 14.sp,
                                                              letterSpacing: 0.2 ,
                                                              fontWeight:  FontWeight.w500,
                                                              height: 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ),
                                                ),


                                                (Platform.isIOS)
                                                    ? InkWell(
                                                  onTap: () async {
                                                    signinApple();
                                                  },
                                                  child: Container(
                                                      width: w / 1.32,
                                                      height: h / 13.9,
                                                      margin: EdgeInsets
                                                          .only(
                                                          bottom: h / 50),
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

                                                              SvgPicture
                                                                  .asset(
                                                                "Assets/images/path4.svg",
                                                                width: 20,
                                                              ),
                                                               Text(
                                                                'Log In with Apple',
                                                                textAlign:
                                                                TextAlign
                                                                    .left,
                                                                style: TextStyle(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        1),
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize: 0.25.sp,
                                                                    letterSpacing:
                                                                    0 ,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    height:
                                                                    1),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                )
                                                    : Container(),

                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: h / 50),
                                                  child: InkWell(
                                                    onTap: () async{
                                                      bool result = await InternetConnectionChecker().hasConnection;
                                                      if (result == true)
                                                      {

                                                        WidgetsBinding
                                                            .instance
                                                            .addPostFrameCallback(
                                                                (_) =>
                                                                Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (
                                                                        context) =>
                                                                        SignUp(),
                                                                  ),
                                                                ));

                                                      }else {
                                                        AnimatedSnackBar.material(
                                                          'Check your internet connection',
                                                          duration: Duration(seconds: 2),
                                                          type: AnimatedSnackBarType.error,
                                                        ).show(
                                                          context,
                                                        );
                                                        // CommingSoonPopup(context, h, w,
                                                        //     "Check your internet connection then try again", "Ok", 17);
                                                      }
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                            'Don’t have an account?',
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style: _TextTheme
                                                                .headline1!
                                                                .copyWith(
                                                                fontSize: 14.sp,
                                                                letterSpacing: 0.3,

                                                                fontWeight:
                                                                FontWeight
                                                                    .w300,
                                                                height: 1)),
                                                        Text("Sign up",
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style: _TextTheme
                                                                .headline1!
                                                                .copyWith(
                                                                decoration:
                                                                TextDecoration
                                                                    .underline,
                                                                fontSize: 9.sp,
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
                                            //    Container(
                                            //      width: w/1.6,
                                            //      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam scelerisque donec varius.',
                                            //        textAlign: TextAlign.center, style: TextStyle(
                                            //       color: Color.fromRGBO(234, 234, 234, 1),
                                            //       fontFamily: 'Red Hat Text',
                                            //       fontSize: 11.sp,
                                            //       letterSpacing: 0.1,
                                            //       fontWeight: FontWeight.w300,
                                            //       height: 1.3636363636363635
                                            // ),),
                                            //    )

                                          ],
                                        ),
                                      ))),
                              state.isLoading == true
                                  ? Center(
                                  child: listLoader(context: context))
                                  : Container(),

                              // RotationTransition(
                              //   turns:_controller as Animation<double>,
                              //   child: SizedBox(
                              //     child: SvgPicture.asset('assets/app_logo.svg'),
                              //     height: 150,
                              //   ),
                              // ),
                            ],
                          ),
                        ))));
        });


    //   AnimatedBuilder(
    //     animation:  _bc!,
    //     builder: (context, child)
    // {
    //   return
    //
    //
    //
    // }
    // );
  }
  // Container(
  //     width: w,
  //     height: h,
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: aT.evaluate(_bc!),
  //         end: aB.evaluate(_bc!),
  //         colors: [
  //           darkBackground.evaluate(_bc!)!,
  //           normalBackground.evaluate(_bc!)!,
  //           lightBackground.evaluate(_bc!)!,
  //         ],
  //       ),
  //     ),
  //     child: ConstrainedBox(
  //         constraints: BoxConstraints(
  //           minWidth: MediaQuery
  //               .of(context)
  //               .size
  //               .width,
  //           minHeight: MediaQuery
  //               .of(context)
  //               .size
  //               .height,
  //         ),
  //         child: IntrinsicHeight(
  //             child: Column(
  //               mainAxisAlignment:
  //               MainAxisAlignment.spaceAround,
  //               mainAxisSize: MainAxisSize.max,
  //               children: [
  //                 const ,
  //                 Container(
  //                   width: w / 1.39,
  //                   height: 55,
  //                   child: SvgPicture.asset(
  //                       "Assets/images/Logo.svg",
  //                       fit: BoxFit.fill),
  //                 ),
  //                 const ,
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment
  //                       .spaceAround,
  //                   children: [
  //                     Container(
  //                         width: w / 1.32,
  //                         height: h / 10,
  //                         child: Form(
  //                           autovalidateMode:
  //                           AutovalidateMode
  //                               .onUserInteraction,
  //                           key: _formkey1,
  //                           child: TextFormField(
  //                             keyboardAppearance:
  //                             Brightness.dark,
  //                             textInputAction:
  //                             TextInputAction
  //                                 .next,
  //                             controller:
  //                             _EmailController,
  //                             cursorHeight: 20,
  //                             onChanged: (
  //                                 value) {},
  //                             onFieldSubmitted:
  //                                 (value) {},
  //                             validator: MultiValidator(
  //                                 [
  //                                   RequiredValidator(
  //                                       errorText:
  //                                       "Required"),
  //                                   EmailValidator(
  //                                       errorText:
  //                                       "Thats not an email")
  //                                 ]),
  //
  //                             cursorColor: Colors
  //                                 .black,
  //                             style: TextStyle(
  //                                 fontSize: 19,
  //                                 fontWeight:
  //                                 FontWeight
  //                                     .w500,
  //                                 height: 1.3,
  //                                 color: Colors
  //                                     .brown),
  //                             decoration: InputDecoration(
  //                                 errorStyle: TextStyle(
  //                                   color: Colors
  //                                       .red,
  //                                 ),
  //                                 errorBorder:
  //                                 OutlineInputBorder(
  //                                   borderSide:
  //                                   BorderSide(
  //                                       color: Colors
  //                                           .white,
  //                                       width: 0.0),
  //                                 ),
  //                                 focusedErrorBorder:
  //                                 OutlineInputBorder(
  //                                   borderSide:
  //                                   BorderSide(
  //                                       color: Colors
  //                                           .white,
  //                                       width: 0.0),
  //                                 ),
  //                                 border:
  //                                 OutlineInputBorder(
  //                                     borderRadius:
  //                                     BorderRadius
  //                                         .circular(
  //                                         5)),
  //                                 enabledBorder:
  //                                 UnderlineInputBorder(
  //                                   borderSide:
  //                                   BorderSide(
  //                                       color: Colors
  //                                           .white),
  //                                   borderRadius:
  //                                   BorderRadius
  //                                       .circular(
  //                                       5),
  //                                 ),
  //                                 focusedBorder:
  //                                 UnderlineInputBorder(
  //                                   borderSide:
  //                                   BorderSide(
  //                                       color: Colors
  //                                           .white),
  //                                   borderRadius:
  //                                   BorderRadius
  //                                       .circular(
  //                                       5),
  //                                 ),
  //                                 filled: true,
  //                                 fillColor: Colors
  //                                     .white,
  //                                 contentPadding: EdgeInsets
  //                                     .only(
  //                                     left: h /
  //                                         70),
  //                                 hintText: "Email",
  //                                 hintStyle: _TextTheme
  //                                     .headline6!
  //                                     .copyWith(
  //                                   fontSize: 24,
  //                                 )),
  //                             keyboardType:
  //                             TextInputType
  //                                 .text,
  //                             // obscureText: SecureInput_pass,
  //                           ),
  //                         )),
  //                     InkWell(
  //                       onTap: () async{
  //                         Changed3 = true;
  //                         setState(() {});
  //                         bool result = await InternetConnectionChecker().hasConnection;
  //                         if (result == true) {
  //                           if (_formkey1
  //                               .currentState!
  //                               .validate()) {
  //                             WidgetsBinding
  //                                 .instance
  //                                 .addPostFrameCallback(
  //                                     (_) =>
  //                                     Navigator
  //                                         .push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                         builder:
  //                                             (context) =>
  //                                             Login2(
  //                                               Email:
  //                                               _EmailController
  //                                                   .text,
  //                                             ),
  //                                       ),
  //                                     ));
  //                           }
  //                         }else{
  //                           AnimatedSnackBar.material(
  //                             'Check your internet connection',
  //                             duration: Duration(seconds: 2),
  //                             type: AnimatedSnackBarType.error,
  //                           ).show(
  //                             context,
  //                           );
  //                           // CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
  //                         }
  //                       },
  //                       child: Container(
  //                           width: w / 1.32,
  //                           height: h / 13.9,
  //                           decoration:
  //                           const BoxDecoration(
  //                             borderRadius:
  //                             BorderRadius.only(
  //                               topLeft:
  //                               Radius.circular(
  //                                   5),
  //                               topRight:
  //                               Radius.circular(
  //                                   5),
  //                               bottomLeft:
  //                               Radius.circular(
  //                                   5),
  //                               bottomRight:
  //                               Radius.circular(
  //                                   5),
  //                             ),
  //                             boxShadow: [
  //                               BoxShadow(
  //                                   color: Color
  //                                       .fromRGBO(
  //                                       0,
  //                                       0,
  //                                       0,
  //                                       0.15000000596046448),
  //                                   offset: Offset(
  //                                       0, 0),
  //                                   blurRadius: 6)
  //                             ],
  //                             color: Color
  //                                 .fromRGBO(
  //                                 207, 109, 56,
  //                                 1),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               'Log in',
  //                               textAlign:
  //                               TextAlign
  //                                   .center,
  //                               style: _TextTheme
  //                                   .headline1!
  //                                   .copyWith(
  //                                   fontSize: 6.2 *
  //                                       SizeConfig
  //                                           .blockSizeHorizontal!
  //                                           .toDouble(),
  //                                   fontWeight:
  //                                   FontWeight
  //                                       .w600),
  //                             ),
  //                           )),
  //                     ),
  //                     Container(
  //                       width: w,
  //                       margin: EdgeInsets.only(
  //                           top: h / 28),
  //                       child: Center(
  //                           child: Text(
  //                             'or',
  //                             textAlign: TextAlign
  //                                 .center,
  //                             style: TextStyle(
  //                                 color: Color
  //                                     .fromRGBO(
  //                                     234, 234,
  //                                     234, 1),
  //                                 fontFamily: 'Red Hat Text',
  //                                 fontSize: 6.1 *
  //                                     SizeConfig
  //                                         .blockSizeHorizontal!
  //                                         .toDouble(),
  //                                 letterSpacing:
  //                                 0 ,
  //                                 fontWeight: FontWeight
  //                                     .w600,
  //                                 height: 1.1875),
  //                           )),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   children: [
  //                     Container(
  //                       width: w / 1.32,
  //                       height: h / 13.9,
  //                       margin: EdgeInsets.only(
  //                           bottom: h / 50),
  //                       child: Container(
  //                           decoration:
  //                           const BoxDecoration(
  //                             borderRadius:
  //                             BorderRadius.only(
  //                               topLeft: Radius
  //                                   .circular(
  //                                   6.9275360107421875),
  //                               topRight: Radius
  //                                   .circular(
  //                                   6.9275360107421875),
  //                               bottomLeft: Radius
  //                                   .circular(
  //                                   6.9275360107421875),
  //                               bottomRight:
  //                               Radius.circular(
  //                                   6.9275360107421875),
  //                             ),
  //                             color: Color
  //                                 .fromRGBO(
  //                                 24, 119, 242,
  //                                 1),
  //                           ),
  //                           padding: const EdgeInsets
  //                               .symmetric(
  //                               horizontal:
  //                               10.391304016113281,
  //                               vertical:
  //                               10.391304016113281),
  //                           child: InkWell(
  //                             onTap: () async {
  //                               signInWithFacebook();
  //                             },
  //                             child: Center(
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                 MainAxisAlignment
  //                                     .center,
  //                                 children: [
  //                                   SvgPicture
  //                                       .asset(
  //                                     "Assets/images/path14.svg",
  //                                     width: 20,
  //                                   ),
  //                                   Container(
  //                                     margin:
  //                                     EdgeInsets
  //                                         .only(
  //                                         left:
  //                                         h /
  //                                             60),
  //                                     child: Text(
  //                                       'Log In with Facebook',
  //                                       textAlign:
  //                                       TextAlign
  //                                           .left,
  //                                       style: TextStyle(
  //                                           color:
  //                                           Color
  //                                               .fromRGBO(
  //                                               255,
  //                                               255,
  //                                               255,
  //                                               1),
  //                                           fontFamily:
  //                                           'Helvetica',
  //                                           fontSize: 18,
  //                                           letterSpacing:
  //                                           0.5,
  //                                           fontWeight:
  //                                           FontWeight
  //                                               .w700,
  //                                           height: 1),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           )),
  //                     ),
  //
  //                     Container(
  //                       width: w / 1.32,
  //                       height: h / 13.9,
  //                       margin: EdgeInsets.only(
  //                           bottom: h / 50),
  //                       decoration: const BoxDecoration(
  //                         borderRadius:
  //                         BorderRadius.only(
  //                           topLeft: Radius
  //                               .circular(
  //                               6.9275360107421875),
  //                           topRight: Radius
  //                               .circular(
  //                               6.9275360107421875),
  //                           bottomLeft: Radius
  //                               .circular(
  //                               6.9275360107421875),
  //                           bottomRight:
  //                           Radius.circular(
  //                               6.9275360107421875),
  //                         ),
  //                         color: Color.fromRGBO(
  //                             255, 255, 255, 1),
  //                       ),
  //                       padding:
  //                       const EdgeInsets
  //                           .symmetric(
  //                           horizontal:
  //                           10.391304016113281,
  //                           vertical:
  //                           10.391304016113281),
  //                       child: InkWell(
  //                         onTap: () {
  //                           signInWithGoogle(
  //                               context: context);
  //                           //  _handleSignIn();
  //                         },
  //                         child: Container(
  //                           width: 16.626087188720703,
  //                           height: 16.626087188720703,
  //                           decoration:
  //                           const BoxDecoration(
  //                             color: Color
  //                                 .fromRGBO(
  //                                 255, 255, 255,
  //                                 1),
  //                           ),
  //                           child: Center(
  //                             child: Row(
  //                               mainAxisAlignment:
  //                               MainAxisAlignment
  //                                   .center,
  //                               children: [
  //                                 SvgPicture
  //                                     .asset(
  //                                   "Assets/images/Google Logo.svg",
  //                                   width: 20,
  //                                 ),
  //                                 Container(
  //                                   margin:
  //                                   EdgeInsets
  //                                       .only(
  //                                       left: h /
  //                                           60),
  //                                   child: Text(
  //                                     'Log In with Google',
  //                                     textAlign:
  //                                     TextAlign
  //                                         .left,
  //                                     style: TextStyle(
  //                                         color: const Color
  //                                             .fromRGBO(
  //                                             0,
  //                                             0,
  //                                             0,
  //                                             0.5400000214576721),
  //                                         fontFamily:
  //                                         'Roboto Medium',
  //                                         fontSize: 18,
  //                                         letterSpacing:
  //                                         0 ,
  //                                         fontWeight:
  //                                         FontWeight
  //                                             .w500,
  //                                         height: 1),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //
  //                     (Platform.isIOS)
  //                         ? InkWell(
  //                       onTap: () async {
  //                         signinApple();
  //                       },
  //                       child: Container(
  //                           width: w / 1.32,
  //                           height: h / 13.9,
  //                           margin: EdgeInsets
  //                               .only(
  //                               bottom: h / 50),
  //                           child: Container(
  //                             decoration:
  //                             const BoxDecoration(
  //                               borderRadius:
  //                               BorderRadius
  //                                   .only(
  //                                 topLeft: Radius
  //                                     .circular(
  //                                     6.9275360107421875),
  //                                 topRight: Radius
  //                                     .circular(
  //                                     6.9275360107421875),
  //                                 bottomLeft: Radius
  //                                     .circular(
  //                                     6.9275360107421875),
  //                                 bottomRight: Radius
  //                                     .circular(
  //                                     6.9275360107421875),
  //                               ),
  //                               color: const Color
  //                                   .fromRGBO(
  //                                   0, 0, 0, 1),
  //                             ),
  //                             padding: const EdgeInsets
  //                                 .symmetric(
  //                                 horizontal:
  //                                 10.391304016113281,
  //                                 vertical:
  //                                 10.391304016113281),
  //                             child: Center(
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                 MainAxisAlignment
  //                                     .spaceAround,
  //                                 children: [
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   SvgPicture
  //                                       .asset(
  //                                     "Assets/images/path4.svg",
  //                                     width: 20,
  //                                   ),
  //                                   const Text(
  //                                     'Log In with Apple',
  //                                     textAlign:
  //                                     TextAlign
  //                                         .left,
  //                                     style: TextStyle(
  //                                         color: const Color
  //                                             .fromRGBO(
  //                                             255,
  //                                             255,
  //                                             255,
  //                                             1),
  //                                         fontFamily:
  //                                         'Roboto',
  //                                         fontSize: 18,
  //                                         letterSpacing:
  //                                         0 ,
  //                                         fontWeight:
  //                                         FontWeight
  //                                             .normal,
  //                                         height:
  //                                         1),
  //                                   ),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                   const Text(
  //                                       ""),
  //                                 ],
  //                               ),
  //                             ),
  //                           )),
  //                     )
  //                         : Container(),
  //
  //                     Container(
  //                       margin: EdgeInsets.only(
  //                           top: h / 50),
  //                       child: InkWell(
  //                         onTap: () async{
  //                           bool result = await InternetConnectionChecker().hasConnection;
  //                           if (result == true)
  //                           {
  //
  //                             WidgetsBinding
  //                                 .instance
  //                                 .addPostFrameCallback(
  //                                     (_) =>
  //                                     Navigator
  //                                         .push(
  //                                       context,
  //                                       MaterialPageRoute(
  //                                         builder:
  //                                             (
  //                                             context) =>
  //                                             SignUp(),
  //                                       ),
  //                                     ));
  //
  //                           }else {
  //                             AnimatedSnackBar.material(
  //                               'Check your internet connection',
  //                               duration: Duration(seconds: 2),
  //                               type: AnimatedSnackBarType.error,
  //                             ).show(
  //                               context,
  //                             );
  //                             // CommingSoonPopup(context, h, w,
  //                             //     "Check your internet connection then try again", "Ok", 17);
  //                           }
  //                         },
  //                         child: Column(
  //                           mainAxisAlignment:
  //                           MainAxisAlignment
  //                               .start,
  //                           children: [
  //                             Text(
  //                                 'Don’t have an account?',
  //                                 textAlign:
  //                                 TextAlign
  //                                     .center,
  //                                 style: _TextTheme
  //                                     .headline1!
  //                                     .copyWith(
  //                                     fontSize: 15,
  //                                     letterSpacing:
  //                                     0.3,
  //                                     fontWeight:
  //                                     FontWeight
  //                                         .w300,
  //                                     height: 1)),
  //                             Text("Sign up",
  //                                 textAlign:
  //                                 TextAlign
  //                                     .center,
  //                                 style: _TextTheme
  //                                     .headline1!
  //                                     .copyWith(
  //                                     decoration:
  //                                     TextDecoration
  //                                         .underline,
  //                                     fontSize: 12,
  //                                     letterSpacing:
  //                                     0.3,
  //                                     fontWeight:
  //                                     FontWeight
  //                                         .w500,
  //                                     height: 1)),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const ,
  //               ],
  //             )))),
  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
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
           barrierDismissible: true,
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



                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 0.24.sp,
                                    letterSpacing: 0 ,
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
                                            fontSize: 0.25.sp,
                                            letterSpacing: 0 ,
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
                      bottom: h/5.5,
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
