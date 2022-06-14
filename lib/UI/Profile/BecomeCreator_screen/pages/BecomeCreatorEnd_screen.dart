
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/UI/Profile/BecomeCreator_screen/pages/TakeQuiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatorScreenEnd extends StatefulWidget {
  const CreatorScreenEnd({Key? key}) : super(key: key);

  @override
  State<CreatorScreenEnd> createState() => _CreatorScreenEndState();
}

class _CreatorScreenEndState extends State<CreatorScreenEnd> {
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
            Container(
              margin: EdgeInsets.only(top: h/50,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Become a Creator', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 23
                  ),),

                ],
              ),
            ),
            Container(
              width: w/1.4,
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Blandit'
                  ' ut nulla mattis et sagittis, mi eu quam. Dolor sit.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: COLOR.inversePrimary,
                    fontFamily: 'Sofia Pro',
                    fontSize: 27,
                    wordSpacing: 2,
                    letterSpacing: 2 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
            ),
            Text(""),
            Text(""),
            Text(""),
            Text(""),
            Text(""),
            InkWell(
              onTap: (){
                WidgetsBinding.instance!
                    .addPostFrameCallback((_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  NavigatorTopBar()),
                ));
              },
              child: Container(
                width: w/1.6,
                height: h/17,
                decoration: BoxDecoration(
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
                  child: Text('Great!', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(234, 234, 234, 1),
                      fontFamily: 'Sofia Pro',
                      fontSize: 20,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),
                ),

              ),
            ),
            Text(""),


          ],
        ),
      ),
    );
  }
}
