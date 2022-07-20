// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names
import 'dart:async';
import 'dart:typed_data';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/Events_Screen.dart';
import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:bubbles/UI/Home/Options_screen/pages/Options_screen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/bloc/TopBar_Event.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:ui'as ui; // imported as ui to prevent conflict between ui.Image and the Image widget
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:math' as math;

import 'package:socket_io_client/socket_io_client.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
List<int>? AllBubblesIDS=[];
List<int>? AllBubblesStatus=[];
List<bool>? AllBubblesStatusTry=[];
List<bool>? AllNearBubblesStatusTry=[];
Timer? timer;
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double? Lat;
  double? Lng;
  final pref = sl<IPrefsHelper>();
  final _HomeBloc = sl<HomeBloc>();
  final ScrollController _Primecontroller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final Completer<GoogleMapController> _controller = Completer();
  final PanelController PanelControllerr = PanelController();
  final _key = GlobalKey();
  late FocusNode FocuseNODE;
  DateTime selectedDate = DateTime.now();
  Geolocator? instance = Geolocator();
  bool? serviceEnabled;
  CameraPosition? UserPostion;
  DateTime? Time;
  bool done = false;
  bool Done2 = false;
  bool isMapCreated = false;
  bool? theme;
  bool? Done = false;
  bool? done2 = false;
  bool? done1 = false;
  double value = 0;
  Random random =  Random();
  StreamSubscription? _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController? _googleMapController;
  bool? diditonceee= false;

  bool showdialogg = false;
  double? CameraZoom;
  Set<Marker> marker2 = {};
  Set<Marker> LOadingg = {};
  Set<Circle> circle = {};
  Set<Circle> Loading = {};
  Location? location;
  Color MYcolor = Colors.black;
  LatLng? centerLatLng;
  geo.LocationPermission? permission;
  late geo.LocationSettings locationSettings;
  Marker? marker;
  LatLng? UserLocation;
  bool DiditOnces = false;
  Data Dataa = Data();
  Uint8List? markerIcon;
  bool doit = false;
  double? lat;
  double? lng;
  var distanceNearby;
  var distanceinside;
  int? locationslength;
  int? meters;
  double? coef;
  double? new_lat ;
  double? new_long ;
  double? User_lat =0;
  double? User_long=0 ;
  int counter = 0;
  GoogleMap? myMap;

  String MyName = "";

  Future<void> getCurrentLocation() async {
    try {
      bool enabled = await Location.instance.serviceEnabled();
      if (enabled) {
        var location = await _locationTracker.getLocation();

          _googleMapController!.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(location.latitude!, location.longitude!),
                    zoom: 12.151926040649414),
              ));

        _locationSubscription =
            _locationTracker.onLocationChanged.listen((newLocalData) {
          if (_googleMapController != null) {
            // print(newLocalData.latitude);
            // print(newLocalData.longitude);
            // UserLocation = LatLng(newLocalData.latitude! ,newLocalData.longitude!);
            _HomeBloc.add(UserMoved((b) => b
              ..lng = newLocalData.longitude!
              ..lat = newLocalData.latitude!));
            // print(newLocalData.longitude);
            // print(newLocalData.latitude);
            User_lat = newLocalData.latitude!;
            User_long =newLocalData.longitude;
           // print("Request called");
          }
        });

        print(location.longitude);
        print(location.latitude);
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }


  }


  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    if (_googleMapController != null) {
      _googleMapController!.dispose();
    }

    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    location = Location();
    GetTHEME();
    print("initState called");
    getCurrentLocation();
    DiditOnces = true;
    _HomeBloc.add(GetAllBubbles());
    _HomeBloc.add(Getprofile());
    timer!=null
        ? timer!.cancel()
        : Text("NUll");
    // AllBubblesStatus = List.filled(100000,0);
    // AllBubblesStatusTry = List.filled(10000,true);
    // AllNearBubblesStatusTry = List.filled(10000,true);
    // AllBubblesIDS = List.filled(10000,0);
    diditonceee = true;
    _HomeBloc.add(GetPrimeBubbles());
    _HomeBloc.add(GetNewBubbles());
    _HomeBloc.add(GetPopularNowBubbles());
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) SetState) {
      return GestureDetector(
          onTap: () {FocusScope.of(context).attach(context);},
          child: BlocBuilder(
              bloc: _HomeBloc,
              builder: (BuildContext Context, HomeState state){


                void LoopOnAllBUbbles(HomeState state)async{
                  try{
                     locationslength = state.locationn!.length;

                  for(int i=0;i<state.locationn!.length;i++) {

                    AllBubblesIDS![i] = state.locationn![i].bubble_id!;
                    meters = state.BubblesRaduis![i];//todo : make this double value for more prefection
                   double coef = meters! * 0.0000089;
                   new_lat = state.locationn![i].lat! + coef;
                   new_long = state.locationn![i].lng! + coef / cos(state.locationn![i].lat! * 0.018);
                  distanceNearby = geo.Geolocator.distanceBetween(User_lat!,User_long!,new_lat!,new_long!);
                    distanceinside = geo.Geolocator.distanceBetween(User_lat!,User_long!,state.locationn![i].lat!,state.locationn![i].lng!);


                    if ((distanceNearby/1000)<=5 && !(distanceinside<=meters) && AllNearBubblesStatusTry![i]){
                      print("there is a bubble ${(distanceNearby/1000).toString().substring(0,4)} KM ahead of me ");
                      print("${(distanceNearby/1000).toString().substring(3)}");
                      AllNearBubblesStatusTry![i]=false;
                      _HomeBloc.add(NotifyNearBubble((b) =>
                      b..Title = "${state.locationn![i].Title} Event"
                      ..Distance = "${(distanceNearby/1000).toString().substring(3)} KM"
                      ));
                    }



                   if (distanceinside<=meters && AllBubblesStatusTry![i]){
                     //AllBubblesStatusTry for not making him to send spam requests
                     AllBubblesStatus![i]=1;
                     print("your inside a ${state.locationn![i].Title} Event");
                     AllBubblesStatusTry![i] = false;
                     _HomeBloc.add(UserJoinedBubble((b) =>
                     b..Bubble_id = state.locationn![i].bubble_id!
                     ));
                   }else if (!(distanceinside<=meters) && !AllBubblesStatusTry![i] ){
                     AllBubblesStatus![i]=0;
                     AllBubblesStatusTry![i] = true;
                     print("YOu left the area of a ${state.locationn![i].Title} Event");
                    // sendILeftBubble(state.locationn![i].bubble_id!);
                     _HomeBloc.add(UserLeftBubble((b) =>
                     b..Bubble_id = state.locationn![i].bubble_id!
                     ));
                   }

                  }
                  }catch (e){
                    print(e);
                  }
                }

                if (state.GetprofileSuccess!){
                  MyName = state.ProfileDate!.user!.alias.toString();
                }



                if (state.GetAllBubblesSuccess! && diditonceee == true){
                  // ListenForWhoJoinedBUbble();
                  // ListenForWhoLeftBUbble();

                  LoopOnAllBUbbles(state);
                  diditonceee = false;


                  timer = Timer.periodic(Duration(seconds: 10), (Timer t)async{
                    return
                      LoopOnAllBUbbles(state);
                  });


                }



                return WillPopScope(
                  onWillPop: () async => false,
                  child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    key: _scaffoldKey,
                    body: SafeArea(
                      child: Stack(
                          children:[
                        GoogleMap(
                          onCameraMove:(CameraPosition cameraPosition) {
                              if(!state.GetAllBubblesIsloading!){
                          //    LoopOnAllBUbbles();
                              CameraZoom = cameraPosition.zoom;
                              }
                          },
                          myLocationButtonEnabled: true,
                          onTap: (location) {
                            //LoopOnAllBUbbles();
                           // LoopOnAllBUbbles();
                            if (state.MakeHimBEableTOSEtBubble!) {
                              Lat = location.latitude;
                              Lng = location.longitude;

                              _HomeBloc.add(CreateBubbless((b) => b
                                ..Radius = value
                                ..lat = location.latitude
                                ..lng = location.longitude));
                            }
                          },


                          zoomControlsEnabled: false,
                          circles: state.GetAllBubblesIsloading!
                              ? Loading
                              : state.circle!,
                          mapType: MapType.hybrid,
                          markers: state.GetAllBubblesIsloading!
                              ? LOadingg
                              : state.marker2!,// LatLng(37.9715, 23.7267),
                          initialCameraPosition: CameraPosition(
                              target: LatLng(state.Userlat, state.Userlng),
                              zoom: 12.151926040649414),
                          onMapCreated: (controller) {

                            _googleMapController = controller;
                            _controller.complete(controller);
                            isMapCreated = true;
                            changeMapMode();
                            print(
                                "Map Created----------------------------------------------");
                          },
                          myLocationEnabled: false,
                          zoomGesturesEnabled: true,
                        ),

                        state.GetprofileSuccess!
                            ? state.ProfileDate!.user!.is_creator == 1
                                ? Positioned(
                                    bottom: h / 50,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        print("clicked");
                                        _HomeBloc.add(ShowDialoog());
                                        MYcolor = Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Stack(children: [
                                          SvgPicture.asset(
                                            "Assets/images/widget.svg",
                                            width: 90,
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            left: 0,
                                            bottom: 0,
                                            child: IconButton(
                                                icon: SvgPicture.asset(
                                                    "Assets/images/Vector(4).svg"),
                                                onPressed: () async {
                                                  if (state
                                                      .MakeHimBEableTOSEtBubble!) {
                                                    _HomeBloc.add(
                                                        OpenDoorTObeAbleTOsetBubble(
                                                            (b) => b
                                                              ..MakeHimBEableTOSEtBubbles =
                                                                  false));
                                                  } else {
                                                    _HomeBloc.add(
                                                        OpenDoorTObeAbleTOsetBubble(
                                                            (b) => b
                                                              ..MakeHimBEableTOSEtBubbles =
                                                                  true));
                                                  }
                                                  await getCenter();
                                                  print("clicked");
                                                  _HomeBloc.add(ShowDialoog());
                                                  MYcolor = Color((math.Random()
                                                                  .nextDouble() *
                                                              0xFFFFFF)
                                                          .toInt())
                                                      .withOpacity(1.0);
                                                  // _HomeBloc.add(
                                                  //     CreateBubbless((b) =>
                                                  //     b
                                                  //       ..Radius = value
                                                  //       ..lat = centerLatLng!
                                                  //           .latitude
                                                  //       ..lng = centerLatLng!
                                                  //           .longitude
                                                  //     ));
                                                }),
                                          ),
                                        ]),
                                      ),
                                    ))
                                : Text("")
                            : Text(""),

                        ShowCaseWidget(
                            builder: Builder(
                             builder: (context) => SlidingUpPanel(
                              controller: PanelControllerr,
                              color: ColorS.onPrimaryContainer,
                              maxHeight: h,
                              minHeight: 30,
                              onPanelOpened: () {
                                _HomeBloc.add(GetNearbyBubbles((b) =>   b
                                  ..lng = User_long
                                  ..lat = User_lat
                                ));
                              },
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              panel: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                width: w,
                                height: h * 2,
                                child: Column(
                                  children:[
                                    SizedBox(
                                      height: h / 70,
                                    ),
                                    Container(
                                      width: w / 3.9,
                                      height: h / 130,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        color: ColorS.onTertiary,
                                      ),
                                      //
                                    ),
                                    SizedBox(
                                      height: h / 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: w/2,
                                          height: h/15,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Nearby Primes',
                                                textAlign: TextAlign.left,
                                                style: _TextTheme.headlineLarge!
                                                    .copyWith(
                                                  fontSize: 17,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              InkWell(
                                                onTap: () {
                                                  _Primecontroller.animateTo(
                                                    _Primecontroller.position
                                                        .minScrollExtent,
                                                    duration: Duration(
                                                        microseconds: 2),
                                                    curve: Curves.easeIn,
                                                  );
                                                  WidgetsBinding.instance!
                                                      .addPostFrameCallback(
                                                        (_) => ShowCaseWidget.of(
                                                        context)!
                                                        .startShowCase(
                                                      [
                                                        _key,
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: w / 20,
                                                  height: h / 50,
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "Assets/images/Vector22.svg",
                                                          width: h/40,
                                                          color: ColorS.onTertiary),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 5,),
                                        IconButton(
                                            onPressed: (){
                                              WidgetsBinding
                                                  .instance!
                                                  .addPostFrameCallback((_) =>
                                                  Navigator
                                                      .push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Events_Screen(type:  'Nearby Primes',User_long: User_long,User_lat: User_lat,  ),
                                                    ),
                                                  ));
                                            },
                                            icon: Text('See all',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(207, 109, 56, 1),
                                                  fontFamily: 'Red Hat Display',
                                                  fontSize: 11,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1
                                              ),)

                                        )
                                      ],
                                    ),
                                    state.GetNewBubblesSuccess!
                                        ? Container(
                                            width: w,
                                            height: h /4,
                                      padding:EdgeInsets.only(left: h/25),
                                            child: ListView.separated(
                                              cacheExtent : 500,
                                              controller:_Primecontroller ,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: false,
                                              itemCount: state.GetPrimeBubbles!
                                                  .data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                    String Value = state.GetBubbles!.data![index].color!;
                                                    if (Value.contains("#",0)){
                                                      Value = Value.substring(1);
                                                      Value = "0xff$Value";
                                                    }
                                                    var myInt = int.parse(Value);
                                                    var BackgroundColor= myInt;


                                                return index == 0
                                                    ? Showcase(
                                                        key: _key,
                                                        description:
                                                            'Prime Bubbles are permanent public bubbles that are placed in key places',
                                                        showArrow: true,
                                                        showcaseBackgroundColor:  Colors.transparent,
                                                        textColor: Colors.white,
                                                        disableAnimation: false,
                                                        disposeOnTap: true,
                                                        onTargetClick: (){ },

                                                        child: InkWell(
                                                          onTap: () {
                                                              WidgetsBinding
                                                                  .instance!
                                                                  .addPostFrameCallback(
                                                                      (_) =>   Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (
                                                                              context) =>
                                                                              Plan_Screen(
                                                                                Event_id: state
                                                                                    .GetPrimeBubbles!
                                                                                    .data![index]
                                                                                    .id!, Event_name:state.GetPrimeBubbles!.data![index].title.toString() ,
                                                                              ),
                                                                        ),
                                                                      ));



                                                          },
                                                          child:



                                                                  Container(
                                                                    width: w/2.5,
                                                                    height: h / 5,
                                                                    padding: EdgeInsets.only(top: h/300),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius : BorderRadius.only(
                                                                        topLeft: Radius.circular(364.2384033203125),
                                                                        topRight: Radius.circular(364.2384033203125),
                                                                        bottomLeft: Radius.circular(14.569536209106445),
                                                                        bottomRight: Radius.circular(14.569536209106445),
                                                                      ),
                                                                      color: Color(0xff606060),
                                                                    ),child:

                                                                  Column(
                                                                      children: [
                                                                        Stack(
                                                                        children: [
                                                                          CachedNetworkImage(
                                                                            imageUrl: state
                                                                                .GetPrimeBubbles!.data![index].images![0].image.toString(),
                                                                            imageBuilder: (context, imageProvider) => Container(
                                                                              width: w/2.5,
                                                                              height: h/6.5,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius : BorderRadius.only(
                                                                                  topLeft: Radius.circular(364.2384033203125),
                                                                                  topRight: Radius.circular(364.2384033203125),
                                                                                  bottomLeft: Radius.circular(14.569536209106445),
                                                                                  bottomRight: Radius.circular(14.569536209106445),
                                                                                ),
                                                                                image:DecorationImage(image: imageProvider
                                                                                    ,fit: BoxFit.fill
                                                                                ),

                                                                              ),

                                                                            ),
                                                                            placeholder: (context, url) => CircularProgressIndicator(),
                                                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                                                          ),
                                                                          Positioned(
                                                                              top: h/9,
                                                                            child: Container(
                                                                                width: w/2.5,
                                                                                height: h/8,
                                                                                padding: EdgeInsets.only(top: h/4),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius : BorderRadius.only(
                                                                                    // topLeft: Radius.circular(30.2384033203125),
                                                                                    // topRight: Radius.circular(30.2384033203125),
                                                                                  ),
                                                                                  gradient : LinearGradient(
                                                                                      begin: Alignment(5.730259880964636e-14,-2),
                                                                                      end: Alignment(-1,3.9593861611176705e-16),
                                                                                      colors: [Colors.transparent,Color(BackgroundColor).withOpacity(.5)]
                                                                                  ),
                                                                                )
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        ),

                                                                        Expanded(
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              borderRadius : BorderRadius.only(
                                                                                bottomLeft: Radius.circular(14.569536209106445),
                                                                                bottomRight: Radius.circular(14.569536209106445),
                                                                              ),
                                                                              color: Color(0xff606060),
                                                                            ),
                                                                            child:
                                                                            Column(
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    SvgPicture.asset(
                                                                                      "Assets/images/Exclude.svg",
                                                                                      color : Color(BackgroundColor),
                                                                                      width: w/10,
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Container(
                                                                                        color: Colors.transparent,
                                                                                        child: Text(state.GetPrimeBubbles!.data![index].title.toString(),
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          textAlign: TextAlign.left, style: TextStyle(
                                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                                              fontFamily: 'Red Hat Display',
                                                                                              fontSize: 13,
                                                                                              letterSpacing: 0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              height: 1
                                                                                          ),),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text('Park', textAlign: TextAlign.left, style: TextStyle(
                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                    fontFamily: 'Red Hat Text',
                                                                                    fontSize: 10,
                                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    height: 1
                                                                                ),)
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]





                                                                  ),


                                                                  ),







                                                        ))
                                                        : InkWell(
                                                  onTap: () {
                                                    WidgetsBinding
                                                        .instance!
                                                        .addPostFrameCallback(
                                                            (_) =>   Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (
                                                                context) =>
                                                                Plan_Screen(
                                                                  Event_id: state
                                                                      .GetPrimeBubbles!
                                                                      .data![index]
                                                                      .id!, Event_name:state.GetPrimeBubbles!.data![index].title.toString() ,
                                                                ),
                                                          ),
                                                        ));



                                                  },
                                                  child:



                                                  Container(
                                                    width: w/2.5,
                                                    height: h / 5,
                                                    padding: EdgeInsets.only(top: h/300),
                                                    decoration: BoxDecoration(
                                                      borderRadius : BorderRadius.only(
                                                        topLeft: Radius.circular(364.2384033203125),
                                                        topRight: Radius.circular(364.2384033203125),
                                                        bottomLeft: Radius.circular(14.569536209106445),
                                                        bottomRight: Radius.circular(14.569536209106445),
                                                      ),
                                                      color: Color(0xff606060),
                                                    ),child:

                                                  Column(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            CachedNetworkImage(
                                                              imageUrl: state
                                                                  .GetPrimeBubbles!.data![index].images![0].image.toString(),
                                                              imageBuilder: (context, imageProvider) => Container(
                                                                width: w/2.5,
                                                                height: h/6.5,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(364.2384033203125),
                                                                    topRight: Radius.circular(364.2384033203125),
                                                                    bottomLeft: Radius.circular(14.569536209106445),
                                                                    bottomRight: Radius.circular(14.569536209106445),
                                                                  ),
                                                                  image:DecorationImage(image: imageProvider
                                                                      ,fit: BoxFit.fill
                                                                  ),

                                                                ),

                                                              ),
                                                              placeholder: (context, url) => CircularProgressIndicator(),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ),
                                                            Positioned(
                                                              top: h/9,
                                                              child: Container(
                                                                  width: w/2.5,
                                                                  height: h/8,
                                                                  padding: EdgeInsets.only(top: h/4),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius : BorderRadius.only(
                                                                      // topLeft: Radius.circular(30.2384033203125),
                                                                      // topRight: Radius.circular(30.2384033203125),
                                                                    ),
                                                                    gradient : LinearGradient(
                                                                        begin: Alignment(5.730259880964636e-14,-2),
                                                                        end: Alignment(-1,3.9593861611176705e-16),
                                                                        colors: [Colors.transparent,Color(BackgroundColor).withOpacity(.5)]
                                                                    ),
                                                                  )
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        Expanded(
                                                          child: Container(

                                                            decoration: BoxDecoration(
                                                              borderRadius : BorderRadius.only(
                                                                bottomLeft: Radius.circular(14.569536209106445),
                                                                bottomRight: Radius.circular(14.569536209106445),
                                                              ),
                                                              color: Color(0xff606060),
                                                            ),
                                                            child:
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                      "Assets/images/Exclude.svg",
                                                                      color : Color(BackgroundColor),
                                                                      width: w/10,
                                                                    ),
                                                                    Flexible(
                                                                      child: Container(
                                                                        color: Colors.transparent,
                                                                        child: Text(state.GetPrimeBubbles!.data![index].title.toString(),
                                                                          overflow: TextOverflow.ellipsis,
                                                                          textAlign: TextAlign.left, style: TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 13,
                                                                              letterSpacing: 0,
                                                                              fontWeight: FontWeight.w600,
                                                                              height: 1
                                                                          ),),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text('Park', textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Text',
                                                                    fontSize: 10,
                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight: FontWeight.w300,
                                                                    height: 1
                                                                ),)
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ]





                                                  ),


                                                  ),







                                                );
                                              },
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return SizedBox(width: h / 100);
                                              },
                                            ),
                                          )
                                        : state.GetNewBubblesIsloading == true
                                            ? Container(
                                        padding:EdgeInsets.only(left: h/25),
                                        width: w,
                                        height: h /4,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                        child: listLoader(
                                                            context: context)),
                                                  ],
                                                ))
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      padding:EdgeInsets.only(left: h/25),
                                                      width: w,
                                                      height: h /4,
                                                      child:
                                                          Center(child: const Text("Waiting...")),
                                                    ),
                                                  ),
                                                ],
                                              ),



                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: w,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: w/15),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              width: w / 1.6,
                                              height: h / 18,
                                              child: Form(
                                                key: _formkey1,
                                                child: TextFormField(
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  controller: _SearchController,
                                                  focusNode: FocuseNODE,
                                                  cursorColor: Colors.grey,
                                                  onChanged: (keyword){
                                                    _HomeBloc.add(SearchBubblesLists((b) => b
                                                    ..Keyword = keyword
                                                    ));
                                                  },
                                                  style: const TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 16.5),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(30.0),
                                                      borderSide: const BorderSide(
                                                          color: Color(0xffC4C4C4),
                                                          width: 10),
                                                    ),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30.0)),
                                                      borderSide: BorderSide(
                                                          color: Color(0xffC4C4C4),
                                                          width: 2),
                                                    ),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30.0)),
                                                      borderSide: BorderSide(
                                                          color: Color(0xffC4C4C4),
                                                          width: 2),
                                                    ),
                                                    prefixIcon: IconButton(
                                                        icon: SvgPicture.asset(
                                                          'Assets/images/Vector(1).svg',
                                                        ),
                                                        onPressed:
                                                            null //do something,
                                                        ),
                                                    filled: true,
                                                    fillColor: Colors.transparent,
                                                    contentPadding:
                                                        const EdgeInsets.symmetric(),
                                                    hintText:
                                                        "Search for locations or events",
                                                    hintStyle: _TextTheme.headline6!
                                                        .copyWith(
                                                      fontSize: 2 *
                                                          SizeConfig
                                                              .blockSizeVertical!
                                                              .toDouble(),
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType.text,
                                                ),
                                              )),

                                  
                                             IconButton(
                                               onPressed: (){
                                                print("er");
                                               },
                                               icon: Row(
                                                 children: [

                                                   Expanded(
                                                     child: Container(
                                                       width: w/7.5,
                                                       height: h / 14,
                                                       child: SvgPicture.asset(
                                                           "Assets/images/Calender.svg",
                                                           fit: BoxFit.fill,
                                                           color: ColorS.surface),
                                                     ),
                                                   ),

                                                 ],
                                               ),



                                             ),
                                             IconButton(
                                               onPressed: (){

                                               },
                                               icon: Row(
                                                 children: [
                                                   
                                                   Expanded(
                                                     child: Container(
                                                       width: w/7.5,
                                                       height: h / 14,
                                                       child: SvgPicture.asset(
                                                           "Assets/images/Filter.svg",
                                                           fit: BoxFit.fill,
                                                           color: ColorS.surface),
                                                     ),
                                                   ),

                                                 ],
                                               ),


                                             ),
                                       
                                   
                                          SizedBox(width: 5,),

                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                        width: w,
                                        height: h / 2,
                                        margin: EdgeInsets.only(top: h/60),
                                        child: SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: w/3,
                                                    child: Text(
                                                      'Subscribed Feed',
                                                      textAlign: TextAlign.left,
                                                      style: _TextTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                        fontSize: 17,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  SizedBox(width: 2,),
                                                    IconButton(
                                                        onPressed: (){
                                                          WidgetsBinding
                                                              .instance!
                                                              .addPostFrameCallback((_) =>
                                                              Navigator
                                                                  .push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => Events_Screen(type: 'Subscribed Feed',  ),
                                                                ),
                                                              ));
                                                        },
                                                        icon: Text('See all',
                                                          textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                              fontFamily: 'Red Hat Display',
                                                              fontSize: 11,
                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight: FontWeight.w400,
                                                              height: 1
                                                          ),)

                                                  )
                                                ],
                                              ),

                                              state.GetNewBubblesSuccess!
                                                  ? state.GetPopularNowBubbles!.data! .length != 0
                                                  ? Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: ScrollConfiguration(
                                                      behavior: MyBehavior(),
                                                      child: ListView
                                                          .separated(
                                                        cacheExtent : 500,
                                                        physics: BouncingScrollPhysics(),
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemCount: state.FilteredBUBBLElists3!.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {


                                                          return InkWell(
                                                            onTap: () {
                                                              WidgetsBinding
                                                                  .instance!
                                                                  .addPostFrameCallback((_) =>
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Plan_Screen(
                                                                            Event_id: state.FilteredBUBBLElists3![index].id!, Event_name:state.FilteredBUBBLElists3![index].Title! ,
                                                                          ),
                                                                    ),
                                                                  ));
                                                              // }
                                                            },
                                                            child:Container(
                                                              width: w / 1.6,
                                                              height:  h / 3,
                                                              decoration: BoxDecoration(
                                                                borderRadius : BorderRadius.only(
                                                                  topLeft: Radius.circular(7),
                                                                  topRight: Radius.circular(7),
                                                                  bottomLeft: Radius.circular(7),
                                                                  bottomRight: Radius.circular(7),
                                                                ),
                                                                color : Color.fromRGBO(96, 96, 96, 1),
                                                              ),
                                                              child:
                                                              Column(
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Container(
                                                                        width: w / 1.6,
                                                                        height: h/4.2,
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                                          child:CachedNetworkImage(
                                                                            fit: BoxFit.fitWidth,
                                                                            imageUrl:
                                                                            //"",
                                                                            state.FilteredBUBBLElists2![index].image.toString(),
                                                                            placeholder: (context, url) => Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                                              ],
                                                                            ),
                                                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                                                          ),
                                                                        ),
                                                                      ),

                                                                      Transform.rotate(
                                                                        angle: -179.99999499104388 * (math.pi / 180),
                                                                        child: Container(
                                                                            width: w / 1.6,
                                                                            height: h/4.2,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius : BorderRadius.only(
                                                                                topLeft: Radius.circular(7),
                                                                                topRight: Radius.circular(7),
                                                                                bottomLeft: Radius.circular(7),
                                                                                bottomRight: Radius.circular(7),
                                                                              ),
                                                                              gradient : LinearGradient(
                                                                                  begin: Alignment(5.730259880964636e-14,-2),
                                                                                  end: Alignment(2,3.9593861611176705e-16),
                                                                                  colors: [Colors.transparent,Color(state.FilteredBUBBLElists2![index].Color!),]
                                                                              ),
                                                                            )
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),


                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [

                                                                      Flexible(
                                                                        child: Container(
                                                                          margin: EdgeInsets.only(left: h/50),
                                                                          child: Column(
                                                                            children: [
                                                                              const SizedBox(
                                                                                height:
                                                                                10,
                                                                              ),
                                                                              Container(

                                                                                child:      Text(
                                                                                  state.FilteredBUBBLElists2![index].Title.toString(),
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: _TextTheme.headlineLarge!.copyWith(
                                                                                    color: Color(state.FilteredBUBBLElists2![index].Color!.toInt()),
                                                                                    fontSize: 19,
                                                                                    letterSpacing: 0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),

                                                                              ),
                                                                              Container(
                                                                                child:  Text(
                                                                                  'At ${state.FilteredBUBBLElists2![index].location.toString()}',
                                                                                  textAlign: TextAlign.left,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: _TextTheme.headlineLarge!.copyWith(
                                                                                    fontSize: 13,
                                                                                    letterSpacing: 0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),

                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child:  Text(
                                                                                  '${state.FilteredBUBBLElists2![index].location.toString()}',
                                                                                  textAlign: TextAlign.left,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: _TextTheme.headlineLarge!.copyWith(
                                                                                    fontSize: 13,
                                                                                    letterSpacing: 0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),

                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        "Assets/images/Exclude.svg",
                                                                        color : Color(state.FilteredBUBBLElists2![index].Color!),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {
                                                          return const Text(
                                                              "      ");
                                                        },
                                                      )))
                                                  : Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: Center(
                                                      child: Text(
                                                          "No events was made today why not you make one?!")))
                                                  : state.GetNewBubblesIsloading ==true
                                                  ? Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 10),
                                                  width: w,
                                                  height: h / 3.5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Center(
                                                          child: listLoader(
                                                              context:
                                                              context)),
                                                    ],
                                                  ))
                                                  : Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      padding:EdgeInsets.only(left: h/40),
                                                      width: w,
                                                      height:  h / 3,
                                                      child:
                                                      Center(
                                                        child: const Text(
                                                            "Waiting..."),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),


                                              SizedBox(
                                                height: h/40,
                                              ),



                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: w/3,
                                                    child: Text(
                                                      'Popular Now',
                                                      textAlign: TextAlign.left,
                                                      style: _TextTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                        fontSize: 17,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  SizedBox(width: 2,),
                                                  IconButton(
                                                      onPressed: (){
                                                        WidgetsBinding
                                                            .instance!
                                                            .addPostFrameCallback((_) =>
                                                            Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => Events_Screen(type: 'Popular Now',  ),
                                                              ),
                                                            ));
                                                      },
                                                      icon: Text('See all',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(207, 109, 56, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 11,
                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1
                                                        ),)

                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: h/40,
                                              ),

                                              state.GetNewBubblesSuccess!
                                                  ? state.GetPopularNowBubbles!.data! .length != 0
                                                  ? Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: ScrollConfiguration(
                                                      behavior: MyBehavior(),
                                                      child: ListView
                                                          .separated(
                                                        cacheExtent : 500,
                                                        physics: BouncingScrollPhysics(),
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemCount: state.FilteredBUBBLElists3!.length,
                                                        itemBuilder:  (BuildContext context,int index){
                                                          return InkWell(
                                                            onTap: () {
                                                            WidgetsBinding
                                                                .instance!
                                                                .addPostFrameCallback((_) =>
                                                                Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        Plan_Screen(
                                                                          Event_id: state.FilteredBUBBLElists3![index].id!, Event_name:state.FilteredBUBBLElists3![index].Title! ,
                                                                        ),
                                                                  ),
                                                                ));
                                                            },
                                                            child:Container(
                                                              width: w / 1.6,
                                                              height:  h / 3,
                                                              decoration: BoxDecoration(
                                                                borderRadius : BorderRadius.only(
                                                                  topLeft: Radius.circular(7),
                                                                  topRight: Radius.circular(7),
                                                                  bottomLeft: Radius.circular(7),
                                                                  bottomRight: Radius.circular(7),
                                                                ),
                                                                color : Color.fromRGBO(96, 96, 96, 1),
                                                              ),
                                                              child:
                                                              Column(
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Container(
                                                                        width: w / 1.6,
                                                                        height: h/4.2,
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                                          child:CachedNetworkImage(
                                                                            fit: BoxFit.fitWidth,
                                                                            imageUrl:
                                                                            state.FilteredBUBBLElists3![index].image.toString(),
                                                                            placeholder: (context, url) => Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                                              ],
                                                                            ),
                                                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                                                          ),
                                                                        ),
                                                                      ),

                                                                      Transform.rotate(
                                                                        angle: -179.99999499104388 * (math.pi / 180),
                                                                        child: Container(
                                                                            width: w / 1.6,
                                                                            height: h/4.2,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius : BorderRadius.only(
                                                                                topLeft: Radius.circular(7),
                                                                                topRight: Radius.circular(7),
                                                                                bottomLeft: Radius.circular(7),
                                                                                bottomRight: Radius.circular(7),
                                                                              ),
                                                                              gradient : LinearGradient(
                                                                                  begin: Alignment(5.730259880964636e-14,-2),
                                                                                  end: Alignment(2,3.9593861611176705e-16),
                                                                                  colors: [Colors.transparent,Color(state.FilteredBUBBLElists3![index].Color!),]
                                                                              ),
                                                                            )
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: w / 1.6,
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            state.FilteredBUBBLElists3![index].type!="Prime"
                                                                                ?  state.FilteredBUBBLElists3![index].User_type!="admin"
                                                                                ?    Row(
                                                                              children: [
                                                                                CircleAvatar(
                                                                                  radius: 17,
                                                                                  backgroundColor: Color(int.parse(state.FilteredBUBBLElists3![index].Creator_Color!)),
                                                                                  backgroundImage: NetworkImage(state.FilteredBUBBLElists3![index].Creator_Avatar!),
                                                                                ),
                                                                                SizedBox(width: 10,),
                                                                                Text(state.FilteredBUBBLElists3![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                    fontFamily: 'Red Hat Display',
                                                                                    fontSize: 10.477987289428711,
                                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    height: 1
                                                                                ),),

                                                                              ],
                                                                            )
                                                                                : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                fontFamily: 'Red Hat Display',
                                                                                fontSize: 10.477987289428711,
                                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                fontWeight: FontWeight.w600,
                                                                                height: 1
                                                                            ),)
                                                                                :Text(""),
                                                                            SizedBox(width: 10,),
                                                                            IconButton(
                                                                              icon:SvgPicture.asset(
                                                                                  "Assets/images/SAVE.svg"
                                                                              ) ,
                                                                              onPressed: (){
                                                                                _HomeBloc.add(ToggleSaveBubble((b) =>
                                                                                b..Bubble_id = state.FilteredBUBBLElists3![index].id
                                                                                    ..index = index
                                                                                ));
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),


                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                      Container(
                                                                        margin: EdgeInsets.only(left: h/50),
                                                                        child: Column(
                                                                          children: [
                                                                            const SizedBox(
                                                                              height:
                                                                              10,
                                                                            ),
                                                                            Container(

                                                                              child:      Text(
                                                                                state.FilteredBUBBLElists3![index].Title.toString(),
                                                                                overflow: TextOverflow.ellipsis,
                                                                                textAlign: TextAlign.left,
                                                                                style: _TextTheme.headlineLarge!.copyWith(
                                                                                  color: Color(state.FilteredBUBBLElists3![index].Color!.toInt()),
                                                                                  fontSize: 19,
                                                                                  letterSpacing: 0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              ),

                                                                            ),
                                                                            Container(
                                                                              child:  Text(
                                                                                'At ${state.FilteredBUBBLElists3![index].location.toString()}',
                                                                                textAlign: TextAlign.left,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: _TextTheme.headlineLarge!.copyWith(
                                                                                  fontSize: 13,
                                                                                  letterSpacing: 0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),

                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              child:  Text(
                                                                                '${state.FilteredBUBBLElists3![index].location.toString()}',
                                                                                textAlign: TextAlign.left,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: _TextTheme.headlineLarge!.copyWith(
                                                                                  fontSize: 13,
                                                                                  letterSpacing: 0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),

                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      ),
                                                                      SvgPicture.asset(
                                                                        "Assets/images/Exclude.svg",
                                                                        color : Color(state.FilteredBUBBLElists3![index].Color!),
                                                                      ),

                                                                    ],
                                                                  )


                                                                ],
                                                              ),


                                                            )
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {
                                                          return const Text(
                                                              "      ");
                                                        },
                                                      )))
                                                  : Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: Center(
                                                      child: Text(
                                                          "No events was made today why not you make one?!")))
                                                  : state.GetNewBubblesIsloading ==true
                                                  ? Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 10),
                                                  width: w,
                                                  height: h / 3.5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Center(
                                                          child: listLoader(
                                                              context:
                                                              context)),
                                                    ],
                                                  ))
                                                  : Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      padding:EdgeInsets.only(left: h/40),
                                                      width: w,
                                                      height:  h / 3,
                                                      child:
                                                      Center(
                                                        child: const Text(
                                                            "Waiting..."),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),





                                              SizedBox(
                                                height: h/40,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                          width: w/5,
                                          child: Text(
                                            'Nearby',
                                            textAlign: TextAlign.left,
                                            style: _TextTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                  fontSize: 17,
                                                  letterSpacing: 0,
                                                  fontWeight:
                                                  FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                                  SizedBox(width: 5,),
                                                  SizedBox(width: 2,),
                                                  IconButton(
                                                      onPressed: (){
                                                        WidgetsBinding
                                                            .instance!
                                                            .addPostFrameCallback((_) =>
                                                            Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => Events_Screen(type: 'Nearby', User_lat: User_lat,User_long: User_long, ),
                                                              ),
                                                            ));
                                                      },
                                                      icon: Text('See all',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(207, 109, 56, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 11,
                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1
                                                        ),)

                                                  )
                                                ],
                                              ),
                                               SizedBox(
                                                height: h/40,
                                              ),

                                              state.NearbySuccess!
                                                  ? state.FilteredBUBBLElists2!.length != 0
                                                  ? Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: ScrollConfiguration(
                                                      behavior: MyBehavior(),
                                                      child: ListView.separated(

                                                        cacheExtent : 500,
                                                        physics: BouncingScrollPhysics(),
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemCount: state.FilteredBUBBLElists2!.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {


                                                          return InkWell(
                                                            onTap: () {
                                                              WidgetsBinding
                                                                  .instance!
                                                                  .addPostFrameCallback((_) =>
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Plan_Screen(
                                                                            Event_id: state.FilteredBUBBLElists2![index].id!, Event_name:state.FilteredBUBBLElists2![index].Title! ,
                                                                          ),
                                                                    ),
                                                                  ));
                                                            },
                                                            child:
                                                            Container(
                                                              width: w / 1.6,
                                                              height:  h / 3,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(7),
                                                                    topRight: Radius.circular(7),
                                                                    bottomLeft: Radius.circular(7),
                                                                    bottomRight: Radius.circular(7),
                                                                  ),
                                                                  color : Color.fromRGBO(96, 96, 96, 1),
                                                                ),
                                                              child:
                                                                  Column(
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Container(
                                                                            width: w / 1.6,
                                                                            height: h/4.2,
                                                                            child: ClipRRect(
                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                                              child:CachedNetworkImage(
                                                                                fit: BoxFit.fitWidth,
                                                                                imageUrl:
                                                                                //"",
                                                                                state.FilteredBUBBLElists2![index].image.toString(),
                                                                                placeholder: (context, url) => Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                                                  ],
                                                                                ),
                                                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Transform.rotate(
                                                                            angle: -179.99999499104388 * (math.pi / 180),
                                                                            child: Container(
                                                                                width: w / 1.6,
                                                                                height: h/4.2,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius : BorderRadius.only(
                                                                                    topLeft: Radius.circular(7),
                                                                                    topRight: Radius.circular(7),
                                                                                    bottomLeft: Radius.circular(7),
                                                                                    bottomRight: Radius.circular(7),
                                                                                  ),
                                                                                  gradient : LinearGradient(
                                                                                      begin: Alignment(5.730259880964636e-14,-2),
                                                                                      end: Alignment(2,3.9593861611176705e-16),
                                                                                      colors: [Colors.transparent,Color(state.FilteredBUBBLElists2![index].Color!),]
                                                                                  ),
                                                                                )
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width: w / 1.6,
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                state.FilteredBUBBLElists2![index].type!="Prime"
                                                                                    ?  state.FilteredBUBBLElists2![index].User_type!="admin"
                                                                                    ?
                                                                                Row(
                                                                                  children: [
                                                                                    CircleAvatar(
                                                                                      radius: 17,
                                                                                      backgroundColor: Color(int.parse(state.FilteredBUBBLElists2![index].Creator_Color!)),
                                                                                      backgroundImage: NetworkImage(state.FilteredBUBBLElists2![index].Creator_Avatar!),
                                                                                    ),
                                                                                    SizedBox(width: 10,),
                                                                                    Text(state.FilteredBUBBLElists2![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                        fontFamily: 'Red Hat Display',
                                                                                        fontSize: 10.477987289428711,
                                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        height: 1
                                                                                    ),),

                                                                                  ],
                                                                                )
                                                                                    :     Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                    fontFamily: 'Red Hat Display',
                                                                                    fontSize: 10.477987289428711,
                                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    height: 1
                                                                                ),)

                                                                                    :Text(""),
                                                                                SizedBox(width: 10,),
                                                                                IconButton(
                                                                                  icon:SvgPicture.asset("Assets/images/SAVE.svg") ,
                                                                                  onPressed: (){
                                                                                    _HomeBloc.add(ToggleSaveBubble((b) =>
                                                                                    b..Bubble_id = state.FilteredBUBBLElists2![index].id
                                                                                      ..index = index
                                                                                    ));
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),


                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                          Container(
                                                                            margin: EdgeInsets.only(left: h/50),
                                                                            child: Column(
                                                                              children: [
                                                                                const SizedBox(
                                                                                  height:
                                                                                  10,
                                                                                ),
                                                                                Container(
                                                                                  child:  Text(
                                                                                    state.FilteredBUBBLElists2![index].Title.toString(),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    textAlign: TextAlign.left,
                                                                                    style: _TextTheme.headlineLarge!.copyWith(
                                                                                      color: Color(state.FilteredBUBBLElists2![index].Color!.toInt()),
                                                                                      fontSize: 19,
                                                                                      letterSpacing: 0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                  ),

                                                                                ),
                                                                                Container(
                                                                                  child:  Text(
                                                                                    'At ${state.FilteredBUBBLElists2![index].location.toString()}',
                                                                                    textAlign: TextAlign.left,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: _TextTheme.headlineLarge!.copyWith(
                                                                                      fontSize: 13,
                                                                                      letterSpacing: 0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),

                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  child:  Text(
                                                                                    '${state.FilteredBUBBLElists2![index].location.toString()}',
                                                                                    textAlign: TextAlign.left,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: _TextTheme.headlineLarge!.copyWith(
                                                                                      fontSize: 13,
                                                                                      letterSpacing: 0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),

                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          ),
                                                                          SvgPicture.asset(
                                                                            "Assets/images/Exclude.svg",
                                                                            color : Color(state.FilteredBUBBLElists2![index].Color!),
                                                                          ),

                                                                        ],
                                                                      )


                                                                    ],
                                                                  ),


                                                            )




                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {
                                                          return const Text(
                                                              "      ");
                                                        },
                                                      )))
                                                  : Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: Center(
                                                      child: Text(
                                                          "No events was made today why not you make one?!")))
                                                  : state.NearbyIsloading ==true
                                                  ? Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 10),
                                                  width: w,
                                                  height: h / 3.5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Center(
                                                          child: listLoader(
                                                              context:
                                                              context)),
                                                    ],
                                                  ))
                                                  : Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      padding:EdgeInsets.only(left: h/40),
                                                      width: w,
                                                      height:  h / 3,
                                                      child:
                                                      Center(
                                                        child: const Text(
                                                            "Waiting..."),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: h/40,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    width: w/3,
                                                    child: Text(
                                                      'New Bubbles',
                                                      textAlign: TextAlign.left,
                                                      style: _TextTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                        fontSize: 17,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5,),
                                                  SizedBox(width: 2,),
                                                  IconButton(
                                                      onPressed: (){
                                                        WidgetsBinding
                                                            .instance!
                                                            .addPostFrameCallback((_) =>
                                                            Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => Events_Screen(type: 'New Bubbles',  ),
                                                              ),
                                                            ));
                                                      },
                                                      icon: Text('See all',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(207, 109, 56, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 11,
                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1
                                                        ),)

                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: h/40,
                                              ),

                                              state.GetNewBubblesSuccess!
                                                  ? state.GetNewBubbles!.data! .length != 0
                                                      ? Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                  child: ScrollConfiguration(
                                                      behavior: MyBehavior(),
                                                      child: ListView.separated(

                                                        cacheExtent : 500,
                                                        physics: BouncingScrollPhysics(),
                                                        scrollDirection:
                                                        Axis.horizontal,
                                                        itemCount: state.FilteredBUBBLElists1!.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {


                                                          return InkWell(
                                                              onTap: () {
                                                                WidgetsBinding
                                                                    .instance!
                                                                    .addPostFrameCallback((_) =>
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            Plan_Screen(
                                                                              Event_id: state.FilteredBUBBLElists1![index].id!, Event_name:state.FilteredBUBBLElists1![index].Title! ,
                                                                            ),
                                                                      ),
                                                                    ));
                                                              },
                                                              child:
                                                              Container(
                                                                width: w / 1.6,
                                                                height:  h / 3,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular(7),
                                                                    topRight: Radius.circular(7),
                                                                    bottomLeft: Radius.circular(7),
                                                                    bottomRight: Radius.circular(7),
                                                                  ),
                                                                  color : Color.fromRGBO(96, 96, 96, 1),
                                                                ),
                                                                child:
                                                                Column(
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        Container(
                                                                          width: w / 1.6,
                                                                          height: h/4.2,
                                                                          child: ClipRRect(
                                                                            borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                                            child:CachedNetworkImage(
                                                                              fit: BoxFit.fitWidth,
                                                                              imageUrl:
                                                                              //"",
                                                                              state.FilteredBUBBLElists1![index].image.toString(),
                                                                              placeholder: (context, url) => Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(width:w/8,height:h/20,child: Center(child: CircularProgressIndicator())),
                                                                                ],
                                                                              ),
                                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Transform.rotate(
                                                                          angle: -179.99999499104388 * (math.pi / 180),
                                                                          child: Container(
                                                                              width: w / 1.6,
                                                                              height: h/4.2,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius : BorderRadius.only(
                                                                                  topLeft: Radius.circular(7),
                                                                                  topRight: Radius.circular(7),
                                                                                  bottomLeft: Radius.circular(7),
                                                                                  bottomRight: Radius.circular(7),
                                                                                ),
                                                                                gradient : LinearGradient(
                                                                                    begin: Alignment(5.730259880964636e-14,-2),
                                                                                    end: Alignment(2,3.9593861611176705e-16),
                                                                                    colors: [Colors.transparent,Color(state.FilteredBUBBLElists1![index].Color!),]
                                                                                ),
                                                                              )
                                                                          ),
                                                                        ),



                                                                        Container(
                                                                          width: w / 1.6,
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                    state.FilteredBUBBLElists1![index].type!="Prime"
                                                                        ?  state.FilteredBUBBLElists1![index].User_type!="admin"
                                                                    ?
                                                                              Row(
                                                                                children: [
                                                                                  CircleAvatar(
                                                                                    radius: 17,
                                                                                    backgroundColor: Color(int.parse(state.FilteredBUBBLElists1![index].Creator_Color!)),
                                                                                    backgroundImage: NetworkImage(state.FilteredBUBBLElists1![index].Creator_Avatar!),
                                                                                  ),
                                                                                  SizedBox(width: 10,),
                                                                                  Text(state.FilteredBUBBLElists1![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                      fontFamily: 'Red Hat Display',
                                                                                      fontSize: 10.477987289428711,
                                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      height: 1
                                                                                  ),),

                                                                                ],
                                                                              )
                                                                    :     Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 10.477987289428711,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),)

                                                                        :Text(""),
                                                                              SizedBox(width: 10,),
                                                                              IconButton(
                                                                                icon:SvgPicture.asset("Assets/images/SAVE.svg") ,
                                                                                onPressed: (){
                                                                                  _HomeBloc.add(ToggleSaveBubble((b) =>
                                                                                  b..Bubble_id = state.FilteredBUBBLElists1![index].id
                                                                                    ..index = index
                                                                                  ));
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),


                                                                   Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Flexible(
                                                                            child: Container(
                                                                              margin: EdgeInsets.only(left: h/50),
                                                                              child: Column(
                                                                                children: [
                                                                                  const SizedBox(
                                                                                    height:
                                                                                    10,
                                                                                  ),
                                                                                 Container(
                                                                                      child:Text(
                                                                                        state.FilteredBUBBLElists1![index].Title.toString(),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: _TextTheme.headlineLarge!.copyWith(
                                                                                          color: Color(state.FilteredBUBBLElists1![index].Color!.toInt()),
                                                                                          fontSize: 19,
                                                                                          letterSpacing: 0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                               
                                                                                 Container(
                                                                                      child:  Text(
                                                                                        'At ${state.FilteredBUBBLElists1![index].location.toString()}',
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: _TextTheme.headlineLarge!.copyWith(
                                                                                          fontSize: 13,
                                                                                          letterSpacing: 0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                     

                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                      child:  Text(
                                                                                        '${state.FilteredBUBBLElists1![index].location.toString()}',
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: _TextTheme.headlineLarge!.copyWith(
                                                                                          fontSize: 13,
                                                                                          letterSpacing: 0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),

                                                                                      ),
                                                                                    ),
                                                                              
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SvgPicture.asset(
                                                                            "Assets/images/Exclude.svg",
                                                                            color : Color(state.FilteredBUBBLElists1![index].Color!),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                  


                                                                  ],
                                                                ),


                                                              )




                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext
                                                        context,
                                                            int index) {
                                                          return const Text(
                                                              "      ");
                                                        },
                                                      )))
                                                      : Container(
                                                  padding:EdgeInsets.only(left: h/40),
                                                  width: w,
                                                  height:  h / 3,
                                                          child: Center(
                                                              child: Text(
                                                                  "No events was made today why not you make one?!")))
                                                        : state.GetNewBubblesIsloading ==true
                                                            ? Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 10),
                                                        width: w,
                                                        height: h / 3.5,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Center(
                                                                        child: listLoader(
                                                                            context:
                                                                                context)),
                                                                  ],
                                                                ))
                                                            : Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Center(
                                                                    child: Container(
                                                                      padding:EdgeInsets.only(left: h/40),
                                                                      width: w,
                                                                      height:  h / 3,
                                                                      child:
                                                                          Center(
                                                                            child: const Text(
                                                                                "Waiting..."),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h/40,
                                    ),

                                  ],
                                ),
                              )),
                        )),

                        state.showDialogg!
                            ? Positioned(
                                child: StatefulBuilder(builder: (BuildContext
                                        context,
                                    void Function(void Function()) SetState) {
                                  return Stack(children: [
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: BottomSheet(
                                        animationController: BottomSheet
                                            .createAnimationController(this),
                                        enableDrag: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        onClosing: () {},
                                        builder: (context) {
                                          return Container(
                                            height: h / 4,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        width: w / 1.2,
                                                        child: Slider(
                                                          min: 50.0,
                                                          max: 200.0,
                                                          value:
                                                              state.NewValue!,
                                                          activeColor:
                                                              const Color(
                                                                  0xffCF6D38),
                                                          inactiveColor: ColorS
                                                              .onErrorContainer,
                                                          onChanged: (double  value) async {
                                                            if (Lat!=null || lng!=null) {
                                                              this.value = value;
                                                              _HomeBloc.add(ChangeSliderValue( (b) => b..value = value));
                                                              _HomeBloc.add(CreateBubbless((b)=>b
                                                                        ..Radius = value / 1.06
                                                                        ..lat = Lat
                                                                        ..lng = Lng));

                                                            }else{
                                                              Page2().method(_scaffoldKey.currentContext!, "Bubbles Help",
                                                                  "Choose bubble location By clicking on any spot on map", "Back");
                                                            }

                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${value.toInt()}m",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _HomeBloc.add( DeleteBubble());
                                                        _HomeBloc.add(
                                                            OpenDoorTObeAbleTOsetBubble(
                                                                (b) => b  ..MakeHimBEableTOSEtBubbles =  false));

                                                        _HomeBloc.add( ShowDialoog());



                                                      },
                                                      child: Center(
                                                        child: Center(
                                                          child: Text('   Back',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: _TextTheme
                                                                  .headline3!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          15)),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        // if (CameraZoom != 17.69658088684082 ){
                                                        //   getCenter();
                                                        //   print(CameraZoom);
                                                        //   _googleMapController!.animateCamera(
                                                        //       CameraUpdate.newCameraPosition(
                                                        //           CameraPosition(target:centerLatLng! , zoom: 17.69658088684082)
                                                        //       ));
                                                        // }else{
                                                        await getCenter();

                                                        print(centerLatLng!
                                                            .latitude);
                                                        print(centerLatLng!
                                                            .longitude);
                                                        Dataa.lng =
                                                            centerLatLng!
                                                                .longitude;
                                                        Dataa.lat =
                                                            centerLatLng!
                                                                .latitude;
                                                        Dataa.raduis =
                                                            value.toInt();
                                                        WidgetsBinding.instance!
                                                            .addPostFrameCallback(
                                                                (_) => Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Options_screen(
                                                                          Dataa:
                                                                              Dataa,
                                                                        ),
                                                                      ),
                                                                    ));
                                                      },
                                                      //   },
                                                      child: Center(
                                                        child: Container(
                                                          width: w / 2,
                                                          height: h / 15,
                                                          decoration:
                                                              const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(7),
                                                              topRight: Radius
                                                                  .circular(7),
                                                              bottomLeft: Radius
                                                                  .circular(7),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          7),
                                                            ),
                                                            color:
                                                                Color.fromRGBO(
                                                                    148,
                                                                    38,
                                                                    87,
                                                                    1),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Next',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          1),
                                                                  fontFamily:
                                                                      'ABeeZee',
                                                                  fontSize: 18,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(""),
                                                    Text(""),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ]);
                                }),
                              )
                            : const Text(""),

                        state.GetAllBubblesIsloading!
                            ? Container(
                                width: w,
                                height: h / 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: listLoader(context: context)),
                                  ],
                                ))
                            : Text("")

                      ]),
                    ),
                  ),
                );
              }));
    });
  }


  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> getCenter() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  changeMapMode() {
    print(theme);
    print("THEME-----------------");
    if (theme!) {
      getJsonFile('Assets/dark_map_style.json').then(setMapStyle);
    } else {
      getJsonFile('Assets/light_map_style.json').then(setMapStyle);
    }
    print("Status in change mode : $theme");
  }

  void setMapStyle(String mapStyle) {
    _googleMapController?.setMapStyle(mapStyle);
  }

  Future<void> GetTHEME() async {
    theme = await pref.GetThemeON();
    print(theme);
  }

  Future<void> SetLatLng() async {
    await pref.SetLatLng(Lat!, Lng!);
  }

}

class Locationss{
  double? lat;
  double? lng;
  int? bubble_id;
  String? Title;
}

class BubbleData{
String? image;
String? TYPE;
String? Title;
String? location;
String? StartDate;
String? endDate;
String? type;
int? Color;
int? id;
String? Creator_Alias;
String? Creator_Color;
String? Creator_Avatar;
String? User_type;

}