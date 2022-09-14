// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/prefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../Login_screen/pages/Login_Page.dart';
import 'SignUp2.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Pref = PrefsHelper();
  late FocusNode FoucesNodePass;
  late FocusNode FoucesNodeEmail;
  late FocusNode FoucesNodeConfirm;
  bool SecureInput_pass2 = false;
  bool SecureInput_pass = false;
  bool? DiditOnce = true;
  bool Changed2 = false;
  bool Changed3 = false;
  bool Changed = false;
  bool DIALOG = false;
  double? lat;
  double? lng;
  String? fcmToken;

  final bloc2 = sl<SignUpBloc>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PassController = TextEditingController();
  final TextEditingController _ConfirmpassController = TextEditingController();
  final PasswordValidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final nameValidation = RegExp(r"^[\p{Letter}\p{Number}]+$");
  final emailvalidaition = RegExp(
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0"
      r"-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u0"
      r"0A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)"
      r"+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDC"
      r"F\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(("
      r"(\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(("
      r"[a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]"
      r")*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-"
      r"z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0"
      r"-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");

  //                 //(?=.*[A-Z])       // should contain at least one upper case
  //                                                     //   (?=.*[a-z])       // should contain at least one lower case
  //                                                     //   (?=.*?[0-9])      // should contain at least one digit
  //                                                     //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
  //                                                     //   .{8,}             // Must be at least 8 characters in length

  final AtleastOneUperCase = RegExp("(?=.*[A-Z])");
  final containAtleastOneLowercase = RegExp("(?=.*[a-z])");
  final shouldContainAtleastOneDigit = RegExp("(?=.*?[0-9])");
  final least8CharactersInLength = RegExp(".{8,}");

  Future<void> GetlatAndLng() async {
    lat = await Pref.Getlat();
    lng = await Pref.GetLng();
    print(" User lat and lng ??! : $lat , $lng ");
  }

  @override
  void initState() {
    FoucesNodePass = FocusNode();
    FoucesNodeEmail = FocusNode();
    FoucesNodeConfirm = FocusNode();
    super.initState();

    // _EmailController.addListener(() {
    //   if (_EmailController.text.isEmpty || _PassController.text.isEmpty || _ConfirmpassController.text.isEmpty ){
    //     bloc2.add(ChangeSelected((b) => b..status = false));
    //   }else{
    //     bloc2.add(ChangeSelected((b) => b..status = true));
    //   }
    // });
//
//     _EmailController.addListener(() {
//       if (_EmailController.text.isEmpty){
//         bloc2.add(ChangeSelected((b) => b..status = false));
//       }
//     });
//     _PassController.addListener(() {
//       if (_PassController.text.isEmpty){
//         bloc2.add(ChangeSelected((b) => b..status = false));
//       }
//     });
//
//
//     _ConfirmpassController.addListener(() {
//       if (_ConfirmpassController.text.isEmpty ){
//         bloc2.add(ChangeSelected((b) => b..status = false));
//       }
//     });




    //Selected
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
                    topLeft: Radius.circular(8.285714149475098.r),
                    topRight: Radius.circular(8.285714149475098.r),
                    bottomLeft: Radius.circular(8.285714149475098.r),
                    bottomRight: Radius.circular(8.285714149475098.r),
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
                            topLeft: Radius.circular(8.285714149475098.r),
                            topRight: Radius.circular(8.285714149475098.r),
                            bottomLeft: Radius.circular(8.285714149475098.r),
                            bottomRight: Radius.circular(8.285714149475098.r),
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
                                    fontSize: 13.sp,
                                    letterSpacing: 0.2,
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
                                          topLeft: Radius.circular(4.142857074737549.r),
                                          topRight: Radius.circular(4.142857074737549.r),
                                          bottomLeft: Radius.circular(4.142857074737549.r),
                                          bottomRight: Radius.circular(4.142857074737549.r),
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
                                            fontSize: 20.sp,
                                            letterSpacing: 0.2,
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
  @override
  void dispose() {
    super.dispose();
    FoucesNodeEmail.dispose();
    FoucesNodePass.dispose();
    _PassController.dispose();
    _EmailController.dispose();
    _ConfirmpassController.dispose();
    FoucesNodeConfirm.dispose();
  }

  bool Diditonce = false;
  bool Selected = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: bloc2,
        builder: (BuildContext context, SignUpState state) {
          if (state.success == true && Diditonce == true) {
            if (_ConfirmpassController.text == _PassController.text) {
              if (state.Checkemail!.msg == "success") {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  UsersData Users = UsersData(
                      Email: _EmailController.text.toLowerCase(),
                      Pass: _PassController.text,
                      ConfirmPass: _ConfirmpassController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp2(
                        Users: Users,
                      ),
                    ),
                  );
                });
              } else if ( state.Checkemail!.msg=="email already has been Taken"){
                print(  state.Checkemail!.msg!);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CommingSoonPopup(context,h,w,"Email already has been taken","Ok",17);
                });
              }
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                CommingSoonPopup(context,h,w,"Password doesn't match confirm password","Ok",17);
                // alreatDialogBuilder(context, "Error",
                //     "", "Back");
              });
            }
            Diditonce = false;
          }
          return GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                  key: _scaffoldKey,
                  backgroundColor: AppColor,
                  body: SafeArea(
                    child:
                    Stack(children: [

                    Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(

                                  child: Container(
                                    width: w,
                                    height: h,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Spacer(),
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
                                        Spacer(),

                                        Column(
                                          children: [
                                            Container(
                                                width: w / 1.32,
                                                height: h / 10,
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
                                                    onTap: (){
                                                      bloc2.add(HideSpaceOnSignUP());
                                                    },
                                                    controller:
                                                    _EmailController,
                                                    onChanged: (value) {
                                                      Selected = true;
                                                    //  bloc2.add(ChangeSelected((b) => b..status = true));
                                                    },
                                                    onFieldSubmitted: (value) {
                                                      FoucesNodePass
                                                          .requestFocus();
                                                    },

                                                    validator:(value){

                                                      if (!emailvalidaition
                                                          .hasMatch(
                                                          value!.toLowerCase())) {
                                                        return "Thats not an Email";
                                                      }else if (value.isEmpty){
                                                        return "Required";
                                                      }
                                                    },
                                                    cursorColor: Colors.black,
                                                    cursorHeight: h / 30,
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        height: 0.9.h,
                                                        color: Colors.brown),
                                                    // inputFormatters: [
                                                    //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                                    // ],
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
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                h/200.5)
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
                                                                h/200.5)
                                                        ),
                                                        border:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                h/200.5),

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
                                                              h/200.5)
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
                                                              h/200.5)
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                        EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            12),
                                                        hintText: "Email",
                                                        hintStyle: _TextTheme
                                                            .headline6!
                                                            .copyWith(
                                                          fontSize: 20.sp,
                                                        )),
                                                    keyboardType:
                                                    TextInputType.text,
                                                    // obscureText: SecureInput_pass,
                                                  ),
                                                )),
                                            Container(
                                              width: w / 1.4,
                                              child: Center(
                                                  child: Text(
                                                      'You need to verify your email before using your account. We will send you a verification email.',
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: _TextTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                          FontWeight
                                                              .w300,
                                                          color: Color(
                                                              0xffEAEAEA)))),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        state.iSHideSpaceOnSignUP!
                                            ?Container()
                                        :
                                        Spacer(),
                                        Column(
                                          children: [
                                            Form(
                                                autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                                key: _formkey2,
                                                child: Container(
                                                  width: w / 1.32,
                                                  height: h / 10,
                                                  // height:Changed2?_formkey2.currentState!.validate()?h/13:h/10:h/13,
                                                  child: TextFormField(
                                                    keyboardAppearance:
                                                    Brightness.dark,
                                                    textInputAction:
                                                    TextInputAction.next,
                                                    controller: _PassController,

                                                    onTap: (){
                                                      bloc2.add(HideSpaceOnSignUP());
                                                    },
                                                      // inputFormatters: [
                                                      //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                                      // ],
                                                    onChanged: (value) {
                                                      Selected = true;
                                                      setState(() {

                                                      });
                                                    //  bloc2.add(ChangeSelected((b) => b..status = true));
                                                    },
                                                    onFieldSubmitted: (value) {
                                                      FoucesNodeConfirm.requestFocus();
                                                    },
                                                    validator:(value){
                                                      if (!AtleastOneUperCase
                                                          .hasMatch(
                                                          value!)) {
                                                        return "Password Must Contain At least 1 UpperCase Character";
                                                      } else if (!containAtleastOneLowercase
                                                          .hasMatch(
                                                          value)) {
                                                        return "Password Must Contain At least 1 LowerCase Character";
                                                      } else if (!shouldContainAtleastOneDigit
                                                          .hasMatch(
                                                          value)) {
                                                        return "Password Must Contain At least 1 Digit";
                                                      } else if (!least8CharactersInLength
                                                          .hasMatch(
                                                          value)) {
                                                        return "Password Minimum length is 8 characters";
                                                      }
                                                    },
                                                    cursorColor: Colors.black,
                                                    cursorHeight: h / 30,
                                                    style: TextStyle(
                                                        fontSize: 19.sp,
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
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                h/200.5)
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
                                                                h/200.5)
                                                        ),
                                                        border:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              h/200.5),

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
                                                                h/200.5)
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
                                                                h/200.5)
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                        EdgeInsets
                                                            .symmetric(
                                                          horizontal: 12.w,
                                                        ),
                                                        hintText: "Password",
                                                        hintStyle: _TextTheme
                                                            .headline6!
                                                            .copyWith(
                                                          fontSize: 20.sp,
                                                        )),
                                                    keyboardType:
                                                    TextInputType.text,
                                                    obscureText: true,
                                                  ),
                                                )),
                                        Container(
                                                child: Form(
                                                    autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                    key: _formkey3,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: h / 20),
                                                      width: w / 1.32,
                                                      child: TextFormField(
                                                        keyboardAppearance:
                                                        Brightness.dark,
                                                        textInputAction:
                                                        TextInputAction
                                                            .next,
                                                        controller:
                                                        _ConfirmpassController,
                                                        autocorrect: true,
                                                        // inputFormatters: [
                                                        //   FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                                        // ],
                                                        onTap: (){
                                                          bloc2.add(HideSpaceOnSignUP());
                                                        },
                                                        onChanged: (value) {
                                                          Selected = true;
                                                          setState(() {

                                                          });
                                                          // bloc2.add(ChangeSelected((b) => b..status = true));
                                                        },
                                                        onFieldSubmitted:
                                                            (value) {},
                                                        validator: (value) {
                                                          //  final AtleastOneUperCase = RegExp("(?=.*[A-Z])");
                                                          //   final containAtleastOneLowercase = RegExp("(?=.*[a-z])");
                                                          //   final shouldContainAtleastOneDigit = RegExp("(?=.*?[0-9])");
                                                          //   final least8CharactersInLength = RegExp(".{8,}");
                                                          if (!AtleastOneUperCase
                                                              .hasMatch(
                                                              value!)) {
                                                            return "Password Must Contain At least 1 UpperCase Character";
                                                          } else if (!containAtleastOneLowercase
                                                              .hasMatch(
                                                              value)) {
                                                            return "Password Must Contain At least 1 LowerCase Character";
                                                          } else if (!shouldContainAtleastOneDigit
                                                              .hasMatch(
                                                              value)) {
                                                            return "Password Must Contain At least 1 Digit";
                                                          } else if (!least8CharactersInLength
                                                              .hasMatch(
                                                              value)) {
                                                            return "Password Minimum length is 8 characters";
                                                          }
                                                        },
                                                        cursorColor:
                                                        Colors.black,
                                                        cursorHeight: h / 30,
                                                        style: TextStyle(
                                                            fontSize: 19.sp,
                                                            height: 0.9.h,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            color:
                                                            Colors.brown),
                                                        decoration:
                                                        InputDecoration(
                                                            errorStyle:
                                                            TextStyle(
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
                                                                    h/200.5)
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
                                                                    h/200.5)
                                                            ),
                                                            border:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  h/200.5),

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
                                                                    h/200.5)
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
                                                                    h/200.5)
                                                            ),
                                                            filled: true,
                                                            fillColor:
                                                            Colors
                                                                .white,
                                                            contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                              horizontal:
                                                              12.w,
                                                            ),
                                                            hintText:
                                                            "Confirm Password",
                                                            hintStyle: _TextTheme
                                                                .headline6!
                                                                .copyWith(
                                                              fontSize: 19.sp,
                                                            )),
                                                        keyboardType:
                                                        TextInputType.text,
                                                        obscureText: true,
                                                      ),
                                                    )),
                                              ),

                                            InkWell(
                                              onTap: () async {
                                                if (_formkey1.currentState!.validate() &&
                                                    _formkey2.currentState!
                                                        .validate() &&
                                                    _formkey3.currentState!
                                                        .validate()) {
                                                  bool result =
                                                  await InternetConnectionChecker()
                                                      .hasConnection;
                                                  if (result == true) {
                                                    bloc2.add(CheckEmails((b) =>
                                                    b
                                                      ..Email =
                                                          _EmailController
                                                              .text));
                                                    Diditonce = true;
                                                  } else {
                                                    print(
                                                        'No internet :( Reason:');
                                                    CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
                                                  }
                                                }
                                              },
                                              child: Container(
                                                  width: w / 1.30,
                                                  height: h / 13.9,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      topLeft: Radius.circular( h/90.5),
                                                      topRight:Radius.circular( h/90.5),
                                                      bottomLeft: Radius.circular( h/90.5),
                                                      bottomRight:Radius.circular( h/90.5),
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
                                                    color:

                                                    Selected
                                                        ?
                                                    (_formkey1
                                                        .currentState!
                                                        .validate() &&
                                                        _formkey2
                                                            .currentState!
                                                            .validate() &&
                                                        _formkey3
                                                            .currentState!
                                                            .validate())
                                                        ? Color.fromRGBO(
                                                        207, 109, 56, 1)
                                                        : Color(0xff939393)
                                                        : Color(0xff939393),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Sign Up',
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: _TextTheme
                                                          .headline1!
                                                          .copyWith(
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontSize: 18.sp,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            Text(""),
                                            Container(
                                              child: InkWell(
                                                onTap: () {
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) => Navigator.of(
                                                          context)
                                                          .pop());
                                                },
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Already have an account?",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: _TextTheme
                                                            .headline1!
                                                            .copyWith(
                                                            fontSize: 14.sp,
                                                            letterSpacing:
                                                            0.3,
                                                            fontWeight:
                                                            FontWeight
                                                                .w300,
                                                            height: 1)),
                                                    Text("Log In",
                                                        textAlign:
                                                        TextAlign.center,
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
                                          ],
                                        ),
                                        Spacer(),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                      

                      state.isLoading == true
                          ? Center(child: listLoader(context: context))
                          : Container(),

                    ]),
                  )));
        });
  }

  Widget listLoader({context}) {
    return SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }

  alreatDialogBuilder(
    BuildContext Context,
    String Title,
    String body,
    String BottonTxt,
  ) async {
    return showDialog(
        context: Context,
           barrierDismissible: true,
        builder: (Context) {
          return AlertDialog(
            title: Text(Title),
            content: Container(
              child: Text(body),
            ),
            actions: [
              RaisedButton(
                child: Text(BottonTxt),
                onPressed: () {
                  Navigator.pop(Context);
                },
              ),
            ],
          );
        });
  }

  Onpressed() {}
}
