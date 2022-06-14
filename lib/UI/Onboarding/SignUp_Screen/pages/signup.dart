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
import 'package:flutter_bloc/flutter_bloc.dart';
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
        bloc: bloc2,                    //todo: fix logo
        //todo: fix solution for textfield getting covered by the keyboard.
        builder: (BuildContext context, SignUpState state) {
          if (state.success==true&& Diditonce ==true){
            if (_ConfirmpassController.text ==
                _PassController.text) {
              if (state.Checkemail!.msg=="success"){
                WidgetsBinding.instance!.addPostFrameCallback((_){

                  UsersData Users = UsersData(Email: _EmailController
                      .text ,Pass:_PassController
                      .text ,ConfirmPass: _ConfirmpassController
                      .text );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUp2(Users: Users,),


                    ),
                  );
                });


              }else{
                WidgetsBinding.instance!.addPostFrameCallback((_){
                  alreatDialogBuilder(context,"Authentication Error",state.Checkemail!.msg!,"Back");
                });
              }
            } else {
              WidgetsBinding.instance!.addPostFrameCallback((_){
                alreatDialogBuilder(context,"Error","Password Must be Equal to password confirmation","Back");
              });
            }
            Diditonce=false;
          }
          return SafeArea(
            child: Scaffold(
            //    resizeToAvoidBottomInset : false,
                key: _scaffoldKey,
                backgroundColor: AppColor,
                body: Stack(children: [
                  GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child:  SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width,
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                    Spacer(),
                                    Container(
                                      width: w / 1.34,
                                      height: h / 13,
                                      child: SvgPicture.asset(
                                        "Assets/images/Logo.svg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Container(
                                            width: w / 1.30,
                                            height: h/10,
                                            child: Form(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              key: _formkey1,
                                              child: TextFormField(
                                                keyboardAppearance: Brightness.dark,
                                                textInputAction:
                                                    TextInputAction.next,
                                                controller: _EmailController,
                                                onChanged: (value) {
                                                  Selected = true;
                                                },
                                                onFieldSubmitted: (value) {
                                                  FoucesNodePass.requestFocus();
                                                },

                                                validator: MultiValidator([
                                                  RequiredValidator(
                                                      errorText: "Required"),
                                                  EmailValidator(
                                                      errorText:
                                                          "Thats not an email")
                                                ]),
                                                cursorColor: Colors.black,
                                                cursorHeight: h/30,
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.brown),

                                                decoration: InputDecoration(
                                                    errorStyle:TextStyle(color: Colors.red,),
                                                    errorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(5)
                                                    ),
                                                  counterText: ' ',
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,

                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12),

                                                  hintText: "Email",
                                                    hintStyle: _TextTheme.headline6!.copyWith(
                                                      fontSize: 6.2 *
                                                          SizeConfig
                                                              .blockSizeHorizontal!
                                                              .toDouble(),
                                                    )
                                                ),
                                                keyboardType: TextInputType.text,
                                                // obscureText: SecureInput_pass,
                                              ),
                                            )),


                                        Container(
                                          width: w / 1.4,
                                          child:  Center(
                                              child: Text(
                                            'You need to verify your email before using your account. We will send you a verification email.',
                                            textAlign: TextAlign.center,
                                            style: _TextTheme.headlineLarge!.copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xffEAEAEA)
                                            )
                                          )),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Form(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              key: _formkey2,
                                              child: Container(
                                                width: w / 1.30,
                                              height: h/10,
                                              // height:Changed2?_formkey2.currentState!.validate()?h/13:h/10:h/13,
                                                child: TextFormField(
                                                keyboardAppearance: Brightness.dark,
                                                textInputAction:
                                                    TextInputAction.next,
                                                controller: _PassController,
                                                onChanged: (value) {
                                                  Selected = true;
                                                },
                                                onFieldSubmitted: (value) {
                                                  FoucesNodeConfirm.requestFocus();
                                                },
                                                validator: MultiValidator([
                                                  RequiredValidator(
                                                      errorText: "Required"),
                                                ]),
                                                cursorColor: Colors.black,
                                                  cursorHeight: h/30,
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.brown),
                                                decoration: InputDecoration(
                                                    errorStyle:TextStyle(color: Colors.red,),
                                                    errorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(5)
                                                    ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          // vertical: Changed2
                                                          //     ? _formkey2
                                                          //             .currentState!
                                                          //             .validate()
                                                          //         ? h / 100
                                                          //         : h / 70
                                                          //     : h / 100),
                                                      ),
                                                  hintText: "Password",
                                                    hintStyle: _TextTheme.headline6!.copyWith(
                                                      fontSize: 6.2 *
                                                          SizeConfig
                                                              .blockSizeHorizontal!
                                                              .toDouble(),
                                                    )
                                                ),
                                                keyboardType: TextInputType.text,
                                                obscureText: true,
                                              ),
                                            )),

                                     Form(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              key: _formkey3,
                                              child:    Container(
                                                margin: EdgeInsets.only(bottom: h/20),
                                                width: w / 1.30,
                                                child: TextFormField(
                                                keyboardAppearance: Brightness.dark,
                                                textInputAction:
                                                    TextInputAction.next,
                                                controller: _ConfirmpassController,
                                                autocorrect: true,
                                                onChanged: (value) {
                                                  Selected = true;
                                                },
                                                onFieldSubmitted: (value) {
                                                },
                                                validator: MultiValidator([
                                                  RequiredValidator(
                                                      errorText: "Required"),
                                                ]),
                                                cursorColor: Colors.black,
                                                  cursorHeight: h/30,
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.brown),
                                                decoration: InputDecoration(
                                                    errorStyle:TextStyle(color: Colors.red,),
                                                    errorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    focusedErrorBorder:  OutlineInputBorder(
                                                      borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(5)
                                                    ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                        borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                       ),
                                                  hintText: "Confirm Password",
                                                    hintStyle: _TextTheme.headline6!.copyWith(
                                                      fontSize: 6.2 *
                                                          SizeConfig
                                                              .blockSizeHorizontal!
                                                              .toDouble(),
                                                    )
                                                ),
                                                keyboardType: TextInputType.text,
                                                obscureText: true,
                                              ),
                                            )),

                                        InkWell(
                                          onTap: ()async {

                                            Changed2 = true;
                                            Changed3 = true;
                                            Changed = true;
                                            if (_formkey1.currentState!.validate() &&
                                                _formkey2.currentState!
                                                    .validate() &&
                                                _formkey3.currentState!
                                                    .validate()) {
                               bool result = await InternetConnectionChecker().hasConnection;
                                    if (result == true) {
                                      bloc2.add(CheckEmails((b) =>
                                      b
                                        ..Email = _EmailController.text
                                      ));
                                      Diditonce = true;
                                    }else {
                                      print('No internet :( Reason:');
                                      Page2().method(
                                          _scaffoldKey.currentContext!,
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
                                              decoration:  BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft: Radius.circular(5),
                                                  bottomRight: Radius.circular(5),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0,
                                                          0.15000000596046448),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 6)
                                                ],
                                                color:
                                                Selected?
                                                (_formkey1.currentState!.validate() &&
                                                    _formkey2.currentState!
                                                        .validate() &&
                                                    _formkey3.currentState!
                                                        .validate())?  Color.fromRGBO(207, 109, 56, 1)
                                                    :   Color(0xff939393)

                                                    :Color(0xff939393),
                                              ),
                                              child:  Center(
                                                child: Text(
                                                  'Sign Up',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  _TextTheme.headline1!.copyWith(
                                                      fontWeight: FontWeight.w600,
                                                    fontSize: 3 *
                                                        SizeConfig
                                                            .blockSizeVertical!
                                                            .toDouble(),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Text(""),
                                        Container(
                                          child: InkWell(
                                            onTap: () {
                                              WidgetsBinding.instance!
                                                  .addPostFrameCallback((_) =>
                                                      Navigator.of(context).pop());
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children:  [
                                                Text(
                                                  "Already have an account?",
                                                  textAlign: TextAlign.center,
                                                    style:  _TextTheme.headline1!.copyWith(
                                                        fontSize: 17,
                                                        letterSpacing: 0.3,
                                                        fontWeight: FontWeight.w300,
                                                        height: 1
                                                    )
                                                ),
                                                Text(
                                                  "Log In",


                                                  textAlign: TextAlign.center,
                                                  style: _TextTheme.headline1!.copyWith(
                                                      decoration:
                                                      TextDecoration.underline,
                                                      fontSize: 17,
                                                      letterSpacing: 0.3,
                                                      fontWeight: FontWeight.w500,
                                                      height: 1
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Spacer(),

                          ],
                          )
                        )
                      )
                        ),
                    ),


                  state.isLoading == true
                      ? Center(child: listLoader(context: context))
                      : Container(),
                ])),
          );
        });
  }

  Widget listLoader({context}) {
    return SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
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
        barrierDismissible: false,
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
