import 'dart:io';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/CameraVerification_screen/pages/home.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class VerifyProfile extends StatefulWidget {
  const VerifyProfile({Key? key}) : super(key: key);

  @override
  State<VerifyProfile> createState() => _VerifyProfileState();
}


class _VerifyProfileState extends State<VerifyProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Permission? permission;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return  WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: h/100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Container(
                        margin: EdgeInsets.only(
                            right: h / 35),
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "Assets/images/Frame 11.svg",
                              width: 30,
                              color: ColorS.surface),
                          onPressed:(){
                            Navigator.pop(context);
                          },
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          top: h / 100),
                      child: Text('Profile Verification', textAlign: TextAlign.left,      style: _TextTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 23
                      ),),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    height: h/4,
                    width: w/2,
                    child:  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit ut nulla mattis et sagittis, mi eu quam. Dolor sit.',
                      textAlign: TextAlign.left,  style: _TextTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 23
                      ),),
                  ),
                  const Text(""),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: h/10,
                          width: w/2,
                          child:       Text('Profile Info:', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 23
                          ))
                      ),
                      const Text(""),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: h/13,
                        width: w/2,
                        child:        Text('Name', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 23
                        )),
                      ),
                      const Text(""),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: h/10,
                          width: w/2,
                          child:        Text('Username', textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 23
                          ))
                      ),
                      const Text(""),
                    ],
                  ),

                ],
              ),
              InkWell(
                onTap: ()async{
                    WidgetsBinding.instance!.addPostFrameCallback((_) =>
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CameraScreen(),
                          ),
                        )
                    );
                },
                child: Container(
                  width: w/1.2,
                  height: h/14,
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
                    color : Color.fromRGBO(207, 109, 56, 1),
                  ),
                  child:  Center(
                    child: Text('Continue', textAlign: TextAlign.center,     style:
                    _TextTheme.headline1,),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );



  }
}
