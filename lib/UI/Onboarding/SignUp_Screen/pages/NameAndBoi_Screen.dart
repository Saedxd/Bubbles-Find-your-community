import 'dart:typed_data';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Permission1_Screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

//todo: fix solution for textfield getting covered by the keyboard.
class NameAndBoi extends StatefulWidget {

  UsersData? Users;
  NameAndBoi({this.Users});

  @override
  State<NameAndBoi> createState() => _NameAndBoiState();
}

class _NameAndBoiState extends State<NameAndBoi> {
  final nameValidation3 = RegExp( r'^(?=.*[a-zA-Z])(?=.*[*".!@#\$%^&(){}:;<>,.\' r"'?/~_+-=])(?=.*[0-9]).{8,30}\$");
  final pref = sl<IPrefsHelper>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late FocusNode FoucesNodeUserName;
  late FocusNode FoucesNodeBoi;
  bool SecureInput_pass = false;
  bool SecureInput_pass2 = false;
  bool DIALOG = false;
  var FcmToken;
  bool? DiditOnce = true;
  final bloc2 = sl<SignUpBloc>();
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _BoiController = TextEditingController();

  Future<void> getFcmToken() async {
    FirebaseMessaging.instance.getToken().then((FcmTOken) {
      print(FcmTOken);
      return FcmToken = FcmTOken;
    });
  }

  bool ISsocial = false;
