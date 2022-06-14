import 'dart:ffi';

import 'package:bubbles/UI/Bubbles/InBubble/Pages/GroupChat_Page/pages/GroupChat_Screen.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Plan_Screen extends StatefulWidget {
  Plan_Screen({Key? key}) : super(key: key);

  @override
  State<Plan_Screen> createState() => _Plan_ScreenState();
}

class _Plan_ScreenState extends State<Plan_Screen> {
bool selected = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                  children :[
                    Container(
                      width: w,
                      height: h/2,
                      margin: EdgeInsets.only(top: h/50),
                      child: Image.asset("Assets/images/Rectangle 136.png",fit: BoxFit.fill,),
                    ),
                    Container(
                      width: w,
                      height: h/14.6,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0,4),
                            blurRadius: 4
                        )],
                        color : Color.fromRGBO(148, 38, 87, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                                "Assets/images/Frame 11.svg",
                                width: 30,
                                color: Colors.white),
                            onPressed:(){
                              Navigator.pop(context);
                            },
                          ),
                          Text('Colour Day Festival', textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Display',
                              fontSize: 22,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w600,
                              height: 1
                          ),),
                          SizedBox(width: 10,),
                          IconButton(
                            icon: SvgPicture.asset(
                                "Assets/images/save.svg",
                                width: h/50,
                                color:!selected? Colors.white:Colors.orange),
                            onPressed:(){
                              setState(() {
                                selected = !selected;
                              });
                              print(selected);
                            },
                          ),
                        ],
                      ),

                    ),
                  ]
              ),
              SizedBox(height: h/30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('At O.A.K.A Athens', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(20, 208, 120, 1),
                      fontFamily: 'Red Hat Display',
                      fontSize: 22,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w600,
                      height: 1
                  ),),
                  Text(""),
                  Text(""),
                ],
              ),
              SizedBox(height: h/50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('10:00am - 04:00am', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Red Hat Display',
                      fontSize: 15.528663635253906,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w200,
                      height: 1
                  ),),
                  Text(""),
                  Text(""),
                ],
              ),
            ],
          ),
          SizedBox(height: h/22,),
          Container(
            width: w/1.2,
            margin: EdgeInsets.only(bottom: h/20),
            child: Text('Το Colourday Festival είναι το μεγαλύτερο και πιο επιτυχημένο φεστιβάλ στην Ελλάδα. Πραγματοποιείται κάθε Ιούνιο στο ΟΑΚΑ στο Μαρούσι συγκεντρώνοντας δεκάδες χιλιάδες θεατές.', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Sofia Sans',
                fontSize: 17,
                letterSpacing: 0 ,
                fontWeight: FontWeight.w300,
                height: 1.2857142857142858
            ),),
          ),
          InkWell(
            onTap:(){
//
              WidgetsBinding.instance!
                  .addPostFrameCallback(
                      (_) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const GroupChat(),),
                  ));
            },
            child: Container(
                width: w/2.3,
                height: h/13,
                margin: EdgeInsets.only(bottom: h/50),
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27),
                    bottomLeft: Radius.circular(27),
                    bottomRight: Radius.circular(27),
                  ),
                  color : Color.fromRGBO(20, 208, 120, 1),
                ),
              child: Center(
                child:
                Text('Enter Bubble', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(47, 47, 47, 1),
                    fontFamily: 'Red Hat Display',
                    fontSize: 18,
                    letterSpacing: 0 ,
                    fontWeight: FontWeight.w600,
                    height: 1
                ),)
                ,
              ),
            ),
          )
        ],
      ),
    ),
    );

  }
}

// class Vision extends StatefulWidget {
//   @override
//   State<Vision> createState() => _VisionState();
// }
//
// class _VisionState extends State<Vision> {
//   void initState() {
//     super.initState();
//     delay();
//   }
//
//   void delay() {
//     Future.delayed(const Duration(milliseconds: 5000), () {
//     Navigator.pop(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     TextTheme _TextTheme = Theme.of(context).textTheme;
//     ColorScheme ColorS = Theme.of(context).colorScheme;
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//    body:  SafeArea(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: [
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              InkWell(
//                onTap: () {
//                  Navigator.pop(context);
//                },
//                child: Container(
//                  margin: EdgeInsets.only(top: h/50),
//                    width: w / 10,
//                    height: h / 30,
//                    child: SvgPicture.asset(
//                        "Assets/images/Frame 11.svg",
//                        width: 30,
//                        color: ColorS.surface
//                    )),
//              ),
//              Text(""),
//              Text(""),
//              Text(""),
//              Text(""),
//
//            ],
//          ),
//          Spacer(),
//          Container(
//            width: w,
//            height: h/2,
//            child: Image.asset("Assets/images/Vision Prototype (1) 1.png"
//              ,fit: BoxFit.fill,),
//          ),
//          Spacer(),
//          Container(
//            width: w/1.2,
//            child: Text('This part is going to be animated like a'
//                ' mini loading screen and this text box is going'
//                ' to contain informative text on vision requests.',
//              textAlign: TextAlign.left, style: TextStyle(
//                color: Color.fromRGBO(255, 255, 255, 1),
//                fontFamily: 'Sofia Pro',
//                fontSize: 17,
//                letterSpacing: 0.5,
//                fontWeight: FontWeight.normal,
//                height: 1.3846153846153846
//            ),),
//          ),
//          Spacer(),
//        ],
//      ),
//    ),
//       ),
//     );
//   }
// }

