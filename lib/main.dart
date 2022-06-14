import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'App/app.dart';
import 'Injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async {
try {
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





}catch(e){
  print(e);
}
    runApp(ProviderScope(child:MyApp()));
}


//// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
//// flutter pub get && flutter pub run build_runner watch

//flutter logs
//flutter build apk --split-per-abi



//todo's : Fix the fonts on the normal message and the overflow on create account challenge
//todo's :fix all font sizes with the new standerd.
//todo's :look at trello for fixes


//todo : replace the image that placed in raw in options screen with svg
//todo :handdle the screen of camera when access denyied
//todo :check why the verify request takes time to proceed
//todo :Display a message when verify profile when its done done
//todo : night mode button fix

// CD6356
// EB9B5D
// 80BFC5
// BA477A
// 7B78F5
// D588B1
// 77C08A
// 578274
// EAEAEA
// DEDDBF
// 606060
// 303030
// 4ECEB6
// E0A41E
// 31576D
// 8D4624
//…or create a new repository on the command line
//
// echo "# Bubbles" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/Saedxd/Bubbles.git
// git push -u origin main
//
// …or push an existing repository from the command line
//
// git remote add origin https://github.com/Saedxd/Bubbles.git
// git branch -M main
// git push -u origin main


//git lfs migrate import --include="*.bin"