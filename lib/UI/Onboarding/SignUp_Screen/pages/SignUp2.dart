// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names
import 'dart:io';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/prefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/signup.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/theme/ResponsiveText.dart';
import 'Birthday_screen.dart';
import 'Gender_screen.dart';


class SignUp2 extends StatefulWidget {
  UsersData? Users;
    SignUp2({this.Users});
  @override
  _SignUp2State createState() => _SignUp2State();
}


class _SignUp2State extends State<SignUp2> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bloc2 = sl<SignUpBloc>();
  final Pref = PrefsHelper();
  late FocusNode FoucesNodeFirstName;
  late FocusNode FoucesNodeLastName;
  bool Changed3 = false;
  bool Changed2 = false;
  bool SecureInput_pass = false;
  bool SecureInput_pass2 = false;
  bool DIALOG = false;
  bool DiditOnce = true;
  double? lat;
  double? lng;
  String? fcmToken;

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final TextEditingController _FirstNameController = TextEditingController();
  final TextEditingController _LastNameController = TextEditingController();

  Future<void> GetlatAndLng() async {
    lat = await Pref.Getlat();
    lng = await Pref.GetLng();
    print(" User lat and lng ??! : $lat , $lng ");
  }
bool Selected = false;
  @override
  void initState() {
    FoucesNodeFirstName = FocusNode();
    FoucesNodeLastName = FocusNode();


    super.initState();
    // FirebaseMessaging.instance.getToken().then((FcmTOken) =>
    // fcmToken = FcmTOken
    //
    // );
    // GetlatAndLng();
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
                            Text(""),


                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 0.24.sp,
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
                                            fontSize: 0.24.sp,
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
  final nameValidation = RegExp(r"^[\p{Letter}\p{Number}]+$");
  final nameValidation2 = RegExp(r"([A-Za-z0-9\-\_]+)");
  final nameValidation3 = RegExp( r'^(?=.*[a-zA-Z])(?=.*[*".!@#\$%^&(){}:;<>,.\' r"'?/~_+-=])(?=.*[0-9]).{8,30}\$");
  final nameValidation4 = RegExp("/[ `!@#\$%^&*()_+\-=\[\]{};':\"\|,.<>\/?~]/");
  @override
  void dispose() {
    super.dispose();
    FoucesNodeFirstName.dispose();
    FoucesNodeLastName.dispose();
    _FirstNameController.dispose();
    _LastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return   BlocBuilder(
        bloc: bloc2,
        builder: (BuildContext context, SignUpState state)
    { return
      WillPopScope(
          onWillPop: () async => true,
          child: GestureDetector(
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child:
              SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  key: _scaffoldKey,
                  backgroundColor: AppColor,
                  body: SafeArea(
                      child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                FocusScopeNode currentFocus = FocusScope.of(
                                    context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              child:
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: w,
                                      height: h,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            width: w / 1.2,
                                            margin: EdgeInsets.only(
                                                top: h / 40),
                                            child: InkWell(
                                              onTap: () {
                                                WidgetsBinding.instance.addPostFrameCallback((_) =>
                                                    Navigator.of(context).pop()
                                                );
                                              },
                                              child: Text('< Back',
                                                  textAlign: TextAlign.left,
                                                  style: _TextTheme.headline1!
                                                      .copyWith(
                                                      fontSize: 20.sp,
                                                      letterSpacing: 0.1,
                                                      fontWeight: FontWeight
                                                          .w300,
                                                      height: 1
                                                  )),
                                            ),
                                          ),

                                          Text('What is your name?',
                                              textAlign: TextAlign.left,
                                              style: _TextTheme.headlineLarge!
                                                  .copyWith(
                                                letterSpacing: 0.6,
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                              )),
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
                                                      keyboardAppearance: Brightness
                                                          .dark,
                                                      textInputAction: TextInputAction
                                                          .next,
                                                      controller: _FirstNameController,
                                                      onChanged: (value) {
                                                        Selected = true;
                                                        setState(() {

                                                        });
                                                      },
                                                      onFieldSubmitted: (
                                                          value) {
                                                        FoucesNodeLastName
                                                            .requestFocus();
                                                      },


                                                      validator:(value){

                                                    if (value!.isEmpty){
                                                          return "Required";
                                                        }else if (value.length<2) {
                                                          return "Minimum name length is 3 Characters";
                                                        }else if (value.length>25){
                                                          return "Maximum name length is 25 Characters";
                                                        }else if (RegExp(r'^[*&^%$#@!\|+=<>?/~0-9]+$').hasMatch(value.toString())){
                                                      return "Can't use Other Languages!";
                                                    }
                                                      }

                                                      ,
                                                      cursorColor: Colors.black,
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight
                                                              .w500,
                                                          height: 1.h,
                                                          color: Colors.brown),

                                                      decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                            color: Colors.red,),
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
                                                          fillColor: Colors
                                                              .white,
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 12.w,
                                                              vertical: h /
                                                                  100),
                                                          hintText: "First Name",
                                                          hintStyle: _TextTheme
                                                              .headline6!
                                                              .copyWith(
                                                            fontSize: 20.sp,
                                                          )
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text,
                                                      // obscureText: SecureInput_pass,
                                                    ),
                                                  )),
                                              Container(
                                                  width: w / 1.32,
                                                  height: h / 10,
                                                  child: Form(
                                                    autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                    key: _formkey2,
                                                    child: TextFormField(
                                                      keyboardAppearance: Brightness
                                                          .dark,
                                                      textInputAction: TextInputAction
                                                          .next,
                                                      controller: _LastNameController,
                                                      onChanged: (value) {
                                                        Selected = true;
                                                        setState(() {

                                                        });
                                                      },
                                                      onFieldSubmitted: (
                                                          value) {},
                                                      validator:(value){
                                            if (value!.isEmpty){
                                            return "Required";
                                            }else if (value.length<2) {
                                            return "Minimum name length is 3 Characters";
                                            }else if (value.length>25){
                                            return "Maximum name length is 25 Characters";
                                            }
                                                      // if (nameValidation4
                                                      //   .hasMatch(
                                                      // value!)) {
                                                      // return "Only Letters and numbers allowed for Lastname";
                                                      // }else if (value.isEmpty){
                                                      // return "Required";
                                                      // }else if (value.length<3) {
                                                      // return "Minimum Lastname length is 3 Characters";
                                                      // }else if (value.length>25){
                                                      // return "Maximum Lastname length is 3 Characters";
                                                      // }
                                                      },

                                                      cursorColor: Colors.black,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                                                      ],
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight
                                                              .w500,

                                                          height: 1.h,

                                                          color: Colors.brown),

                                                      decoration: InputDecoration(
                                                          errorStyle: TextStyle(
                                                            color: Colors.red,),
                                                          errorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 0.0),
                                                          ),
                                                          focusedErrorBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white,
                                                                width: 0.0),
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(5)
                                                          ),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white),
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                          ),
                                                          focusedBorder: UnderlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .white),
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors
                                                              .white,
                                                          contentPadding: EdgeInsets
                                                              .symmetric(
                                                              horizontal: 12.w,
                                                              vertical: h / 100
                                                          ),
                                                          hintText: "Last Name",
                                                          hintStyle: _TextTheme
                                                              .headline6!
                                                              .copyWith(
                                                            fontSize: 20.sp,
                                                          )
                                                      ),
                                                      keyboardType: TextInputType
                                                          .text,
                                                      // obscureText: SecureInput_pass,
                                                    ),
                                                  )),
                                            ],
                                          ),


                                          Text(""),
                                          Text(""),
                                          Text(""),
                                          InkWell(
                                            onTap: () async {
                                              if (_formkey1.currentState!
                                                  .validate() &&
                                                  _formkey2.currentState!
                                                      .validate()) {
                                                widget.Users!
                                                    .SetFirstnameANDLastname(
                                                    _FirstNameController.text,
                                                    _LastNameController.text);
                                                bool result = await InternetConnectionChecker()
                                                    .hasConnection;
                                                if (result == true) {
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback((
                                                      _) =>
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                BirthDay(
                                                                  Users: widget
                                                                      .Users,
                                                                )),)
                                                  );
                                                } else {
                                                  print(
                                                      'No internet :( Reason:');
                                                  CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);

                                                }
                                              }
                                            },
                                            child: Container(
                                                width: w / 1.32,
                                                height: h / 13.9,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .only(
                                                    topLeft: Radius.circular(5),
                                                    topRight: Radius.circular(
                                                        5),
                                                    bottomLeft: Radius.circular(
                                                        5),
                                                    bottomRight: Radius
                                                        .circular(5),
                                                  ),
                                                  boxShadow: [BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0,
                                                          0.15000000596046448),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 6
                                                  )
                                                  ],
                                                  color: Selected ?
                                                  (_formkey1.currentState!
                                                      .validate() &&
                                                      _formkey2.currentState!
                                                          .validate())
                                                      ? Color.fromRGBO(
                                                      207, 109, 56, 1)
                                                      : Color(0xff939393)

                                                      : Color(0xff939393),
                                                ),
                                                child:
                                                Center(
                                                  child: Text('Next',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                    _TextTheme.headline1!
                                                        .copyWith(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontSize: 18.sp,

                                                    ),),
                                                )

                                            ),
                                          ),
                                          Text(""),
                                          Text(""),


                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            // state.isLoading == true
                            //     ? Center(child: listLoader(context: context))
                            //     : Container(),
                          ])),
                ),
                //   );
                // },
              )));
    }
    );

  }
  Widget listLoader({context}) {
    return SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
    //       Container(
    //                               child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceEvenly,
    //                                   children: [
    //                                     Container(
    //                                         child: Form(
    //                                       autovalidateMode:
    //                                           AutovalidateMode.onUserInteraction,
    //                                       key: _formkey1,
    //                                       child: TextFormField(
    //                                         keyboardAppearance: Brightness.dark,
    //                                         textInputAction: TextInputAction.next,
    //                                         controller: _EmailController,
    //                                         onChanged: (value) {},
    //                                         onFieldSubmitted: (value) {
    //                                           FoucesNodePass.requestFocus();
    //                                         },
    //                                         focusNode: FoucesNodeEmail,
    //
    //                                         validator: MultiValidator([
    //                                           RequiredValidator(
    //                                               errorText: "Required"),
    //                                           EmailValidator(
    //                                               errorText: "Thats not an email")
    //                                         ]),
    //                                         cursorColor: Colors.black,
    //                                         style: const TextStyle(
    //                                             color: Colors.brown),
    //
    //                                         decoration: const InputDecoration(
    //                                           enabledBorder: UnderlineInputBorder(
    //                                             borderSide:
    //                                                 BorderSide(color: sliderBack),
    //                                           ),
    //                                           focusedBorder: UnderlineInputBorder(
    //                                             borderSide:
    //                                                 BorderSide(color: Colors.black),
    //                                           ),
    //                                           filled: true,
    //                                           fillColor: Colors.white,
    //                                           contentPadding: EdgeInsets.symmetric(
    //                                               horizontal: 12),
    //                                           hintText: "Email..",
    //                                           labelText: "Email",
    //                                           labelStyle: TextStyle(
    //                                             fontSize: 14,
    //                                             fontWeight: FontWeight.bold,
    //                                             color: sliderBack,
    //                                           ),
    //                                         ),
    //                                         keyboardType: TextInputType.text,
    //                                         // obscureText: SecureInput_pass,
    //                                       ),
    //                                     )),
    //                                     Container(
    //                                       child: Form(
    //                                           autovalidateMode: AutovalidateMode
    //                                               .onUserInteraction,
    //                                           key: _formkey2,
    //                                           child: TextFormField(
    //                                             keyboardAppearance: Brightness.dark,
    //                                             textInputAction:
    //                                                 TextInputAction.next,
    //                                             controller: _PassController,
    //                                             onChanged: (value) {},
    //                                             onFieldSubmitted: (value) {
    //                                               FoucesNodeConfirm.requestFocus();
    //                                             },
    //                                             focusNode: FoucesNodePass,
    //                                             validator: MultiValidator([
    //                                               RequiredValidator(
    //                                                   errorText: "Required"),
    //                                               MinLengthValidator(6,
    //                                                   errorText:
    //                                                       "Password must be Aleast 6 Characters")
    //                                             ]),
    //                                             cursorColor: Colors.black,
    //                                             style:
    //                                                 TextStyle(color: Colors.brown),
    //                                             decoration: InputDecoration(
    //                                                 enabledBorder:
    //                                                     UnderlineInputBorder(
    //                                                   borderSide: BorderSide(
    //                                                       color: sliderBack),
    //                                                 ),
    //                                                 focusedBorder:
    //                                                     UnderlineInputBorder(
    //                                                   borderSide: BorderSide(
    //                                                       color: Colors.black),
    //                                                 ),
    //                                                 filled: true,
    //                                                 fillColor: Colors.white,
    //                                                 //   contentPadding:  const EdgeInsets.symmetric(horizontal: 12),
    //                                                 hintText: "Password..",
    //                                                 labelText: "Password",
    //                                                 labelStyle: TextStyle(
    //                                                   fontSize: 14,
    //                                                   fontWeight: FontWeight.bold,
    //                                                   color: sliderBack,
    //                                                 ),
    //                                                 suffixIcon: IconButton(
    //                                                   icon: Icon(SecureInput_pass
    //                                                       ? Icons
    //                                                           .remove_red_eye_outlined
    //                                                       : Icons.security),
    //                                                   onPressed: () {
    //                                                     setState(() {
    //                                                       SecureInput_pass =
    //                                                           !SecureInput_pass;
    //                                                     });
    //                                                   },
    //                                                 )),
    //                                             keyboardType: TextInputType.text,
    //                                             obscureText: SecureInput_pass,
    //                                           )),
    //                                     ),
    //                                     Container(
    //                                         child: Form(
    //                                       autovalidateMode:
    //                                           AutovalidateMode.onUserInteraction,
    //                                       key: _formkey3,
    //                                       child: TextFormField(
    //                                         keyboardAppearance: Brightness.dark,
    //                                         textInputAction: TextInputAction.next,
    //                                         controller: _ConfirmpassController,
    //                                         onChanged: (value) {},
    //                                         onFieldSubmitted: (value) {
    //                                         },
    //                                         focusNode: FoucesNodeConfirm,
    //                                         validator:
    //                                         MultiValidator([
    //                                           RequiredValidator(errorText:"Required"),
    //                                           MinLengthValidator(6,errorText: "Password must be Aleast 6 Characters")
    //                                         ]),
    //                                         cursorColor: Colors.black,
    //                                         style: const TextStyle(
    //                                             color: Colors.brown),
    //                                         decoration: InputDecoration(
    //                                             enabledBorder:
    //                                                 const UnderlineInputBorder(
    //                                               borderSide:
    //                                                   BorderSide(color: sliderBack),
    //                                             ),
    //                                             focusedBorder:
    //                                                 const UnderlineInputBorder(
    //                                               borderSide: BorderSide(
    //                                                   color: Colors.black),
    //                                             ),
    //                                             filled: true,
    //                                             fillColor: Colors.white,
    //                                             contentPadding:
    //                                                 EdgeInsets.symmetric(
    //                                                     horizontal: 12),
    //                                             hintText: "Confirm password..",
    //                                             labelText: "Confirm password",
    //                                             labelStyle: const TextStyle(
    //                                               fontSize: 14,
    //                                               fontWeight: FontWeight.bold,
    //                                               color: sliderBack,
    //                                             ),
    //                                             suffixIcon: IconButton(
    //                                               icon: Icon((SecureInput_pass
    //                                                   ? Icons
    //                                                       .remove_red_eye_outlined
    //                                                   : Icons.security)),
    //                                               onPressed: () {
    //                                                 setState(() {
    //                                                   SecureInput_pass2 =
    //                                                       !SecureInput_pass2;
    //                                                 });
    //                                               },
    //                                             )),
    //                                         keyboardType: TextInputType.text,
    //                                         obscureText: SecureInput_pass2,
    //                                       ),
    //                                     )),
    //                                   ]),
    //                             ),
    //
    //                             Container(
    //                               child: Column(
    //                                 children: [
    //                                   Container(
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.end,
    //                                       children: [
    //                                         InkWell(
    //                                           onTap: () {},
    //                                           child: Container(
    //                                             height: h / 25,
    //                                             child: const Text(
    //                                               'Forgot Password?    \n',
    //                                               style: TextStyle(
    //                                                 fontFamily: 'Montserrat',
    //                                                 fontSize: 14,
    //                                                 color: Color(0xff000000),
    //                                                 height: 2.2857142857142856,
    //                                               ),
    //                                               textHeightBehavior:
    //                                                   TextHeightBehavior(
    //                                                       applyHeightToFirstAscent:
    //                                                           false),
    //                                               textAlign: TextAlign.center,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   Container(
    //                                     child: custombtn(
    //                                       WantBig: true,
    //                                       WantImage: false,
    //                                       IsGoogle: false,
    //                                       btnColor: Colors.red,
    //                                       outlineColor: Colors.red,
    //                                       TxtColor: red,
    //                                       textt: "SIGN UP",
    //                                       onPressed: () async {
    //
    //                                         DIALOG = !DIALOG;
    //                                         if (_formkey2.currentState!.validate() &&
    //                                             _formkey3.currentState!
    //                                                 .validate() &&
    //                                             _formkey1.currentState!
    //                                                 .validate()
    //                                          ) {
    //                                           bool result =
    //                                               await InternetConnectionChecker()
    //                                                   .hasConnection;
    //                                           if (result == true) {
    //                                             print('YAY! Free cute dog pics!');
    //
    //                                             // WidgetsBinding.instance!.addPostFrameCallback((_) =>
    //                                             // //this line of code is to prevent a red screen between yeilds
    //                                             // Navigator.push(
    //                                             //   context,
    //                                             //   MaterialPageRoute(builder: (context) => VerifyScreen(
    //                                             //     email: _EmailController.text,
    //                                             //     Username: _UsernameController.text,
    //                                             //     ConfirmPass: _ConfirmpassController.text,
    //                                             //     Lat: lat!,
    //                                             //     Phone: _phoneController.text,
    //                                             //     Pass: _PassController.text,
    //                                             //     FcmToken: fcmToken??"uuu",
    //                                             //     Lng: lng!,
    //                                             //   )),
    //                                             // ));
    //                                             //
    //                                             ///Proccess DOne.
    //
    //
    //                                           } else {
    //                                             print('No internet :( Reason:');
    //                                             Page2().method(
    //                                                 _scaffoldKey.currentContext!,
    //                                                 "Connection Failed",
    //                                                 """Something went Wrong
    //                                                             Check your internet Connection""",
    //                                                 "back");
    //                                           }
    //                                         } else if (_PassController.text.isEmpty ||
    //                                             _ConfirmpassController
    //                                                 .text.isEmpty ||
    //                                             _EmailController.text.isEmpty
    //                                           ) {
    //                                           Future.delayed(Duration.zero, () {
    //                                             Page2().method(
    //                                                 _scaffoldKey.currentContext!,
    //                                                 "Error",
    //                                                 "Input Mustn't be Empty",
    //                                                 "back");
    //                                           });
    //
    //
    //
    //                                         } else if (!RegExp(
    //                                                 emailvalidaition.toString())
    //                                             .hasMatch(_EmailController.text)) {
    //                                           Future.delayed(Duration.zero, () {
    //                                             Page2().method(
    //                                                 _scaffoldKey.currentContext!,
    //                                                 "Error",
    //                                                 "Thats not an Email",
    //                                                 "back");
    //                                           });
    //                                         }  else if (_PassController.text.length < 6 ||
    //                                             _ConfirmpassController.text.length <
    //                                                 6) {
    //
    //                                         }
    //                                       },
    //                                       IsLoading: false,
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //
    //                             InkWell(
    //                               onTap: (){},
    //                               child: Row(
    //                                   mainAxisAlignment: MainAxisAlignment.center,
    //                                   children: [
    //                                     RichText(
    //                                       text: TextSpan(
    //                                         children: <TextSpan>[
    //                                           TextSpan(
    //                                             text: "Already Have an account?",
    //                                             style: TextStyle(
    //                                                 color: writingONback,
    //                                                 fontSize: 12),
    //                                           ),
    //                                           const TextSpan(
    //                                             text: "sign in",
    //                                             style: TextStyle(
    //                                               fontSize: 12,
    //                                               color: red,
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     )
    //                                   ]),
    //                             ),
    // Container(
    //                               height: h / 2.1,
    //                               padding: EdgeInsets.only(top: 0),
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.start,
    //                                 children: [
    //                                   Container(
    //                                     child: custombtn(
    //                                       WantBig: true,
    //                                       WantImage: false,
    //                                       IsGoogle: false,
    //                                       btnColor: pinkColor,
    //                                       outlineColor: Colors.black45,
    //                                       TxtColor: white,
    //                                       textt: "Sign Up",
    //                                       //this text of the button passed to the custombtn function
    //                                       onPressed: () {
    //                                         print("heloo");
    //                                         widget.bloc2.add(PostSignUp((b) => b
    //                                           ..username = _UsernameController.text
    //                                           ..password = _PassController.text
    //                                           ..Email = _EmailController.text
    //                                           ..Phone = _phoneController.text
    //                                           ..ConfirmPass = _ConfirmpassController.text
    //                                              ));
    //                                       },
    //
    //
    //                                       IsLoading:
    //                                           false,
    //
    //                                     ),
    //                                   ),
    //                                   Row(
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceAround,
    //                                     children: [
    //                                       Container(
    //                                         width: w / 2.5,
    //                                         height: h / 500,
    //                                         color: Colors.white12,
    //                                       ),
    //                                       Container(
    //                                         child: Text(
    //                                           "OR",
    //                                           style: TextStyle(
    //                                               color: writingONback,
    //                                               fontSize: 18,
    //                                               fontWeight: FontWeight.w500),
    //                                         ),
    //                                       ),
    //                                       Container(
    //                                         width: w / 2.5,
    //                                         height: h / 500,
    //                                         color: Colors.white12,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Container(
    //                                     child: Column(
    //                                       mainAxisAlignment: MainAxisAlignment.center,
    //                                       children: [
    //                                         InkWell(
    //                                           onTap: () {
    //                                             Navigator.push(
    //                                               context,
    //                                               MaterialPageRoute(builder: (context) =>  Login()),
    //                                             );
    //                                           },
    //                                           child: Row(
    //                                               mainAxisAlignment:
    //                                                   MainAxisAlignment.center,
    //                                               children: [
    //                                                 RichText(
    //                                                   text: TextSpan(
    //                                                     children: <TextSpan>[
    //                                                       TextSpan(
    //                                                         text:
    //                                                             "Already Have an account?",
    //                                                         style: TextStyle(
    //                                                           color: writingONback,
    //                                                         ),
    //                                                       ),
    //                                                       TextSpan(
    //                                                         text: "Sign IN",
    //                                                         style: TextStyle(
    //                                                           color: Colors.pink,
    //                                                         ),
    //                                                       ),
    //                                                     ],
    //                                                   ),
    //                                                 )
    //                                               ]),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ), //btns--------------------
    //                             ),
    //  ElevatedButton(
    //                                   onPressed: () {
    //                                     _formkey5.currentState!.validate();
    //                                   },
    //                                   child: Text('Validate'),
    //                                 ),
    //                                 ElevatedButton(
    //                                   onPressed: () {
    //                                     getPhoneNumber('+15417543010');
    //                                   },
    //                                   child: Text('Update'),
    //                                 ),
    //                                 ElevatedButton(
    //                                   onPressed: () {
    //                                     _formkey5.currentState!.save();
    //                                   },
    //                                   child: Text('Save'),
    //                                 ),
    //  Container(
    //                                       width: w / 1.1,
    //                                       height: h / 10,
    //                                       child: Form(
    //                                         autovalidateMode:   AutovalidateMode.onUserInteraction,
    //                                         key: _formkey1,
    //                                         child: TextFormField(
    //                                           textInputAction: TextInputAction.next,
    //                                           style:  TextStyle(color: Colors.white70),
    //
    //
    //                                           controller: _UsernameController,
    //                                           onChanged: (value) {},
    //                                           onFieldSubmitted: (value) {
    //
    //                                           },
    //                                           validator: MultiValidator([
    //                                             // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
    //                                             RequiredValidator(
    //                                                 errorText: "Required"),
    //                                             MinLengthValidator(4,
    //                                                 errorText:
    //                                                     "name must be Above 4 Characters"),
    //                                           ]),
    //                                           cursorColor: Colors.black,
    //                                           decoration: InputDecoration(
    //                                               filled: true,
    //                                               fillColor: textfieldBack,
    //                                               prefixIcon: Icon(Icons.person),
    //                                               contentPadding:
    //                                                   EdgeInsets.symmetric(
    //                                                       horizontal: 12),
    //                                               hintText: "User Name",
    //                                               labelText: "User Name",
    //
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: 18,
    //                                                 color: Colors.blue[900],
    //                                               ),
    //
    //                                               suffixIcon: IconButton(
    //
    //                                                 icon: Icon(_EmailController
    //                                                         .text.isEmpty
    //                                                     ? null
    //                                                     : Icons.close),
    //                                                 onPressed: () {
    //                                                   setState(() {
    //                                                     _UsernameController.clear();
    //                                                   });
    //                                                 },
    //                                               )),
    //                                           keyboardType: TextInputType.text,
    //
    //                                         ),
    //                                       )),
    //                                   Container(
    //                                       width: w / 1.1,
    //                                       height: h / 10,
    //                                       child: Form(
    //                                         autovalidateMode:
    //                                             AutovalidateMode.onUserInteraction,
    //                                         key: _formkey3,
    //                                         child: TextFormField(
    //                                           textInputAction: TextInputAction.next,
    //                                           controller: _EmailController,
    //                                           onChanged: (value) {
    //                                            // FoucesNodePass.requestFocus();
    //                                           },
    //                                           onFieldSubmitted: (value) {
    //                                             FoucesNodePass.requestFocus();
    //                                           },
    //                                           focusNode: FoucesNodeEmail,
    //                                           validator: MultiValidator([
    //                                             // the use inputs if its is email if so activate the emailvailidator if not do that minlength thingy
    //                                             RequiredValidator(
    //                                                 errorText: "Required"),
    //                                             EmailValidator(
    //                                                 errorText:
    //                                                     "That's not an Email")
    //                                             // MinLengthValidator(2, errorText: "Password must be Above 2 Characters")),
    //                                             //  MinLengthValidator(6,  errorText: "Password must be Above 6 Characters"),
    //                                           ]),
    //                                           cursorColor: Colors.black,
    //                                           style:
    //                                               TextStyle(color: Colors.white70),
    //                                           decoration: InputDecoration(
    //                                               filled: true,
    //                                               fillColor: textfieldBack,
    //                                               prefixIcon: Icon(Icons.email),
    //                                               contentPadding:
    //                                                   EdgeInsets.symmetric(
    //                                                       horizontal: 12),
    //                                               hintText: "Email..",
    //                                               labelText: "Email Address",
    //                                               // we access constructor in statefulWidgets Throw Widget.Var
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: 18,
    //                                                 color: Colors.blue[900],
    //                                               ),
    //                                               // border: OutlineInputBorder(),
    //                                               suffixIcon: IconButton(
    //                                                 //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
    //                                                 icon: Icon(_EmailController
    //                                                         .text.isEmpty
    //                                                     ? null
    //                                                     : Icons.close),
    //                                                 // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
    //                                                 onPressed: () {
    //                                                   setState(() {
    //                                                     _EmailController.clear();
    //                                                   });
    //                                                 },
    //                                               )),
    //                                           keyboardType: TextInputType.text,
    //                                           //  obscureText: SecureInput_pass,
    //                                         ),
    //                                       )),
    //                                   Container(
    //                                       width: w / 1.1,
    //                                       height: h / 10,
    //                                       child: Form(
    //                                         autovalidateMode:  AutovalidateMode.onUserInteraction,
    //                                         key: _formkey2,
    //                                         child: TextFormField(
    //                                           style: TextStyle(color: Colors.white70),
    //                                           controller: _PassController,
    //                                           onChanged: (value) {
    //                                            // FoucesNodeConfirm.requestFocus();
    //                                           },
    //                                           onFieldSubmitted: (value) {
    //                                             FoucesNodeConfirm.requestFocus();
    //                                           },
    //                                           focusNode: FoucesNodePass,
    //                                           validator: MultiValidator([
    //
    //                                             RequiredValidator(
    //                                                 errorText: "Required"),
    //                                             MinLengthValidator(6,
    //                                                 errorText:
    //                                                     "Password must be Above 6 Characters"),
    //                                           ]),
    //                                           cursorColor: Colors.black,
    //                                           decoration: InputDecoration(
    //                                               filled: true,
    //                                               fillColor: textfieldBack,
    //                                               prefixIcon: Icon(Icons.lock),
    //                                               contentPadding:
    //                                                   EdgeInsets.symmetric(
    //                                                       horizontal: 12),
    //                                               hintText: "password..",
    //                                               labelText: "Password",
    //
    //                                               labelStyle: TextStyle(
    //                                                 fontSize: 18,
    //                                                 color: Colors.blue[900],
    //                                               ),
    //
    //                                               suffixIcon: IconButton(
    //
    //                                                 icon: Icon((SecureInput_pass
    //                                                     ? Icons
    //                                                         .remove_red_eye_outlined
    //                                                     : Icons.security)),
    //                                                 // : (SecureInput_pass ? Icons.remove_red_eye_outlined: Icons.security)),
    //                                                 onPressed: () {
    //                                                   setState(() {
    //
    //                                                     SecureInput_pass =
    //                                                         !SecureInput_pass;
    //                                                   });
    //                                                 },
    //                                               )),
    //                                           keyboardType: TextInputType.text,
    //                                           obscureText: SecureInput_pass,
    //                                         ),
    //                                       )),
    //                                   Container(
    //                                       width: w / 1.1,
    //                                       height: h / 10,
    //                                       child: Form(
    //                                         autovalidateMode:
    //                                             AutovalidateMode.onUserInteraction,
    //
    //                                         key: _formkey4,
    //                                         child: TextFormField(
    //                                           controller: _ConfirmpassController,
    //                                           style:
    //                                               TextStyle(color: Colors.white70),
    //                                           onChanged: (value) {
    //                                           //  FoucesNodePhone.requestFocus();
    //                                           },
    //                                           onFieldSubmitted: (value) {
    //                                             FoucesNodePhone.requestFocus();
    //                                           },
    //                                           focusNode: FoucesNodeConfirm,
    //                                           validator: MultiValidator([
    //                                             RequiredValidator(
    //                                                 errorText: "Required"),
    //                                             MinLengthValidator(6,
    //                                                 errorText:
    //                                                     "Password must be Above 6 Characters"),
    //                                           ]),
    //                                           cursorColor: Colors.black,
    //                                           decoration: InputDecoration(
    //                                             filled: true,
    //                                             fillColor: textfieldBack,
    //                                             prefixIcon: Icon(Icons.lock),
    //                                             contentPadding:
    //                                                 EdgeInsets.symmetric(
    //                                                     horizontal: 12),
    //                                             hintText: "Confirm Password..",
    //                                             labelText: "Confrim Password",
    //                                             // we access constructor in statefulWidgets Throw Widget.Var
    //                                             labelStyle: TextStyle(
    //                                               fontSize: 18,
    //                                               color: Colors.blue[900],
    //                                             ),
    //                                               suffixIcon: IconButton(
    //                                                 //if secureinput which is passed in argument true i need the secure Icon if not DONT NEED IT
    //                                                 icon: Icon( SecureInput_pass2
    //                                                     ? Icons
    //                                                     .remove_red_eye_outlined
    //                                                     : Icons.security),
    //                                                 onPressed: () {
    //                                                   setState(() {
    //
    //                                                     SecureInput_pass2 =
    //                                                     !SecureInput_pass2;
    //                                                   });
    //                                                 },
    //                                               )
    //
    //                                           ),
    //                                           keyboardType: TextInputType.text,
    //                                           obscureText: SecureInput_pass2,
    //                                         ),
    //                                       )),
    //                                   Container(
    //                                       width: w / 1.1,
    //                                       height: h / 10,
    //                                       child: Form(
    //                                         autovalidateMode:
    //                                             AutovalidateMode.onUserInteraction,
    //                                         key: _formkey5,
    //
    //                                         child: TextFormField(
    //                                           style:
    //                                               TextStyle(color: Colors.white70),
    //                                            textInputAction: TextInputAction.next,
    //                                           controller: _phoneController,
    //                                           onChanged: (value) { },
    //                                           onFieldSubmitted: (value) {  },
    //
    //                                           focusNode: FoucesNodePhone,
    //                                           validator: MultiValidator([
    //                                             RequiredValidator(
    //                                                 errorText: "Required"),
    //                                           ]),
    //                                           cursorColor: Colors.black,
    //                                           decoration: InputDecoration(
    //                                             filled: true,
    //                                             fillColor: textfieldBack,
    //                                             prefixIcon: Icon(Icons.phone),
    //                                             contentPadding:
    //                                                 EdgeInsets.symmetric(
    //                                                     horizontal: 12),
    //                                             hintText: "phone..",
    //                                             labelText: "phone",
    //                                             labelStyle: TextStyle(
    //                                               fontSize: 18,
    //                                               color: Colors.blue[900],
    //                                             ),
    //                                           ),
    //
    //                                           //keyboardType: TextInputType.text,
    //                                           //obscureText: SecureInput_pass,
    //                                         ),
    //                                       )),
  }
}

