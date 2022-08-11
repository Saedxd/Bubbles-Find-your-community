import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
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
  Uint8List? _imageFile;
  String? base64Image;
  String? ColorS="";
//// EAEAEA
// // 606060
  List<String> BubbleColors = ["0xff8D4624","0xff31576D","0xffE0A41E","0xff4ECEB6","0xffDEDDBF",
    "0xff578274","0xff77C08A","0xffD588B1","0xff7B78F5","0xffBA477A","0xff80BFC5","0xffEB9B5D","0xffCD6356","0xff606060","0xffEAEAEA"];
  List<String> Avatar_Colors =[];
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

  // void changeColor(Color color) {
  //   setState(() => pickerColor = color);
  // }

  // alreatDialogBuilder() async {
  //   return showDialog(
  //     builder: (BuildContext context) {
  //       var h = MediaQuery.of(context).size.height;
  //       var w = MediaQuery.of(context).size.width;
  //
  //       return Container(
  //         child: AlertDialog(
  //           backgroundColor: ChooseAvatarBack,
  //           title: const Text('Pick a color!'),
  //           content: SingleChildScrollView(
  //             child: ColorPicker(
  //
  //        colorHistory: [],
  //               pickerColor: pickerColor,
  //               onColorChanged: changeColor,
  //             ),
  //           ),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               child: const Text('Got it'),
  //               onPressed: () {
  //                 setState(() => currentColor = pickerColor);
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //     context: context,
  //   );
  // }

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
                child: Container(
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: h/20,),
                   Container(
                       width: w,
                       child: Center(
                         child: Text(
                         'Choose colour scheme',
                         textAlign: TextAlign.left,
                         style:_TextTheme.headlineLarge!.copyWith(
                             letterSpacing: 1,
                             fontSize: 3.5 *
                                 SizeConfig
                                     .blockSizeVertical!
                                     .toDouble(),
                             fontWeight: FontWeight.w600,
                             color: Colors.white
                         )
                   ),
                       ),),
                      SizedBox(height: h/30,),
                      Container(
                        child: Screenshot(
                          controller: screenshotController,
                          child: CircleAvatar(
                            radius: h / 7,
                            backgroundColor: Color(int.parse(state.PickedColor!)),
                            backgroundImage:
                                NetworkImage(widget.SelectedAvatar.toString()),
                          ),
                        ),
                      ),

                      Container(
                        width: w/1.32,
                        height: h/2.5,
                        child: GridView.builder(
                            cacheExtent : 500,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: (6 / 6.1),
                            ),
                            itemCount: BubbleColors.length,
                            itemBuilder: (BuildContext ctx, index) {
                              //print(state.GetGender!.genders![index].image!.image.toString());
                              return InkWell(
                                onTap: (){
                                  bloc2.add(ChangePickedColor((b) => b..PickedColor=BubbleColors[index]));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      radius: 13,
                                      backgroundColor: Color(int.parse(BubbleColors[index])),
                                    )),
                              );
                            }),
                      ),
                      // Container(
                      //   height: h / 2.3,
                      //   child: BlockPicker(
                      //     pickerColor: currentColor,
                      //     onColorChanged: changeColor,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
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
                           widget.Users!.SetBackGroundColor(state.PickedColor!);
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
                ),
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
