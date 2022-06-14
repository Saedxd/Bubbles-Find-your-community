
import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;


class MyTheme {
ThemeData lightTheme = ThemeData(


  textTheme:  const TextTheme(
headline2:  TextStyle(//uSED FOR Headlines like Top onces like choose Avatar Headline
    color: Color.fromRGBO(234, 234, 234, 1),
    fontFamily: 'Red Hat Display',
    fontSize: 20,
    letterSpacing: 0 ,
    fontWeight: FontWeight.w500,
    height: 1
),

    //#C4C4C4

    headline5:
    TextStyle(
        color: Color(0xff303030),

        fontFamily: 'Red Hat Text',
        fontSize: 14,
        letterSpacing: 0 ,
        fontWeight: FontWeight.w300,
        height: 1
    ),
//#EAEAEA
    headline3:TextStyle(
      color: Color.fromRGBO(96, 96, 96, 1),
    fontFamily: 'Red Hat Text',
    fontSize: 15.352381706237793,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
    height: 1
),

    headline6:  TextStyle(
      color: Color.fromRGBO(147, 147, 147, 1),
    fontFamily: 'Red Hat Text',
    fontSize: 22,
    letterSpacing: 0 ,
    fontWeight: FontWeight.w300,
    height: 1
),
    headline4:   TextStyle(
        color: Color.fromRGBO(234, 234, 234, 1),
        fontFamily: 'Red Hat Display',
        fontSize: 20,
        letterSpacing: 0 ,
        fontWeight: FontWeight.normal,
        height: 1
    ),


    headline1:TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'Red Hat Text',
        fontSize: 22,
        letterSpacing: 0.2 ,
        fontWeight: FontWeight.w600,
        height: 1
    ),
    headlineLarge:  TextStyle(
        color: Color(0xff606060),
        fontFamily: 'Red Hat Display',
        fontSize: 20,
        letterSpacing: 0 ,
        fontWeight: FontWeight.w500,
        height: 1
    ),
    subtitle1:    TextStyle(
        color: Color(0xffEAEAEA),
    fontFamily: 'Red Hat Display',
    fontSize: 20,
    letterSpacing: 0 ,
    fontWeight: FontWeight.normal,
    height: 1
),


  ),

  colorScheme: const ColorScheme(
    background:  Color(0xffEAEAEA),
    onBackground: Color(0xff606060),
    primary: Color(0xff606060),
    onPrimary: Color(0xffEAEAEA),
    onSurface: Color(0xff606060),
    onError:  Color(0xffEAEAEA),
    secondaryContainer : Color(0xffEAEAEA),
    primaryVariant: Colors.grey,
      tertiary : Color(0xff606060),
    onPrimaryContainer :Colors.white,
    onTertiary :  Color(0xff606060),
    outline:Color(0xff606060),
    shadow:Color(0xffEAEAEA),
      inverseSurface : Colors.black87,
    onTertiaryContainer :Color(0xff303030),
      surfaceVariant : Color(0xff606060),
    inversePrimary :Color(0xff303030),
      onErrorContainer :  Color(0xff303030),
    secondaryVariant : Colors.black,
    secondary: Colors.white,
    onSecondary:   Color(0xff303030),
onSecondaryContainer: Color(0xff303030),
    primaryContainer:Colors.white,
    surface: Color(0xff606060),
    error: Color(0xffEAEAEA),
onInverseSurface: Color(0xffEAEAEA),
    errorContainer:  Color(0xff303030),

//secondaryContainer
    onSurfaceVariant: Color.fromRGBO(47, 47, 47, 1),


    brightness: Brightness.light,
  ),
);

