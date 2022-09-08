import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';



import 'Permission2_Screen.dart';

class Permission1_Screen extends StatefulWidget {
  const Permission1_Screen({Key? key}) : super(key: key);

  @override
  State<Permission1_Screen> createState() => _Permission1_ScreenState();
}

class _Permission1_ScreenState extends State<Permission1_Screen> {
 final pref = sl<IPrefsHelper>();

  bool? serviceEnabled;
  LocationPermission? permission;
  Position? _currentPosition;
  double? Lat;
  double? Lng;

 Future<void> SetLatLng()async{
   await pref.SetLatLng(Lat!, Lng!);
 }

 void _determinePosition() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print("LOL 2");
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    SetLocation();
  }


  void SetLocation()async{
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true
    ) .then((Position position) async {
      _currentPosition = await position;
      Lat = _currentPosition!.latitude;
      Lng = _currentPosition!.longitude;
      print(Lat);
      print(Lng);
      Future.delayed(Duration(milliseconds: 2500), () {
        SetLatLng();
      });
    }).catchError((e) {
      print(e);
    });
    print(Geolocator.isLocationServiceEnabled());
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;

    return WillPopScope(
        onWillPop: () async => false,
    child:

      Scaffold(
      backgroundColor: PermissionScreen,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
Column(
  children: [
    Container(
      height: h/3,
      child: Container(
        margin: EdgeInsets.only(top: h/10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SvgPicture.asset("Assets/images/Frame100.svg",width: w/5.5,),
            SizedBox(width: 13.w,),
            SvgPicture.asset("Assets/images/Enable Location Services.svg",width: w/2.4),
            SizedBox(width: w/25,),
          ],),
      ),
    ),
    Center(
      child: Container(
        width: w/1.4,
        height: h/3,
        margin: EdgeInsets.only(bottom: h/50,top: h/40),
        child:   Text("""We use your location
to show you nearby
Bubbles and to
access them""",
          textAlign: TextAlign.left,
          style:_TextTheme.headline1!.copyWith(
            letterSpacing: .9,
            wordSpacing: 2,
            fontWeight: FontWeight.w300,
            fontSize: 24.sp,
          ),),
      ),
    ),
  ],
),


            Column(
              children: [

                    InkWell(
                      onTap: (){
                        _determinePosition();
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Permission2_Screen( ),
//

                              ),
                            )
                        );
                      },
                      child: Container(
                        width: w/1.32,
                        height: h/15,
                        decoration:  BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(5.r),
                            topRight:Radius.circular(5.r),
                            bottomLeft: Radius.circular(5.r),
                            bottomRight:Radius.circular(5.r),
                          ),
                          boxShadow : [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                              offset: Offset(0,0),
                              blurRadius: 6
                          )],
                          color : Color.fromRGBO(148, 38, 87, 1),
                        ),
                        child: Center(
                          child: Text('Enable', textAlign: TextAlign.center,       style:
                          _TextTheme.headline1!.copyWith(
                            fontSize: 22.sp,
                          ),),
                        ),
                      ),
                    ),
                Text(""),
                InkWell(
                  onTap: (){
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Permission2_Screen( ),
//

                          ),
                        )
                    );

                  },
                  child:
                  Container(
                    margin: EdgeInsets.only(bottom: h/60),
                    child: Text('Not Now', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(47, 47, 47, 1),
                        fontFamily: 'Red Hat Text',
                        fontSize: 17.sp,
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w300,
                        height: 1
                    ),),
                  )
                ),
                Text(""),

              ],
            )

          ],
        ),
      ),
    ));
  }
}
