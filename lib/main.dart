import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'App/app.dart';
import 'Injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
try {
 //HttpOverrides.global =  MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await iniGetIt();

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
  AllNearBubblesStatusTry = List.filled(10000,true);
  AllBubblesIDS = List.filled(10000,0);
}catch(e){
  print(e);
}
    runApp(ProviderScope(child:MyApp()));
}

List<int>? AllBubblesIDS=[];
List<int>? AllBubblesStatus=[];
List<bool>? AllBubblesJoinStatusTry=[];
List<bool>? AllBubblesLeftStatusTry=[];
List<bool>? AllNearBubblesStatusTry=[];
Timer? timer;
bool CalledLoopingfucntion = false;



//// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//// flutter pub get && flutter pub run build_runner watch
//// flutter logs
//// flutter build apk --split-per-abi
//// flutter build appbundle

//todo : fix all font sizes with the new standerd
//todo : night mode button fix
//todo : add the lines for socket for ios go to there package page
//todo : handdle the screen of camera when access denyied
//todo : check why the verify request takes time to proceed
//todo : Display a message when verify profile when its done done
//todo : import socket for ios and same for all packages

//Priority
//todo: upload to googleplay (fix the bug on image shown on the image andreas sent)

//Avatar Colors
// CD6356
// EB9B5D
// 80BFC5
// BA477A
// 7B78F5
// D588B1
// 77C08A
// DEDDBF
// 303030
// 4ECEB6
// E0A41E
// 31576D
// 8D4624
// EAEAEA
// 606060
//Bubble Colors
// 1. D1B964
// 2. E0A41E
// 3. EB9B5D
// 4. CF6D38
// 5. E06859
// 6. D96799
// 7. 7B78F5
// 8. 80BFC5
// 9. 4ECEB6
// 10. 6FA191
// 11. 77C08A
// 12. 34A853




//…or create a new repository on the command line
//echo "# Bubbles" >> README.md
//git init
//git add README.md
//git commit -m "first commit"
//git branch -M main
//git remote add origin https://github.com/Saedxd/Bubbles.git
//git push -u origin main
//…or push an existing repository from the command line


//git remote add origin https://github.com/Saedxd/Bubbles.git
//git branch -M main
//git push -u origin main




//Major problems
//todo : fix validation for all app
// fix solution for textfield getting covered by the keyboard......Solution : boolean test it with upper content when search begins
//todo : fix email auto validation where capital letters in email makes it not an email "problem"
//todo : fix these andreas numbers
//todo : 1 :https://www.awesomescreenshot.com/video/10296479?key=2c25c7472014d9aff5f555c929a4a3fb&fbclid=IwAR1AmdURNxi5vmPUQa-4kGAS03YA5PDimpfOgT0Od-geCuLdvHGGYi-1j1k
//ter (30893): [ERROR:flutter/lib/ui/ui_dart_state.cc(209)] Unhandled Exception: 'package:flutter/src/widgets/scroll_controller.dart': Failed assertion: line 107 pos 12: '_positions.isNotEmpty': ScrollController not attached to any scroll views.
// E/flutter (30893): #0      _AssertionError._doThrowNew (dart:core-patch/errors_patch.dart:51:61)
// E/flutter (30893): #1      _AssertionError._throwNew (dart:core-patch/errors_patch.dart:40:5)
// E/flutter (30893): #2      ScrollController.position (package:flutter/src/widgets/scroll_controller.dart:107:12)
// E/flutter (30893): #3      PageController.animateToPage (package:flutter/src/widgets/page_view.dart:195:41)
// E/flutter (30893): #4      _NavigatorTopBarState.build.<anonymous closure>.<anonymous closure>.<anonymous closure> (package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart:395:54)
// E/flutter (30893): #5      new Future.delayed.<anonymous closure> (dart:async/future.dart:393:39)
// E/flutter (30893): #6      _rootRun (dart:async/zone.dart:1418:47)
// E/flutter (30893): #7      _CustomZone.run (dart:async/zone.dart:1328:19)
// E/flutter (30893): #8      _CustomZone.runGuarded (dart:async/zone.dart:1236:7)
// E/flutter (30893): #9      _CustomZone.bindCallbackGuarded.<anonymous closure> (dart:async/zone.dart:1276:23)
// E/flutter (30893): #10     _rootRun (dart:async/zone.dart:1426:13)
// E/flutter (30893): #11     _CustomZone.run (dart:async/zone.dart:1328:19)
// E/flutter (30893): #12     _CustomZone.bindCallback.<anonymous closure> (dart:async/zone.dart:1260:23)
// E/flutter (30893): #13     Timer._createTimer.<anonymous closure> (dart:async-patch/timer_patch.dart:18:15)
// E/flutter (30893): #14     _Timer._runTimers (dart:isolate-patch/timer_impl.dart:395:19)
// E/flutter (30893): #15     _Timer._handleMessage (dart:isolate-patch/timer_impl.dart:426:5)
// E/flutter (30893): #16     _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:192:12)
//todo :  make scroll controller then pass it in constuctor