ThemeData darkTheme = ThemeData(

  appBarTheme:  const AppBarTheme(
      color: Colors.black
  ),
  textTheme:  const TextTheme(
      headline2:  TextStyle(//uSED FOR Headlines like Top onces like choose Avatar Headline
          color: Color.fromRGBO(234, 234, 234, 1),
          fontFamily: 'Red Hat Display',
          fontSize: 20,
          letterSpacing: 0 ,
          fontWeight: FontWeight.w500,
          height: 1
      ),
    headline4:   TextStyle(
        color: Color(0xff606060),
    fontFamily: 'Red Hat Display',
    fontSize: 20,
    letterSpacing: 0 ,
    fontWeight: FontWeight.normal,
    height: 1
),

    headline5:
 TextStyle(
     color: Color(0xffC4C4C4),
    fontFamily: 'Red Hat Text',
    fontSize: 15,
    letterSpacing: 0 ,
    fontWeight: FontWeight.w200,
    height: 1
),
    headline3:TextStyle(
        color: Colors.white,
        fontFamily: 'Red Hat Text',
        fontSize: 15.352381706237793,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
        height: 1
    ),
    headline6:  TextStyle(
        color: Color.fromRGBO(147, 147, 147, 1),
        fontFamily: 'Red Hat Text',
        fontSize: 22,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w300,
        height: 1
    ),

    headline1:TextStyle(//Used for bUTTONS text and back buttons
        color: Color.fromRGBO(255, 255, 255, 1),
      fontFamily: 'Red Hat Text',
        fontSize: 22,
        letterSpacing: 0 ,
        fontWeight: FontWeight.w500,
        height: 1
    ),
    headlineLarge:  TextStyle(//uSED FOR Headlines like Top onces like choose Avatar Headline
      color: Color.fromRGBO(234, 234, 234, 1),
    fontFamily: 'Red Hat Display',
    fontSize: 20,
    letterSpacing: 0 ,
        fontWeight: FontWeight.w500,
    height: 1
),
    subtitle1:    TextStyle(
        color: Color(0xffEAEAEA),
        fontFamily: 'Red Hat Display',
        fontSize: 20,
        letterSpacing: 0 ,
        fontWeight: FontWeight.normal,
        height: 1
    ),

  ),
  colorScheme: const ColorScheme(
    background: Color(0xff606060),
    onBackground:  Color.fromRGBO(255, 255, 255, 1),
    primary:Color(0xffC4C4C4),
    onPrimary:Color(0xffC4C4C4),
    onSurface: Color(0xffFFFFFF),//for page names like Notifications
    onError:   Color.fromRGBO(96, 96, 96, 1),
    primaryVariant: Colors.black,
    secondaryContainer :Color(0xff606060),
    tertiary : Colors.white,
    onTertiary :  Color(0xffEAEAEA),
      onPrimaryContainer :Color(0xff303030),
      outline:Color.fromRGBO(234, 234, 234, 1),
      inverseSurface : Colors.white,
      shadow: Color(0xff303030),
      onTertiaryContainer :Color.fromRGBO(147, 147, 147, 1),
    surfaceVariant : Color.fromRGBO(234, 234, 234, 1),
      inversePrimary :Color.fromRGBO(234, 234, 234, 1),
    onErrorContainer :  Colors.white,
      secondaryVariant : Color(0xff939393),
    onSecondary: Colors.red,
    secondary: Colors.black,

    primaryContainer:Color(0xff606060),
    surface: Color(0xffEAEAEA),
    onSecondaryContainer: Colors.white,

    onInverseSurface: Color(0xff303030),
    onSurfaceVariant: Colors.white,
    errorContainer:  Color(0xff939393),




    error: Color.fromRGBO(47, 47, 47, 1),
    brightness: Brightness.dark,
  ),
);

}
// Figma Flutter Generator Rectangle4Widget - RECTANGLE
// Container(
// width: 291,
// height: 69,
// decoration: BoxDecoration(
// borderRadius : BorderRadius.only(
// topLeft: Radius.circular(5),
// topRight: Radius.circular(5),
// bottomLeft: Radius.circular(5),
// bottomRight: Radius.circular(5),
// ),
// boxShadow : [BoxShadow(
// color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
// offset: Offset(0,0),
// blurRadius: 20
// )],
//
// )
// )