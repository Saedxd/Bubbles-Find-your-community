import 'package:bubbles/UI/Profile/BecomeCreator_screen/pages/TakeQuiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CreatorScreen extends StatefulWidget {
  const CreatorScreen({Key? key}) : super(key: key);

  @override
  State<CreatorScreen> createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: h/100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              right: h / 20),
                          child: IconButton(
                            icon: SvgPicture.asset(
                                "Assets/images/Frame 11.svg",
                                width: 30.w,
                                color: COLOR.surface),
                            onPressed:(){

                              Navigator.pop(context);
                            },
                          )),
                      Text('Become a Creator', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp
                      ),),
                      Text(""),
                      Text(""),

                    ],
                  ),
                ),
                SizedBox(height: h/20,),
                Container(
                  width: w/1.4,
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit ut nulla mattis et sagittis, mi eu quam. Dolor sit.',
                    textAlign: TextAlign.left,
                    style: _textthem.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                      fontSize: 18.sp,
                    ),),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //
            //     InkWell(
            //       onTap: () {
            //         Navigator.pop(context);
            //       },
            //       child: Container(
            //           width: w / 10,
            //           height: h / 30,
            //           margin: EdgeInsets.only(left: h/50,top: h/50),
            //           child: SvgPicture.asset(
            //               "Assets/images/Frame 11.svg",
            //               width: 30,
            //               color: COLOR.surface
            //
            //           )),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(top: h/50),
            //       child: Text('Become a Creator', textAlign: TextAlign.left,    style: _textthem.headlineLarge!.copyWith(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 23
            //       ),),
            //     ),
            //     Text(""),
            //     Text(""),
            //     Text(""),
            //     Text(""),
            //   ],
            // ),


            InkWell(
              onTap: (){
                WidgetsBinding.instance
                    .addPostFrameCallback((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TakeQuiz_Screen()),
                ));
              },
              child: Container(
                width: w/1.6,
                height: h/17,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                    bottomRight:Radius.circular(5.r),
                  ),
                  boxShadow : [BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                      offset: Offset(0,0),
                      blurRadius: 6
                  )],
                  color : Color.fromRGBO(207, 109, 56, 1),
                ),
                child:  Center(
                  child: Text('Take Quiz', textAlign: TextAlign.center, style:
                  _textthem.headline1!.copyWith(
                      fontSize: 19.sp
                  ),),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
