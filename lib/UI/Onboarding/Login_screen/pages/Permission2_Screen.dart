import 'dart:io';

import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_bloc.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_event.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/bloc/login_state.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';


class Permission2_Screen extends StatefulWidget {
  const Permission2_Screen({Key? key}) : super(key: key);

  @override
  State<Permission2_Screen> createState() => _Permission2_ScreenState();
}

class _Permission2_ScreenState extends State<Permission2_Screen> {
  final _loginBloc = sl<loginBloc>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return WillPopScope(
        onWillPop: () async => false,
    child: BlocBuilder(
        bloc: _loginBloc,
        builder: (BuildContext context, loginState state) {
          return   Scaffold(
            backgroundColor: PermissionScreen,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(

                children: [
                      Container(
                        height: h/3,
                        child: Container(
                          margin: EdgeInsets.only(top: h/10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(""),
                              Stack(children:[
                                SvgPicture.asset("Assets/images/Ellipse 75.svg",width: w/5.5,),
                                Positioned(
                                    right: 0,
                                    left: 0,
                                    bottom: h/40,
                                    child: SvgPicture.asset("Assets/images/Vector.svg",width: w/12.5,))
                              ]
                              ),
                              SizedBox(width: 13,),


                              SvgPicture.asset("Assets/images/Allow Notifications.svg",width: w/2.8),

                              SizedBox(width: h/25,),
                            ],),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: w/1.4,
                          margin: EdgeInsets.only(bottom: h/50,top: h/40),
                          child:  Text("""We’ll let you know
when there’s a bubble
at your location!""",
                              textAlign: TextAlign.left,

                              style:    _TextTheme  .headline1!.copyWith(
                                letterSpacing: .9,
                                wordSpacing: 2,
                                fontWeight: FontWeight.w300,
                                fontSize:  3.4 *
                                    SizeConfig
                                        .blockSizeVertical!
                                        .toDouble(),
                              ),),


                        ),
                      ),
                ],
                ),

            Column(

              children: [
                      InkWell(
                        onTap: (){
                          _loginBloc.add(SetPermission((b) =>b
                            ..is_notify=1
                          ));
                          WidgetsBinding.instance!.addPostFrameCallback((_) =>
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) =>NavigatorTopBar(GotToHomeAndOpenPanel: false,),
                                ),
                              )
                          );
                        },
                        child: Container(
                          width: w/1.2,
                          height: h/15,
                          decoration: const BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            boxShadow : [BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                                offset: Offset(0,0),
                                blurRadius: 6
                            )],
                            color : Color.fromRGBO(148, 38, 87, 1),
                          ),
                          child: Center(
                            child: Text('Allow', textAlign: TextAlign.center,       style:
                            _TextTheme.headline1,),
                          ),
                        ),
                      ),
                      Text(""),
                      Container(
                        margin: EdgeInsets.only(bottom: h/60),
                        child:
                        InkWell(
                          onTap: (){
                            _loginBloc.add(SetPermission((b) =>b
                              ..is_notify=0
                            ));
                            WidgetsBinding.instance!.addPostFrameCallback((_) =>
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) =>
                                        NavigatorTopBar( GotToHomeAndOpenPanel: false,),


                                  ),
                                )
                            );
                          },
                          child:     Text('Not Now', textAlign: TextAlign.center, style: TextStyle(
                              color: Color.fromRGBO(47, 47, 47, 1),
                              fontFamily: 'Red Hat Text',
                              fontSize: 18,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w300,
                              height: 1
                          ),)
                      ),),
                      Text(""),
              ],
            ),

                ],
              ),
            ),
          );

        }
    ));



  }
}
