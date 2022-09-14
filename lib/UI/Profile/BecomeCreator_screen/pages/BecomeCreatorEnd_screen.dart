
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_Bloc.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/bloc/Creator_State.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/pages/TakeQuiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:move_to_background/move_to_background.dart';

class CreatorScreenEnd extends StatefulWidget {
  const CreatorScreenEnd({Key? key}) : super(key: key);

  @override
  State<CreatorScreenEnd> createState() => _CreatorScreenEndState();
}

class _CreatorScreenEndState extends State<CreatorScreenEnd> {
  int BackGroundCounter = 0;
  final _CreatorBloc = sl<CreatorBloc>();
  bool Diditonce = true;
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
                                    fontSize: FontSize.toDouble(),
                                    letterSpacing: 18,
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
                                          topLeft:Radius.circular(4.142857074737549.r),
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
                                            fontSize: 14.sp,
                                            letterSpacing: 0.3,
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
                      bottom: h/5,
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
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return
      BlocBuilder(
        bloc: _CreatorBloc,
        builder: (BuildContext context, CreatorState state)
    {

      return
        WillPopScope(
            onWillPop: () async {
              print(BackGroundCounter);
              if (BackGroundCounter == 0) {
                BackGroundCounter++;
                return false;
              } else if (BackGroundCounter == 1) {
                BackGroundCounter = 0;
                await MoveToBackground.moveTaskToBack();
                //  var _androidAppRetain = MethodChannel("android_app_retain");
                //   _androidAppRetain.invokeMethod("sendToBackground");
              }
              return false;
            },
            child:

            Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: h / 50,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text('Become a Creator', textAlign: TextAlign.left,
                                style: _textthem.headlineLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.sp
                                ),),

                            ],
                          ),
                        ),
                        SizedBox(height: h/20,),
                        Container(
                          width: w / 1.4,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit'
                                ' ut nulla mattis et sagittis, mi eu quam. Dolor sit.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: COLOR.inversePrimary,
                                fontFamily: 'Sofia Pro',
                                fontSize: 18.sp,
                                wordSpacing: 2,
                                letterSpacing: 2.3,
                                fontWeight: FontWeight.w300,
                                height: 1
                            ),),
                        ),
                      ],
                    ),


                    InkWell(
                      onTap: () {

                        WidgetsBinding.instance
                            .addPostFrameCallback((_) =>
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                NavigatorTopBar(GotToHomeAndOpenPanel: false,)), (Route<dynamic> route) => false));

                      },
                      child: Container(
                        width: w / 1.6,
                        height: h / 17,
                        margin: EdgeInsets.only(bottom: h/20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            topRight:  Radius.circular(5.r),
                            bottomLeft:  Radius.circular(5.r),
                            bottomRight: Radius.circular(5.r),
                          ),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.15000000596046448),
                              offset: Offset(0, 0),
                              blurRadius: 6
                          )
                          ],
                          color: Color.fromRGBO(207, 109, 56, 1),
                        ),
                        child: Center(
                          child: Text('Great!', textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(234, 234, 234, 1),
                                fontFamily: 'Sofia Pro',
                                fontSize: 20.sp,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                        ),

                      ),
                    ),



                  ],
                ),
              ),
            ));
    }
      );
  }
}
