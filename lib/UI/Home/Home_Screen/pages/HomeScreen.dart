// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names
import 'dart:async';
import 'dart:typed_data';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
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
import 'package:bubbles/models/GetBubblesModel/DatesEventListModel.dart';
import 'package:bubbles/models/GetBubblesModel/OrganizersListModel.dart';
import 'package:bubbles/models/GetUsersInsideBubbleModel/UsersInsideBubbleListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' as wid;
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
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;

bool ChangeUistatus=false;
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.OpenPanel});

  bool? OpenPanel = false;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
List<int>? AllBubblesIDS=[];
List<int>? AllBubblesStatus=[];
List<bool>? AllBubblesJoinStatusTry=[];
List<bool>? AllBubblesLeftStatusTry=[];
List<bool>? AllNearBubblesStatusTry=[];
Timer? timer;
bool CalledLoopingfucntion = false;
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final GlobalKey globalKey = GlobalKey();
  final ScrollController _Primecontroller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  final PanelController PanelControllerr = PanelController();
  final _formkey1 = GlobalKey<FormState>();
  Location _locationTracker = Location();
  DateTime selectedDate = DateTime.now();
  Geolocator? instance = Geolocator();
  Random random =  Random();
  final _key = GlobalKey();
  Data Dataa = Data();

  final pref = sl<IPrefsHelper>();
  final _HomeBloc = sl<HomeBloc>();
  double? Lat;
  double? Lng;
  late FocusNode FocuseNODE;
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

  StreamSubscription? _locationSubscription;

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
  var dataBytes;
  var bytes;
  String Avatar="";
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
    GetnearBybubbles();
    FocuseNODE = FocusNode();
    location = Location();
    GetTHEME();
    DiditOnces = true;
    _HomeBloc.add(GetAllBubbles());
    _HomeBloc.add(Getprofile());//todo: take the response from login the id needed then store in shared prefrances and use it anywhere
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


    _SearchController.addListener(() {

      if (_SearchController.text.isEmpty){
        _HomeBloc.add(SearchBubblesList((b) =>
        b..Keyword =""
            ..Change_ViewStatus = false
        ));

      }

    });
  }

  Future<void> GetAvatarr(String avatar)async{
    var request = await http.get(Uri.parse("${avatar}"));
    bytes = await request.bodyBytes;
    dataBytes = await bytes;
  await  getCurrentLocation();
  }

  Future<void> SetLatLng(double lat,double lng) async {
    await pref.SetLatLng(lat, lng);
  }



  Future<void> GetLngLng() async {
    User_lat = await pref.Getlat();
    User_long = await pref.GetLng();
  }


  Future<void> GetnearBybubbles() async {
    bool enabled = await Location.instance.serviceEnabled();
    if (enabled) {
      var location = await _locationTracker.getLocation();


      SetLatLng(location.latitude!,location.longitude!);
      GetLngLng();
      _HomeBloc.add(GetNearbyBubbles((b) =>
      b
        ..lng = location.longitude
        ..lat = location.latitude
      ));

      _googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(location.latitude!, location.longitude!),
                zoom: 12.151926040649414),
          ));

    }
  }
  Future<void> getCurrentLocation() async {
    try {
      bool enabled = await Location.instance.serviceEnabled();
      if (enabled) {

        _locationSubscription =
            _locationTracker.onLocationChanged.listen((newLocalData) {
              if (_googleMapController != null) {
                // UserLocation = LatLng(newLocalData.latitude! ,newLocalData.longitude!);
                  _HomeBloc.add(UserMoved((b) => b
                    ..lng = newLocalData.longitude!
                    ..lat = newLocalData.latitude!
                    ..avatar = Avatar
                      ..Uint8 = dataBytes
                  ));

                User_lat = newLocalData.latitude!;
                User_long =newLocalData.longitude;
              }
            });

      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }


  }
  int counter2 =0;
  bool Diditoncessa =true;

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
              builder: (BuildContext Context, HomeState state)  {


                void LoopOnAllBUbbles(HomeState state)async{
                  print("LoopOnALLbubbles function called");
                  try{

                    print("User joined bubble${AllBubblesJoinStatusTry} ");
                    print("User Left bubble${AllBubblesLeftStatusTry} ");
                    counter2++;
                     locationslength = state.locationn!.length;
                     final Uint8List markerIcon = await  getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);

                     for(int i=0;i<state.locationn!.length;i++) {
                       print(i);

                         AllBubblesIDS![i] = state.locationn![i].bubble_id!;
                         meters = state.BubblesRaduis![i];
                         double coef = meters! * 0.0000089;
                         new_lat = state.locationn![i].lat! + coef;
                         new_long = state.locationn![i].lng! + coef / cos(state
                             .locationn![i]
                             .lat! * 0.018);


                         distanceinside = geo.Geolocator.distanceBetween( User_lat!, User_long!, state.locationn![i].lat!, state.locationn![i].lng!);
                       distanceNearby = geo.Geolocator.distanceBetween(  User_lat!, User_long!, new_lat!, new_long!);


                         // if ((distanceNearby / 1000) <= 5 &&
                         //     !(distanceinside <= meters) &&
                         //     AllNearBubblesStatusTry![i]) {
                         //
                         //   // print("there is a bubble ${(distanceNearby / 1000)
                         //   //     .toString()
                         //   //     .substring(0, 4)} KM ahead of me ");
                         //   // print("${(distanceNearby / 1000).toString().substring(3)}");
                         //   AllNearBubblesStatusTry![i] = false;
                         //   _HomeBloc.add(NotifyNearBubble((b) =>
                         //   b
                         //     ..Title = "${state.locationn![i].Title} Event"
                         //     ..Distance = "${(double.parse(
                         //         (distanceNearby / 1000)))
                         //         .toString()} KM"
                         //   ));
                         // }


                         if (distanceinside <= meters &&
                             !AllBubblesJoinStatusTry![i]
                         && AllBubblesLeftStatusTry![i]
                         ) {

                           AllBubblesStatus![i] = 1;
                           AllBubblesJoinStatusTry![i] = true;
                           AllBubblesLeftStatusTry![i] = false;
                           print("User joined bubble $distanceinside");
                           print("User joined bubble $meters");
                           print("User joined bubble${state.locationn![i].Title} ");
                           print("User joined bubble${AllBubblesStatus} ");
                           print("User joined bubble${AllBubblesJoinStatusTry} ");
                           // print("your inside a ${state.locationn![i].Title} Event");

                                _HomeBloc.add(UserJoinedBubble((b) =>
                                b..Bubble_id = state.locationn![i].bubble_id!
                                ));

                         }

                         if (distanceinside >= meters &&
                             !AllBubblesLeftStatusTry![i]
                         &&  AllBubblesJoinStatusTry![i]
                         ) {
                           print("USER LEFT BUBBLE $distanceinside");
                           print("USER LEFT BUBBLE $meters");
                           print("USER LEFT BUBBLE${state.locationn![i].Title} ");
                           print("USER LEFT BUBBLE $AllBubblesJoinStatusTry");
                           print("USER LEFT BUBBLE $AllBubblesStatus");
                           print("USER LEFT BUBBLE $AllBubblesStatus");
                           AllBubblesStatus![i] = 0;
                           AllBubblesLeftStatusTry![i] = true;
                           AllBubblesJoinStatusTry![i] = false;
                           // print("YOu left the area of a ${state.locationn![i]
                           //     .Title} Event");
                           // sendILeftBubble(state.locationn![i].bubble_id!);

                            _HomeBloc.add(UserLeftBubble((b) =>
                            b..Bubble_id = state.locationn![i].bubble_id!
                            ));

                         }




                   if (counter2==1) {

          for(int i=0;i<state.GetBubbles!.data!.length;i++) {
            String Value = state.GetBubbles!.data![i].color!;
            if (Value.contains("#", 0)) {
              Value = Value.substring(1);
              Value = "0xff$Value";
            }
            var myInt = int.parse(Value);
            var BackgroundColor = myInt;
            if (state.GetBubbles!.data![i].draw_type != "polygon") {
              _HomeBloc.add(AddMarker((b) =>
              b..circle = Circle(
                  circleId: CircleId(
                      state.GetBubbles!.data![i].id.toString()),
                  radius: state.GetBubbles!.data![i].radius!,
                  zIndex: 2,
                  strokeColor: Colors.transparent,
                  center: LatLng(state.GetBubbles!.data![i].lat!,
                      state.GetBubbles!.data![i].lng!),
                  fillColor: Color(BackgroundColor).withAlpha(
                      100),
                  onTap: () async {
                    BubbleData Bubbledata = BubbleData();
                    Bubbledata.Category =
                        state.GetBubbles!.data![i].category.toString();
                    Bubbledata.Title =
                        state.GetBubbles!.data![i].title.toString();
                    Bubbledata.location =
                        state.GetBubbles!.data![i].location.toString();

                    if (state.GetSavedBubbles!.data![i].type.toString() !=
                        "Prime") {
                      Bubbledata.StartDate =
                          state.GetBubbles!.data![i].start_event_date
                              .toString();
                      Bubbledata.endDate =
                          state.GetBubbles!.data![i].end_event_date
                              .toString();
                    }
                    Bubbledata.image =
                        state.GetBubbles!.data![i].images![0].image
                            .toString();


                    Bubbledata.id = state.GetBubbles!.data![i].id!.toInt();
                    Bubbledata.type =
                        state.GetBubbles!.data![i].type.toString();
                    Bubbledata.Creator_Alias =
                        state.GetBubbles!.data![i].created_by!.user!.alias ??
                            "";
                    Bubbledata.Creator_Avatar =
                        state.GetBubbles!.data![i].created_by!.user!.avatar;
                    Bubbledata.Creator_Color =
                        state.GetBubbles!.data![i].created_by!.user!
                            .background_color;
                    Bubbledata.User_type =
                        state.GetBubbles!.data![i].created_by!.type;
                    Bubbledata.Description =
                        state.GetBubbles!.data![i].description.toString();


                    Bubbledata.Organizers =
                    state.GetBubbles!.data![i].organizers!;
                    Bubbledata.is_Saved = state.GetBubbles!.data![i].is_save!;
                    Bubbledata.users_in_bubble = state.GetBubbles!.data![i].users_in_bubble!;
                    Bubbledata.saved_users = state.GetBubbles!.data![i].saved_users!;

                    // Bubbledata.dates = state.GetPrimeBubbles!.data![i].dates!;
                    String Value = state.GetBubbles!.data![i].color
                        .toString();

                    if (Value.contains("#", 0)) {
                      Value = Value.substring(1);
                      Value = "0xff$Value";
                    }
                    var myInt = int.parse(Value);
                    var BackgroundColor = myInt;

                    Bubbledata.Color = BackgroundColor;
                    _HomeBloc.add(ChangeToDetailUiState((
                        b) => b..Bubbledata = Bubbledata));
                  })
                ..marker = Marker(
                  markerId: MarkerId(
                      (state.GetBubbles!.data![i].id! + 1000)
                          .toString()),
                  position: LatLng(state.GetBubbles!.data![i].lat!,
                      state.GetBubbles!.data![i].lng!),
                  icon: BitmapDescriptor.fromBytes(markerIcon),
                  onTap: () {
                    BubbleData Bubbledata = BubbleData();
                    Bubbledata.users_in_bubble = state.GetBubbles!.data![i].users_in_bubble!;
                    Bubbledata.saved_users = state.GetBubbles!.data![i].saved_users!;
                    Bubbledata.Title = state.GetBubbles!.data![i].title.toString();
                    Bubbledata.location =  state.GetBubbles!.data![i].location.toString();

                    if (state.GetBubbles!.data![i].type.toString() !=  "Prime") {
                      Bubbledata.StartDate =state.GetBubbles!.data![i].start_event_date.toString();
                      Bubbledata.endDate = state.GetBubbles!.data![i].end_event_date.toString();
                      Bubbledata.dates = state.GetBubbles!.data![i].dates;
                    }
                    Bubbledata.image =state.GetBubbles!.data![i].images![0].image .toString();
                    Bubbledata.id =
                        state.GetBubbles!.data![i].id!.toInt();
                    Bubbledata.type =
                        state.GetBubbles!.data![i].type.toString();
                    Bubbledata.Creator_Alias =
                        state.GetBubbles!.data![i].created_by!.user!
                            .alias;
                    Bubbledata.Creator_Avatar =
                        state.GetBubbles!.data![i].created_by!.user!
                            .avatar;
                    Bubbledata.Creator_Color =
                        state.GetBubbles!.data![i].created_by!.user!
                            .background_color;
                    Bubbledata.User_type =
                        state.GetBubbles!.data![i].created_by!.type;
                    Bubbledata.Description =
                        state.GetBubbles!.data![i].description
                            .toString();
                    Bubbledata.Organizers =
                    state.GetBubbles!.data![i].organizers!;
                    Bubbledata.is_Saved =
                    state.GetBubbles!.data![i].is_save!;
                    // Bubbledata.dates = state.GetPrimeBubbles!.data![i].dates!;
                    String Value = state.GetBubbles!.data![i].color
                        .toString();

                    if (Value.contains("#", 0)) {
                      Value = Value.substring(1);
                      Value = "0xff$Value";
                    }
                    var myInt = int.parse(Value);
                    var BackgroundColor = myInt;

                    Bubbledata.Color = BackgroundColor;
                    _HomeBloc.add(ChangeToDetailUiState((b) =>
                    b
                      ..Bubbledata = Bubbledata
                      ..Status = true));
                  },

                )
              ));
            }
          }
                   }

                  }
                    CalledLoopingfucntion = true;
                  }catch (e){
                    print(e);
                  }
                }

                if (state.GetprofileSuccess! && Diditoncessa == true){
                  MyName = state.ProfileDate!.user!.alias.toString();
                  Avatar = state.ProfileDate!.user!.avatar.toString();
                   GetAvatarr(Avatar);
                  Diditoncessa = false;
                }
                if (state.GetAllBubblesSuccess! && diditonceee == true){
                  GetLngLng();
                  diditonceee = false;
                  LoopOnAllBUbbles(state);
                  if (widget.OpenPanel!)
                    PanelControllerr.open();
                  timer = Timer.periodic(Duration(seconds: 10), (Timer t)async{
                    return
                      LoopOnAllBUbbles(state);
                  });


                }

                return WillPopScope(
                  onWillPop: () async => false,
                  child: Scaffold(
                    key: _scaffoldKey,
                    body: SafeArea(
                      child: Stack(
                          children:[
                          //  MyMarker(globalKey),
                        GoogleMap(
                          onCameraMove:(CameraPosition cameraPosition) {
                              if(!state.GetAllBubblesIsloading!){
                              CameraZoom = cameraPosition.zoom;
                              }
                          },
                          myLocationButtonEnabled: true,
                          onTap: (location) {
                      if (state.ShowBubbleDetailsUI!){


                        _HomeBloc.add(ChangeToDetailUiState((b) =>b..Status = false ));
                      }
                            if (state.MakeHimBEableTOSEtBubble!) {
                              // Lat = location.latitude;
                              // Lng = location.longitude;

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
                          },
                          myLocationEnabled: false,
                          zoomGesturesEnabled: true,
                        ),
                        state.ShowBubbleDetailsUI!
                            ?Positioned(
                          bottom: h/17,
                          left: 0,
                          right: 0,
                          child: InkWell(
                          onTap: (){
                            if (state.DetailBubbledata!.type=="Prime"){
                              WidgetsBinding
                                  .instance!
                                  .addPostFrameCallback((_) =>
                                  Navigator
                                      .push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PrimePlan_page(
                                            Bubble: state.DetailBubbledata,
                                            my_id: state.ProfileDate!.user!
                                                .id,),
                                    ),
                                  ));
                            }else {
                              WidgetsBinding
                                  .instance!
                                  .addPostFrameCallback((_) =>
                                  Navigator
                                      .push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Plan_Screen(
                                            Bubble: state.DetailBubbledata,
                                            my_id: state.ProfileDate!.user!
                                                .id,),
                                    ),
                                  ));
                            }
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: w/1.1,
                                    height: h/8.6,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        topRight: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                        bottomRight: Radius.circular(100),
                                      ),
                                      color : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  child:Row(
                                    children: [
                                      SizedBox(width: w/30,),
                                      CircleAvatar(
                                        radius: h/22,
                                        backgroundImage: NetworkImage(state.DetailBubbledata!.image!),
                                      ),
                                      SizedBox(width: w/20,),
                                      Container(
                                        height: h/8.6,
                                        width: w/2.2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: w/2.2,
                                              child: Text(state.DetailBubbledata!.Title!,
                                                textAlign: TextAlign.left, style: TextStyle(
                                                  color:  Color(state.DetailBubbledata!.Color!),
                                                 fontFamily: 'Red Hat Display',
                                                  fontSize: 16,
                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1
                                              ),),
                                            ),
                                            SizedBox(height: w/65,),
                                             Container(
                                               width: w/2.2,
                                          child:
                                          Text('At ${state.DetailBubbledata!.location!}', textAlign: TextAlign.left, style: TextStyle(
                                                color: Color.fromRGBO(96, 96, 96, 1),
                                                fontFamily: 'Red Hat Display',
                                                fontSize: 12,
                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.w600,
                                                height: 1
                                            ),),
                                        ),
                                            SizedBox(height: w/120,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(radius: 8,
                                                    backgroundImage: NetworkImage(state.DetailBubbledata!.Creator_Avatar??""),
                                                    backgroundColor: Color(int.parse(state.DetailBubbledata!.Creator_Color??"0xff000000")),
                                                  ),

                                                  SizedBox(width: w/35,),
                                                  Text(state.DetailBubbledata!.Creator_Alias??"Admin", textAlign: TextAlign.left, style: TextStyle(
                                                      color: Color.fromRGBO(96, 96, 96, 1),
                                                      fontFamily: 'Red Hat Display',
                                                      fontSize: 9,
                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1
                                                  ),)
                                                ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            height: h/8.6,
                                            width: w/5,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  "Assets/images/Exclude.svg",
                                                  color : Color(state.DetailBubbledata!.Color!),
                                                  width: w/7,
                                                ),
                                              ]
                                            )
                                        ),
                                      )
                                    ],
                                  )


                                ),
                              ],
                            ),
                          ),
                        )
                            :Text(""),


                        state.GetprofileSuccess!
                            ? state.ProfileDate!.user!.is_creator == 1
                                ? !state.ShowBubbleDetailsUI!
                            ?Positioned(
                                    bottom: h / 50,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {

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
                             :Text("")
                                : Text("")
                            : Text(""),

                        ShowCaseWidget(
                            builder: wid.Builder(
                             builder: (context) => SlidingUpPanel(
                              controller: PanelControllerr,
                              color: ColorS.onPrimaryContainer,
                              maxHeight:  state.BUBBLElistS3!.length== 0&& state.BUBBLElistS2!.length == 0 && state.BUBBLElistS1!.length== 0
                                 ?h/2.4
                                 :h,

                              minHeight: 30,
                              onPanelOpened: () { },
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              panel:  Container(
                                    width: w,
                                  height: state.BUBBLElistS3!.length== 0&& state.BUBBLElistS2!.length == 0 && state.BUBBLElistS1!.length== 0
                                      ?h/2.5
                                      :h,

                                  child:Column(
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
                                            !state.ChangeViewStatus!?
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      width: w/2,
                                                      height: h/15,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Prime Bubbles',
                                                            textAlign: TextAlign.left,
                                                            style: _TextTheme.headlineLarge!.copyWith(
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
                                                                    milliseconds: 2000),
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
                                                    SizedBox(width: 5,),
                                                    InkWell(
                                                      onTap: (){
                                                        WidgetsBinding
                                                            .instance!
                                                            .addPostFrameCallback((_) =>
                                                            Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => Events_Screen(
                                                                    Bubble: state.BUBBLElistS4!,
                                                                    Type: 'Primes',
                                                                    my_id: state.ProfileDate!.user!.id!
                                                                ),
                                                              ),
                                                            ));
                                                      },
                                                      child: Text('See all',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(207, 109, 56, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 13,
                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1
                                                        ),),
                                                    ),
                                                    SizedBox(width: 0,),
                                                  ],
                                                ),

                                                state.GetNewBubblesSuccess!
                                                    ? Row(
                                                      children: [
                                                        SizedBox(width: w/20,),
                                                        Container(
                                                  width: w/1.1,
                                                  height: h /4.2,
                                                  // margin: EdgeInsets.only(left: h/40),
                                                  child: ListView.separated(
                                                        cacheExtent : 500,
                                                        controller:_Primecontroller ,
                                                        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                        scrollDirection: Axis.horizontal,
                                                        shrinkWrap: false,
                                                        itemCount: state.BUBBLElistS4!.length,
                                                        itemBuilder:
                                                            (BuildContext context,
                                                            int index2) {
                                                          String Value = state.BUBBLElistS4![index2].Color.toString();
                                                          if (Value.contains("#",0)){
                                                            Value = Value.substring(1);
                                                            Value = "0xff$Value";
                                                          }
                                                          var myInt = int.parse(Value);
                                                          var BackgroundColor= myInt;


                                                          return index2 == 0
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

                                                              child:  InkWell(
                                                                onTap: () {
                                                                  WidgetsBinding
                                                                      .instance!
                                                                      .addPostFrameCallback(
                                                                          (_) =>   Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (
                                                                              context) =>
                                                                              PrimePlan_page(Bubble:state.BUBBLElistS4![index2] ,
                                                                                my_id: state.ProfileDate!.user!.id,         List_Type: "PRIME", ),
                                                                        ),
                                                                      ));



                                                                },
                                                                child:



                                                                Container(
                                                                  width: w/2.5,
                                                                  height: h / 6,
                                                                  // margin: EdgeInsets.only(left: h/40),
                                                                  padding: EdgeInsets.only(top: h/300,),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius : BorderRadius.only(
                                                                      topLeft: Radius.circular(364.2384033203125),
                                                                      topRight: Radius.circular(364.2384033203125),
                                                                      bottomRight: Radius.circular(40.569536209106445),
                                                                      bottomLeft: Radius.circular(40.569536209106445),

                                                                    ),
                                                                    color: Colors.white,
                                                                  ),child:

                                                                Column(
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          CachedNetworkImage(
                                                                            imageUrl:state.BUBBLElistS4![index2].image.toString(),
                                                                            imageBuilder: (context, imageProvider) => Container(
                                                                              width: w/2.2,
                                                                              height: h / 6,
                                                                              margin: EdgeInsets.only(left: w/200,right: w/200),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius : BorderRadius.only(
                                                                                  topLeft: Radius.circular(364.2384033203125),
                                                                                  topRight: Radius.circular(364.2384033203125),
                                                                                ),
                                                                                image:DecorationImage(image: imageProvider
                                                                                    ,fit: BoxFit.fill
                                                                                ),

                                                                              ),

                                                                            ),
                                                                            placeholder: (context, url) => Container(    width: w/2.5,
                                                                                height: h/6.5,child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    CircularProgressIndicator(),
                                                                                  ],
                                                                                )),
                                                                            errorWidget: (context, url, error) => Container(    width: w/2.5,
                                                                                height: h/6.5,child: Icon(Icons.error)),
                                                                          ),

                                                                          Positioned(
                                                                            top: h/7,
                                                                            child: Container(
                                                                                width: w/2.5,
                                                                                height: h/12,
                                                                                padding: EdgeInsets.only(top: h/2),
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.transparent,
                                                                                  boxShadow : [BoxShadow(
                                                                                      color: Colors.black54,
                                                                                      offset: Offset(0,0),
                                                                                      blurRadius: 15.628571510314941
                                                                                  )],

                                                                                )
                                                                            ),
                                                                          ),

                                                                          // Positioned(
                                                                          //   top: h/7,
                                                                          //   child: Container(
                                                                          //       width: w/2.5,
                                                                          //       height: h/8,
                                                                          //       padding: EdgeInsets.only(top: h/2),
                                                                          //       decoration: BoxDecoration(
                                                                          //         borderRadius : BorderRadius.only(
                                                                          //           // topLeft: Radius.circular(30.2384033203125),
                                                                          //           // topRight: Radius.circular(30.2384033203125),
                                                                          //         ),
                                                                          //         gradient : LinearGradient(
                                                                          //             begin: Alignment(5.730259880964636e-14,-1),
                                                                          //             end: Alignment(1,3.9593861611176705e-16),
                                                                          //             colors: [Color(0xff000000).withOpacity(.02),Color(0xff000000).withOpacity(.02)]
                                                                          //         ),
                                                                          //       )
                                                                          //   ),
                                                                          // ),
                                                                          Positioned(
                                                                            left: h/40,
                                                                              top: h/30,
                                                                              child: Image.asset("Assets/images/icon.png")
                                                                          ),
                                                                  Positioned(
                                                                    left: w/3.9,
                                                                    top: h/7.1,
                                                                    child:
                                                                          Container(
                                                                            width: w/3.7,height: h/15,
                                                                            margin: EdgeInsets.only(left:state.BUBBLElistS4![index2].users_in_bubble!.length==1
                                                                                ?  w/20
                                                                                :state.BUBBLElistS4![index2].users_in_bubble!.length==2
                                                                                ?w/50
                                                                                :    w/130
                                                                                ,bottom: h/10),    child: ListView.builder(
                                                                              itemCount: state.BUBBLElistS4![index2].users_in_bubble!.length<3? state.BUBBLElistS4![index2].users_in_bubble!.length:3,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                String Value =  state.BUBBLElistS4![index2].users_in_bubble![index].background_color.toString();
                                                                                if (Value.contains("#",0)){
                                                                                  Value = Value.substring(1);
                                                                                  Value = "0xff$Value";
                                                                                }
                                                                                var myInt = int.parse(Value);
                                                                                var BackgroundColor= myInt;
                                                                                return    Row(
                                                                                  children: [
                                                                                    index==0
                                                                                        ? SizedBox(width: 5,)
                                                                                        : Container(),
                                                                                    Align(
                                                                                        widthFactor: 0.75,
                                                                                        alignment: Alignment.topCenter,
                                                                                        child:
                                                                                        Container(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Wrap(
                                                                                                children: [
                                                                                                  CircleAvatar(
                                                                                                    radius: 6,
                                                                                                    backgroundColor: Color(BackgroundColor),
                                                                                                    backgroundImage: NetworkImage(state.BUBBLElistS4![index2].users_in_bubble![index].avatar.toString()),
                                                                                                  )
                                                                                                ],

                                                                                              ),
                                                                                            ],

                                                                                          ),
                                                                                        )
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),),
                                                                          Positioned(
                                                                            left: w/2.8,
                                                                            top: h/6.8,
                                                                            child: Text("+${state.BUBBLElistS4![index2].users_in_bubble!.length.toString()}", textAlign: TextAlign.left, style: TextStyle(
                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                fontFamily: 'Red Hat Text',
                                                                                fontSize: 8.309549331665039,
                                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                fontWeight: FontWeight.w700,
                                                                                height: 1
                                                                            ),),
                                                                          )
                                                                        ],
                                                                      ),

                                                                      Expanded(
                                                                        child: Container(


                                                                          decoration: BoxDecoration(
                                                                            borderRadius : BorderRadius.only(
                                                                              bottomRight: Radius.circular(6.569536209106445),
                                                                              bottomLeft: Radius.circular(6.569536209106445),
                                                                            ),
                                                                            color: Color(0xff606060),
                                                                          ),
                                                                          child:
                                                                          Row(
                                                                            children: [
                                                                              SizedBox(height: 2,),
                                                                              Column(
                                                                                children: [
                                                                                  Stack(
                                                                                    children: [
                                                                                      SvgPicture.asset(
                                                                                        "Assets/images/Exclude.svg",
                                                                                        color : Color(BackgroundColor),
                                                                                        width: w/7.9,
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 0,
                                                                                          right: 0,
                                                                                          top: 0,
                                                                                          bottom: 0,
                                                                                          child:  Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                            Container(
                                                                                            width: w/26,
                                                                                            child:
                                                                                                  Image.asset("Assets/images/icons.png",  fit: BoxFit.fill,),
                                                                                            )      ],
                                                                                              ))

                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          width: w/4.2,
                                                                                          color: Colors.transparent,
                                                                                          child: Text(state.BUBBLElistS4![index2].Title.toString(),
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
                                                                                  SizedBox(height: 5,),
                                                                                  Container(
                                                                                    width: w/4.2,
                                                                                    child: Text(state.BUBBLElistS4![index2].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                        fontFamily: 'Red Hat Text',
                                                                                        fontSize: 11,
                                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                        fontWeight: FontWeight.w300,
                                                                                        height: 1
                                                                                    ),),
                                                                                  ),
                                                                                ],
                                                                              )


                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]





                                                                ),


                                                                ),







                                                              ))
                                                              :   InkWell(
                                                            onTap: () {
                                                              WidgetsBinding
                                                                  .instance!
                                                                  .addPostFrameCallback(
                                                                      (_) =>   Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          PrimePlan_page(Bubble:state.BUBBLElistS4![index2] ,
                                                                            my_id: state.ProfileDate!.user!.id,         List_Type: "PRIME", ),
                                                                    ),
                                                                  ));



                                                            },
                                                            child:



                                                            Container(
                                                              width: w/2.5,
                                                              height: h / 6,
                                                              // margin: EdgeInsets.only(left: h/40),
                                                              padding: EdgeInsets.only(top: h/300,),
                                                              decoration: BoxDecoration(
                                                                borderRadius : BorderRadius.only(
                                                                  topLeft: Radius.circular(364.2384033203125),
                                                                  topRight: Radius.circular(364.2384033203125),
                                                                  bottomRight: Radius.circular(40.569536209106445),
                                                                  bottomLeft: Radius.circular(40.569536209106445),

                                                                ),
                                                                color: Colors.white,
                                                              ),child:

                                                            Column(
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      CachedNetworkImage(
                                                                        imageUrl:state.BUBBLElistS4![index2].image.toString(),
                                                                        imageBuilder: (context, imageProvider) => Container(
                                                                          width: w/2.2,
                                                                          height: h / 6,
                                                                          margin: EdgeInsets.only(left: w/200,right: w/200),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius : BorderRadius.only(
                                                                              topLeft: Radius.circular(364.2384033203125),
                                                                              topRight: Radius.circular(364.2384033203125),
                                                                            ),
                                                                            image:DecorationImage(image: imageProvider
                                                                                ,fit: BoxFit.fill
                                                                            ),

                                                                          ),

                                                                        ),
                                                                        placeholder: (context, url) => Container(    width: w/2.5,
                                                                            height: h/6.5,child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                CircularProgressIndicator(),
                                                                              ],
                                                                            )),
                                                                        errorWidget: (context, url, error) => Container(    width: w/2.5,
                                                                            height: h/6.5,child: Icon(Icons.error)),
                                                                      ),

                                                                      Positioned(
                                                                        top: h/7,
                                                                        child: Container(
                                                                            width: w/2.5,
                                                                            height: h/12,
                                                                            padding: EdgeInsets.only(top: h/2),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius : BorderRadius.only(
                                                                                // topLeft: Radius.circular(30.2384033203125),
                                                                                // topRight: Radius.circular(30.2384033203125),
                                                                              ),
                                                                              gradient : LinearGradient(
                                                                                  begin: Alignment(8.730259880964636e-14,-0.5),
                                                                                  end: Alignment(-3,3.9593861611176705e-16),
                                                                                  colors: [Colors.transparent,Color(BackgroundColor).withOpacity(.5)]
                                                                              ),
                                                                            )
                                                                        ),
                                                                      ),

                                                                      Positioned(
                                                                        top: h/7,
                                                                        child: Container(
                                                                            width: w/2.5,
                                                                            height: h/8,
                                                                            padding: EdgeInsets.only(top: h/2),
                                                                            decoration: BoxDecoration(
                                                                              borderRadius : BorderRadius.only(
                                                                                // topLeft: Radius.circular(30.2384033203125),
                                                                                // topRight: Radius.circular(30.2384033203125),
                                                                              ),
                                                                              gradient : LinearGradient(
                                                                                  begin: Alignment(5.730259880964636e-14,-1),
                                                                                  end: Alignment(1,3.9593861611176705e-16),
                                                                                  colors: [Color(0xff000000).withOpacity(.02),Color(0xff000000).withOpacity(.02)]
                                                                              ),
                                                                            )
                                                                        ),
                                                                      ),
                                                                      Positioned(
                                                                          left: h/40,
                                                                          top: h/30,
                                                                          child: Image.asset("Assets/images/icon.png")
                                                                      ),
                                                                      Positioned(
                                                                        left: w/3.9,
                                                                        top: h/7.1,
                                                                        child:
                                                                        Container(
                                                                          width: w/3.7,height: h/15,
                                                                          margin: EdgeInsets.only(left:state.BUBBLElistS4![index2].users_in_bubble!.length==1
                                                                              ?  w/20
                                                                              :state.BUBBLElistS4![index2].users_in_bubble!.length==2
                                                                              ?w/50
                                                                              :    w/130
                                                                              ,bottom: h/10),
                                                                          child: ListView.builder(
                                                                            itemCount: state.BUBBLElistS4![index2].users_in_bubble!.length<3? state.BUBBLElistS4![index2].users_in_bubble!.length:3,
                                                                            scrollDirection: Axis.horizontal,
                                                                            itemBuilder: (BuildContext context, int index) {
                                                                              String Value =  state.BUBBLElistS4![index2].users_in_bubble![index].background_color.toString();
                                                                              if (Value.contains("#",0)){
                                                                                Value = Value.substring(1);
                                                                                Value = "0xff$Value";
                                                                              }
                                                                              var myInt = int.parse(Value);
                                                                              var BackgroundColor= myInt;
                                                                              return    Row(
                                                                                children: [
                                                                                  index==0
                                                                                      ? SizedBox(width: 5,)
                                                                                      : Container(),
                                                                                  Align(
                                                                                      widthFactor: 0.75,
                                                                                      alignment: Alignment.topCenter,
                                                                                      child:
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Wrap(
                                                                                              children: [
                                                                                                CircleAvatar(
                                                                                                  radius: 6,
                                                                                                  backgroundColor: Color(BackgroundColor),
                                                                                                  backgroundImage: NetworkImage(state.BUBBLElistS4![index2].users_in_bubble![index].avatar.toString()),
                                                                                                )
                                                                                              ],

                                                                                            ),
                                                                                          ],

                                                                                        ),
                                                                                      )
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),),
                                                                      Positioned(
                                                                        left: w/2.8,
                                                                        top: h/6.8,
                                                                        child: Text("+${state.BUBBLElistS4![index2].users_in_bubble!.length.toString()}", textAlign: TextAlign.left, style: TextStyle(
                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                            fontFamily: 'Red Hat Text',
                                                                            fontSize: 8.309549331665039,
                                                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                            fontWeight: FontWeight.w700,
                                                                            height: 1
                                                                        ),),
                                                                      )
                                                                    ],
                                                                  ),

                                                                  Expanded(
                                                                    child: Container(


                                                                      decoration: BoxDecoration(
                                                                        borderRadius : BorderRadius.only(
                                                                          bottomRight: Radius.circular(6.569536209106445),
                                                                          bottomLeft: Radius.circular(6.569536209106445),
                                                                        ),
                                                                        color: Color(0xff606060),
                                                                      ),
                                                                      child:
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(height: 2,),
                                                                          Column(
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  SvgPicture.asset(
                                                                                    "Assets/images/Exclude.svg",
                                                                                    color : Color(BackgroundColor),
                                                                                    width: w/7.9,
                                                                                  ),
                                                                                  Positioned(
                                                                                      left: 0,
                                                                                      right: 0,
                                                                                      top: 0,
                                                                                      bottom: 0,
                                                                                      child:  Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: w/26,
                                                                                            child:
                                                                                            Image.asset("Assets/images/icons.png",  fit: BoxFit.fill,),
                                                                                          )      ],
                                                                                      ))

                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Container(
                                                                                  width: w/4.2,
                                                                                  color: Colors.transparent,
                                                                                  child: Text(state.BUBBLElistS4![index2].Title.toString(),
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
                                                                              SizedBox(height: 5,),
                                                                              Container(
                                                                                width: w/4.2,
                                                                                child: Text(state.BUBBLElistS4![index2].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                    fontFamily: 'Red Hat Text',
                                                                                    fontSize: 11,
                                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    height: 1
                                                                                ),),
                                                                              ),
                                                                            ],
                                                                          )


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
                                                ),
                                                      ],
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



                                              ],
                                            )
                                                :Container(),

                                            state.BUBBLElistS3!.length!= 0|| state.BUBBLElistS2!.length != 0 || state.BUBBLElistS1!.length!= 0
                                                ?   Container(
                                              width: w,
                                                  height: h/1.7,

                                                  child: Column(
                                              children: [

                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width: w,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            margin: EdgeInsets.only(left: w/25,right: w/20),
                                                            decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius.circular(15),
                                                                bottomRight: Radius.circular(15),
                                                                topLeft: Radius.circular(15),
                                                                topRight: Radius.circular(15),
                                                              ),
                                                            ),
                                                            width: w / 1.5,
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
                                                                  _HomeBloc.add(SearchBubblesList((b) => b
                                                                    ..Keyword = keyword
                                                                    ..Change_ViewStatus = keyword.isNotEmpty
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
                                                                  contentPadding: EdgeInsets.symmetric(),
                                                                  prefixIconColor: Color(0xff939393),
                                                                  filled: true,
                                                                  fillColor: Colors.transparent,
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

                                                        InkWell(
                                                          onTap: (){
                                                            CommingSoonPopup(context, h, w,  "Coming Soon!", "Can't wait!", 18);
                                                          },
                                                          child: Container(
                                                            width: w/9.1,
                                                            height: h / 14,
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                  "Assets/images/Calender.svg",
                                                                  color: ColorS.surface,    width: w/12
                                                                  ,
                                                                  height: h / 20,),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            CommingSoonPopup(context, h, w,  "Coming Soon!", "Can't wait!", 18);
                                                          },
                                                          child: Container(
                                                            width: w/8.5,
                                                            height: h / 14,
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                  "Assets/images/Filter.svg",
                                                                  color: ColorS.surface,        width: w/12
                                                                  ,
                                                                  height: h / 20,),
                                                              ],
                                                            ),
                                                          ),
                                                        ),


                                                        SizedBox(width: 5,),

                                                      ],
                                                    ),
                                                  ),

                                                  !state.ChangeViewStatus!?
                                                  Expanded(
                                                    child: Container(
                                                      width: w,
                                                      height: h / 1.9,
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [

                                                            state.BUBBLElistS3!.length!= 0
                                                                ?
                                                            Column(
                                                              children: [
                                                                SizedBox(height: h/65,),
                                                                Container(

                                                                  width: w,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Container(
                                                                        width: w/4,
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
                                                                      InkWell(
                                                                        onTap: (){
                                                                          WidgetsBinding
                                                                              .instance!
                                                                              .addPostFrameCallback((_) =>
                                                                              Navigator
                                                                                  .push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => Events_Screen(
                                                                                      Bubble:  state.BUBBLElistS3!,
                                                                                      Type:'Popular Now' ,
                                                                                      my_id: state.ProfileDate!.user!.id!
                                                                                  ),
                                                                                ),
                                                                              ));
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 13,
                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1
                                                                          ),),
                                                                      )

                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height: h/45,),


                                                                state.GetNewBubblesSuccess!
                                                                    ? Container(
                                                                    width: w,
                                                                    height:  h / 3,
                                                                    child: ScrollConfiguration(
                                                                        behavior: MyBehavior(),
                                                                        child: ListView.separated(
                                                                          cacheExtent : 500,
                                                                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                          scrollDirection:
                                                                          Axis.horizontal,
                                                                          itemCount: state.BUBBLElistS3!.length,
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
                                                                                                Bubble:state.BUBBLElistS3![index],
                                                                                                my_id: state.ProfileDate!.user!.id ,     ),
                                                                                        ),
                                                                                      ));
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
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
                                                                                                state.BUBBLElistS3![index].image.toString(),
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
                                                                                          Container(
                                                                                              width: w / 1.6,
                                                                                              height: h/10.2,

                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius : const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(20),
                                                                                                  topRight:  Radius.circular(20),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS3![index].Color!).withOpacity(.5),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),

                                                                                          // Transform.rotate(
                                                                                          //   angle: 50.99999499104388 * (math.pi / 180),
                                                                                          //   child: Container(
                                                                                          //       width: w / 1.6,
                                                                                          //       height: h/4.2,
                                                                                          //       decoration: BoxDecoration(
                                                                                          //         borderRadius : BorderRadius.only(
                                                                                          //           topLeft: Radius.circular(7),
                                                                                          //           //    topRight: Radius.circular(7),
                                                                                          //           bottomLeft: Radius.circular(7),
                                                                                          //           bottomRight: Radius.circular(7),
                                                                                          //         ),
                                                                                          //         gradient : LinearGradient(
                                                                                          //             begin: Alignment(5.730259880964636e-14,-2),
                                                                                          //             end: Alignment(2,3.9593861611176705e-16),
                                                                                          //             colors: [Colors.transparent,Color(state.BUBBLElistS1![index].Color!),]
                                                                                          //         ),
                                                                                          //       )
                                                                                          //   ),
                                                                                          // ),
                                                                                          Container(
                                                                                              width: w / 2.2,
                                                                                              height: h/14.89,
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  state.BUBBLElistS3![index].User_type!="admin"
                                                                                                      ?  Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS3![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS3![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS3![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                          fontFamily: 'Red Hat Display',
                                                                                                          fontSize: 10.477987289428711,
                                                                                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          height: 1
                                                                                                      ),),

                                                                                                    ],
                                                                                                  )
                                                                                                      :  Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                      fontFamily: 'Red Hat Display',
                                                                                                      fontSize: 10.477987289428711,
                                                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      height: 1
                                                                                                  ),),


                                                                                                  Text(""),
                                                                                                  Text(""),
                                                                                                ],
                                                                                              )
                                                                                          ),
                                                                                          Positioned(
                                                                                            left: h/35,
                                                                                            bottom: h/6,
                                                                                            child: Container(
                                                                                              width:w,
                                                                                              height: h/12.89,
                                                                                              child:
                                                                                              IconButton(
                                                                                                icon:SvgPicture.asset(
                                                                                                  state.BUBBLElistS3![index].is_Saved!
                                                                                                      ?"Assets/images/BiggerSaved.svg"
                                                                                                      :"Assets/images/SAVE.svg"
                                                                                                  ,width:  !state.BUBBLElistS3![index].is_Saved!? w/8: w/6,
                                                                                                ) ,
                                                                                                onPressed: (){
                                                                                                  _HomeBloc.add(
                                                                                                      ToggleSaveBubble((b) => b
                                                                                                        ..Bubble_id = state.BUBBLElistS3![index].id
                                                                                                        ..index = index
                                                                                                        ..List_type = 'New Bubbles'
                                                                                                        ..Saved_Status =   state.BUBBLElistS3![index].is_Saved!
                                                                                                      )
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          )
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

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS3![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                                                                            color: Color(state.BUBBLElistS3![index].Color!.toInt()),
                                                                                                            fontSize: 19,
                                                                                                            letterSpacing: 0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                        ),

                                                                                                      ),
                                                                                                    ],
                                                                                                  ),

                                                                                                  SizedBox(height: 3,),

                                                                                                  Container(
                                                                                                    width: w / 2,
                                                                                                    child:  Text(
                                                                                                      'At ${state.BUBBLElistS3![index].location.toString()}',
                                                                                                      textAlign: TextAlign.left,
                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                      style: _TextTheme.headlineLarge!.copyWith(
                                                                                                        fontSize: 13,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 7,),
                                                                                                  Container(
                                                                                                    width: w/2,
                                                                                                    child: Text("${state.BUBBLElistS3![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                        fontFamily: 'Red Hat Text',
                                                                                                        fontSize: 7.5,
                                                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                        height: 1
                                                                                                    ),),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(state.BUBBLElistS3![index].Color!),
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



                                                              ],
                                                            ):Container(),

                                                            state.BUBBLElistS2!.length != 0?
                                                            Column(
                                                              children: [
                                                                SizedBox(height: h/65,),
                                                                Container(

                                                                  width: w,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Container(
                                                                        width: w/5,
                                                                        child: Text(
                                                                          '   Nearby',
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
                                                                      SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          WidgetsBinding
                                                                              .instance!
                                                                              .addPostFrameCallback((_) =>
                                                                              Navigator
                                                                                  .push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => Events_Screen(
                                                                                      Bubble: state.BUBBLElistS2!,
                                                                                      Type:'Nearby',
                                                                                      my_id: state.ProfileDate!.user!.id!
                                                                                  ),
                                                                                ),
                                                                              ));
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 13,
                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1
                                                                          ),),
                                                                      )

                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height: h/45,),

                                                                state.NearbySuccess!
                                                                    ? Container(
                                                                    width: w,
                                                                    height:  h / 3,
                                                                    child: ScrollConfiguration(
                                                                        behavior: MyBehavior(),
                                                                        child: ListView.separated(
                                                                          cacheExtent : 500,
                                                                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                          scrollDirection:
                                                                          Axis.horizontal,
                                                                          itemCount: state.BUBBLElistS2!.length,
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
                                                                                                Bubble:state.BUBBLElistS2![index],
                                                                                                my_id: state.ProfileDate!.user!.id ,     ),
                                                                                        ),
                                                                                      ));
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
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
                                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(7),topLeft:Radius.circular(7)  ),
                                                                                              child:CachedNetworkImage(
                                                                                                fit: BoxFit.fitWidth,
                                                                                                imageUrl:
                                                                                                //"",
                                                                                                state.BUBBLElistS2![index].image.toString(),
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
                                                                                          Container(
                                                                                              width: w / 1.6,
                                                                                              height: h/10.2,

                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius : const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(10),
                                                                                                  topRight:  Radius.circular(10),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS2![index].Color!).withOpacity(.5),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),

                                                                                          // Transform.rotate(
                                                                                          //   angle: 50.99999499104388 * (math.pi / 180),
                                                                                          //   child: Container(
                                                                                          //       width: w / 1.6,
                                                                                          //       height: h/4.2,
                                                                                          //       decoration: BoxDecoration(
                                                                                          //         borderRadius : BorderRadius.only(
                                                                                          //           topLeft: Radius.circular(7),
                                                                                          //           //    topRight: Radius.circular(7),
                                                                                          //           bottomLeft: Radius.circular(7),
                                                                                          //           bottomRight: Radius.circular(7),
                                                                                          //         ),
                                                                                          //         gradient : LinearGradient(
                                                                                          //             begin: Alignment(5.730259880964636e-14,-2),
                                                                                          //             end: Alignment(2,3.9593861611176705e-16),
                                                                                          //             colors: [Colors.transparent,Color(state.BUBBLElistS1![index].Color!),]
                                                                                          //         ),
                                                                                          //       )
                                                                                          //   ),
                                                                                          // ),
                                                                                          Container(
                                                                                              width: w / 2.2,
                                                                                              height: h/14.89,
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  state.BUBBLElistS2![index].User_type!="admin"
                                                                                                      ?  Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS2![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS2![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS2![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                          fontFamily: 'Red Hat Display',
                                                                                                          fontSize: 10.477987289428711,
                                                                                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          height: 1
                                                                                                      ),),

                                                                                                    ],
                                                                                                  )
                                                                                                      :  Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                      fontFamily: 'Red Hat Display',
                                                                                                      fontSize: 10.477987289428711,
                                                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      height: 1
                                                                                                  ),),


                                                                                                  Text(""),
                                                                                                  Text(""),
                                                                                                ],
                                                                                              )
                                                                                          ),
                                                                                          Positioned(
                                                                                            left: h/35,
                                                                                            bottom: h/6,
                                                                                            child: Container(
                                                                                              width:w,
                                                                                              height: h/12.89,
                                                                                              child:
                                                                                              IconButton(
                                                                                                icon:SvgPicture.asset(
                                                                                                  state.BUBBLElistS2![index].is_Saved!
                                                                                                      ?"Assets/images/BiggerSaved.svg"
                                                                                                      :"Assets/images/SAVE.svg"
                                                                                                  ,width:  !state.BUBBLElistS2![index].is_Saved!? w/8: w/6,
                                                                                                ) ,
                                                                                                onPressed: (){
                                                                                                  _HomeBloc.add(
                                                                                                      ToggleSaveBubble((b) => b
                                                                                                        ..Bubble_id = state.BUBBLElistS2![index].id
                                                                                                        ..index = index
                                                                                                        ..List_type = 'New Bubbles'
                                                                                                        ..Saved_Status =   state.BUBBLElistS2![index].is_Saved!
                                                                                                      )
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          )
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

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS2![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                                                                            color: Color(state.BUBBLElistS2![index].Color!.toInt()),
                                                                                                            fontSize: 19,
                                                                                                            letterSpacing: 0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                        ),

                                                                                                      ),
                                                                                                    ],
                                                                                                  ),

                                                                                                  SizedBox(height: 3,),

                                                                                                  Container(
                                                                                                    width: w / 2,
                                                                                                    child:  Text(
                                                                                                      'At ${state.BUBBLElistS2![index].location.toString()}',
                                                                                                      textAlign: TextAlign.left,
                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                      style: _TextTheme.headlineLarge!.copyWith(
                                                                                                        fontSize: 13,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 7,),
                                                                                                  Container(
                                                                                                    width: w/2,
                                                                                                    child: Text("${state.BUBBLElistS2![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                        fontFamily: 'Red Hat Text',
                                                                                                        fontSize: 7.5,
                                                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                        height: 1
                                                                                                    ),),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(state.BUBBLElistS2![index].Color!),
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
                                                              ],
                                                            ):Container(),

                                                            state.BUBBLElistS1!.length!= 0?
                                                            Column(
                                                              children: [
                                                                SizedBox(height: h/65,),
                                                                Container(

                                                                  width: w,
                                                                  child: Row(
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
                                                                      SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          WidgetsBinding
                                                                              .instance!
                                                                              .addPostFrameCallback((_) =>
                                                                              Navigator
                                                                                  .push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => Events_Screen(
                                                                                      Bubble:state.BUBBLElistS1! ,
                                                                                      Type:'New Bubbles',
                                                                                      my_id: state.ProfileDate!.user!.id!
                                                                                  ),
                                                                                ),
                                                                              ));
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 13,
                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1
                                                                          ),),
                                                                      )

                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height: h/45,),



                                                                state.GetNewBubblesSuccess!
                                                                    ? Container(
                                                                    width: w,
                                                                    height:  h / 3,
                                                                    child: ScrollConfiguration(
                                                                        behavior: MyBehavior(),
                                                                        child: ListView.separated(
                                                                          cacheExtent : 500,
                                                                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                          scrollDirection:
                                                                          Axis.horizontal,
                                                                          itemCount: state.BUBBLElistS1!.length,
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
                                                                                                Bubble:state.BUBBLElistS1![index],
                                                                                                my_id: state.ProfileDate!.user!.id ,     ),
                                                                                        ),
                                                                                      ));
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
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
                                                                                                state.BUBBLElistS1![index].image.toString(),
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
                                                                                          Container(
                                                                                                 width: w / 1.6,
                                                                                                  height: h/10.2,

                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius : const BorderRadius.only(
                                                                                                  topLeft: Radius.circular(20),
                                                                                               topRight:  Radius.circular(20),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS1![index].Color!).withOpacity(.5),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),

                                                                                          // Transform.rotate(
                                                                                          //   angle: 50.99999499104388 * (math.pi / 180),
                                                                                          //   child: Container(
                                                                                          //       width: w / 1.6,
                                                                                          //       height: h/4.2,
                                                                                          //       decoration: BoxDecoration(
                                                                                          //         borderRadius : BorderRadius.only(
                                                                                          //           topLeft: Radius.circular(7),
                                                                                          //           //    topRight: Radius.circular(7),
                                                                                          //           bottomLeft: Radius.circular(7),
                                                                                          //           bottomRight: Radius.circular(7),
                                                                                          //         ),
                                                                                          //         gradient : LinearGradient(
                                                                                          //             begin: Alignment(5.730259880964636e-14,-2),
                                                                                          //             end: Alignment(2,3.9593861611176705e-16),
                                                                                          //             colors: [Colors.transparent,Color(state.BUBBLElistS1![index].Color!),]
                                                                                          //         ),
                                                                                          //       )
                                                                                          //   ),
                                                                                          // ),
                                                                                          Container(
                                                                                              width: w / 2.2,
                                                                                              height: h/14.89,
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                              state.BUBBLElistS1![index].User_type!="admin"
                                                                                                      ?  Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS1![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS1![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS1![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                                                                                          color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                          fontFamily: 'Red Hat Display',
                                                                                                          fontSize: 10.477987289428711,
                                                                                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          height: 1
                                                                                                      ),),

                                                                                                    ],
                                                                                                  )
                                                                                                      :  Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                      fontFamily: 'Red Hat Display',
                                                                                                      fontSize: 10.477987289428711,
                                                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      height: 1
                                                                                                  ),),


                                                                                                  Text(""),
                                                                                                  Text(""),
                                                                                                ],
                                                                                              )
                                                                                          ),
                                                                                          Positioned(
                                                                                            left: h/35,
                                                                                            bottom: h/6,
                                                                                            child: Container(
                                                                                              width:w,
                                                                                              height: h/12.89,
                                                                                              child:
                                                                                              IconButton(
                                                                                                icon:SvgPicture.asset(
                                                                                                  state.BUBBLElistS1![index].is_Saved!
                                                                                                      ?"Assets/images/BiggerSaved.svg"
                                                                                                      :"Assets/images/SAVE.svg"
                                                                                                  ,width:  !state.BUBBLElistS1![index].is_Saved!? w/8: w/6,
                                                                                                ) ,
                                                                                                onPressed: (){
                                                                                                  _HomeBloc.add(
                                                                                                      ToggleSaveBubble((b) => b
                                                                                                        ..Bubble_id = state.BUBBLElistS1![index].id
                                                                                                        ..index = index
                                                                                                        ..List_type = 'New Bubbles'
                                                                                                        ..Saved_Status =   state.BUBBLElistS1![index].is_Saved!
                                                                                                      )
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          )
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

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS1![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style: _TextTheme.headlineLarge!.copyWith(
                                                                                                            color: Color(state.BUBBLElistS1![index].Color!.toInt()),
                                                                                                            fontSize: 19,
                                                                                                            letterSpacing: 0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                        ),

                                                                                                      ),
                                                                                                    ],
                                                                                                  ),

                                                                                                  SizedBox(height: 3,),

                                                                                                  Container(
                                                                                                    width: w / 2,
                                                                                                    child:  Text(
                                                                                                      'At ${state.BUBBLElistS1![index].location.toString()}',
                                                                                                      textAlign: TextAlign.left,
                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                      style: _TextTheme.headlineLarge!.copyWith(
                                                                                                        fontSize: 13,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 7,),
                                                                                                  Container(
                                                                                                    width: w/2,
                                                                                                    child: Text("${state.BUBBLElistS1![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                        fontFamily: 'Red Hat Text',
                                                                                                        fontSize: 7.5,
                                                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                        fontWeight: FontWeight.w300,
                                                                                                        height: 1
                                                                                                    ),),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(state.BUBBLElistS1![index].Color!),
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
                                                              ],
                                                            ):Container(),

                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )

                                                      :state.Searchsuccess!?
                                                  Container(
                                                      width: w/1.1,
                                                      height: h/1.25,
                                                      child :
                                                      ScrollConfiguration(
                                                          behavior: MyBehavior(),
                                                          child:
                                                          GridView.builder(
                                                              itemCount: state.FilteredBubbleList!.length,
                                                              scrollDirection: Axis.vertical,
                                                              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,

                                                                childAspectRatio: (5 / 5),),
                                                              itemBuilder: (BuildContext context, int index) {

                                                                return   InkWell(
                                                                    onTap: (){
                                                                      WidgetsBinding
                                                                          .instance!
                                                                          .addPostFrameCallback(
                                                                              (_) =>   Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (
                                                                                  context) =>
                                                                                  Plan_Screen(
                                                                                    Bubble:state.FilteredBubbleList![index],my_id: state.ProfileDate!.user!.id,  ),
                                                                            ),
                                                                          ));

                                                                    },
                                                                    child:Center(
                                                                      child: Container(
                                                                          width:w/1.15,
                                                                          height: h/2.1,
                                                                          margin: const EdgeInsets.all(10),
                                                                          decoration: const BoxDecoration(
                                                                            borderRadius : BorderRadius.only(
                                                                              topLeft: Radius.circular(7.777777194976807),
                                                                              topRight: Radius.circular(7.777777194976807),
                                                                              bottomLeft: Radius.circular(7.777777194976807),
                                                                              bottomRight: Radius.circular(7.777777194976807),
                                                                            ),
                                                                            color : Color.fromRGBO(96, 96, 96, 1),
                                                                          ),
                                                                          child :Column(
                                                                            children: [
                                                                              Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      width:w/1.15,
                                                                                      height: h/2.89,
                                                                                      child: ClipRRect(
                                                                                        borderRadius: const BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                                                        child:CachedNetworkImage(
                                                                                          fit: BoxFit.fill,
                                                                                          imageUrl:  state.FilteredBubbleList![index].image.toString(),
                                                                                          placeholder: (context, url) => Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(width:w/8,height:h/20,child: const Center(child: CircularProgressIndicator())),
                                                                                            ],
                                                                                          ),
                                                                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Transform.rotate(
                                                                                      angle: -179.99999499423683 * (math.pi / 180),
                                                                                      child: Container(
                                                                                          width:w/1.15,
                                                                                          height: h/2.89,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius : const BorderRadius.only(
                                                                                              topLeft: Radius.circular(7.777777194976807),
                                                                                              //  topRight: Radius.circular(7.777777194976807),
                                                                                              bottomRight: Radius.circular(7.777777194976807),
                                                                                              bottomLeft: Radius.circular(7.777777194976807),
                                                                                            ),
                                                                                            gradient : LinearGradient(
                                                                                                begin: const Alignment(5.730259880964636e-14,-2),
                                                                                                end: const Alignment(2,3.9593861611176705e-16),
                                                                                                colors: [
                                                                                                  Colors.transparent,
                                                                                                  Color(state.FilteredBubbleList![index].Color!),
                                                                                                ]
                                                                                            ),
                                                                                          )
                                                                                      ),
                                                                                    ),


                                                                                    Container(
                                                                                        width:w/1.15,
                                                                                        height: h/6.89,
                                                                                        child:Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                          children: [
                                                                                            state.FilteredBubbleList![index].User_type=="user"
                                                                                                ?Row(
                                                                                              children: [
                                                                                                CircleAvatar(
                                                                                                  radius: 17,
                                                                                                  backgroundColor: Color(int.parse(state.FilteredBubbleList![index].Creator_Color!)),
                                                                                                  backgroundImage: NetworkImage(state.FilteredBubbleList![index].Creator_Avatar!),
                                                                                                ),
                                                                                                const SizedBox(width: 10,),
                                                                                                Text(state.FilteredBubbleList![index].Creator_Alias!, textAlign: TextAlign.left, style: const TextStyle(
                                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                    fontFamily: 'Red Hat Display',
                                                                                                    fontSize: 10.477987289428711,
                                                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    height: 1
                                                                                                ),),

                                                                                              ],
                                                                                            )
                                                                                                : const Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                fontFamily: 'Red Hat Display',
                                                                                                fontSize: 10.477987289428711,
                                                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                height: 1
                                                                                            ),),

                                                                                            const Text(""),
                                                                                            const Text(""),

                                                                                          ],
                                                                                        )






                                                                                    ),
                                                                                    Positioned(
                                                                                      left: h/9,
                                                                                      child: Container(
                                                                                        width:w,
                                                                                        height: h/6.89,
                                                                                        child:

                                                                                        IconButton(
                                                                                          icon:SvgPicture.asset(
                                                                                              !state.isLoading!?
                                                                                              state.success!?
                                                                                              state.Saved_Status![index]
                                                                                                  ?"Assets/images/BiggerSaved.svg"
                                                                                                  :"Assets/images/SAVE.svg"
                                                                                                  :""
                                                                                                  :""
                                                                                          ) ,
                                                                                          onPressed: (){
                                                                                            // _HomeBloc.add(
                                                                                            //     ToggleSaveBubbleEventScreen((b) => b
                                                                                            //       ..Bubble_id = state.FilteredBubbleList![index].id
                                                                                            //       ..index = index
                                                                                            //       ..List_type = widget.Type
                                                                                            //       ..Saved_Status =state.Saved_Status![index]
                                                                                            //     )
                                                                                            // );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ]
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                                                          Row(
                                                                                            children: [
                                                                                              Container(
                                                                                                child: Text(
                                                                                                  state.FilteredBubbleList![index].Title.toString(),
                                                                                                  textAlign: TextAlign.left,
                                                                                                  overflow: TextOverflow.ellipsis,
                                                                                                  style: _TextTheme.headlineLarge!.copyWith(
                                                                                                    color: Color(state.FilteredBubbleList![index].Color!),
                                                                                                    fontSize: 25,
                                                                                                    letterSpacing: 0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                                ),

                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          const SizedBox(height: 5,),
                                                                                          Container(
                                                                                            width: w / 2,
                                                                                            child:  Text(
                                                                                              "At ${ state.FilteredBubbleList![index].location.toString()}",
                                                                                              textAlign: TextAlign.left,
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              style: _TextTheme.headlineLarge!.copyWith(
                                                                                                fontSize: 17,
                                                                                                letterSpacing: 0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),

                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(height: 5,),
                                                                                           Text(state.FilteredBubbleList![index].Category.toString(), textAlign: TextAlign.left, style: TextStyle(
                                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                                              fontFamily: 'Red Hat Text',
                                                                                              fontSize: 12.222221851348877,
                                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              height: 1
                                                                                          ),)
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 5,),
                                                                                  SvgPicture.asset(
                                                                                    "Assets/images/Exclude.svg",
                                                                                    width: w/8,
                                                                                    color : Color(state.FilteredBubbleList![index].Color!),
                                                                                  ),

                                                                                ],
                                                                              )
                                                                            ],
                                                                          )

                                                                      ),
                                                                    ));




                                                              }
                                                          )
                                                      )
                                                  ):Container(),



                                              ],
                                            ),
                                                )
                                                :Text("")




                                          ],
                                        ),
                                ),
                              ),
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
                                                          if (state.Bubble_lat!=0 || state.Bubble_lng!=0) {
                                                              this.value = value;
                                                              _HomeBloc.add(ChangeSliderValue( (b) => b..value = value));
                                                              _HomeBloc.add(CreateBubbless((b)=>b
                                                                        ..Radius = value / 1.06
                                                                        ..lat = state.Bubble_lat
                                                                        ..lng = state.Bubble_lng));

                                                            }else{
                                                            CommingSoonPopup(context, h, w,  "Choose bubble location by clicking on any spot on map", "OK!", 18);

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
                                                        Dataa.lng =
                                                            centerLatLng!
                                                                .longitude;
                                                        Dataa.lat =
                                                            centerLatLng!
                                                                .latitude;
                                                        Dataa.raduis =
                                                            value.toInt();
                                                        var result = await


                                                        Navigator
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
                                                        ).then((value) {
                                                          if (value=="Yep!"){
                                                            CommingSoonPopup(Context, h, w, "Bubble was made Successfully","Sounds good!",24);

                                                          }
                                                        });


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


  CommingSoonPopup(
      BuildContext Context,
      double h,
      double w,
      String Value,
      String buttonValue,
      int FontSize
      ) async {
    return showDialog(
        context: Context,
        barrierDismissible: false,
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098),
                    topRight: Radius.circular(8.285714149475098),
                    bottomLeft: Radius.circular(8.285714149475098),
                    bottomRight: Radius.circular(8.285714149475098),
                  ),
                  color: Colors.transparent,
                ),


                child: Stack(
                  children: [

                    Positioned(
                      top: h/12.5,
                      child: Container(
                        width: w/1.4,
                        height: h/4.2,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(8.285714149475098),
                            topRight: Radius.circular(8.285714149475098),
                            bottomLeft: Radius.circular(8.285714149475098),
                            bottomRight: Radius.circular(8.285714149475098),
                          ),
                          color : Color.fromRGBO(47, 47, 47, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),


                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: FontSize.toDouble(),
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: h/15.5,
                                      width: w/2,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(4.142857074737549),
                                          topRight: Radius.circular(4.142857074737549),
                                          bottomLeft: Radius.circular(4.142857074737549),
                                          bottomRight: Radius.circular(4.142857074737549),
                                        ),
                                        boxShadow : [BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0,0),
                                            blurRadius: 6.628571510314941
                                        )],
                                        color : Color.fromRGBO(168, 48, 99, 1),
                                      ),
                                      child: Center(
                                        child:
                                        Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 14,
                                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w400,
                                            height: 1
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: h/8,
                      bottom: h/5,
                      child: SvgPicture.asset(
                        "Assets/images/widget.svg",
                        width: 90,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
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

    if (theme!) {
      getJsonFile('Assets/dark_map_style.json').then(setMapStyle);
    } else {
      getJsonFile('Assets/light_map_style.json').then(setMapStyle);
    }

  }

  void setMapStyle(String mapStyle) {
    _googleMapController?.setMapStyle(mapStyle);
  }

  Future<void> GetTHEME() async {
    theme = await pref.GetThemeON();

  }

  // Future<void> SetLatLng() async {
  //   await pref.SetLatLng(Lat!, Lng!);
  // }

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
String? Description;
int? Color;
int? id;
BuiltList<OrganizersListModel>? Organizers;
BuiltList<DatesEventListModel>?  dates;
BuiltList<UsersInsideBubbleListModel>?  users_in_bubble;
BuiltList<UsersInsideBubbleListModel>?  saved_users;
String? Creator_Alias="";
String? Creator_Color;
String? Creator_Avatar;
String? User_type;
bool? is_Saved;
String? Category;
}

class MyMarker extends StatelessWidget {
  // declare a global key and get it trough Constructor

  MyMarker(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;

  @override
  Widget build(BuildContext context) {
    // wrap your widget with RepaintBoundary and
    // pass your global key to RepaintBoundary
    return RepaintBoundary(
      key: globalKeyMyWidget,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 180,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          Container(
              width: 220,
              height: 150,
              decoration:
              BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    'Widget',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
