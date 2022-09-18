import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bubbles/UI/Profile/Profile_Screen/pages/Porfile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'App/app.dart';
import 'Injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
try {
 //HttpOverrides.global =  MyHttpOverrides();
//SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await iniGetIt();
  await Gleap.initialize(
    token: '93AmJho7YPNoLs3F5Oe3jPZHlxF7wjZ5',
  );
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  AllBubblesStatus = List.filled(100000,0);
  AllBubblesJoinStatusTry = List.filled(10000,false);
  AllBubblesLeftStatusTry = List.filled(10000,true);
  AllNearBubblesStatusTry = List.filled(10000,false);
  AllBubblesIDS = List.filled(10000,0);
  // double latitude = 45.5017;
  // double longitude = -73.5673;
  //
  // String tz = tzmap.latLngToTimezoneString(latitude, longitude);
  // print('Montreal is in the $tz time zone.');
}catch(e){
  print(e);
}
    runApp(
      //  Profile()
      ProviderScope(child:MyApp())
    );
}

List<int>? AllBubblesIDS=[];
List<int>? AllBubblesStatus=[];
List<bool>? AllBubblesJoinStatusTry=[];
List<bool>? AllBubblesLeftStatusTry=[];
List<bool>? AllNearBubblesStatusTry=[];
Timer? timer;
Timer? timer2112;
bool CalledLoopingfucntion = false;



//// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//// flutter pub get && flutter pub run build_runner watch
//// flutter logs
//// flutter build apk --split-per-abi
//// flutter build appbundle
//flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi --obfuscate --split-debug-info=Bubbles\build\app\outputs\flutter-apk




//…or create a new repository on the command line
//echo "# Bubbles" >> README.md
//git init
//git add README.md
//git commit -m "first commit"
//git branch -M sub_sub
//https://github.com/Saedxd/Bubbles/tree/sub_main
//git remote add origin https://github.com/Saedxd/Bubbles/tree/code
//git push -u origin sub_sub
//…or push an existing repository from the command line


//git remote add origin https://github.com/Saedxd/Bubbles.git
//git branch -M main
//git push -u origin main



