// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names
import 'dart:async';
import 'dart:typed_data';


import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/Pages/PlainPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:bubbles/UI/Home/Options_screen/pages/Options_screen.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'dart:ui' as ui; // imported as ui to prevent conflict between ui.Image and the Image widget
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double? Lat;
  double? Lng;
  final pref = sl<IPrefsHelper>();
  final _HomeBloc = sl<HomeBloc>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final Completer<GoogleMapController> _controller = Completer();
  final PanelController PanelControllerr = PanelController();
  final _key = GlobalKey();
  late FocusNode FocuseNODE;
  DateTime selectedDate = DateTime.now();
  bool? serviceEnabled;
  List<int> Selected = [1, 0, 0];
  CameraPosition? UserPostion;
  DateTime? Time;
  bool done = false;
  bool Done2 = false;
  bool isMapCreated = false;
  BitmapDescriptor? MapMarker;
  bool? theme;
  bool? Done= false;
  bool? done2= false;
  bool? done1= false;
  double value = 0;
  Random random = new Random();
  StreamSubscription? _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController? _googleMapController;
  bool showdialogg = false;
  double? CameraZoom;
  Set<Marker> marker2 ={};
  Set<Marker> LOadingg ={};
  Set<Circle> circle ={};
  Set<Circle> Loading ={};
  Location? location;
  Color MYcolor =Colors.black;
  LatLng? centerLatLng;
  geo.LocationPermission? permission;
  late geo.LocationSettings locationSettings;
  Marker? marker;
  LatLng? UserLocation;
  bool DiditOnces = false;
  Data Dataa = Data();
  Uint8List?   markerIcon;
  bool doit= false;




  void getCurrentLocation() async {
    try {
      bool enabled = await Location.instance.serviceEnabled();

    if (enabled) {
      var location = await _locationTracker.getLocation();

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
            if (_googleMapController != null) {
              print(newLocalData.latitude);
              print(newLocalData.longitude);
              // UserLocation = LatLng(newLocalData.latitude! ,newLocalData.longitude!);
               _HomeBloc.add(UserMoved((b) => b
                   ..lng = newLocalData.longitude!
                   ..lat = newLocalData.latitude!
               ));
               print("Request called");
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
     location =  Location();
    GetTHEME();
    print("initState called");
    getCurrentLocation();
    DiditOnces = true;
    _HomeBloc.add(GetAllBubbles());
    _HomeBloc.add(GetPrimeBubbles());
    _HomeBloc.add(GetNewBubbles());

  }

  // makeIcon()async{
  //         markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
  //         doit= true;
  //         setState(() { });
  //
  //
  // }
  //todo: make the create bubble thing only for creators.

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  StatefulBuilder(builder:
        (BuildContext context,

        void Function(void Function()) SetState) {
      return GestureDetector(
        onTap:(){
          FocusScope.of(context).attach(context);
        },
        child:   BlocBuilder(
            bloc: _HomeBloc,
            builder: (BuildContext Context, HomeState state) {

              //
              // int? length;
              // if (state.GetAllBubblesSuccess! && DiditOnces){
              //   // MakeBubble();
              //   DiditOnces = false;
              //   length = state.GetBubbles!.data!.length;
              // }


              return WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: _scaffoldKey,
                  body: SafeArea(
                    child: Stack(
                        children:[



                          GoogleMap(
                            onCameraMove:(CameraPosition cameraPosition){
                              CameraZoom = cameraPosition.zoom;
                              print(CameraZoom);
                            },
                            onTap: (location){
                            if (state.MakeHimBEableTOSEtBubble!) {
                              Lat = location.latitude;
                              Lng = location.longitude;

                              _HomeBloc.add(CreateBubbless((b) =>
                              b
                                ..Radius = value
                                ..lat = location.latitude
                                ..lng = location.longitude
                              ));
                            }
                            },
                            zoomControlsEnabled: false,
                            circles:state.GetAllBubblesIsloading!?Loading:state.circle!,
                            mapType: MapType.hybrid,
                            markers:state.GetAllBubblesIsloading!?LOadingg:state.marker2!,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(37.9715 ,23.7267),
                                zoom: 12.151926040649414),
                            onMapCreated: (controller) {
                              _googleMapController = controller;
                              _controller.complete(controller);
                              isMapCreated = true;
                              changeMapMode();
                              print("Map Created----------------------------------------------");
                            },
                            myLocationEnabled: false,
                            zoomGesturesEnabled: true,
                          ),
                          Positioned(
                              bottom: h/50,
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  print("clicked");
                                  _HomeBloc.add(ShowDialoog());
                                  MYcolor =Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
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
                                          icon: SvgPicture.asset("Assets/images/Vector(4).svg"),
                                          onPressed:()async{
                                      if (state.MakeHimBEableTOSEtBubble!) {
                                        _HomeBloc.add(OpenDoorTObeAbleTOsetBubble((b) =>
                                        b..MakeHimBEableTOSEtBubbles = false
                                        ));
                                      }else{
                                        _HomeBloc.add(OpenDoorTObeAbleTOsetBubble((b) =>
                                        b..MakeHimBEableTOSEtBubbles = true
                                        ));
                                      }
                                              await getCenter();
                                              print("clicked");
                                              _HomeBloc.add(ShowDialoog());
                                              MYcolor = Color(
                                                  (math.Random().nextDouble() *
                                                      0xFFFFFF).toInt())
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
                                          }
                                      ),
                                    ),
                                  ]),
                                ),
                              )),
                          ShowCaseWidget(
                              builder: Builder(
                                builder: (context) => SlidingUpPanel(
                                    controller: PanelControllerr,
                                    color: ColorS.onPrimaryContainer,
                                    maxHeight: h,
                                    minHeight: 30,
                                    onPanelOpened: (){

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
                                        children: [
                                          SizedBox(
                                            height: h/70,
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
                                              // color: ColorS.onTertiary

                                              color: ColorS.onTertiary,
                                            ),
                                            //
                                          ),
                                          SizedBox(
                                            height: h/20,
                                          ),
                                          Column(
                                            children: const [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(""),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Prime Bubbles',
                                                    textAlign: TextAlign.left, style:
                                                    _TextTheme.headlineLarge!.copyWith(
                                                      fontSize: 17,
                                                      letterSpacing: 0 ,
                                                      fontWeight: FontWeight.w600,),


                                                  ),

                                                  InkWell(
                                                    onTap: (){
                                                      WidgetsBinding.instance!
                                                          .addPostFrameCallback(
                                                            (_) => ShowCaseWidget.of(context)!
                                                            .startShowCase(
                                                          [
                                                            _key,
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: w/20,
                                                      height: h/50,

                                                      child: SvgPicture.asset(
                                                          "Assets/images/Vector22.svg",
                                                          width: 10,
                                                          color: ColorS.onTertiary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Text(""),
                                              const Text(""),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          state.GetAllPrimeSuccess!
                                              ? Container(
                                            width: w,
                                            height: h / 7,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: false,
                                              itemCount: state.GetPrimeBubbles!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return index == 0
                                                    ? Showcase(
                                                    key: _key,
                                                    description:
                                                    'Prime Bubbles are permanent public bubbles that are placed in key places',
                                                    showArrow: true,
                                                    showcaseBackgroundColor:
                                                    Colors.transparent,
                                                    textColor: Colors.white,
                                                    shapeBorder: CircleBorder(
                                                        side: BorderSide.none),
                                                    child: CircleAvatar(
                                                        backgroundColor: Colors.pink,
                                                        radius: h/14,
                                                        backgroundImage:NetworkImage(state.GetPrimeBubbles!.data![index].images![0].image.toString())
                                                    ))
                                                    : CircleAvatar(
                                                    radius: h/14,
                                                    backgroundImage:NetworkImage(state.GetPrimeBubbles!.data![index].images![0].image.toString())
                                                );
                                              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: h/100); },
                                            ),
                                          )
                                              : state.GetAllPrimeIsloading == true
                                              ? Container(
                                              width: w,
                                              height: h / 7,
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
                                            MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Container(
                                                  width: w,
                                                  height: h / 7,
                                                  child:
                                                  const Text("Error"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(15),
                                                  bottomRight: Radius.circular(15),
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              width: w / 1.1,
                                              height: h / 15,
                                              child: Form(
                                                key: _formkey1,
                                                child: TextFormField(
                                                  textInputAction:
                                                  TextInputAction.search,
                                                  controller: _SearchController,
                                                  focusNode: FocuseNODE,
                                                  cursorColor: Colors.grey,
                                                  style: const TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 16.5),
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(30.0),
                                                      borderSide: const BorderSide(
                                                          color: Color(0xff939393),
                                                          width: 10),
                                                    ),
                                                    focusedBorder:
                                                    const OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30.0)),
                                                      borderSide: BorderSide(
                                                          color: Color(0xff939393),
                                                          width: 2),
                                                    ),
                                                    enabledBorder:
                                                    const OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(30.0)),
                                                      borderSide: BorderSide(
                                                          color: Color(0xff939393),
                                                          width: 2),
                                                    ),
                                                    prefixIcon: IconButton(
                                                        icon: SvgPicture.asset(
                                                          'Assets/images/Vector(1).svg',
                                                        ),
                                                        onPressed: null //do something,
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.transparent,
                                                    contentPadding:
                                                    const EdgeInsets.symmetric(
                                                    ),
                                                    hintText:
                                                    "Search for locations or events",

                                                    hintStyle: _TextTheme.headline6!.copyWith(
                                                      fontSize: 2.5 *
                                                          SizeConfig
                                                              .blockSizeVertical!
                                                              .toDouble(),
                                                      fontWeight: FontWeight.w400,
                                                    ),

                                                  ),
                                                  keyboardType: TextInputType.text,
                                                ),
                                              )),
                                          const Text(""),
                                          const SizedBox(
                                            height: 10,
                                          ),

                                          Expanded(
                                            child: Container(
                                              width: w,
                                              height: h / 2,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Text(
                                                          'Popular Now',
                                                          textAlign: TextAlign.center,
                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                            fontSize: 17,
                                                            letterSpacing: 0 ,
                                                            fontWeight: FontWeight.w600,),
                                                        ),
                                                        const Text(""),
                                                        const Text(""),
                                                      ],
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets.only(
                                                            left: 10),
                                                        width: w,
                                                        height: h / 3.5,
                                                        child: ListView.separated(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            return Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){
                                                                    WidgetsBinding.instance!.addPostFrameCallback((_) =>
                                                                        Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) => Plan_Screen(),
                                                                          ),
                                                                        )
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                      width: w / 1.5,
                                                                      height: h / 4,
                                                                      decoration:
                                                                      const BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                          topLeft: Radius
                                                                              .circular(
                                                                              20),
                                                                          topRight: Radius
                                                                              .circular(
                                                                              20),
                                                                          bottomLeft: Radius
                                                                              .circular(
                                                                              20),
                                                                          bottomRight:
                                                                          Radius
                                                                              .circular(
                                                                              20),
                                                                        ),
                                                                        color: CardColors,
                                                                      ),
                                                                      child: Column(
                                                                          children: <
                                                                              Widget>[
                                                                            Container(
                                                                                width: w /
                                                                                    1.5,
                                                                                height:
                                                                                h / 8,
                                                                                decoration:
                                                                                const BoxDecoration(
                                                                                  color: Colors
                                                                                      .green,
                                                                                  borderRadius:
                                                                                  BorderRadius.only(
                                                                                    topLeft:
                                                                                    Radius.circular(20),
                                                                                    topRight:
                                                                                    Radius.circular(20),
                                                                                    bottomLeft:
                                                                                    Radius.circular(0),
                                                                                    bottomRight:
                                                                                    Radius.circular(0),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                        color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                                                                                        offset: Offset(0, 1),
                                                                                        blurRadius: 11)
                                                                                  ],
                                                                                  // image : DecorationImage(
                                                                                  //     image: AssetImage('Assets/images/Be_Bubbly 1.png'),
                                                                                  //     fit: BoxFit.fitWidth
                                                                                  // ),
                                                                                )),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .spaceAround,
                                                                              children: const [
                                                                                Text(
                                                                                  'Colours Day Festival',
                                                                                  textAlign:
                                                                                  TextAlign.left,
                                                                                  style: TextStyle(
                                                                                      color: Color.fromRGBO(
                                                                                          20,
                                                                                          208,
                                                                                          120,
                                                                                          1),
                                                                                      fontFamily:
                                                                                      'Gill Sans Nova',
                                                                                      fontSize:
                                                                                      14.435483932495117,
                                                                                      letterSpacing:
                                                                                      .6,
                                                                                      fontWeight:
                                                                                      FontWeight.normal,
                                                                                      height: 1),
                                                                                ),
                                                                                Text(""),
                                                                                Text(""),
                                                                              ],
                                                                            ),
                                                                            const Spacer(),
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .spaceAround,
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceAround,
                                                                                      children: const [
                                                                                        Text(
                                                                                          'At O.A.K.A Athens',
                                                                                          textAlign: TextAlign.left,
                                                                                          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Gill Sans Nova', fontSize: 11.548386573791504, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                                                                                        ),
                                                                                        Text(""),
                                                                                        Text(""),
                                                                                        Text(""),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceAround,
                                                                                      children: const [
                                                                                        Text(
                                                                                          '10:00am - 04:00am',
                                                                                          textAlign: TextAlign.left,
                                                                                          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Sofia Pro', fontSize: 8.661290168762207, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                                                                                        ),
                                                                                        Text(""),
                                                                                        Text(""),
                                                                                        Text(""),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                const Text(
                                                                                    ""),
                                                                                SvgPicture
                                                                                    .asset(
                                                                                  "Assets/images/Exclude.svg",
                                                                                  color: Colors
                                                                                      .orange,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ])),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            return const Text("      ");
                                                          },
                                                        )

                                                      //   : Selected[1]==1
                                                      //   ?ListView.builder(
                                                      // scrollDirection: Axis.horizontal,
                                                      // itemCount: 20,
                                                      // itemBuilder: (BuildContext context, int index) {
                                                      //   return Container(
                                                      //     color: Colors.grey,
                                                      //     width: w/2.1,
                                                      //     height: h/10,
                                                      //     child: Text("First"),
                                                      //   );
                                                      // },)
                                                      //   :ListView.builder(
                                                      // scrollDirection: Axis.horizontal,
                                                      // itemCount: 20,
                                                      // itemBuilder: (BuildContext context, int index) {
                                                      //   return Container(
                                                      //     color: Colors.grey,
                                                      //     width: w/2.1,
                                                      //     height: h/10,
                                                      //     child: Text("First"),
                                                      //   );
                                                      // },),

                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Text(
                                                          'Nearby ',
                                                          textAlign: TextAlign.center,
                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                            fontSize: 17,
                                                            letterSpacing: 0 ,
                                                            fontWeight: FontWeight.w600,),
                                                        ),
                                                        const Text(""),
                                                        const Text(""),
                                                      ],
                                                    ),
                                                    Container(
                                                        padding: const EdgeInsets.only(
                                                            left: 10),
                                                        width: w,
                                                        height: h / 3.5,
                                                        child: ListView.separated(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            return Row(
                                                              children: [
                                                                Container(
                                                                    width: w / 1.5,
                                                                    height: h / 4,
                                                                    decoration:
                                                                    const BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                          topLeft: Radius
                                                                              .circular(
                                                                              20),
                                                                          topRight:
                                                                          Radius.circular(
                                                                              20),
                                                                          bottomLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                          bottomRight:
                                                                          Radius.circular(
                                                                              20),
                                                                        ),
                                                                        color:
                                                                        CardColors),
                                                                    child: Column(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                              width: w /
                                                                                  1.5,
                                                                              height:
                                                                              h / 8,
                                                                              decoration:
                                                                              const BoxDecoration(
                                                                                color: Colors
                                                                                    .green,
                                                                                borderRadius:
                                                                                BorderRadius.only(
                                                                                  topLeft:
                                                                                  Radius.circular(20),
                                                                                  topRight:
                                                                                  Radius.circular(20),
                                                                                  bottomLeft:
                                                                                  Radius.circular(0),
                                                                                  bottomRight:
                                                                                  Radius.circular(0),
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                      color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                                                                                      offset: Offset(0, 1),
                                                                                      blurRadius: 11)
                                                                                ],
                                                                                // image : DecorationImage(
                                                                                //     image: AssetImage('Assets/images/Be_Bubbly 1.png'),
                                                                                //     fit: BoxFit.fitWidth
                                                                                // ),
                                                                              )),
                                                                          const SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceAround,
                                                                            children: const [
                                                                              Text(
                                                                                'Colours Day Festival',
                                                                                textAlign:
                                                                                TextAlign.left,
                                                                                style: TextStyle(
                                                                                    color: Color.fromRGBO(
                                                                                        20,
                                                                                        208,
                                                                                        120,
                                                                                        1),
                                                                                    fontFamily:
                                                                                    'Gill Sans Nova',
                                                                                    fontSize:
                                                                                    14.435483932495117,
                                                                                    letterSpacing:
                                                                                    .6,
                                                                                    fontWeight:
                                                                                    FontWeight.normal,
                                                                                    height: 1),
                                                                              ),
                                                                              Text(""),
                                                                              Text(""),
                                                                            ],
                                                                          ),
                                                                          const Spacer(),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceAround,
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment.spaceAround,
                                                                                    children: const [
                                                                                      Text(
                                                                                        'At O.A.K.A Athens',
                                                                                        textAlign: TextAlign.left,
                                                                                        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Gill Sans Nova', fontSize: 11.548386573791504, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                                                                                      ),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment.spaceAround,
                                                                                    children: const [
                                                                                      Text(
                                                                                        '10:00am - 04:00am',
                                                                                        textAlign: TextAlign.left,
                                                                                        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Sofia Pro', fontSize: 8.661290168762207, letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.normal, height: 1),
                                                                                      ),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const Text(
                                                                                  ""),
                                                                              SvgPicture
                                                                                  .asset(
                                                                                "Assets/images/Exclude.svg",
                                                                                color: Colors
                                                                                    .orange,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                        ])),
                                                              ],
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            return const Text("      ");
                                                          },
                                                        )

                                                      //   : Selected[1]==1
                                                      //   ?ListView.builder(
                                                      // scrollDirection: Axis.horizontal,
                                                      // itemCount: 20,
                                                      // itemBuilder: (BuildContext context, int index) {
                                                      //   return Container(
                                                      //     color: Colors.grey,
                                                      //     width: w/2.1,
                                                      //     height: h/10,
                                                      //     child: Text("First"),
                                                      //   );
                                                      // },)
                                                      //   :ListView.builder(
                                                      // scrollDirection: Axis.horizontal,
                                                      // itemCount: 20,
                                                      // itemBuilder: (BuildContext context, int index) {
                                                      //   return Container(
                                                      //     color: Colors.grey,
                                                      //     width: w/2.1,
                                                      //     height: h/10,
                                                      //     child: Text("First"),
                                                      //   );
                                                      // },),

                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Text(
                                                          'New Bubbles ',
                                                          textAlign: TextAlign.center,
                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                            fontSize: 17,
                                                            letterSpacing: 0 ,
                                                            fontWeight: FontWeight.w600,),
                                                        ),
                                                        const Text(""),
                                                        const Text(""),
                                                      ],
                                                    ),

                                                    state.GetNewBubblesSuccess!
                                                        ? state.GetNewBubbles!.data!.length!=0?
                                                         Container(
                                                        padding: const EdgeInsets.only(
                                                            left: 10),
                                                        width: w,
                                                        height: h / 3.5,
                                                        child: ListView.separated(
                                                          scrollDirection:
                                                          Axis.horizontal,
                                                          itemCount: state.GetNewBubbles!.data!.length,
                                                          itemBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            String Value="";
                                                            print(state.GetNewBubbles!.data![index].color!);
                                                            Value = state.GetNewBubbles!.data![index].color!;
                                                            if (Value.contains("#",0)){
                                                              Value = Value.substring(1);
                                                              Value = "0xff$Value";
                                                            }
                                                            var myInt = int.parse(Value);
                                                            var BackgroundColor= myInt;


                                                            return Row(
                                                              children: [
                                                                Container(
                                                                    width: w / 1.5,
                                                                    height: h / 4,
                                                                    decoration:
                                                                    const BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                          topLeft: Radius
                                                                              .circular(
                                                                              20),
                                                                          topRight:
                                                                          Radius.circular(
                                                                              20),
                                                                          bottomLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                          bottomRight:
                                                                          Radius.circular(
                                                                              20),
                                                                        ),
                                                                        color:
                                                                        CardColors),
                                                                    child: Column(
                                                                        children: <
                                                                            Widget>[
                                                                          Container(
                                                                              width: w /
                                                                                  1.5,
                                                                              height:
                                                                              h / 8,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: Colors
                                                                                    .green,
                                                                                borderRadius:
                                                                                BorderRadius.only(
                                                                                  topLeft:
                                                                                  Radius.circular(20),
                                                                                  topRight:
                                                                                  Radius.circular(20),
                                                                                  bottomLeft:
                                                                                  Radius.circular(0),
                                                                                  bottomRight:
                                                                                  Radius.circular(0),
                                                                                ),
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                      color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                                                                                      offset: Offset(0, 1),
                                                                                      blurRadius: 11)
                                                                                ],
                                                                                image : DecorationImage(
                                                                                    image:NetworkImage(state.GetNewBubbles!.data![index].images![0].image.toString()),
                                                                                    fit: BoxFit.fitWidth
                                                                                ),
                                                                              )),
                                                                          const SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceAround,
                                                                            children: [

                                                                              Text(
                                                                                state.GetNewBubbles!.data![index].title.toString(),
                                                                                textAlign:
                                                                                TextAlign.left,
                                                                                style: _TextTheme.headlineLarge!.copyWith(
                                                                                  color: Color(BackgroundColor),
                                                                                  fontSize: 19,
                                                                                  letterSpacing: 0 ,
                                                                                  fontWeight: FontWeight.w600,),
                                                                              ),
                                                                              Text(""),
                                                                              Text(""),
                                                                            ],
                                                                          ),
                                                                          const Spacer(),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceAround,
                                                                            children: [
                                                                              Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment.spaceAround,
                                                                                    children: [

                                                                                      Text(
                                                                                        'At ${state.GetNewBubbles!.data![index].location.toString()}',
                                                                                        textAlign: TextAlign.left, style: _TextTheme.headlineLarge!.copyWith(
                                                                                        fontSize: 17,
                                                                                        letterSpacing: 0 ,
                                                                                        fontWeight: FontWeight.w600,), ),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${state.GetNewBubbles!.data![index].start_event_date} - ${state.GetNewBubbles!.data![index].end_event_date} ',
                                                                                        textAlign: TextAlign.left,
                                                                                        style: _TextTheme.headline1!.copyWith(
                                                                                          fontSize: 12,
                                                                                          letterSpacing: 0 ,
                                                                                          fontWeight: FontWeight.w300,),
                                                                                      ),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                      Text(""),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const Text(
                                                                                  ""),
                                                                              SvgPicture
                                                                                  .asset(
                                                                                "Assets/images/Exclude.svg",
                                                                                color: Color(BackgroundColor),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height: 10,
                                                                          ),
                                                                        ])),
                                                              ],
                                                            );
                                                          },
                                                          separatorBuilder:
                                                              (BuildContext context,
                                                              int index) {
                                                            return const Text("      ");
                                                          },
                                                        )

                                                    )
                                                        :Container(

                                                            padding: const EdgeInsets.only(
                                                                left: 10),
                                                            width: w,
                                                            height: h / 3.5,
                                                        child: Center(child: Text("No events was made today why not you make one?!")))
                                                        : state.GetNewBubblesIsloading == true
                                                        ? Container(
                                                        width: w,
                                                        height: h / 7,
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
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            width: w,
                                                            height: h / 7,
                                                            child:
                                                            const Text("Error"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              )),

                          state.showDialogg!
                              ? Positioned(child:
                          StatefulBuilder(
                              builder:(BuildContext context,
                                  void Function(void Function()) SetState){
                                return Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: BottomSheet(
                                          animationController:
                                          BottomSheet.createAnimationController(
                                              this),
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
                                                            min: 0.0,
                                                            max: 100.0,
                                                            value: state.NewValue!,
                                                            activeColor:
                                                            const Color(0xffCF6D38),
                                                            inactiveColor:
                                                            ColorS.onErrorContainer,
                                                            onChanged:
                                                                (double value)async {
                                                              this.value = value;
                                                                  _HomeBloc.add(ChangeSliderValue((b) => b
                                                                    ..value = value
                                                                  ));

                                                              _HomeBloc.add(CreateBubbless((b) => b
                                                                ..Radius = value/1.06
                                                                ..lat = Lat
                                                                ..lng =Lng
                                                              ));

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
                                                            style: const TextStyle(
                                                                fontSize: 20,
                                                                color:
                                                                Colors.white),
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
                                                          _HomeBloc.add(OpenDoorTObeAbleTOsetBubble((b) =>
                                                          b..MakeHimBEableTOSEtBubbles = false
                                                          ));
                                                          _HomeBloc.add(
                                                              ShowDialoog());
                                                          _HomeBloc.add(DeleteBubble());
                                                        },
                                                        child: Center(
                                                          child: Center(
                                                            child: Text(
                                                                '   Back',
                                                                textAlign:
                                                                TextAlign.center,
                                                                style: _TextTheme.headline3!.copyWith(
                                                                    fontSize: 15
                                                                )
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async{
                                                         // getCenter();

                                                          // if (CameraZoom != 17.69658088684082 ){
                                                          //   getCenter();
                                                          //   print(CameraZoom);
                                                          //   _googleMapController!.animateCamera(
                                                          //       CameraUpdate.newCameraPosition(
                                                          //           CameraPosition(target:centerLatLng! , zoom: 17.69658088684082)
                                                          //       ));
                                                          // }else{
                                                            await getCenter();

                                                            print(centerLatLng!.latitude);
                                                            print(centerLatLng!.longitude);
                                                            Dataa.lng =centerLatLng!.longitude;
                                                            Dataa.lat =centerLatLng!.latitude;
                                                            Dataa.raduis =value.toInt();
                                                            WidgetsBinding.instance!.addPostFrameCallback((_) =>
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) => Options_screen(Dataa: Dataa,),
                                                                  ),
                                                                )
                                                            );
                                                          },
                                                     //   },
                                                        child: Center(
                                                          child: Container(
                                                            width: w / 2,
                                                            height: h / 15,
                                                            decoration:
                                                            const BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                topLeft:
                                                                Radius.circular(
                                                                    7),
                                                                topRight:
                                                                Radius.circular(
                                                                    7),
                                                                bottomLeft:
                                                                Radius.circular(
                                                                    7),
                                                                bottomRight:
                                                                Radius.circular(
                                                                    7),
                                                              ),
                                                              color: Color.fromRGBO(
                                                                  148, 38, 87, 1),
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Next',
                                                                textAlign: TextAlign
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
                              ?Container(
                              width: w,
                              height: h / 1,
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
                              :Text("")


                        ]),
                  ),
                ),
              );
            })
      );
    });
  }

  Future<void> dIALOG() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return showModalBottomSheet<void>(
        barrierColor: Colors.white.withOpacity(0),
        isScrollControlled: true,
        context: context,
        enableDrag: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) SetState) {
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: FractionallySizedBox(
                    heightFactor: 0.30,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Container(
                                width: w / 1.2,
                                decoration: const BoxDecoration(
                                  //   color: const Color(0xff303030),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: Slider(
                                  min: 0.0,
                                  max: 100.0,
                                  value: value,
                                  activeColor: const Color(0xffCF6D38),
                                  inactiveColor: Colors.white,
                                  onChanged: (double value) {
                                    SetState(() {
                                      this.value = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${value.toInt()}m",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: w / 2.3,
                            height: h / 15,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7),
                                bottomLeft: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                              ),
                              color: Color.fromRGBO(148, 38, 87, 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'ABeeZee',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                          ),
                        )
                      ],
                    )));
          });
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
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<void> getCenter() async {
    final GoogleMapController controller = await _controller.future;
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) / 2,
    );

  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  changeMapMode(){
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

  Future<void> SetLatLng()async{
    await pref.SetLatLng(Lat!, Lng!);
  }

}
// /     showdialogg
//                     ?  Positioned(
//                       right: 0,
//                       left: 0,
//                       bottom: 0,
//                       child: Container(
//                         width: w / 1.2,
//                         height: h/3,
//                         decoration: BoxDecoration(
//                           color: const Color(0xff303030),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20),
//                             bottomLeft: Radius.circular(0),
//                             bottomRight: Radius.circular(0),
//                           ),
//                         ),
//
//                         child: Column(
//                              //     mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Center(
//                                           child: Container(
//                                             width: w / 1.2,
//
//
//                                             child: Slider(
//                                               min: 0.0,
//                                               max: 100.0,
//                                               value: value,
//                                               activeColor: Color(0xffCF6D38),
//                                               inactiveColor: Colors.white,
//                                               onChanged: (double value) {
//                                                 setState(() {
//                                                   this.value = value;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "${value.toInt()}m",
//                                               style: TextStyle(fontSize: 20),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     Center(
//                                       child: Container(
//                                         width: w/2.3,
//                                         height: h/15,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(7),
//                                             topRight: Radius.circular(7),
//                                             bottomLeft: Radius.circular(7),
//                                             bottomRight: Radius.circular(7),
//                                           ),
//                                           color: Color.fromRGBO(148, 38, 87, 1),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             'Next',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                                 color: Color.fromRGBO(255, 255, 255, 1),
//                                                 fontFamily: 'ABeeZee',
//                                                 fontSize: 18,
//                                                 letterSpacing:
//                                                 0 /*percentages not used in flutter. defaulting to zero*/,
//                                                 fontWeight: FontWeight.normal,
//                                                 height: 1),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                       ),
//                     )
//                     :  Text("")

