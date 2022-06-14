import 'dart:typed_data';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/Permissions_Screen/pages/Permission1_Screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
//todo: fix solution for textfield getting covered by the keyboard.
class NameAndBoi extends StatefulWidget {

  UsersData? Users;
  NameAndBoi({this.Users});

  @override
  State<NameAndBoi> createState() => _NameAndBoiState();
}

class _NameAndBoiState extends State<NameAndBoi> {
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
            pref.saveUser(
              state.data as UserData,
              state.data!.user!.token!,
              true,
            );

            print(state.data!.user!.data!.gender!);
            WidgetsBinding.instance!
                .addPostFrameCallback((_) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Permission1_Screen()),
                    ));

            diditonece = false;
          }

          if (state.success == true &&
              diditonece == true &&
              state.UpdateProfileINDEX == 6) {
            WidgetsBinding.instance!
                .addPostFrameCallback((_) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Permission1_Screen()),
                    ));

            diditonece = false;
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(""),
                              Column(
                                children: [

                                Container(
                               width: w/1.3,
                                  child:        Text(
                                      'Choose an Alias!',
                                      textAlign: TextAlign.left,
                                      style: _TextTheme.headline1!.copyWith(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w400
                                      )
                                  ),
                                ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(""),
                                  Container(
                                      width: w / 1.30,
                                      height: h/10,
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
                                            MinLengthValidator(4,
                                                errorText:
                                                "Minimum Characters is 4 "),
                                            MaxLengthValidator(15,
                                                errorText:
                                                "Maximum Characters is 15"),
                                            //1 character minimum
                                            // 30 characters maximum
                                            // Allowed characters: Letters (a-z), numbers (0-9), underscore (_) and period (.).
                                            // Today at 12:26
                                            // 12:26
                                            // Andreas replied to you
                                            // Andreas Pavli
                                            // Use a combination of at least six numbers, letters and punctuation marks (like ! and &).
                                          ]),
                                          cursorColor: Colors.black,
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                              height: 1.3,
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
                                              enabledBorder: UnderlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide:
                                                BorderSide(color: Colors.white),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsets.symmetric(horizontal: 12,),
                                              hintText: "Alias",
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
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: w/1.3,
                                    child:
                                    Text(
                                        'Write a short bio!',
                                        textAlign: TextAlign.left,
                                        style: _TextTheme.headline1!.copyWith(
                                          fontSize: 23,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(""),
                                  Container(
                                      width: w / 1.30,
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
                                              fontSize: 19,
                                              height: 1.3,
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
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: Colors.white),
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            // labelText: "Bio",
                                            hintText:  "Bio",
                                            hintStyle: _TextTheme.headline6!.copyWith(
                                              fontSize: 6.2 *
                                                  SizeConfig
                                                      .blockSizeHorizontal!
                                                      .toDouble(),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding: const EdgeInsets.only(
                                                top: 20, left: 10),
                                          ),
                                          keyboardType: TextInputType.text,
                                        ),
                                      )),

                                ],
                              ),
                              Container(
                                width: w / 1.3,
                                height: h / 15,
                                margin: EdgeInsets.only(bottom: h/50),
                                child: InkWell(
                                  onTap: () async{
                                    // print(widget.Email);
                                    // print(widget.Pass);
                                    // print(widget.ConfirmPass);
                                    // print(widget.Color2);
                                    // print(widget.Interset);
                                    // print(widget.GenderID);
                                    // print(widget.FirstName);
                                    // print(widget.LastName);
                                    // print(widget.BirthDay);
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
                                    width: w / 1.3,
                                    height: h / 15,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
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
                                          fontSize: 6.2 *
                                              SizeConfig
                                                  .blockSizeHorizontal!
                                                  .toDouble(),
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
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }
}