int? GenderID;
String? LastName;
String? Color2;
List<int>? Interset;
String? BirthDay;
int? AvatarID;
String? FirstName;
String? Email;
String? Pass;
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
                                    fontSize: 12.sp,
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
                                            fontSize: 12.sp,
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
                        width: 90.w,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
  }
  @override
  void initState() {
    FoucesNodeUserName = FocusNode();
    FoucesNodeBoi = FocusNode();
    super.initState();
    getFcmToken();
    GetISsocial();
    GenderID=  widget.Users!.GetGender();
    LastName = widget.Users!.GetLastname();
    Color2 = widget.Users!.GetBackGroundColor();
    Interset = widget.Users!.GetInterests();
    BirthDay = widget.Users!.GetBirthDate();
    AvatarID = widget.Users!.GetAvatar();
    FirstName =  widget.Users!.GetFirstname();
    Pass=  widget.Users!.GetPass();
    Email=  widget.Users!.GetEmail();
print("---------------------------");
    print(GenderID);
    print(LastName);
    print(Color2);
    print(Interset);
    print(BirthDay);
    print(AvatarID);
    print(FirstName);
    print(Pass);
    print(Email);
  }

  Future<void> SetSoical() async {
    await pref.SETISsoical();
  }

  Future<void> GetISsocial() async {
    ISsocial = await pref.GETISsoical();
  }

  @override
  void dispose() {
    super.dispose();
    FoucesNodeUserName.dispose();
    FoucesNodeBoi.dispose();
    _UsernameController.dispose();
    _BoiController.dispose();
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

  bool diditonece = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: bloc2,
        builder: (BuildContext context, SignUpState state) {
          if (state.success == true &&
              diditonece == true &&
              state.UserDataINDEX == 5) {
            if (state.data!.msg=="success") {
              // AnimatedSnackBar.material(
              //   'Account customization Succeeded',
              //   duration: Duration(seconds: 2),
              //   type: AnimatedSnackBarType.success,
              // ).show(
              //   context,
              // );
              pref.saveUser(
                state.data!.user!,
                state.data!.user!.token!,
                true,
              );

              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Permission1_Screen()),
                  ));
            }
            diditonece = false;
          }

          // if (state.success == true &&
          //     diditonece == true &&
          //     state.UpdateProfileINDEX == 6) {
          //   if (state.data!.msg=="success") {
          //   WidgetsBinding.instance!
          //       .addPostFrameCallback((_) => Navigator.pushReplacement(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Permission1_Screen()),
          //           ));
          //
          //
          //   diditonece = false;
          //   }
          // }

          if (state.UpdateSocialProfileSuccess! && diditonece &&  state.UpdateProfileINDEX == 6) {
            if (state.UpdateSocialProfile!.msg == "updated success") {
              pref.saveUser(
                state.UpdateSocialProfile!.user!,
                "",
                true,
              );
              //
              // AnimatedSnackBar.material(
              //   'Account customization Succeeded',
              //   duration: Duration(seconds: 2),
              //   type: AnimatedSnackBarType.success,
              // ).show(
              //   context,
              // );
              WidgetsBinding.instance
                  .addPostFrameCallback((_) =>
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Permission1_Screen()),
                  ));
            }
          }

          return  GestureDetector(
              onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:Scaffold(
            resizeToAvoidBottomInset : false,
            key: _scaffoldKey,
            backgroundColor: ChooseAvatarBack,
            body: SafeArea(
                child:  Stack(children: [
                        Container(
                          width: w,
                          height: h,
                          margin: EdgeInsets.only(top: 90.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [



                                Container(
                               width: w/1.3,
                                  margin: EdgeInsets.only(bottom: 14.h),
                                  child:Text(
                                      'Choose an Alias!',
                                      textAlign: TextAlign.left,
                                      style:_TextTheme.headlineLarge!.copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      )
                                  ),
                                ),

                                  Container(
                                      width: w / 1.30,
                                      height: h/10,
                                      margin: EdgeInsets.only(bottom: 27.h),
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey1,
                                        child: TextFormField(
                                          focusNode: FoucesNodeUserName,
                                          keyboardAppearance: Brightness.dark,
                                          textInputAction: TextInputAction.next,
                                          controller: _UsernameController,
                                          onChanged: (value) {

                                          },
                                          onFieldSubmitted: (value) {
                                            FoucesNodeBoi.requestFocus();
                                          },
                                          validator: (value){
                                      if (nameValidation3
                                          .hasMatch(
                                      value!)) {
                                      return "Only Letters and numbers allowed for Alias";
                                      }else if (value.length<1) {
                                      return "Minimum Alias length is 1 Characters";
                                      }else if (value.length>25){
                                      return "Maximum Alias length is 30 Characters";
                                      }else if(value.contains(RegExp(r'[!@#$%^&*(),?":{}|<>]'))){
                                        return "Special characters not allowed";
                                      }


                                          },
                                            //1 character minimum
                                            // 30 characters maximum
                                            // Allowed characters: Letters (a-z), numbers (0-9), underscore (_) and period (.).
                                            // Today at 12:26
                                            // 12:26
                                            // Andreas replied to you
                                            // Andreas Pavli
                                            // Use a combination of at least six numbers, letters and punctuation marks (like ! and &).

                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              height: 1.h,
                                              color: Colors.brown),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9_]+$'))
                                          ],
                                          decoration: InputDecoration(
                                              errorStyle:TextStyle(color: Colors.red,),
                                              errorBorder:  OutlineInputBorder(
                                                borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                              ),
                                              focusedErrorBorder:  OutlineInputBorder(
                                                borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius:BorderRadius.circular(5.r)
                                              ),
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius:BorderRadius.circular(5.r)


                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius: BorderRadius.circular(5.r)
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsets.symmetric(horizontal: 12.w,),
                                              hintText: "Alias",
                                            hintStyle: GoogleFonts.roboto().copyWith(
                                                fontSize: 20.sp,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w300,
                                                height: 1,
                                              color: Color(0xff939393)
                                            ),
                                          ),
                                          keyboardType: TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      )),


                                  Container(
                                    width: w/1.3,
                                    margin: EdgeInsets.only(bottom: 14.h),
                                    child:
                                    Text(
                                        'Write a short bio!',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme.headlineLarge!.copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white
                                        )
                                    ),
                                  ),

                                  Container(
                                      width: w / 1.30,
                                      height: h/2.8,
                                      margin: EdgeInsets.only(bottom: 31.h),
                                      child: Form(
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        key: _formkey2,
                                        child: TextFormField(
                                          maxLines: 11,
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
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              height: 1.h,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.brown),
                                          decoration: InputDecoration(
                                            errorStyle:TextStyle(color: Colors.red,),
                                            errorBorder:  OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.r),
                                              borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                            ),
                                            focusedErrorBorder:  OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.r),
                                              borderSide:  BorderSide(color: Colors.white, width: 0.0),
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.r)
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(5.r)
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.white),
                                              borderRadius:BorderRadius.circular(5.r)
                                            ),
                                            // labelText: "Bio",
                                            hintText:  "Bio",
                                            hintStyle: GoogleFonts.roboto().copyWith(
                                                fontSize: 20.sp,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w300,
                                                height: 1.h,
                                                color: Color(0xff939393)
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:  EdgeInsets.only(
                                                top: 10.h, left: 10.w),
                                          ),
                                          keyboardType: TextInputType.text,
                                        ),
                                      )),


                              Container(
                                width: w / 1.3,
                                height: h / 15,
                                child: InkWell(
                                  onTap: () async{
                                    print(_BoiController.text);
                                    print(_UsernameController.text);
                                    print(FcmToken);
                                    print(_UsernameController.text);
                                    print(FcmToken);
                                    GetISsocial();
                                    if (_formkey1.currentState!.validate() &&
                                        _formkey2.currentState!.validate()) {
                                      bool result = await InternetConnectionChecker().hasConnection;

                                      if (result == true) {
                                        diditonece = true;
                                        print(ISsocial);
                                        if (Email == "") {
                                          bloc2.add(SocialUpdateProfile((b) => b
                                            ..interests = Interset
                                            ..fcmToken = FcmToken
                                            ..avatarid = AvatarID
                                            ..birth_date = BirthDay
                                            ..bio = _BoiController.text
                                            ..background_color = Color2
                                            ..first_name = FirstName
                                            ..last_name = LastName
                                            ..alias = _UsernameController.text
                                            ..Genter = GenderID!.toInt()

                                          ));

                                        } else {
                                          bloc2.add(PostSignUp((b) => b
                                            ..interests = Interset
                                            ..Email = Email
                                            ..fcmToken = FcmToken
                                            ..avatarID = AvatarID
                                            ..birth_date = BirthDay
                                            ..bio = _BoiController.text
                                            ..background_color = Color2
                                            ..first_name = FirstName
                                            ..last_name = LastName
                                            ..password = Pass
                                            ..alias = _UsernameController.text
                                            ..Genter = GenderID!.toInt()
                                          ));
                                        }
                                      }else {
                                        print('No internet :( Reason:');
                                        CommingSoonPopup(context, h, w, "Check your internet connection then try again", "Ok", 17);
                                      }


                                    }
                                  },
                                  child: Container(
                                    width: w / 1.3,
                                    height: h / 15,
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5.r),
                                        topRight: Radius.circular(5.r),
                                        bottomLeft: Radius.circular(5.r),
                                        bottomRight: Radius.circular(5.r),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                0, 0, 0, 0.15000000596046448),
                                            offset: Offset(0, 0),
                                            blurRadius: 6)
                                      ],
                                      color: Color.fromRGBO(148, 38, 87, 1),
                                    ),
                                    child: Center(
                                      child: Text(
                                          'Done',
                                          textAlign: TextAlign.center,
                                        style:
                                        _TextTheme.headline1!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        state.isLoading == true
                            ? Container(
                            height: h,
                            child: Center(child: listLoader(context: context)))
                            : Container(),
                      ]),
                ))


          );
        });
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}