//   void setCustomMarker() async{
//
//      done = true;
//      print("done :$done");
//  //    print(MapMarker.toString());
//     if (MapMarker==null){
//       print("null found");
//     }
//   }
// void Onpressed(){
//   WidgetsBinding.instance!.addPostFrameCallback((_) =>
//
//   );
// }
// Future<void> _getLocationUpdates (BuildContext context, LocationData locationData, Function callUpdateData)
// async {
//   location.onLocationChanged. listen ((value) {
//     final distance = calculateDistance(
//         value.latitude, value.longitude, locationData.latitude,
//         locationData.longitude);
//
//     Provider.of<MapProvider>(context, listen: false).updateCurrentLocation(
//
//         LatLng(value.latitudel.toDouble(), value.longitude!.toDouble()));
//
//     locationData = value;
//     if (distance > 0.5) {
//       callUpdateData();
//     }
//   }
//       }
// static Future<Uint8List> getBytesFromAsset(String path, int width) async {
//   ByteData data = await rootBundle.load(path);
//   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//   ui.FrameInfo fi = await codec.getNextFrame();
//   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
// }
// void setCustomMarker() async{
//    MapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),"Assets/images/Bubble$randomNumber.png");
//    done = true;
//    print("done :$done");
//    print(MapMarker.toString());
// }
//List<Set<Marker>> markers =[];

