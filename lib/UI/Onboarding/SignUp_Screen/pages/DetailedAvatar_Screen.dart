import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

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
                  margin: EdgeInsets.only(top: 36.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   Container(
                       width: w,
                       margin: EdgeInsets.only(bottom: 17.h),
                       child: Center(
                         child: Text(
                         'Choose colour scheme',
                         textAlign: TextAlign.left,
                         style:_TextTheme.headlineLarge!.copyWith(
                             letterSpacing: 1,
                             fontSize: 20.sp,
                             fontWeight: FontWeight.w600,
                             color: Colors.white
                         )
                   ),
                       ),),

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
                        margin: EdgeInsets.only(top: 5.h),
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
                                      radius: 13.w,
                                      backgroundColor: Color(int.parse(BubbleColors[index])),
                                    )),
                              );
                            }),
                      ),


                      Container(
                        width: w / 1.3,
                        height: h / 15,
                        margin: EdgeInsets.only(top: 37.h),
                        child: InkWell(
                          onTap: () async {
                           widget.Users!.SetBackGroundColor(state.PickedColor!);
                           WidgetsBinding.instance
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
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular( 5.r),
                                topRight:Radius.circular( 5.r),
                                bottomLeft: Radius.circular( 5.r),
                                bottomRight:Radius.circular( 5.r),
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
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
             ),
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
