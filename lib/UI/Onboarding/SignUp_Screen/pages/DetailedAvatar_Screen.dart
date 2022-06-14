import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/NameAndBoi_Screen.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/pages/UserData.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class DetailAvatar extends StatefulWidget {


  UsersData? Users;
  String? SelectedAvatar;
  DetailAvatar({this.Users,this.SelectedAvatar});

  @override
  State<DetailAvatar> createState() => _DetailAvatarState();
}

class _DetailAvatarState extends State<DetailAvatar> {
  final bloc2 = sl<SignUpBloc>();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  Uint8List? _imageFile;
  String? base64Image;
  String? ColorS="";
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> TakeScreenshot() async {
    await screenshotController.capture().then((image) async {
      _imageFile = image;
      EncodeImage();
    }).catchError((onError) {
      print(onError);
    });
  }

  void EncodeImage() async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(_imageFile!);
    // File.fromRawPath(uint8List);
    final bytes = file.readAsBytesSync();
    base64Image = base64Encode(bytes);
    print("imgbytes : $base64Image");
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  alreatDialogBuilder() async {
    return showDialog(
      builder: (BuildContext context) {
        var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size.width;

        return Container(
          child: AlertDialog(
            backgroundColor: ChooseAvatarBack,
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(

         colorHistory: [],
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme Colors2 = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: bloc2,
        builder: (BuildContext context, SignUpState state) {
          return Scaffold(
            backgroundColor: ChooseAvatarBack,
            body: SafeArea(
              child: ScrollConfiguration(
              behavior: MyBehavior(),
          child:

          SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(""),
                        Text(""),
                        Text(""),
                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'Choose colour scheme',
                            textAlign: TextAlign.left,
                              style:_TextTheme.headlineLarge!.copyWith(
                                  fontSize: 3.5 *
                                      SizeConfig
                                          .blockSizeVertical!
                                          .toDouble(),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              )
                          ),
                        ),
                        Text(""),
                        Text(""),
                      ],
                    ),
                    Column(
                      children: [
                        Text(""),
                      ],
                    ),
                    Container(
                      child: Screenshot(
                        controller: screenshotController,
                        child: CircleAvatar(
                          radius: h / 7,
                          backgroundColor: pickerColor,
                          backgroundImage:
                              NetworkImage(widget.SelectedAvatar.toString()),
                        ),
                      ),
                    ),
                    Container(
                      height: h / 2.3,
                      child: BlockPicker(
                        pickerColor: currentColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: w / 1.3,
                    //   height: h / 15,
                    //   child: InkWell(
                    //     onTap: () {
                    //       alreatDialogBuilder();
                    //       print(pickerColor);
                    //     },
                    //     child: Container(
                    //       width: w / 1.3,
                    //       height: h / 15,
                    //       decoration: const BoxDecoration(
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(5),
                    //           topRight: Radius.circular(5),
                    //           bottomLeft: Radius.circular(5),
                    //           bottomRight: Radius.circular(5),
                    //         ),
                    //         boxShadow: [
                    //           BoxShadow(
                    //               color: Color.fromRGBO(
                    //                   0, 0, 0, 0.15000000596046448),
                    //               offset: Offset(0, 0),
                    //               blurRadius: 6)
                    //         ],
                    //         color: Color.fromRGBO(148, 38, 87, 1),
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           'More Coloring Details',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               color: Color.fromRGBO(234, 234, 234, 1),
                    //               fontFamily: 'Sofia Pro',
                    //               fontSize: 20,
                    //               letterSpacing:
                    //                   0 /*percentages not used in flutter. defaulting to zero*/,
                    //               fontWeight: FontWeight.normal,
                    //               height: 1),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: w / 1.3,
                      height: h / 15,
                      child: InkWell(
                        onTap: () async {
                     int a =   widget.Users!.GetAvatar();
                     print(a);
                     String lengthss = "ColorSwatch(primary value: Color(";
                     print("this it is");
                     print(lengthss.length);
                          print(pickerColor);
                          print(pickerColor.toString().length);
                          //length of color that caused the problem is  33
                          //
                         //MaterialColor(primary value: Color(0xff9e9e9e))
                          //MaterialColor(primary value: Color(0xffff9800))

                           //watch(prim
                             //All colors does this except the black color

                         pickerColor.toString().length==47
                              ?  ColorS = pickerColor.toString().substring(35,45)
                              :pickerColor.toString().length==17
                                  ?   ColorS = pickerColor.toString().substring(6,16)
                                  :   ColorS = pickerColor.toString().substring(33,43);

                         widget.Users!.SetBackGroundColor(ColorS.toString()==""?pickerColor.toString():ColorS.toString());
                         WidgetsBinding.instance!
                             .addPostFrameCallback((_) =>
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                       NameAndBoi(
                                        Users:  widget.Users,
                                       )),
                             ));

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
                              'Next',
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
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Column(
                    //   children: [
                    //     Text(""),
                    //
                    //   ],
                    // ),
                    // Container(
                    //
                    //     width: w/1.1,
                    //     height: h/1.38,
                    //     child:  GridView.builder(
                    //         shrinkWrap: true,
                    //         itemCount: 40,
                    //         //  physics: NeverScrollableScrollPhysics(),
                    //         gridDelegate:
                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 4,
                    //           childAspectRatio: (5 / 5.5),
                    //         ),
                    //         itemBuilder: (context, index) {
                    //           return
                    //             Container(
                    //               margin: EdgeInsets.all(5),
                    //               child: CircleAvatar(
                    //                 //   backgroundColor: Colors.black,
                    //                 backgroundImage: NetworkImage(
                    //                     "https://images.unsplash.com/photo-1650476217339-6b7e08b844a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60"
                    //                 ),
                    //               ),
                    //             );
                    //
                    //         }
                    //
                    //     )
                    // ),
                    //
                    // Container(
                    //
                    //   child : InkWell(
                    //       onTap: () {
                    //         // if (dot < 3 && dot > -1) dot += 1;
                    //         // if (_pageController.hasClients) {
                    //         //   _pageController.animateToPage(
                    //         //     dot,
                    //         //     duration: const Duration(milliseconds: 700),
                    //         //     curve: Curves.easeInOut,
                    //         //   );
                    //         // }
                    //
                    //       },
                    //       child:
                    //
                    //
                    //       Container(
                    //         width: w/1.3,
                    //         height: h/15,
                    //         decoration: const BoxDecoration(
                    //           borderRadius : BorderRadius.only(
                    //             topLeft: Radius.circular(5),
                    //             topRight: Radius.circular(5),
                    //             bottomLeft: Radius.circular(5),
                    //             bottomRight: Radius.circular(5),
                    //           ),
                    //           boxShadow : [BoxShadow(
                    //               color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                    //               offset: Offset(0,0),
                    //               blurRadius: 6
                    //           )],
                    //           color : Color.fromRGBO(148, 38, 87, 1),
                    //         ),
                    //         child: Center(
                    //           child: Text('Next', textAlign: TextAlign.center, style: TextStyle(
                    //               color: Color.fromRGBO(234, 234, 234, 1),
                    //               fontFamily: 'Sofia Pro',
                    //               fontSize: 20,
                    //               letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    //               fontWeight: FontWeight.normal,
                    //               height: 1
                    //           ),),
                    //         ),
                    //       )
                    //
                    //
                    //
                    //
                    //   ),
                    //
                    // )
                  ],
                ),
              ),),
            ),
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
