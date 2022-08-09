import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/CameraVerification_screen/bloc/VerfiyProfile_Bloc.dart';
import 'package:bubbles/UI/Profile/CameraVerification_screen/bloc/VerifyProfile_event.dart';
import 'package:bubbles/UI/Profile/CameraVerification_screen/bloc/VerifyProfile_state.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
//todo : handle the ebug that happens when i deny the camera permission and i get stuck

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreen createState() => _CameraScreen();
}

class _CameraScreen extends State<CameraScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _VerifyProfile = sl<VerifyProfileBloc>();
  File? imagePath;
  File? imagePath2;
  File? file;
  double? height;
  double? width;
  String? image2;
  String? image1;
  bool FirstTime = true;
  bool FirstTime2 = true;
  bool Done = false;
  String? base64Image;
  String? base64Image2;
  int counter = 0;

  void Convert(File path){
    Uint8List bytes = path.readAsBytesSync();
  //  String base64Image = base64Encode(bytes);
    counter++;
    FirstTime2
        ?      base64Image = base64Encode(bytes)
        :     base64Image2 = base64Encode(bytes);
    FirstTime2 =false;
    if (counter==2){
      DidITonce = true;
      _VerifyProfile.add(AddImages((b) => b
      ..image2 = base64Image2
          ..image1 = base64Image
      ));

    }
  }

  // void Onpressed(){
  //   WidgetsBinding.instance!
  //       .addPostFrameCallback((_) => Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) =>  NavigatorTopBar()),
  //   ));
  // }

  Future imagePicker() async {
    try {
      final image = await ImagePicker().pickImage(source:ImageSource.camera, preferredCameraDevice: CameraDevice.rear,);
      if (image == null)    WidgetsBinding.instance!
          .addPostFrameCallback((_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>  NavigatorTopBar(GotToHomeAndOpenPanel: false,)),
      ));
      FirstTime
    ?   imagePath = File(image!.path)
     :  imagePath2 = File(image!.path);



      if(FirstTime) {
        FirstTime = false;
       await imagePicker();
        _VerifyProfile.add(ChangeDone());
        print(Done);
      }
    } on PlatformException catch (e) {
      print("failed to select an image");
    }
  }
//final size = MediaQuery.of(context).size;
// final deviceRatio = size.width / size.height;
// return Transform.scale(
//   scale: controller.value.aspectRatio / deviceRatio,
//   child: Center(
//     child: AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: CameraPreview(controller),
//     ),
//   ),
// );
  @override
  void initState() {
    super.initState();
    try {
      imagePicker();
    }catch(e){
      print(e);
    }
  }
bool DidITonce = false;
  alreatDialogBuilder(

      BuildContext Context,
      String Title,
      String body,
      String BottonTxt,

      ) async {
    TextTheme _textthem = Theme.of(Context).textTheme;


    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
            title: Text(Title),
            content: Container(
              child: Text(body,    style: _textthem.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 17
              ),),
            ),
            actions: [
              RaisedButton(
                child: Text(BottonTxt),
                onPressed: () {
                  Navigator.pop(Context);
                  Navigator.pop(Context);
                  WidgetsBinding.instance!
                      .addPostFrameCallback((_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  NavigatorTopBar(GotToHomeAndOpenPanel: false,)),
                  ));
                },
              ),

            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    height = h;
    width = w;


    return  BlocBuilder(
        bloc: _VerifyProfile,
        builder: (BuildContext Context, VerifyProfileState state) {
          //todo : make loading state  and navigate back to home or porfile
if (state.success! && DidITonce){
  WidgetsBinding.instance!
      .addPostFrameCallback(
          (_) =>
              alreatDialogBuilder(
      _scaffoldKey.currentContext!,
      "Verification Request",
      """We have recived your Image its under view
thanks for your patients
      """,
      "Back"));
  DidITonce = false;
}
          return   WillPopScope(
            onWillPop: () async => false,
            child:Scaffold(
              key: _scaffoldKey,
              body: SafeArea(
                child: state.Done!
                    ?Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: COLOR.surface),
                                  onPressed:(){
                                    Navigator.pop(context);
                                  },
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  top: h / 100),
                              child: Text('Upload image', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23
                              ),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: h/18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: w/4.3,
                                height: h/5,
                                child: Image.file(imagePath!,fit: BoxFit.fill,)),
                            SizedBox(width: 5,),
                            Container(
                              width: w/4.3,
                              height: h/5,
                              child:
                              Image.file(imagePath2!,fit: BoxFit.fill,),)
                          ],
                        ),
                      ),
                      Container(
                        width: w/1.7,
                        height: h/4,
                        child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit ut nulla mattis et sagittis, mi eu quam. Dolor sit.',
                          maxLines: 5,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: COLOR.inversePrimary,
                              fontFamily: 'Sofia Pro',
                              wordSpacing: 1,
                              fontSize: 25,
                              letterSpacing: 1 ,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),),
                      ),
                      InkWell(
                        onTap: (){
                          // if (imagePath!=null && imagePath2!=null) {
                          //   ShowDialog();
                          //   Convert(imagePath!);
                          //   Future.delayed(const Duration(milliseconds: 2000), () {
                          //     Convert(imagePath2!);
                          //   });
                          //
                          // }
                        },
                        child: Container(
                          width: w/7,
                          height: h/13,
                          margin: EdgeInsets.only(right: h/4,bottom: h/20),
                          decoration: BoxDecoration(
                            color : Color.fromRGBO(207, 109, 56, 1),
                          ),
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: ()async{
                          if (imagePath!=null && imagePath2!=null) {

                            Convert(imagePath!);
                            Future.delayed(const Duration(milliseconds: 2000), () {
                              Convert(imagePath2!);
                              //  ShowDialog();
                            });
                          }
                        },
                        child: Container(
                          width: w/1.25,
                          height: h/14,
                          margin: EdgeInsets.only(bottom: 10),
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
                            child: Text('Submit', textAlign: TextAlign.center,  style:
                            _textthem.headline1,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  state.isLoading!?
                  listLoader(context: Context)
                      :Text(""),
                ],)
                    :Text(""),
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

