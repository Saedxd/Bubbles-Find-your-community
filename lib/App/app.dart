import 'dart:async';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_Event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_bloc.dart';
import 'package:bubbles/UI/Profile/Friendlist_Screen/pages/Friendlist_screen.dart';
import 'package:bubbles/UI/Spash_Screen/pages/Splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:theme_manager/theme_manager.dart';
import '../core/Language/localization/demo_localization.dart';
import '../core/theme/theme_constants.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  State<MyApp> createState() => _MyAppState();
}
bool ISNewNotifications= false;
class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static final navigatorKey = new GlobalKey<NavigatorState>();
  final _TopBarBloc = sl<TopBarBloc>();
  bool? serviceEnabled;
  LocationPermission? permission;
  final pref = sl<IPrefsHelper>();
  MyTheme themeee = MyTheme();
  bool done = false;


  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin fltNotification;
 // StreamSubscription<FGBGType>? subscription;




  // Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   await Firebase.initializeApp();
  //   print("Handling a background message $message");
  //
  //   print(message.notification!.title.toString());
  //   if (message.notification!.title.toString() == "#Friend Request") {
  //     navigatorKey.currentState!.push(
  //         MaterialPageRoute(builder: (_) => FreindRequests())
  //     );
  //   }
  // }
  void _addBadge(int count) {
    FlutterAppBadger.updateBadgeCount(count);
  }


  void initMessaging() async{
    ISNewNotifications = true;
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    );
    var androiInit = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInit = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );


   var  initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    // fltNotification.initialize(
    //     initSetting,
    // //  onSelectNotification: handleClickNotification,
    // );
    fltNotification.initialize(initSetting,
        onSelectNotification:(String? payload){
      try{
        print("payload : $payload");
        //todo : handle on notification click
       // if(payload != null && payload.isNotEmpty) {
          navigatorKey.currentState!.push(     MaterialPageRoute(  builder: (context) => Friendlist(is_WithoutTopBar: true)));
     //   }
      }catch (e) {}
      return;
    });


    AndroidNotificationDetails androidNotificationsDetails =  AndroidNotificationDetails(
        'Channel 5',
        'Notification',
      channelDescription: "channel Description",
        importance: Importance.max,
        playSound: true,
      enableLights: false ,
    );
//To redirect me at least to friend requests??
    var iosDetails = IOSNotificationDetails();

    var generalNotificationDetails =NotificationDetails(
        android: androidNotificationsDetails,
        iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _TopBarBloc.add(GetBadge());
      _addBadge(1);
      print(message);
      RemoteNotification? notification=message.notification;
      AndroidNotification? android=message.notification?.android;
      if(notification!=null && android!=null)
      {
        //  fltNotification.show(
        //   notification.hashCode,
        //   notification.title,
        //   notification.body,
        //   generalNotificationDetails,
        // );

        fltNotification.show(
            notification.hashCode,
            notification.title,
            notification.body,
            generalNotificationDetails
        );}
      ISNewNotifications = true;
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: ${message.notification!}");
      print(message.notification!.title.toString());
      if (message.notification!.title.toString() == "Friend Request") {
        if (message.notification!.titleLocKey != null &&
            message.notification!.titleLocKey!.isNotEmpty) {
          navigatorKey.currentState!.push(MaterialPageRoute(builder:(_) => Friendlist(is_WithoutTopBar: true))
          );
          ISNewNotifications = true;
        }
      }
    }  );
    //
    // FirebaseMessaging.onBackgroundMessage((message) {
    //
    // });

//    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);



        }

  // handleClickNotification(String? payload) {
  //   print(payload);
  //   print("IN HANDDLE");
  //   if (payload == "#Friend Request") {
  //     navigatorKey.currentState!.push(
  //         MaterialPageRoute(builder: (_) => FreindRequests())
  //     );
  //   }
  // }
  // void listenToNotification() {
  //
  //     onMessage: (Map<String, dynamic> message) async {
  //       print("onMessage: $message");
  //
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print("onLaunch: $message");
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print("onResume: ${message["data"]}");
  //       // print("onResume: ${message["data"]}");
  //       // SchedulerBinding.instance!.addPostFrameCallback((_) {
  //       //   Navigator.of(GlobalVariable.navState.currentContext)
  //       //       .push(MaterialPageRoute(
  //       //       builder: (context) => TimelineView(
  //       //         campaignId: message["data"]["campaign"],
  //       //       )));
  //       // });
  //     },
  //   );
  // }


  void listenOrganizerNotification(context) {

  }
// MaterialPageRoute(builder: (_) => NavigatorTopBar(GOtoDirect: 5,))
  void handleMessage(RemoteMessage message) {

    print("onMessage: ${message.notification!}");

    if (message.notification!.title.toString() == "Friend Request") {
      navigatorKey.currentState!.push(
          MaterialPageRoute(builder: (_) =>Friendlist(is_WithoutTopBar: true))
      );
    }
  }
  //Future<void> onSelectNotification(payload) async {
  //   if(payload != null) {
  //     Map<String, dynamic> data = json.decode(payload);
  //
  //     if (data['screen'] == "message") {
  //       Navigator.push(
  //           navigatorKey.currentContext!,
  //           MaterialPageRoute(
  //             builder: (context) => MessageListPage(),
  //           )
  //       );
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    initMessaging();
    WidgetsFlutterBinding.ensureInitialized();
  }



  @override
  Widget build(BuildContext context) {

    Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'Assets/images/Vector(1).svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'Assets/images/Logo.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'Assets/images/path4.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'Assets/images/path14.svg'),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'Assets/images/Google Logo.svg'),
        null,
      ),
      //
      //
      //

    ]);

    return ThemeManager(
        defaultBrightnessPreference: BrightnessPreference.dark,
        data: (Brightness brightness) {
          print(brightness);
       // ThemeManager.of(context)
       //        .setBrightnessPreference(BrightnessPreference.dark);
         return
           brightness==Brightness.light
                ?themeee.darkTheme
                :themeee.darkTheme;

        },
        loadBrightnessOnStart: true,
        themedWidgetBuilder: (BuildContext context, ThemeData theme) {
          return  ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                home:
                // DirectChat(),
                // CameraScreen(),
                SecondClass(),
                title: 'Bubbles',
                theme: theme,
                localizationsDelegates: const [
                  DemoLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode &&
                        supportedLocale.countryCode == locale?.countryCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
              );
            },
            designSize: Size(320,568),
          );
        });


  }

}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//   RemoteNotification notification = message.notification!;
//   AndroidNotification android = message.notification!.android!;
//   print(notification);
//   print(android);
//
//   if (notification != null && android != null) {
//
//     flutterLocalNotificationsPlugin.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//            color: Colors.blue,
//          //   channel.description,
//             playSound: true,
//             icon:'@mipmap/appicon',
//           ),
//         ));
//   }
// });
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}