// List<Marker> mMarkers = [];

//            Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 Selected = List.filled(3, 0);
//                                                 Selected[0] = 1;
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                 width: w / 5,
//                                                 height: h / 20,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   const BorderRadius.only(
//                                                     topLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     topRight: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomRight: Radius.circular(
//                                                         13.954300880432129),
//                                                   ),
//                                                   color: Selected[0] == 1
//                                                       ? const Color.fromRGBO(
//                                                       207, 109, 56, 1)
//                                                       : const Color(0xff606060),
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text(
//                                                     'Today',
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         color: Color.fromRGBO(
//                                                             255, 255, 255, 1),
//                                                         fontFamily: 'Gill Sans Nova',
//                                                         fontSize: 12.51075267791748,
//                                                         letterSpacing:
//                                                         .7 /*percentages not used in flutter. defaulting to zero*/,
//                                                         fontWeight: FontWeight.normal,
//                                                         height: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 Selected = List.filled(3, 0);
//                                                 Selected[1] = 1;
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                 width: w / 4.5,
//                                                 height: h / 20,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   const BorderRadius.only(
//                                                     topLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     topRight: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomRight: Radius.circular(
//                                                         13.954300880432129),
//                                                   ),
//                                                   color: Selected[1] == 1
//                                                       ? const Color.fromRGBO(
//                                                       207, 109, 56, 1)
//                                                       : const Color(0xff606060),
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text(
//                                                     'Tomorrow',
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         color: Color.fromRGBO(
//                                                             255, 255, 255, 1),
//                                                         fontFamily: 'Gill Sans Nova',
//                                                         fontSize: 12.51075267791748,
//                                                         letterSpacing: .7,
//                                                         fontWeight: FontWeight.normal,
//                                                         height: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 Selected = List.filled(3, 0);
//                                                 Selected[2] = 1;
//                                                 setState(() {});
//                                               },
//                                               child: Container(
//                                                 width: w / 5,
//                                                 height: h / 20,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                   const BorderRadius.only(
//                                                     topLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     topRight: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomLeft: Radius.circular(
//                                                         13.954300880432129),
//                                                     bottomRight: Radius.circular(
//                                                         13.954300880432129),
//                                                   ),
//                                                   color: Selected[2] == 1
//                                                       ? const Color.fromRGBO(
//                                                       207, 109, 56, 1)
//                                                       : const Color(0xff606060),
//                                                 ),
//                                                 child: const Center(
//                                                   child: Text(
//                                                     'Weekend',
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         color: Color.fromRGBO(
//                                                             255, 255, 255, 1),
//                                                         fontFamily: 'Gill Sans Nova',
//                                                         fontSize: 12.51075267791748,
//                                                         letterSpacing:
//                                                         0 /*percentages not used in flutter. defaulting to zero*/,
//                                                         fontWeight: FontWeight.normal,
//                                                         height: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Container(
//                                                 width: w / 8,
//                                                 height: h / 20,
//                                                 decoration: const BoxDecoration(
//                                                     borderRadius: BorderRadius.only(
//                                                       topLeft: Radius.circular(
//                                                           13.954300880432129),
//                                                       topRight: Radius.circular(
//                                                           13.954300880432129),
//                                                       bottomLeft: Radius.circular(
//                                                           13.954300880432129),
//                                                       bottomRight: Radius.circular(
//                                                           13.954300880432129),
//                                                     ),
//                                                     color: CardColors),
//                                                 child: Center(
//                                                     child: Stack(children: [
//                                                       SvgPicture.asset(
//                                                         "Assets/images/Vector(2).svg",
//                                                         width: 18,
//                                                       ),
//                                                       Positioned(
//                                                           bottom: -1,
//                                                           right: -1,
//                                                           child: SvgPicture.asset(
//                                                             "Assets/images/Vector(3).svg",
//                                                             width: 10,
//                                                           ))
//                                                     ])),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),