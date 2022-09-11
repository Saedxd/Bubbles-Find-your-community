// ignore_for_file: file_names, non_ant_identifier_names, ant_identifier_names
import 'dart:async';
import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/pages/CustomizeBubble_Screen.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/pages/Options_screen.dart';
import 'package:bubbles/UI/Onboarding/Login_screen/pages/Login_Page.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:bubbles/models/UserDataModel/User.dart';
import 'package:bubbles/models/UserDataModel/UserData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'dart:typed_data';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/pages/Events_Screen.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:bubbles/main.dart';
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
String Avatar="";
String Alias="";
int id=0;
String Background_Color = "";
int IS_Creator = 0;
int indexx =0;
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController _Primecontroller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _SearchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  final PanelController PanelControllerr = PanelController();
  final _formkey1 = GlobalKey<FormState>();
  final GlobalKey globalKey = GlobalKey();
  Location _locationTracker = Location();
  DateTime selectedDate = DateTime.now();
  Geolocator? instance = Geolocator();
  final _HomeBloc = sl<HomeBloc>();
  final pref = sl<IPrefsHelper>();
  Random random =  Random();
  final _key = GlobalKey();
  Data Dataa = Data();
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
  // LatLng? centerLatLng;
  geo.LocationPermission? permission;
  late geo.LocationSettings locationSettings;
  Marker? marker;
  LatLng? UserLocation;
  bool DiditOnces = false;
  var dataBytes;
  var bytes;
  bool doit = false;
  double? lat;
  double? lng;
  var distanceNearby;
  var distanceinside;
  var distance;
  int? locationslength;
  int? meters;
  double? coef;
  double? new_lat;
  double? new_long;
  double? User_lat= 0;
  double? User_long= 0;
  int counter = 0;
  GoogleMap? myMap;
  String Time_zonE= "";
  int counter2 =0;
  bool Diditoncessa =true;
  Uint8List? markerIcon;

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
    GetUserData();
      getCurrentLocation();
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
          statusBarColor: Color(0xff303030),
          systemNavigationBarColor: Color(0xff303030)
      ),
    );
    GetnearBybubbles();
    print(AllBubblesStatus);
    print(AllBubblesJoinStatusTry);
    FocuseNODE = FocusNode();
    location = Location();
    // GetTHEME();
    DiditOnces = true;
    _HomeBloc.add(GetAllBubbles());
    timer!=null
        ? timer!.cancel()
        : Text("NUll");
    // AllBubblesStatus = List.filled(100000,0);
    // AllBubblesStatusTry = List.filled(10000,true);
    // AllNearBubblesStatusTry = List.filled(10000,true);
    // AllBubblesIDS = List.filled(10000,0);
    diditonceee = true;
    _HomeBloc.add(GetNewBubbles());
    _HomeBloc.add(GetPopularNowBubbles());
    _HomeBloc.add(GetUpcomingBubbles());
    _HomeBloc.add(GetActiveBubbles());


    _SearchController.addListener(() {
      if (_SearchController.text.isEmpty){
        _HomeBloc.add(SearchBubblesList((b) =>
        b..Keyword =""
            ..Change_ViewStatus = false
        ));
      }
    });
  }
  List<bool> Save_Status_Detail_UI = List.filled(10000,false);
  List<int> BubbleIDS_Detail_UI = [];
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
                 counter2++;
                  markerIcon   = await  getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
                    if (counter2==1) {


                      for(int i=0;i<state.GetBubbles!.data!.length;i++) {

                        Save_Status_Detail_UI[i]= state.GetBubbles!.data![i].is_save!;
                        BubbleIDS_Detail_UI.add(state.GetBubbles!.data![i].id!);
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
                                Bubbledata.index = i;
                                Bubbledata.isAvailable =
                                state.GetBubbles!.data![i].is_available.toString()=="available"
                                    ? true
                                    :false;
                                Bubbledata.Category = state.GetBubbles!.data![i].category!.name!;
                                Bubbledata.Cateogory_Icon = state.GetBubbles!.data![i].category!.image!;
                                Bubbledata.Title = state.GetBubbles!.data![i].title.toString();
                                Bubbledata.location =  state.GetBubbles!.data![i].location.toString();

                                if (state.GetBubbles!.data![i].type.toString() != "Prime") {
                                  Bubbledata.StartDate = state.GetBubbles!.data![i].start_event_date.toString();
                                  Bubbledata.endDate =  state.GetBubbles!.data![i].end_event_date .toString();
                                  Bubbledata.dates = state.GetBubbles!.data![i].dates;

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
                                    b) => b..Bubbledata = Bubbledata..Status = true));
                              })
                            ..marker = Marker(
                              markerId: MarkerId(
                                  (state.GetBubbles!.data![i].id! + 1000)
                                      .toString()),
                              position: LatLng(state.GetBubbles!.data![i].lat!,
                                  state.GetBubbles!.data![i].lng!),
                              icon: BitmapDescriptor.fromBytes(markerIcon!),
                              onTap: () {
                                BubbleData Bubbledata = BubbleData();
                                Bubbledata.index = i;
                                Bubbledata.isAvailable =
                                state.GetBubbles!.data![i].is_available.toString()=="available"
                                    ? true
                                    :false;
                                Bubbledata.Category = state.GetBubbles!.data![i].category!.name!;
                                Bubbledata.Cateogory_Icon = state.GetBubbles!.data![i].category!.image!;
                                Bubbledata.users_in_bubble = state.GetBubbles!.data![i].users_in_bubble!;
                                Bubbledata.saved_users = state.GetBubbles!.data![i].saved_users!;
                                Bubbledata.Title = state.GetBubbles!.data![i].title.toString();
                                Bubbledata.location =  state.GetBubbles!.data![i].location.toString();

                                if (state.GetBubbles!.data![i].type.toString() !=  "Prime") {
                                  Bubbledata.StartDate =state.GetBubbles!.data![i].start_event_date.toString();
                                  Bubbledata.endDate = state.GetBubbles!.data![i].end_event_date.toString();
                                  Bubbledata.dates = state.GetBubbles!.data![i].dates;
                                }
                                //Prime
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
                                    state.GetBubbles!.data![i].description .toString();

                                Bubbledata.Organizers =   state.GetBubbles!.data![i].organizers!;

                                Bubbledata.is_Saved = state.GetBubbles!.data![i].is_save!;

                                // Bubbledata.dates = state.GetPrimeBubbles!.data![i].dates!;
                                String Value = state.GetBubbles!.data![i].color
                                    .toString();

                                if (Value.contains("#", 0)) {
                                  Value = Value.substring(1);
                                  Value = "0xff$Value";
                                }
                                var myInt = int.parse(Value);
                                var BackgroundColor = myInt;
                                print( Bubbledata.type);

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
                      _HomeBloc.add(SaveStatusInDetailUi((b) => b
                        ..status=Save_Status_Detail_UI
                          ..Bubble_IDS = BubbleIDS_Detail_UI
                      ));
                    }

                  locationslength = state.locationn!.length;

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


                         if ((distanceNearby / 1000) <= 5 &&
                             !AllNearBubblesStatusTry![i]) {

                           // print("there is a bubble ${(distanceNearby / 1000)
                           //     .toString()
                           //     .substring(0, 4)} KM ahead of me ");
                           // print("${(distanceNearby / 1000).toString().substring(3)}");
                          print("near by test");
                           AllNearBubblesStatusTry![i] = true;
                           _HomeBloc.add(NotifyNearBubble((b) =>
                           b
                             ..Title = "${state.locationn![i].Title} Event"
                             ..Distance = "${distanceNearby.toStringAsFixed(2)} M"
                           ));
                         }


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


                     }



                  // }catch (e){
                  //   print(e);
                  // }
                }

                if (state.GetAllBubblesSuccess! && diditonceee == true){
                  GetUserData();
                  diditonceee = false;
                  LoopOnAllBUbbles(state);
                  if (widget.OpenPanel!)
                    PanelControllerr.open();
                  timer = Timer.periodic(Duration(seconds: 30), (Timer t)async{
                    return
                      LoopOnAllBUbbles(state);
                  });


                }
                else if (state.GetAllBubblesError== "Something went wrong"){
                  if (state.GetBubbles==null) {
                    AllBubblesStatus = List.filled(100000,0);
                    AllBubblesJoinStatusTry = List.filled(10000,false);
                    AllBubblesLeftStatusTry = List.filled(10000,true);
                    AllNearBubblesStatusTry = List.filled(10000,true);
                    AllBubblesIDS = List.filled(10000,0);
                    setlogout();
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) =>
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            Login()), (Route<dynamic> route) => false));
                  }
                }


                return WillPopScope(
                  onWillPop: () async => false,
                  child: Scaffold(
                    key: _scaffoldKey,
                    body: SafeArea(
                      child: Stack(
                          children:[

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

                              _HomeBloc.add(SetNewBubble((b) => b
                                ..Radius = value
                                ..lat = location.latitude
                                ..lng = location.longitude));
                            }
                          },


                          zoomControlsEnabled: false,
                          circles: state.GetAllBubblesIsloading!
                              ? Loading
                              :  state.MakeHimBEableTOSEtBubble!
                          ?state.NewBubble_circle!
                              :  state.circle!,

                          mapType: MapType.hybrid,
                          markers: state.GetAllBubblesIsloading!
                              ? LOadingg
                              : state.MakeHimBEableTOSEtBubble!
                              ?  state.NewBubble_marker2!
                              : state.marker2!,


                          initialCameraPosition: CameraPosition(
                              target: LatLng(state.Userlat, state.Userlng),
                              zoom: 12.151926040649414),
                          onMapCreated: (controller) {

                            _googleMapController = controller;
                            _controller.complete(controller);
                            isMapCreated = true;
                            // changeMapMode();
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
                            if (state.DetailBubbledata!.type.toString() =="Prime"){
                              // WidgetsBinding
                              //     .instance
                              //     .adspostFrameCallback((_) =>
                              //     Navigator
                              //         .push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) =>
                              //             PrimePlan_page(
                              //               Bubble: state.DetailBubbledata,
                              //               my_id:id,),
                              //       ),
                              //     ));
                              var test =   Navigator
                                  .push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PrimePlan_page(
                                        Bubble: state.DetailBubbledata,
                                        my_id:id,
                                        List_Type: "PRIME",
                                        is_saved: state.DetailUiSaveStatus![state.DetailBubbledata!.index!],
                                      ),
                                ),
                              ).then((value) {
                                bool status = false;

                                if (value=="true"){
                                  status = true;
                                }else if (value=="false"){
                                  status = false;
                                }
                                print(value);
                                if (state.DetailUiSaveStatus![state.DetailBubbledata!.index!]==status) {
                                  print( "Gucci");

                                }
                                else {
                                  for (int i = 0; i <state.BUBBLElistS4!.length; i++) {

                                    if (state.BUBBLElistS4![i].id == state.DetailBubbledata!.id)


                                      _HomeBloc
                                          .add(
                                          ToggleSaveBubble((b) =>
                                          b
                                            ..Bubble_id =state.BUBBLElistS4![i].id
                                            ..index =i
                                            ..List_type = 'PRIME'
                                            ..Saved_Status = state.BUBBLElistS4![i].is_Saved
                                            ..Want_Request = false
                                          )
                                      );
                                  }

                               //   for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                 //   if (state.BUBBLElistS4![index2].id==state.DetailUiSaveID![state.DetailBubbledata!.index!])
                                      _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                        ..index = state.DetailBubbledata!.index!
                                        ..status = !state.DetailUiSaveStatus![state.DetailBubbledata!.index!]
                                        ..Want_Request = false
                                      ));
                                  //}
                                }
                                }
                              );

                            }
                            else {
                              var test =   Navigator
                                  .push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Plan_Screen(
                                        Bubble: state.DetailBubbledata,
                                        my_id:id,
                                        List_Type: "PRIME",
                                    is_saved: state.DetailUiSaveStatus![state.DetailBubbledata!.index!],
                                      ),
                                ),
                              ).then((value) {
                                bool status = false;

                                if (value=="true"){
                                  status = true;
                                }else if (value=="false"){
                                  status = false;
                                }
                                print(value);
                                if (state.DetailUiSaveStatus![state.DetailBubbledata!.index!]==status) {
                                  print( "Gucci");

                                }
                                else {
                                  // for (int i = 0; i <state.BUBBLElistS4!.length; i++) {
                                  //
                                  //   if (state.BUBBLElistS4![i].id == state.DetailBubbledata!.id)
                                  //
                                  //
                                  //     _HomeBloc
                                  //         .add(
                                  //         ToggleSaveBubble((b) =>
                                  //         b
                                  //           ..Bubble_id =state.BUBBLElistS4![i].id
                                  //           ..index =i
                                  //           ..List_type = 'PRIME'
                                  //           ..Saved_Status = state.BUBBLElistS4![i].is_Saved
                                  //           ..Want_Request = false
                                  //         )
                                  //     );
                                  // }
                                  for(int i=0;i<state.BUBBLElistS1!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS1![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'New Bubbles'
                                            ..Saved_Status =   state.BUBBLElistS1![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }
                                  for(int i=0;i<state.BUBBLElistS4!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS4![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'PRIME'
                                            ..Saved_Status =   state.BUBBLElistS4![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }
                                  for(int i=0;i<state.BUBBLElistS2!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS2![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'Nearby'
                                            ..Saved_Status =   state.BUBBLElistS2![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }
                                  for(int i=0;i<state.BUBBLElistS3!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS3![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'Popular Now'
                                            ..Saved_Status =   state.BUBBLElistS3![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }
                                  for(int i=0;i<state.BUBBLElistS5!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS5![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'Upcoming Bubbles'
                                            ..Saved_Status =   state.BUBBLElistS5![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }

                                  for(int i=0;i<state.BUBBLElistS6!.length;i++){
                                    if (state.DetailBubbledata!.id==state.BUBBLElistS6![i].id){
                                      _HomeBloc.add(
                                          ToggleSaveBubble((b) => b
                                            ..index = i
                                            ..List_type = 'Active Bubbles'
                                            ..Saved_Status =   state.BUBBLElistS6![i].is_Saved!
                                            ..Want_Request = false
                                          )
                                      );
                                    }
                                  }
                                      _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                          ..index = state.DetailBubbledata!.index!
                                          ..status = !state.DetailUiSaveStatus![state.DetailBubbledata!.index!]
                                          ..Want_Request = false
                                        ));
                                }
                              }
                              );
                              // WidgetsBinding
                              //     .instance
                              //     .adspostFrameCallback((_) =>
                              //     Navigator
                              //         .push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) =>
                              //             Plan_Screen(
                              //               Bubble: state.DetailBubbledata,
                              //               my_id: id,),
                              //       ),
                              //     ));
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
                                        topLeft: Radius.circular(h/4),
                                        topRight:Radius.circular(h/4),
                                        bottomLeft: Radius.circular(h/4),
                                        bottomRight:Radius.circular(h/4),
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
                                        width: w/2,
                                        child: Row(
                                              children: [

                                                Container(
                                                      child: Text(state.DetailBubbledata!.Title!,
                                                        textAlign: TextAlign.left,
                                                        style : GoogleFonts.roboto().copyWith(
                                                                overflow: TextOverflow.ellipsis,
                                                          color:  Color(state.DetailBubbledata!.Color!),
                                                            fontSize: 11.sp,
                                                          letterSpacing: 0 ,
                                                          fontWeight: FontWeight.w600,
                                                          height: 1
                                                      ),),
                                                    ),

                                                InkWell(
                                                    onTap: (){

                                                      for(int i=0;i<state.BUBBLElistS1!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS1![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'New Bubbles'
                                                                ..Saved_Status =   state.BUBBLElistS1![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }
                                                      for(int i=0;i<state.BUBBLElistS4!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS4![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'PRIME'
                                                                ..Saved_Status =   state.BUBBLElistS4![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }
                                                      for(int i=0;i<state.BUBBLElistS2!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS2![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'Nearby'
                                                                ..Saved_Status =   state.BUBBLElistS2![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }
                                                      for(int i=0;i<state.BUBBLElistS3!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS3![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'Popular Now'
                                                                ..Saved_Status =   state.BUBBLElistS3![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }
                                                      for(int i=0;i<state.BUBBLElistS5!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS5![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'Upcoming Bubbles'
                                                                ..Saved_Status =   state.BUBBLElistS5![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }

                                                      for(int i=0;i<state.BUBBLElistS6!.length;i++){
                                                        if (state.DetailBubbledata!.id==state.BUBBLElistS6![i].id){
                                                          _HomeBloc.add(
                                                              ToggleSaveBubble((b) => b
                                                                ..index = i
                                                                ..List_type = 'Active Bubbles'
                                                                ..Saved_Status =   state.BUBBLElistS6![i].is_Saved!
                                                                ..Want_Request = false
                                                              )
                                                          );
                                                        }
                                                      }

                                                      //
                                                      // if (event.List_type=='New Bubbles'){
                                                      //   state.BUBBLElistS1![event.index!].is_Saved = !event.Saved_Status!;
                                                      //
                                                      // }else if (event.List_type=='Nearby'){
                                                      //
                                                      //   state.BUBBLElistS2![event.index!].is_Saved = !event.Saved_Status!;
                                                      //
                                                      //
                                                      // }else if (event.List_type=='Popular Now'){
                                                      //   state.BUBBLElistS3![event.index!].is_Saved = !event.Saved_Status!;
                                                      //
                                                      // }else if (event.List_type=='Upcoming Bubbles'){
                                                      //   state.BUBBLElistS5![event.index!].is_Saved = !event.Saved_Status!;
                                                      // }
                                                      // else if (event.List_type== "Search"){
                                                      //   state.FilteredBubbleList![event.index!].is_Saved = !event.Saved_Status!;
                                                      // }else if (event.List_type=='Active Bubbles'){
                                                      //   state.BUBBLElistS6![event.index!].is_Saved = !event.Saved_Status!;
                                                      // }

                                                      // for(int i=0;i<state.BUBBLElistS1!.length;i++){
                                                      //   if (state.DetailBubbledata!.id==state.BUBBLElistS1![i].id){
                                                      //     _HomeBloc.add(
                                                      //         ToggleSaveBubble((b) => b
                                                      //           ..index = i
                                                      //           ..List_type = 'New Bubbles'
                                                      //           ..Saved_Status =   state.BUBBLElistS3![i].is_Saved!
                                                      //           ..Want_Request = false
                                                      //         )
                                                      //     );
                                                      //   }
                                                      // }

                                                      _HomeBloc.add(ChangeSaveStatusInDetailUi(
                                                              (b) => b
                                                            ..index= state.DetailBubbledata!.index
                                                            ..status = !state.DetailUiSaveStatus![state.DetailBubbledata!.index!]
                                                            ..bubble_id = state.DetailBubbledata!.id
                                                            ..Want_Request = true
                                                      ));


                                                    },
                                                  child: Container(
                                                      height: h/65,
                                                      margin: EdgeInsets.only(bottom: h/500),
                                                      child:
                                                      SvgPicture.asset(
                                                        !state.DetailUiSaveISloading!?
                                                        state.DetailUiSaveStatus![state.DetailBubbledata!.index!]?
                                                       "Assets/images/Save_Marker(1).svg":
                                                        "Assets/images/Save_outline.svg"
                                                        :""
                                                        ,

                                                        color:  Color(state.DetailBubbledata!.Color!),
                                                      )
                                                  ),
                                                ),

                                              ],
                                            ),
                                        ),
                                            SizedBox(height: w/65,),
                                            Container(
                                             width: w/2.2,
                                        child:
                                       Text('At ${state.DetailBubbledata!.location!}',
                                            textAlign: TextAlign.left,
                                            style : GoogleFonts.roboto().copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                color: Color.fromRGBO(96, 96, 96, 1),
                                                fontSize: 8.5.sp,
                                                letterSpacing: 0 ,
                                                fontWeight: FontWeight.w600,
                                                height: 1
                                            ),),
                                       
                                      ),

                                            SizedBox(height: w/65,),
                                            state.DetailBubbledata!.type.toString() =="Prime"
                                                ?  Row(
                                                  children: [
                                                    Text(
                                              'Prime bubble',
                                              textAlign: TextAlign.left,
                                              style: _TextTheme.headlineLarge!.copyWith(
                                                    color: Color.fromRGBO(96, 96, 96, 1),
                                                fontSize: 6.5.sp,
                                                    letterSpacing: 0,
                                                    fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                                  ],
                                                )
                                                :  Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [

                                                CircleAvatar(radius: 8,
                                                  backgroundImage: NetworkImage(state.DetailBubbledata!.Creator_Avatar!),
                                                  backgroundColor: Color(int.parse(state.DetailBubbledata!.Creator_Color!)),
                                                ),
                                                SizedBox(width: w/70,),
                                                Text(state.DetailBubbledata!.Creator_Alias!,
                                                  textAlign: TextAlign.left, style: TextStyle(
                                                    color: Color.fromRGBO(96, 96, 96, 1),
                                                    fontFamily: 'Red Hat Display',
                                                      fontSize: 6.5.sp,
                                                    letterSpacing: 0 ,
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
                                                Stack(
                                                    children: [
                                                      SvgPicture.asset(
                                                        "Assets/images/Exclude.svg",
                                                        color : Color(state.DetailBubbledata!.Color!),
                                                        width: h/9,
                                                      ),

                                                      Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: 0,
                                                          left: 0,
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                      width: h/50,
                                                                  child: Image.network(state.DetailBubbledata!.Cateogory_Icon!,fit: BoxFit.fill,)),
                                                            ],
                                                          ))
                                                    ],
                                                )
                                           
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



                            state.is_Creator!
                                ? !state.ShowBubbleDetailsUI!
                            ?Positioned(
                                    bottom: h / 50,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {

                                        _HomeBloc.add(ShowDialoog());
                                        // MYcolor = Color(
                                        //         (math.Random().nextDouble() *
                                        //                 0xFFFFFF)
                                        //             .toInt())
                                        //     .withOpacity(1.0);
                                      },
                                      child: Container(
                                        margin:
                                             EdgeInsets.only(bottom: 10.h),
                                        child: Stack(children: [
                                          SvgPicture.asset(
                                            "Assets/images/widget.svg",
                                            width: 90.w,
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
                                                  // await getCenter();

                                                  _HomeBloc.add(ShowDialoog());
                                                }),
                                          ),
                                        ]),
                                      ),
                                    ))
                             :Text("")
                                : Text(""),
                       
                            // state.BUBBLElistS3!.length== 0&& state.BUBBLElistS2!.length == 0 && state.BUBBLElistS1!.length== 0 && state.BUBBLElistS6!.length== 0 && state.BUBBLElistS5!.length== 0&& state.BUBBLElistS4!.length== 0
                            //     ?  Text("")
                            //     :
                            ShowCaseWidget(
                                builder: wid.Builder(
                                  builder: (context) => SlidingUpPanel(
                                    controller: PanelControllerr,
                                    color: ColorS.onPrimaryContainer,
                                    maxHeight:  h,
                                    // state.BUBBLElistS3!.length== 0&& state.BUBBLElistS2!.length == 0 && state.BUBBLElistS1!.length== 0 && state.BUBBLElistS6!.length== 0 && state.BUBBLElistS5!.length== 0
                                    //     ?h/2.4
                                    // :h,


                                    minHeight: h/20,
                                    onPanelOpened:(){
                                      print("BUBBLElistS3!.length : ${state.BUBBLElistS3!.length}");
                                      print("BUBBLElistS2!.length : ${state.BUBBLElistS2!.length}");
                                      print("BUBBLElistS1!.length : ${state.BUBBLElistS1!.length}");
                                      print("BUBBLElistS5!.length : ${state.BUBBLElistS5!.length}");
                                      print("BUBBLElistS6!.length : ${state.BUBBLElistS6!.length}");
                                      print("BUBBLElistS4!.length : ${state.BUBBLElistS4!.length}");

                                    },
                                    borderRadius:  BorderRadius.only(
                                      topLeft: Radius.circular(h/40),
                                      topRight: Radius.circular(h/40),
                                    ),
                                    panel:  Container(
                                      width: w,
                                      height:h,
                                      // state.BUBBLElistS3!.length== 0&& state.BUBBLElistS2!.length == 0 && state.BUBBLElistS1!.length== 0 && state.BUBBLElistS6!.length== 0 && state.BUBBLElistS5!.length== 0
                                      //     ?h/2.5
                                      //     :h,
                                      child:Column(
                                        children:[
                                          SizedBox(
                                            height: h / 70,
                                          ),
                                          Container(
                                            width: w / 3.9,
                                            height: h / 130,
                                            decoration: BoxDecoration(
                                              borderRadius:  BorderRadius.only(
                                                topLeft: Radius.circular(20.r),
                                                topRight: Radius.circular(20.r),
                                                bottomLeft: Radius.circular(20.r),
                                                bottomRight: Radius.circular(20.r),
                                              ),
                                              color: ColorS.onTertiary,
                                            ),
                                            //
                                          ),
                                          !widget.OpenPanel!?
                                          SizedBox(
                                            height: h / 16,
                                          ):Container(),
                                          !state.ChangeViewStatus!
                                              ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      width: w/1.8,
                                                      height: h/15,
                                                      child: Row(
                                                        children: [
                                                          Text(

                                                            '      Nearest Primes',
                                                            textAlign: TextAlign.left,
                                                            style: _TextTheme.headlineLarge!.copyWith(
                                                              fontSize: 14.sp,
                                                              letterSpacing: 0,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(width: 4,),

                                                          InkWell(
                                                            onTap: () {
                                                              try {
                                                                _Primecontroller
                                                                    .animateTo(
                                                                  _Primecontroller
                                                                      .position
                                                                      .minScrollExtent,
                                                                  duration: Duration(
                                                                      milliseconds: 2000),
                                                                  curve: Curves
                                                                      .easeIn,
                                                                );
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                      (_) =>
                                                                      ShowCaseWidget
                                                                          .of(
                                                                          context)
                                                                          !.startShowCase(
                                                                        [
                                                                          _key,
                                                                        ],
                                                                      ),
                                                                );
                                                              }catch(e){
                                                                print(e);
                                                              }
                                                            },
                                                            child:  Container(
                                                                width: w / 10,
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
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    SizedBox(width: 5,),
                                                    SizedBox(width: 5,),
                                                    state.BUBBLElistS4!.length!=0
                                                    ?InkWell(
                                                      onTap: (){

                                                        var test =      Navigator
                                                            .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => Events_Screen(
                                                                Bubble: state.BUBBLElistS4!,
                                                                Type: 'Nearby Primes',
                                                                my_id: id
                                                            ),
                                                          ),
                                                        );
                                                        //     .then((value) {
                                                        //   bool status = false;
                                                        //
                                                        //   if (value =="Yes!") {
                                                        //
                                                        //
                                                        //     for (int k = 0; k <Event_IDS!.length; k++) {
                                                        //
                                                        //
                                                        //         for (int i = 0; i< state.BUBBLElistS4!.length; i++) {
                                                        //           if (Event_IDS![k] ==state.BUBBLElistS4![i].id)
                                                        //              if (Event_Statuses![k] != state.BUBBLElistS4![i].is_Saved )
                                                        //             _HomeBloc.add(ToggleSaveBubble((b) =>  b
                                                        //               ..Bubble_id = state.BUBBLElistS4![i].id
                                                        //               ..index = i
                                                        //               ..List_type = 'PRIME'
                                                        //               ..Saved_Status = state.BUBBLElistS4![i].is_Saved!
                                                        //               ..Want_Request = false
                                                        //             )
                                                        //             );
                                                        //         }
                                                        //
                                                        //
                                                        //       for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                        //         if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                        //           if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                        //           _HomeBloc.add(
                                                        //               ChangeSaveStatusInDetailUi((b) => b
                                                        //                ..index = i
                                                        //                 ..status = !state.DetailUiSaveStatus![i]
                                                        //                 ..Want_Request = false
                                                        //               ));
                                                        //       }
                                                        //       ///
                                                        //
                                                        //
                                                        //
                                                        //       for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                        //         if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                        //           if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                        //             _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                        //               ..index = i
                                                        //               ..List_type = Type
                                                        //               ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                        //               ..Want_Request = false
                                                        //             ));
                                                        //       }
                                                        //
                                                        //
                                                        //
                                                        //         for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                        //           if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                        //             if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                        //               _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                        //                 ..index = i
                                                        //                 ..List_type = Type
                                                        //                 ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                        //                 ..Want_Request = false
                                                        //               ));
                                                        //         }
                                                        //
                                                        //
                                                        //         for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                        //           if (Event_IDS![k] == state.BUBBLElistS2![i].id)
                                                        //             if (Event_Statuses![k]!=state.BUBBLElistS2![i].is_Saved)
                                                        //               _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                        //                 ..index = i
                                                        //                 ..List_type = Type
                                                        //                 ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                        //                 ..Want_Request = false
                                                        //               ));
                                                        //         }
                                                        //
                                                        //         for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                        //           if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                        //             if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                        //               _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                        //                 ..index = i
                                                        //                 ..List_type = Type
                                                        //                 ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                        //                 ..Want_Request = false
                                                        //               ));
                                                        //         }
                                                        //
                                                        //
                                                        //         for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                        //           if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                        //             if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                        //               _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                        //                 ..index = i
                                                        //                 ..List_type = Type
                                                        //                 ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                        //                 ..Want_Request = false
                                                        //               ));
                                                        //         }
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //
                                                        //     }
                                                        //   }
                                                        // });



                                                      },
                                                      child: Text('       See all',
                                                        textAlign: TextAlign.right,
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(207, 109, 56, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 11.sp,
                                                            letterSpacing: 0 ,
                                                            fontWeight: FontWeight.w400,
                                                            height: 1
                                                        ),),
                                                    ):Text(""),
                                                    SizedBox(width: 0,),
                                                  ],
                                                ),
                                                state.BUBBLElistS4!.length!=0
                                                    ?Column(
                                                  children: [
                                                    state.GetNewBubblesSuccess!
                                                        ? Row(
                                                      children: [
                                                        Container(
                                                          width: w,
                                                          height: h /4.6,
                                                          padding: EdgeInsets.only(left: w/20),
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

                                                                      var test =   Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PrimePlan_page(
                                                                                Bubble:state.BUBBLElistS4![index2],
                                                                                my_id: id ,    List_Type: "PRIME",  is_saved: state.BUBBLElistS4![index2].is_Saved,  ),
                                                                        ),
                                                                      ).then((value) {
                                                                        bool status = false;
                                                                        print(value);
                                                                        if (value=="true"){
                                                                          status = true;
                                                                        }else if (value=="false"){
                                                                          status = false;
                                                                        }
                                                                        if (state.BUBBLElistS4![index2].is_Saved==status) {
                                                                          print( "Gucci");

                                                                        }
                                                                        else{
                                                                          _HomeBloc
                                                                              .add(
                                                                              ToggleSaveBubble(( b) =>  b
                                                                                ..Bubble_id = state.BUBBLElistS4![index2].id
                                                                                ..index = index2
                                                                                ..List_type = 'PRIME'
                                                                                ..Saved_Status = state.BUBBLElistS4![index2] .is_Saved!
                                                                                ..Want_Request = false
                                                                              )
                                                                          );
                                                                          for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                            if (state.BUBBLElistS4![index2].id==state.DetailUiSaveID![i])
                                                                              _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                ..index = i
                                                                                ..status = !state.DetailUiSaveStatus![i]
                                                                                ..Want_Request = false
                                                                              ));
                                                                          }
                                                                        }
                                                                      });


                                                                    },
                                                                    child:



                                                                    Container(
                                                                      width: w/2.5,
                                                                      height: h / 8,
                                                                      // margin: EdgeInsets.only(left: h/40),
                                                                      padding: EdgeInsets.only(top: h/300,),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius : BorderRadius.only(
                                                                          topLeft: Radius.circular(h/1.233),
                                                                          topRight: Radius.circular(h/1.233),
                                                                          bottomRight: Radius.circular(h/10),
                                                                          bottomLeft:  Radius.circular(h/10),
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
                                                                                  width: w/2.4,
                                                                                  height: h / 6,
                                                                                  margin: EdgeInsets.only(left: w/500,right: w/500),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(364.2384033203125.r),
                                                                                      topRight: Radius.circular(364.2384033203125.r),
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
                                                                                          blurRadius: 15.628571510314941.w
                                                                                      )],

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
                                                                                    fontSize: 6.3.sp,
                                                                                    letterSpacing: 0 ,
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
                                                                                  SizedBox(height: 1,),
                                                                                  Column(
                                                                                    children: [
                                                                                      SizedBox(height: 3,),
                                                                                      Stack(
                                                                                        children: [
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(BackgroundColor),
                                                                                            width: w/12.8,
                                                                                          ),
                                                                                          Positioned(
                                                                                              left: 0,
                                                                                              right: 0,
                                                                                              top: 2,
                                                                                              bottom: 0,
                                                                                              child:  Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: w/60,
                                                                                                    child:
                                                                                                    Image.network(state.BUBBLElistS4![index2].Cateogory_Icon!,  fit: BoxFit.fill,),
                                                                                                  )      ],
                                                                                              ))

                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(height: 7,),
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          width: w/4.2,
                                                                                          color: Colors.transparent,
                                                                                          child: Text(state.BUBBLElistS4![index2].Title.toString(),
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                            textAlign: TextAlign.left,   style : GoogleFonts.roboto().copyWith(
                                                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                fontSize: 11.sp,
                                                                                                letterSpacing: 0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                height: 1
                                                                                            ),),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(height: 1,),
                                                                                      Container(
                                                                                        width: w/4.2,
                                                                                        child: Text(state.BUBBLElistS4![index2].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                            fontFamily: 'Red Hat Text',
                                                                                            fontSize: 6.5.sp,
                                                                                            letterSpacing: 0 ,
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
                                                                  :  InkWell(
                                                                onTap: () {

                                                                  var test =   Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          PrimePlan_page(
                                                                            Bubble:state.BUBBLElistS4![index2],
                                                                            my_id: id ,    List_Type: "PRIME",  is_saved: state.BUBBLElistS4![index2].is_Saved,  ),
                                                                    ),
                                                                  ).then((value) {
                                                                    bool status = false;
                                                                    print(value);
                                                                    if (value=="true"){
                                                                      status = true;
                                                                    }else if (value=="false"){
                                                                      status = false;
                                                                    }
                                                                    if (state.BUBBLElistS4![index2].is_Saved==status) {
                                                                      print( "Gucci");

                                                                    }
                                                                    else{
                                                                      _HomeBloc
                                                                          .add(
                                                                          ToggleSaveBubble(( b) =>  b
                                                                            ..Bubble_id = state.BUBBLElistS4![index2].id
                                                                            ..index = index2
                                                                            ..List_type = 'PRIME'
                                                                            ..Saved_Status = state.BUBBLElistS4![index2] .is_Saved!
                                                                            ..Want_Request = false
                                                                          )
                                                                      );
                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                        if (state.BUBBLElistS4![index2].id==state.DetailUiSaveID![i])
                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                            ..index = i
                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                            ..Want_Request = false
                                                                          ));
                                                                      }
                                                                    }
                                                                  });


                                                                },
                                                                child:



                                                                Container(
                                                                  width: w/2.5,
                                                                  height: h / 8,
                                                                  // margin: EdgeInsets.only(left: h/40),
                                                                  padding: EdgeInsets.only(top: h/300,),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius : BorderRadius.only(
                                                                      topLeft: Radius.circular(h/1.233),
                                                                      topRight: Radius.circular(h/1.233),
                                                                      bottomRight: Radius.circular(h/10),
                                                                      bottomLeft:  Radius.circular(h/10),
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
                                                                              width: w/2.4,
                                                                              height: h / 6,
                                                                              margin: EdgeInsets.only(left: w/500,right: w/500),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius : BorderRadius.only(
                                                                                  topLeft: Radius.circular(364.2384033203125.r),
                                                                                  topRight: Radius.circular(364.2384033203125.r),
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
                                                                                      blurRadius: 15.628571510314941.w
                                                                                  )],

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
                                                                                fontSize: 6.3.sp,
                                                                                letterSpacing: 0 ,
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
                                                                              SizedBox(height: 1,),
                                                                              Column(
                                                                                children: [
                                                                                  SizedBox(height: 3,),
                                                                                  Stack(
                                                                                    children: [
                                                                                      SvgPicture.asset(
                                                                                        "Assets/images/Exclude.svg",
                                                                                        color : Color(BackgroundColor),
                                                                                        width: w/12.8,
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 0,
                                                                                          right: 0,
                                                                                          top: 2,
                                                                                          bottom: 0,
                                                                                          child:  Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: w/60,
                                                                                                child:
                                                                                                Image.network(state.BUBBLElistS4![index2].Cateogory_Icon!,  fit: BoxFit.fill,),
                                                                                              )      ],
                                                                                          ))

                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  SizedBox(height: 7,),
                                                                                  Flexible(
                                                                                    child: Container(
                                                                                      width: w/4.2,
                                                                                      color: Colors.transparent,
                                                                                      child: Text(state.BUBBLElistS4![index2].Title.toString(),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,   style : GoogleFonts.roboto().copyWith(
                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                            fontSize: 11.sp,
                                                                                            letterSpacing: 0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            height: 1
                                                                                        ),),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 1,),
                                                                                  Container(
                                                                                    width: w/4.2,
                                                                                    child: Text(state.BUBBLElistS4![index2].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                                        fontFamily: 'Red Hat Text',
                                                                                        fontSize: 6.5.sp,
                                                                                        letterSpacing: 0 ,
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
                                                            Center(child:  Text("Waiting...")),
                                                          ),
                                                        ),
                                                      ],
                                                    ),



                                                  ],
                                                )
                                                    :Column(
                                                    children: [

                                                      Container(
                                                      width: w/1.2,
                                                        margin: EdgeInsets.only(left: w/23),
                                                        child: Text('Looks like there are no Prime Bubbles in your area! Help us create a better experience!', textAlign: TextAlign.left, style: TextStyle(
                                                            color: Color.fromRGBO(234, 234, 234, 1),
                                                            fontFamily: 'Red Hat Display',
                                                            fontSize: 14.sp,
                                                            letterSpacing: 0.5 ,
                                                            fontWeight: FontWeight.w300,
                                                            height: 1
                                                        ),),
                                                      ),
                                                      SizedBox(height: h/50,),

                                                      Container(
                                                        width: w/1.2,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                                width: w/2.3,
                                                                height: h/15,
                                                                decoration: BoxDecoration(
                                                                  borderRadius : BorderRadius.only(
                                                                    topLeft: Radius.circular( h/20.5),
                                                                    topRight:Radius.circular( h/20.5),
                                                                    bottomLeft: Radius.circular( h/20.5),
                                                                    bottomRight:Radius.circular( h/20.5),
                                                                  ),
                                                                  boxShadow : [BoxShadow(
                                                                      color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                                                      offset: Offset(0,0),
                                                                      blurRadius: 8.609625816345215
                                                                  )],
                                                                  color : Color.fromRGBO(207, 109, 56, 1),
                                                                ),
                                                              child: Center(
                                                                  child:
                                                                  Text('Suggest Primes', textAlign: TextAlign.center, style: TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Text',
                                                                      fontSize: 15.5.sp,
                                                                      letterSpacing: 0.2,
                                                                      fontWeight: FontWeight.w400,
                                                                      height: 1
                                                                  ),),
                                                              ),
                                                            ),
                                                            Text(""),
                                                            Text(""),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                )

                                              ],
                                          )

                                                  :Container(),


                                           SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: w,
                                            child: Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(left: w/25,right: w/40),
                                                    decoration:  BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius.circular(15.r),
                                                        bottomRight: Radius.circular(15.r),
                                                        topLeft: Radius.circular(15.r),
                                                        topRight: Radius.circular(15.r),
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
                                                        style:  TextStyle(
                                                            color: Colors.brown,
                                                          fontSize: 12.sp,
                                                          height: 1.1,
                                                        ),
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(30.0.r),
                                                            borderSide:  BorderSide(
                                                                color: Color(0xffC4C4C4),
                                                                width: 10),
                                                          ),
                                                          focusedBorder:
                                                           OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(30.0.r)),
                                                            borderSide: BorderSide(
                                                                color: Color(0xffC4C4C4),
                                                                width: 2),
                                                          ),
                                                          enabledBorder:
                                                           OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(30.0.r)),
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
                                                          hintStyle:GoogleFonts.roboto().copyWith(

                                                              letterSpacing: 0.5,
                                                              fontWeight: FontWeight.w300,
                                                              height: 1,
                                                            fontSize: 12.sp,

                                                          ),
                                                        ),
                                                        keyboardType: TextInputType.text,
                                                      ),
                                                    )),

                                                Expanded(
                                                  child: InkWell(
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
                                                ),


                                                Expanded(
                                                  child: InkWell(
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
                                                ),


                                                SizedBox(width: 5,),

                                              ],
                                            ),
                                          ),
                                          state.BUBBLElistS1!.length!= 0||state.BUBBLElistS3!.length!= 0|| state.BUBBLElistS2!.length != 0 || state.BUBBLElistS5!.length!= 0 || state.BUBBLElistS6!.length!= 0
                                              ?Expanded(
                                            child: Container(
                                              width: w,
                                              height:state.Searchsuccess!?h/1.1: h/1.7,

                                              child: Column(
                                                children: [


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
                                                                ?  Column(
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
                                                                          'Popular Now',
                                                                          textAlign: TextAlign.left,
                                                                          style: _TextTheme
                                                                              .headlineLarge!
                                                                              .copyWith(
                                                                            fontSize: 14.sp,
                                                                            letterSpacing: 0,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 5,),
                                                                      InkWell(
                                                                        onTap: (){

                                                                          var test =      Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => Events_Screen(
                                                                                  Bubble:  state.BUBBLElistS3!,
                                                                                  Type:'Popular Now' ,
                                                                                  my_id: id
                                                                              ),
                                                                            ),
                                                                          )
                                                                              .then((value) {
                                                                            bool status = false;

                                                                            if (value =="Yes!") {
                                                                              print(Event_IDS);
                                                                              print(Event_Statuses);

                                                                              for (int k = 0; k <Event_IDS!.length; k++) {

                                                                                for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                                                  if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                                                    if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                                                      _HomeBloc.add(
                                                                                          ChangeSaveStatusInDetailUi((b) => b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                }
                                                                                ///



                                                                                for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }



                                                                                for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type ='Popular Now'
                                                                                        ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                                                  if (Event_IDS![k] ==
                                                                                      state
                                                                                          .BUBBLElistS2![i]
                                                                                          .id) {
                                                                                    if (Event_Statuses![k] !=
                                                                                        state
                                                                                            .BUBBLElistS2![i]
                                                                                            .is_Saved) {
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble((
                                                                                              b) =>
                                                                                          b

                                                                                            ..index = i
                                                                                            ..List_type ="Nearby"
                                                                                            ..Saved_Status = state
                                                                                                .BUBBLElistS2![i]
                                                                                                .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                    }
                                                                                  }
                                                                                }

                                                                                for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'New Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Active Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }
                                                                              }
                                                                            }
                                                                          });


                                                                          // WidgetsBinding
                                                                          //     .instance
                                                                          //     .adspostFrameCallback((_) =>
                                                                          //
                                                                          // );
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 11.sp,
                                                                              letterSpacing: 0 ,
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
                                                                    height:  h / 3.1,
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
                                                                                  var test =   Navigator
                                                                                      .push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) =>
                                                                                          Plan_Screen(
                                                                                            Bubble:state.BUBBLElistS3![index],
                                                                                            my_id: id ,
                                                                                            is_saved:state.BUBBLElistS3![index].is_Saved,
                                                                                          ),
                                                                                    ),
                                                                                  ).then((value) {
                                                                                    bool status = false;
                                                                                    print(value);
                                                                                    if (value=="true"){
                                                                                      status = true;
                                                                                    }else if (value=="false"){
                                                                                      status = false;
                                                                                    }
                                                                                    if (state.BUBBLElistS3![index].is_Saved==status) {
                                                                                      print( "Gucci");

                                                                                    }
                                                                                    else{
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble(( b) =>  b
                                                                                            ..Bubble_id = state.BUBBLElistS3![index].id
                                                                                            ..index = index
                                                                                            ..List_type = 'Popular Now'
                                                                                            ..Saved_Status = state.BUBBLElistS3![index] .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                      );
                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                        if (state.BUBBLElistS3![index].id==state.DetailUiSaveID![i])
                                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                        if (state.BUBBLElistS3![index].id ==state.BUBBLElistS1![i].id)
                                                                                        {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'New Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                      for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                        if (state.BUBBLElistS3![index].id== state.BUBBLElistS2![i].id) {
                                                                                          _HomeBloc
                                                                                              .add(
                                                                                              ToggleSaveBubble((
                                                                                                  b) =>
                                                                                              b
                                                                                                ..index = i
                                                                                                ..List_type = 'Nearby'
                                                                                                ..Saved_Status = state
                                                                                                    .BUBBLElistS2![i]
                                                                                                    .is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }
                                                                                      for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                        if (state.BUBBLElistS3![index].id == state.BUBBLElistS5![i].id) {
                                                                                          _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Upcoming Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                        if (state.BUBBLElistS3![index].id== state.BUBBLElistS6![i].id) {
                                                                                          _HomeBloc.add(
                                                                                              ToggleSaveBubble(( b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Active Bubbles'
                                                                                                ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                    }
                                                                                  });

                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3.1,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(h/90.5),
                                                                                      topRight: Radius.circular(h/90.5),
                                                                                      bottomLeft:Radius.circular(h/90.5),
                                                                                      bottomRight:Radius.circular(h/90.5),
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
                                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
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
                                                                                                borderRadius :  BorderRadius.only(
                                                                                                  topLeft: Radius.circular(h/100),
                                                                                                  topRight:  Radius.circular(h/100),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS3![index].Color!).withOpacity(.4),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),
                                                                                          Container(
                                                                                              width: w / 1.8,
                                                                                              height: h/14.89,
                                                                                              margin: EdgeInsets.only(left: w/25),
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                 Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS3![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS3![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS3![index].Creator_Alias!,
                                                                                                        textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Display',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            height: 1
                                                                                                        ),),

                                                                                                    ],
                                                                                                  ),

                                                                                                  Text(""),


                                                                                                  Container(
                                                                                                    width:w/8,
                                                                                                    height: h/12.89,
                                                                                                    child:
                                                                                                    IconButton(
                                                                                                      icon:SvgPicture.asset(
                                                                                                        state.BUBBLElistS3![index].is_Saved!
                                                                                                            ?"Assets/images/Save_Marker(1).svg"
                                                                                                            :"Assets/images/Save_outline.svg",
                                                                                                        width: w/30,
                                                                                                        color: Colors.white,
                                                                                                      ) ,
                                                                                                      onPressed: (){

                                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                      if (state.BUBBLElistS3![index].id==state.DetailUiSaveID![i])
                                                                                                      _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                      ..index = i
                                                                                                      ..status = !state.DetailUiSaveStatus![i]
                                                                                                      ..Want_Request = false
                                                                                                      ));
                                                                                                      }

                                                                                                      for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                                      if (state.BUBBLElistS3![index].id ==state.BUBBLElistS1![i].id)
                                                                                                      {
                                                                                                      _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                      ..index = i
                                                                                                      ..List_type = 'New Bubbles'
                                                                                                      ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                                      ..Want_Request = false
                                                                                                      )
                                                                                                      );
                                                                                                      }
                                                                                                      }
                                                                                                      for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                                      if (state.BUBBLElistS3![index].id== state.BUBBLElistS2![i].id) {
                                                                                                      _HomeBloc
                                                                                                          .add(
                                                                                                      ToggleSaveBubble((
                                                                                                      b) =>
                                                                                                      b
                                                                                                      ..index = i
                                                                                                      ..List_type = 'Nearby'
                                                                                                      ..Saved_Status = state
                                                                                                          .BUBBLElistS2![i]
                                                                                                          .is_Saved!
                                                                                                      ..Want_Request = false
                                                                                                      )
                                                                                                      );
                                                                                                      }
                                                                                                      }
                                                                                                      for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                      if (state.BUBBLElistS3![index].id == state.BUBBLElistS5![i].id) {
                                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                      ..index = i
                                                                                                      ..List_type = 'Upcoming Bubbles'
                                                                                                      ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                      ..Want_Request = false
                                                                                                      ));
                                                                                                      }
                                                                                                      }

                                                                                                      for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                      if (state.BUBBLElistS3![index].id== state.BUBBLElistS6![i].id) {
                                                                                                      _HomeBloc.add(
                                                                                                      ToggleSaveBubble(( b) =>b
                                                                                                      ..index = i
                                                                                                      ..List_type = 'Active Bubbles'
                                                                                                      ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                      ..Want_Request = false
                                                                                                      )
                                                                                                      );
                                                                                                      }
                                                                                                      }
                                                                                                      _HomeBloc
                                                                                                          .add(
                                                                                                      ToggleSaveBubble(( b) =>  b
                                                                                                      ..Bubble_id = state.BUBBLElistS3![index].id
                                                                                                      ..index = index
                                                                                                      ..List_type = 'Popular Now'
                                                                                                      ..Saved_Status = state.BUBBLElistS3![index] .is_Saved!
                                                                                                      ..Want_Request = true
                                                                                                      )
                                                                                                      );
                                                                                                      }
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )
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
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    5,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS3![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color(state.BUBBLElistS3![index].Color!.toInt()),
                                                                                                            fontSize: 11.sp,
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
                                                                                                      style : GoogleFonts.roboto().copyWith(
                                                                                                        fontSize: 8.5.sp,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  SizedBox(height: 7,),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w/39,
                                                                                                        child:
                                                                                                        Image.network(state.BUBBLElistS3![index].Cateogory_Icon!),
                                                                                                      ),
                                                                                                      SizedBox(width: 3,),
                                                                                                      Container(
                                                                                                        width: w/2.5,
                                                                                                        child: Text("${state.BUBBLElistS3![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Text',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                            height: 1
                                                                                                        ),),
                                                                                                      ),
                                                                                                    ],
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
                                                                            return  Text(
                                                                                "      ");
                                                                          },
                                                                        )))
                                                                    : state.GetNewBubblesIsloading ==true
                                                                    ? Container(
                                                                    padding:
                                                                     EdgeInsets
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
                                                                          child:  Text(
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
                                                                        width: w/3,
                                                                        child: Text(
                                                                          ' Nearby',
                                                                          textAlign: TextAlign.left,
                                                                          style: _TextTheme
                                                                              .headlineLarge!
                                                                              .copyWith(
                                                                            fontSize: 14.sp,
                                                                            letterSpacing: 0,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          var test =       Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => Events_Screen(
                                                                                  Bubble: state.BUBBLElistS2!,
                                                                                  Type:'Nearby',
                                                                                  my_id: id
                                                                              ),
                                                                            ),
                                                                          )
                                                                              .then((value) {
                                                                            bool status = false;

                                                                            if (value =="Yes!") {
                                                                              print(Event_IDS);
                                                                              print(Event_Statuses);

                                                                              for (int k = 0; k <Event_IDS!.length; k++) {

                                                                                for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                                                  if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                                                    if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                                                      _HomeBloc.add(
                                                                                          ChangeSaveStatusInDetailUi((b) => b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                }
                                                                                ///



                                                                                for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }



                                                                                for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type ='Popular Now'
                                                                                        ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                                                  if (Event_IDS![k] ==
                                                                                      state
                                                                                          .BUBBLElistS2![i]
                                                                                          .id) {
                                                                                    if (Event_Statuses![k] !=
                                                                                        state
                                                                                            .BUBBLElistS2![i]
                                                                                            .is_Saved) {
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble((
                                                                                              b) =>
                                                                                          b

                                                                                            ..index = i
                                                                                            ..List_type ="Nearby"
                                                                                            ..Saved_Status = state
                                                                                                .BUBBLElistS2![i]
                                                                                                .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                    }
                                                                                  }
                                                                                }

                                                                                for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'New Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Active Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }
















                                                                              }
                                                                              // Event_IDS!.clear();
                                                                              // Event_Statuses!.clear();
                                                                              // print(Event_IDS);
                                                                              // print(Event_Statuses);

                                                                            }

                                                                          });


                                                                          // WidgetsBinding
                                                                          //     .instance
                                                                          //     .adspostFrameCallback((_) =>
                                                                          //
                                                                          // );
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 11.sp,
                                                                              letterSpacing: 0 ,
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
                                                                    height:  h / 3.1,
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
                                                                                  var test =   Navigator
                                                                                      .push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) =>
                                                                                          Plan_Screen(
                                                                                            Bubble:state.BUBBLElistS2![index],
                                                                                            my_id: id ,       is_saved:state.BUBBLElistS2![index].is_Saved,   ),
                                                                                    ),
                                                                                  ).then((value) {
                                                                                    bool status = false;
                                                                                    print(value);
                                                                                    if (value=="true"){
                                                                                      status = true;
                                                                                    }else if (value=="false"){
                                                                                      status = false;
                                                                                    }
                                                                                    if (state.BUBBLElistS2![index].is_Saved==status) {
                                                                                      print( "Gucci");

                                                                                    }
                                                                                    else{
                                                                                      _HomeBloc.add(
                                                                                          ToggleSaveBubble((b) => b
                                                                                            ..Bubble_id = state.BUBBLElistS2![index].id
                                                                                            ..index = index
                                                                                            ..List_type = 'Nearby'
                                                                                            ..Saved_Status =   state.BUBBLElistS2![index].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                      );

                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                        if (state.BUBBLElistS2![index].id==state.DetailUiSaveID![i])
                                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                        if (state.BUBBLElistS2![index].id ==state.BUBBLElistS1![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'New Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                        if (state.BUBBLElistS2![index].id== state.BUBBLElistS3![i].id) {
                                                                                          _HomeBloc
                                                                                              .add(
                                                                                              ToggleSaveBubble((
                                                                                                  b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Popular Now'
                                                                                                ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                        if (state.BUBBLElistS2![index].id == state.BUBBLElistS5![i].id) {
                                                                                          _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Upcoming Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                        if (state.BUBBLElistS2![index].id== state.BUBBLElistS6![i].id) {
                                                                                          _HomeBloc.add(
                                                                                              ToggleSaveBubble(( b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Active Bubbles'
                                                                                                ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                    }
                                                                                  });
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(h/90.5),
                                                                                      topRight: Radius.circular(h/90.5),
                                                                                      bottomLeft: Radius.circular(h/90.5),
                                                                                      bottomRight: Radius.circular(h/90.5),
                                                                                    ),
                                                                                    color : Color.fromRGBO(96, 96, 96, 1),
                                                                                  ),
                                                                                  child:
                                                                                  Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius : BorderRadius.only(
                                                                                            topLeft: Radius.circular(10),
                                                                                            topRight: Radius.circular(10),
                                                                                          ),
                                                                                          color : Color.fromRGBO(96, 96, 96, 1),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: w / 1.6,
                                                                                              height: h/4.2,
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
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
                                                                                                  borderRadius :  BorderRadius.only(
                                                                                                    topLeft: Radius.circular(h/100),
                                                                                                    topRight:  Radius.circular(h/100),

                                                                                                  ),
                                                                                                  color: Colors.transparent,
                                                                                                  boxShadow : [BoxShadow(
                                                                                                      color: Color(state.BUBBLElistS2![index].Color!).withOpacity(.4),
                                                                                                      offset: Offset(0,0),
                                                                                                      blurRadius: 8.628571510314941
                                                                                                  )],

                                                                                                )
                                                                                            ),
                                                                                            Container(
                                                                                                width: w / 1.8,
                                                                                                height: h/14.89,
                                                                                                margin: EdgeInsets.only(left: w/25),
                                                                                                child:Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                  Row(
                                                                                                      children: [
                                                                                                        CircleAvatar(
                                                                                                          radius: 10,
                                                                                                          backgroundColor: Color(int.parse(state.BUBBLElistS2![index].Creator_Color!)),
                                                                                                          backgroundImage: NetworkImage(state.BUBBLElistS2![index].Creator_Avatar!),
                                                                                                        ),
                                                                                                        SizedBox(width: 10,),
                                                                                                        Text(state.BUBBLElistS2![index].Creator_Alias!,
                                                                                                          textAlign: TextAlign.left, style: TextStyle(
                                                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                              fontFamily: 'Red Hat Display',
                                                                                                              fontSize: 6.5.sp,
                                                                                                              letterSpacing: 0 ,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              height: 1
                                                                                                          ),),

                                                                                                      ],
                                                                                                    ),
                                                                                                    Text(""),


                                                                                                    Container(
                                                                                                      width:w/8,
                                                                                                      height: h/12.89,
                                                                                                      child:
                                                                                                      IconButton(
                                                                                                        icon:SvgPicture.asset(
                                                                                                          state.BUBBLElistS2![index].is_Saved!
                                                                                                              ?"Assets/images/Save_Marker(1).svg"
                                                                                                              :"Assets/images/Save_outline.svg",
                                                                                                          width: w/30,
                                                                                                          color: Colors.white,
                                                                                                        ) ,
                                                                                                        onPressed: (){


                                                                                                          for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                            if (state.BUBBLElistS2![index].id==state.DetailUiSaveID![i])
                                                                                                              _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                                ..index = i
                                                                                                                ..status = !state.DetailUiSaveStatus![i]
                                                                                                                ..Want_Request = false
                                                                                                              ));
                                                                                                          }

                                                                                                          for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                                            if (state.BUBBLElistS2![index].id ==state.BUBBLElistS1![i].id) {
                                                                                                              _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                                ..index = i
                                                                                                                ..List_type = 'New Bubbles'
                                                                                                                ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                                                ..Want_Request = false
                                                                                                              )
                                                                                                              );
                                                                                                            }
                                                                                                          }

                                                                                                          for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                                            if (state.BUBBLElistS2![index].id== state.BUBBLElistS3![i].id) {
                                                                                                              _HomeBloc
                                                                                                                  .add(
                                                                                                                  ToggleSaveBubble((
                                                                                                                      b) =>b
                                                                                                                    ..index = i
                                                                                                                    ..List_type = 'Popular Now'
                                                                                                                    ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                                    ..Want_Request = false
                                                                                                                  )
                                                                                                              );
                                                                                                            }
                                                                                                          }

                                                                                                          for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                            if (state.BUBBLElistS2![index].id == state.BUBBLElistS5![i].id) {
                                                                                                              _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                                ..index = i
                                                                                                                ..List_type = 'Upcoming Bubbles'
                                                                                                                ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                                ..Want_Request = false
                                                                                                              ));
                                                                                                            }
                                                                                                          }

                                                                                                          for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                            if (state.BUBBLElistS2![index].id== state.BUBBLElistS6![i].id) {
                                                                                                              _HomeBloc.add(
                                                                                                                  ToggleSaveBubble(( b) =>b
                                                                                                                    ..index = i
                                                                                                                    ..List_type = 'Active Bubbles'
                                                                                                                    ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                                    ..Want_Request = false
                                                                                                                  )
                                                                                                              );
                                                                                                            }
                                                                                                          }
                                                                                                          _HomeBloc.add(
                                                                                                              ToggleSaveBubble((b) => b
                                                                                                                ..Bubble_id = state.BUBBLElistS2![index].id
                                                                                                                ..index = index
                                                                                                                ..List_type = 'Nearby'
                                                                                                                ..Saved_Status =   state.BUBBLElistS2![index].is_Saved!
                                                                                                                ..Want_Request = true
                                                                                                              )
                                                                                                          );

                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                )
                                                                                            ),
                                                                                          ],
                                                                                        ),
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
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    4,
                                                                                                  ),

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS2![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color(state.BUBBLElistS2![index].Color!.toInt()),
                                                                                                            fontSize: 11.sp,
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
                                                                                                      style : GoogleFonts.roboto().copyWith(
                                                                                                        fontSize: 8.5.sp,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 4,),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w/39,
                                                                                                        child:
                                                                                                        Image.network(state.BUBBLElistS2![index].Cateogory_Icon!),
                                                                                                      ),
                                                                                                      SizedBox(width: 3,),
                                                                                                      Container(
                                                                                                        width: w/2.5,
                                                                                                        child: Text("${state.BUBBLElistS2![index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Text',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                            height: 1
                                                                                                        ),),
                                                                                                      ),
                                                                                                    ],
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
                                                                            return  Text(
                                                                                "      ");
                                                                          },
                                                                        )))
                                                                    : state.NearbyIsloading ==true
                                                                    ? Container(
                                                                    padding:
                                                                     EdgeInsets
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
                                                                          child:  Text(
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
                                                                            fontSize: 14.sp,
                                                                            letterSpacing: 0,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          var test = Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => Events_Screen(
                                                                                  Bubble:state.BUBBLElistS1! ,
                                                                                  Type:'New Bubbles',
                                                                                  my_id: id
                                                                              ),
                                                                            ),
                                                                          )
                                                                              .then((value) {
                                                                            bool status = false;

                                                                            if (value =="Yes!") {


                                                                              for (int k = 0; k <Event_IDS!.length; k++) {

                                                                                for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                                                  if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                                                    if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                                                      _HomeBloc.add(
                                                                                          ChangeSaveStatusInDetailUi((b) => b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }



                                                                                for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type ='Popular Now'
                                                                                        ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                                                  if (Event_IDS![k] ==
                                                                                      state
                                                                                          .BUBBLElistS2![i]
                                                                                          .id) {
                                                                                    if (Event_Statuses![k] !=
                                                                                        state
                                                                                            .BUBBLElistS2![i]
                                                                                            .is_Saved) {
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble((
                                                                                              b) =>
                                                                                          b

                                                                                            ..index = i
                                                                                            ..List_type ="Nearby"
                                                                                            ..Saved_Status = state
                                                                                                .BUBBLElistS2![i]
                                                                                                .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                    }
                                                                                  }
                                                                                }

                                                                                for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'New Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Active Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }
















                                                                              }
                                                                            }
                                                                          });

                                                                          // WidgetsBinding
                                                                          //     .instance
                                                                          //     .adspostFrameCallback((_) =>
                                                                          //     Navigator
                                                                          //         .push(
                                                                          //       context,
                                                                          //       MaterialPageRoute(
                                                                          //         builder: (context) => Events_Screen(
                                                                          //             Bubble:state.BUBBLElistS1! ,
                                                                          //             Type:'New Bubbles',
                                                                          //             my_id: id
                                                                          //         ),
                                                                          //       ),
                                                                          //     )
                                                                          // );
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 11.sp,
                                                                              letterSpacing: 0 ,
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
                                                                    height:  h / 3.1,
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
                                                                                  var test =   Navigator
                                                                                      .push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) =>
                                                                                          Plan_Screen(
                                                                                            Bubble:state.BUBBLElistS1![index],
                                                                                            my_id: id ,      is_saved:state.BUBBLElistS1![index].is_Saved,   ),   ),

                                                                                  ).then((value) {
                                                                                    bool status = false;
                                                                                    print(value);
                                                                                    if (value=="true"){
                                                                                      status = true;
                                                                                    }else if (value=="false"){
                                                                                      status = false;
                                                                                    }
                                                                                    if (state.BUBBLElistS1![index].is_Saved==status) {
                                                                                      print( "Gucci");

                                                                                    }
                                                                                    else{
                                                                                      _HomeBloc.add(
                                                                                          ToggleSaveBubble((b) => b
                                                                                            ..Bubble_id = state.BUBBLElistS1![index].id
                                                                                            ..index = index
                                                                                            ..List_type = 'New Bubbles'
                                                                                            ..Saved_Status =   state.BUBBLElistS1![index].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                      );


                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                        if (state.BUBBLElistS1![index].id==state.DetailUiSaveID![i])
                                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                        if (state.BUBBLElistS1![index].id ==state.BUBBLElistS2![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Nearby'
                                                                                            ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                        if (state.BUBBLElistS1![index].id== state.BUBBLElistS3![i].id) {
                                                                                          _HomeBloc
                                                                                              .add(
                                                                                              ToggleSaveBubble((
                                                                                                  b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Popular Now'
                                                                                                ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                        if (state.BUBBLElistS1![index].id == state.BUBBLElistS5![i].id) {
                                                                                          _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Upcoming Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                        if (state.BUBBLElistS1![index].id== state.BUBBLElistS6![i].id) {
                                                                                          _HomeBloc.add(
                                                                                              ToggleSaveBubble(( b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Active Bubbles'
                                                                                                ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                    }




                                                                                  });
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(h/90.5),
                                                                                      topRight: Radius.circular(h/90.5),
                                                                                      bottomLeft: Radius.circular(h/90.5),
                                                                                      bottomRight: Radius.circular(h/90.5),
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
                                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5),  ),
                                                                                              child:CachedNetworkImage(
                                                                                                fit: BoxFit.fitWidth,
                                                                                                imageUrl:
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
                                                                                                borderRadius :  BorderRadius.only(
                                                                                                  topLeft: Radius.circular(h/100),
                                                                                                  topRight:  Radius.circular(h/100),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS1![index].Color!).withOpacity(.4),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),
                                                                                          Container(
                                                                                              width: w / 1.8,
                                                                                              height: h/14.89,
                                                                                              margin: EdgeInsets.only(left: w/25),
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS1![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS1![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS1![index].Creator_Alias!,
                                                                                                        textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Display',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            height: 1
                                                                                                        ),),

                                                                                                    ],
                                                                                                  ),
                                                                                                  Text(""),
                                                                                                  Container(
                                                                                                    width:w/8,
                                                                                                    height: h/12.89,
                                                                                                    child:
                                                                                                    IconButton(
                                                                                                      icon:SvgPicture.asset(
                                                                                                        state.BUBBLElistS1![index].is_Saved!
                                                                                                            ?"Assets/images/Save_Marker(1).svg"
                                                                                                            :"Assets/images/Save_outline.svg",
                                                                                                        width: w/30,
                                                                                                        color: Colors.white,
                                                                                                      ) ,
                                                                                                      onPressed: (){



                                                                                                        for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                          if (state.BUBBLElistS1![index].id==state.DetailUiSaveID![i])
                                                                                                            _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                              ..index = i
                                                                                                              ..status = !state.DetailUiSaveStatus![i]
                                                                                                              ..Want_Request = false
                                                                                                            ));
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                                          if (state.BUBBLElistS1![index].id ==state.BUBBLElistS2![i].id) {
                                                                                                            _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'Nearby'
                                                                                                              ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            )
                                                                                                            );
                                                                                                          }
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                                          if (state.BUBBLElistS1![index].id== state.BUBBLElistS3![i].id) {
                                                                                                            _HomeBloc
                                                                                                                .add(
                                                                                                                ToggleSaveBubble((
                                                                                                                    b) =>b
                                                                                                                  ..index = i
                                                                                                                  ..List_type = 'Popular Now'
                                                                                                                  ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                                  ..Want_Request = false
                                                                                                                )
                                                                                                            );
                                                                                                          }
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                          if (state.BUBBLElistS1![index].id == state.BUBBLElistS5![i].id) {
                                                                                                            _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'Upcoming Bubbles'
                                                                                                              ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            ));
                                                                                                          }
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                          if (state.BUBBLElistS1![index].id== state.BUBBLElistS6![i].id) {
                                                                                                            _HomeBloc.add(
                                                                                                                ToggleSaveBubble(( b) =>b
                                                                                                                  ..index = i
                                                                                                                  ..List_type = 'Active Bubbles'
                                                                                                                  ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                                  ..Want_Request = false
                                                                                                                )
                                                                                                            );
                                                                                                          }
                                                                                                        }
                                                                                                        _HomeBloc.add(
                                                                                                            ToggleSaveBubble((b) => b
                                                                                                              ..Bubble_id = state.BUBBLElistS1![index].id
                                                                                                              ..index = index
                                                                                                              ..List_type = 'New Bubbles'
                                                                                                              ..Saved_Status =   state.BUBBLElistS1![index].is_Saved!
                                                                                                              ..Want_Request = true
                                                                                                            )
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )
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
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    3,
                                                                                                  ),

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS1![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color(state.BUBBLElistS1![index].Color!.toInt()),
                                                                                                            fontSize: 11.sp,
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
                                                                                                      style : GoogleFonts.roboto().copyWith(
                                                                                                        fontSize: 8.5.sp,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 3,),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w/39,
                                                                                                        child:
                                                                                                        Image.network(state.BUBBLElistS1![index].Cateogory_Icon!),
                                                                                                      ),
                                                                                                      SizedBox(width: 3,),
                                                                                                      Container(
                                                                                                        width: w/2.5,
                                                                                                        child: Text("${state.BUBBLElistS1![index].Category!} Event",
                                                                                                          textAlign: TextAlign.left,   style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                              fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                            height: 1
                                                                                                        ),),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    5,
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
                                                                            return  Text(
                                                                                "      ");
                                                                          },
                                                                        )))
                                                                    : state.GetNewBubblesIsloading ==true
                                                                    ? Container(
                                                                    padding:
                                                                     EdgeInsets
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
                                                                          child:  Text(
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

                                                            state.BUBBLElistS5!.length!= 0?
                                                            Column(
                                                              children: [
                                                                SizedBox(height: h/65,),
                                                                Container(

                                                                  width: w,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Container(
                                                                        width: w/2,
                                                                        child: Text(
                                                                          'Upcoming Bubbles',
                                                                          textAlign: TextAlign.left,
                                                                          style: _TextTheme
                                                                              .headlineLarge!
                                                                              .copyWith(
                                                                            fontSize: 14.sp,
                                                                            letterSpacing: 0,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10,),

                                                                      InkWell(
                                                                        onTap: (){
                                                                          var test =   Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => Events_Screen(
                                                                                  Bubble:state.BUBBLElistS5! ,
                                                                                  Type:'Upcoming Bubbles',
                                                                                  my_id: id
                                                                              ),
                                                                            ),
                                                                          )
                                                                              .then((value) {
                                                                            bool status = false;

                                                                            if (value =="Yes!") {



                                                                              for (int k = 0; k <Event_IDS!.length; k++) {

                                                                                for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                                                  if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                                                    if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                                                      _HomeBloc.add(
                                                                                          ChangeSaveStatusInDetailUi((b) => b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                }
                                                                                ///



                                                                                for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }



                                                                                for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type ='Popular Now'
                                                                                        ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                                                  if (Event_IDS![k] ==
                                                                                      state
                                                                                          .BUBBLElistS2![i]
                                                                                          .id) {
                                                                                    if (Event_Statuses![k] !=
                                                                                        state
                                                                                            .BUBBLElistS2![i]
                                                                                            .is_Saved) {
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble((
                                                                                              b) =>
                                                                                          b

                                                                                            ..index = i
                                                                                            ..List_type ="Nearby"
                                                                                            ..Saved_Status = state
                                                                                                .BUBBLElistS2![i]
                                                                                                .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                    }
                                                                                  }
                                                                                }

                                                                                for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'New Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Active Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }
















                                                                              }
                                                                            }
                                                                          });
                                                                          // WidgetsBinding
                                                                          //     .instance
                                                                          //     .adspostFrameCallback((_) =>
                                                                          //
                                                                          // );
                                                                        },

                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 11.sp,
                                                                              letterSpacing: 0 ,
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
                                                                    height:  h / 3.1,
                                                                    child: ScrollConfiguration(
                                                                        behavior: MyBehavior(),
                                                                        child: ListView.separated(
                                                                          cacheExtent : 500,
                                                                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                          scrollDirection:
                                                                          Axis.horizontal,
                                                                          itemCount: state.BUBBLElistS5!.length,
                                                                          itemBuilder:
                                                                              (BuildContext
                                                                          context,
                                                                              int index) {



                                                                            return InkWell(
                                                                                onTap: () {

                                                                                  var test =   Navigator
                                                                                      .push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) =>
                                                                                          Plan_Screen(
                                                                                            Bubble:state.BUBBLElistS5![index],
                                                                                            my_id: id ,    is_saved:state.BUBBLElistS5![index].is_Saved,     ),
                                                                                    ),
                                                                                  ).then((value) {
                                                                                    bool status = false;
                                                                                    print(value);
                                                                                    if (value=="true"){
                                                                                      status = true;
                                                                                    }else if (value=="false"){
                                                                                      status = false;
                                                                                    }
                                                                                    if (state.BUBBLElistS5![index].is_Saved==status) {
                                                                                      print( "Gucci");

                                                                                    }
                                                                                    else{
                                                                                      _HomeBloc.add(
                                                                                          ToggleSaveBubble((b) => b
                                                                                            ..Bubble_id = state.BUBBLElistS5![index].id
                                                                                            ..index = index
                                                                                            ..List_type = 'Upcoming Bubbles'
                                                                                            ..Saved_Status =   state.BUBBLElistS5![index].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                      );
                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                        if (state.BUBBLElistS5![index].id==state.DetailUiSaveID![i])
                                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                      }
                                                                                      for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                        if (state.BUBBLElistS5![index].id ==state.BUBBLElistS1![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'New Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                      for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                        if (state.BUBBLElistS5![index].id ==state.BUBBLElistS2![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Nearby'
                                                                                            ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                        if (state.BUBBLElistS5![index].id== state.BUBBLElistS3![i].id) {
                                                                                          _HomeBloc
                                                                                              .add(
                                                                                              ToggleSaveBubble((
                                                                                                  b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Popular Now'
                                                                                                ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      // for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                      //   if (state.BUBBLElistS5![index].id == state.BUBBLElistS5![i].id) {
                                                                                      //     _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                      //       ..index = i
                                                                                      //       ..List_type = 'Upcoming Bubbles'
                                                                                      //       ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                      //       ..Want_Request = false
                                                                                      //     ));
                                                                                      //   }
                                                                                      // }

                                                                                      for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                        if (state.BUBBLElistS5![index].id== state.BUBBLElistS6![i].id) {
                                                                                          _HomeBloc.add(
                                                                                              ToggleSaveBubble(( b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Active Bubbles'
                                                                                                ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                    }




                                                                                  });
                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(h/90.5),
                                                                                      topRight: Radius.circular(h/90.5),
                                                                                      bottomLeft: Radius.circular(h/90.5),
                                                                                      bottomRight:Radius.circular(h/90.5),
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
                                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
                                                                                              child:CachedNetworkImage(
                                                                                                fit: BoxFit.fitWidth,
                                                                                                imageUrl:
                                                                                                //"",
                                                                                                state.BUBBLElistS5![index].image.toString(),
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
                                                                                                borderRadius :  BorderRadius.only(
                                                                                                  topLeft: Radius.circular(h/100),
                                                                                                  topRight:  Radius.circular(h/100),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS5![index].Color!).withOpacity(.4),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),
                                                                                          Container(
                                                                                              width: w / 1.8,
                                                                                              height: h/14.89,
                                                                                              margin: EdgeInsets.only(left: w/25),
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                 Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS5![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS5![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS5![index].Creator_Alias!,
                                                                                                        textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Display',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            height: 1
                                                                                                        ),),

                                                                                                    ],
                                                                                                  ),


                                                                                                  Text(""),


                                                                                                  Container(
                                                                                                    width:w/8,
                                                                                                    height: h/12.89,
                                                                                                    child:
                                                                                                    IconButton(
                                                                                                      icon:SvgPicture.asset(
                                                                                                          state.BUBBLElistS5![index].is_Saved!
                                                                                                              ?"Assets/images/Save_Marker(1).svg"
                                                                                                              :"Assets/images/Save_outline.svg",
                                                                                                        width: w/30,
                                                                                                        color: Colors.white,
                                                                                                      ) ,
                                                                                                      onPressed: (){

                                                                                                        for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                          if (state.BUBBLElistS5![index].id==state.DetailUiSaveID![i])
                                                                                                            _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                              ..index = i
                                                                                                              ..status = !state.DetailUiSaveStatus![i]
                                                                                                              ..Want_Request = false
                                                                                                            ));
                                                                                                        }
                                                                                                        for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                                          if (state.BUBBLElistS5![index].id ==state.BUBBLElistS1![i].id) {
                                                                                                            _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'New Bubbles'
                                                                                                              ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            )
                                                                                                            );
                                                                                                          }
                                                                                                        }


                                                                                                        for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                                          if (state.BUBBLElistS5![index].id ==state.BUBBLElistS2![i].id) {
                                                                                                            _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'Nearby'
                                                                                                              ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            )
                                                                                                            );
                                                                                                          }
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                                          if (state.BUBBLElistS5![index].id== state.BUBBLElistS3![i].id) {
                                                                                                            _HomeBloc
                                                                                                                .add(
                                                                                                                ToggleSaveBubble((
                                                                                                                    b) =>b
                                                                                                                  ..index = i
                                                                                                                  ..List_type = 'Popular Now'
                                                                                                                  ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                                  ..Want_Request = false
                                                                                                                )
                                                                                                            );
                                                                                                          }
                                                                                                        }

                                                                                                        // for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                        //   if (state.BUBBLElistS5![index].id == state.BUBBLElistS5![i].id) {
                                                                                                        //     _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                        //       ..index = i
                                                                                                        //       ..List_type = 'Upcoming Bubbles'
                                                                                                        //       ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                        //       ..Want_Request = false
                                                                                                        //     ));
                                                                                                        //   }
                                                                                                        // }

                                                                                                        for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                          if (state.BUBBLElistS5![index].id== state.BUBBLElistS6![i].id) {
                                                                                                            _HomeBloc.add(
                                                                                                                ToggleSaveBubble(( b) =>b
                                                                                                                  ..index = i
                                                                                                                  ..List_type = 'Active Bubbles'
                                                                                                                  ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                                  ..Want_Request = false
                                                                                                                )
                                                                                                            );
                                                                                                          }
                                                                                                        }
                                                                                                        _HomeBloc.add(
                                                                                                            ToggleSaveBubble((b) => b
                                                                                                              ..Bubble_id = state.BUBBLElistS5![index].id
                                                                                                              ..index = index
                                                                                                              ..List_type = 'Upcoming Bubbles'
                                                                                                              ..Saved_Status =   state.BUBBLElistS5![index].is_Saved!
                                                                                                              ..Want_Request = true
                                                                                                            )
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )
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
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    4,
                                                                                                  ),

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS5![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color(state.BUBBLElistS5![index].Color!.toInt()),
                                                                                                            fontSize: 11.sp,
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
                                                                                                      'At ${state.BUBBLElistS5![index].location.toString()}',
                                                                                                      textAlign: TextAlign.left,
                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                      style : GoogleFonts.roboto().copyWith(
                                                                                                        fontSize: 8.5.sp,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 4,),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w/39,
                                                                                                        child:
                                                                                                        Image.network(state.BUBBLElistS5![index].Cateogory_Icon!),
                                                                                                      ),
                                                                                                      SizedBox(width: 3,),
                                                                                                      Container(
                                                                                                        width: w/2.5,
                                                                                                        child: Text("${state.BUBBLElistS5![index].Category!} Event",
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                              fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w300,
                                                                                                            height: 1
                                                                                                        ),),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(state.BUBBLElistS5![index].Color!),
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
                                                                            return  Text(
                                                                                "      ");
                                                                          },
                                                                        )))
                                                                    : state.GetNewBubblesIsloading ==true
                                                                    ? Container(
                                                                    padding:
                                                                     EdgeInsets
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
                                                                          child:  Text(
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

                                                            state.BUBBLElistS6!.length!= 0?
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
                                                                          'Active Bubbles',
                                                                          textAlign: TextAlign.left,
                                                                          style: _TextTheme
                                                                              .headlineLarge!
                                                                              .copyWith(
                                                                            fontSize: 14.sp,
                                                                            letterSpacing: 0,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10,),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          var test = Navigator
                                                                              .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                              builder: (context) => Events_Screen(
                                                                                  Bubble:state.BUBBLElistS6! ,
                                                                                  Type:'Active Bubbles',
                                                                                  my_id: id
                                                                              ),
                                                                            ),
                                                                          )
                                                                              .then((value) {
                                                                            bool status = false;

                                                                            if (value =="Yes!") {


                                                                              for (int k = 0; k <Event_IDS!.length; k++) {

                                                                                for (int i = 0; i< state.DetailUiSaveID!.length; i++) {
                                                                                  if (Event_IDS![k] == state.DetailUiSaveID![i])
                                                                                    if (Event_Statuses![k]!=state.DetailUiSaveStatus![i])
                                                                                      _HomeBloc.add(
                                                                                          ChangeSaveStatusInDetailUi((b) => b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                }
                                                                                ///



                                                                                for (int i = 0; i<state.BUBBLElistS5!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS5![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS5![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }



                                                                                for (int i = 0; i<state.BUBBLElistS3!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS3![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS3![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type ='Popular Now'
                                                                                        ..Saved_Status = state.BUBBLElistS3![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS2!.length; i++) {
                                                                                  if (Event_IDS![k] ==
                                                                                      state
                                                                                          .BUBBLElistS2![i]
                                                                                          .id) {
                                                                                    if (Event_Statuses![k] !=
                                                                                        state
                                                                                            .BUBBLElistS2![i]
                                                                                            .is_Saved) {
                                                                                      _HomeBloc
                                                                                          .add(
                                                                                          ToggleSaveBubble((
                                                                                              b) =>
                                                                                          b

                                                                                            ..index = i
                                                                                            ..List_type ="Nearby"
                                                                                            ..Saved_Status = state
                                                                                                .BUBBLElistS2![i]
                                                                                                .is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                    }
                                                                                  }
                                                                                }

                                                                                for (int i = 0; i<state.BUBBLElistS1!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS1![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS1![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'New Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }


                                                                                for (int i = 0; i<state.BUBBLElistS6!.length; i++) {
                                                                                  if (Event_IDS![k] == state.BUBBLElistS6![i].id)
                                                                                    if (Event_Statuses![k]!=state.BUBBLElistS6![i].is_Saved)
                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                        ..index = i
                                                                                        ..List_type = 'Active Bubbles'
                                                                                        ..Saved_Status = state.BUBBLElistS6![i].is_Saved!
                                                                                        ..Want_Request = false
                                                                                      ));
                                                                                }
                                                                              }
                                                                            }
                                                                          });
                                                                          // WidgetsBinding
                                                                          //     .instance
                                                                          //     .adspostFrameCallback((_) =>
                                                                          //
                                                                          // );
                                                                        },
                                                                        child: Text('See all',
                                                                          textAlign: TextAlign.right,
                                                                          style: TextStyle(
                                                                              color: Color.fromRGBO(207, 109, 56, 1),
                                                                              fontFamily: 'Red Hat Display',
                                                                              fontSize: 11.sp,
                                                                              letterSpacing: 0 ,
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1
                                                                          ),),
                                                                      )

                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(height: h/45,),



                                                                state.GetNewBubblesSuccess!
                                                                    ?  Container(
                                                                    width: w,
                                                                    height:  h / 3.1,
                                                                    child: ScrollConfiguration(
                                                                        behavior: MyBehavior(),
                                                                        child: ListView.separated(
                                                                          cacheExtent : 500,
                                                                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                                                          scrollDirection:
                                                                          Axis.horizontal,
                                                                          itemCount: state.BUBBLElistS6!.length,
                                                                          itemBuilder:
                                                                              (BuildContext
                                                                          context,
                                                                              int index) {



                                                                            return InkWell(
                                                                                onTap: () {
                                                                                  // WidgetsBinding
                                                                                  //     .instance
                                                                                  //     .adspostFrameCallback((_) =>
                                                                                  //   );

                                                                                  var test =   Navigator
                                                                                      .push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) =>
                                                                                          Plan_Screen(
                                                                                            Bubble:state.BUBBLElistS6![index],
                                                                                            my_id: id , is_saved:state.BUBBLElistS6![index].is_Saved,      ),
                                                                                    ),
                                                                                  ).then((value) {
                                                                                    bool status = false;
                                                                                    print(value);
                                                                                    if (value=="true"){
                                                                                      status = true;
                                                                                    }else if (value=="false"){
                                                                                      status = false;
                                                                                    }
                                                                                    if (state.BUBBLElistS6![index].is_Saved==status) {
                                                                                      print( "Gucci");

                                                                                    }else{
                                                                                      _HomeBloc.add(
                                                                                          ToggleSaveBubble((b) => b
                                                                                            ..Bubble_id = state.BUBBLElistS6![index].id
                                                                                            ..index = index
                                                                                            ..List_type = 'Active Bubbles'
                                                                                            ..Saved_Status =   state.BUBBLElistS6![index].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                      );
                                                                                      for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                        if (state.BUBBLElistS6![index].id==state.DetailUiSaveID![i])
                                                                                          _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                            ..index = i
                                                                                            ..status = !state.DetailUiSaveStatus![i]
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                      }
                                                                                      for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                        if (state.BUBBLElistS6![index].id ==state.BUBBLElistS1![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'New Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                      for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                        if (state.BUBBLElistS6![index].id ==state.BUBBLElistS2![i].id) {
                                                                                          _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Nearby'
                                                                                            ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          )
                                                                                          );
                                                                                        }
                                                                                      }

                                                                                      for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                        if (state.BUBBLElistS6![index].id== state.BUBBLElistS3![i].id) {
                                                                                          _HomeBloc
                                                                                              .add(
                                                                                              ToggleSaveBubble((
                                                                                                  b) =>b
                                                                                                ..index = i
                                                                                                ..List_type = 'Popular Now'
                                                                                                ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                ..Want_Request = false
                                                                                              )
                                                                                          );
                                                                                        }
                                                                                      }


                                                                                      for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                        if (state.BUBBLElistS6![index].id == state.BUBBLElistS5![i].id) {
                                                                                          _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                            ..index = i
                                                                                            ..List_type = 'Upcoming Bubbles'
                                                                                            ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                            ..Want_Request = false
                                                                                          ));
                                                                                        }
                                                                                      }

                                                                                    }




                                                                                  });

                                                                                },
                                                                                child:
                                                                                Container(
                                                                                  width: w / 1.6,
                                                                                  height:  h / 3,
                                                                                  margin: EdgeInsets.only(left:index==0? h/35:0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius : BorderRadius.only(
                                                                                      topLeft: Radius.circular(h/90.5),
                                                                                      topRight: Radius.circular(h/90.5),
                                                                                      bottomLeft: Radius.circular(h/90.5),
                                                                                      bottomRight:Radius.circular(h/90.5),
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
                                                                                              borderRadius: BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
                                                                                              child:CachedNetworkImage(
                                                                                                fit: BoxFit.fitWidth,
                                                                                                imageUrl:
                                                                                                //"",
                                                                                                state.BUBBLElistS6![index].image.toString(),
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
                                                                                                borderRadius :  BorderRadius.only(
                                                                                                  topLeft: Radius.circular(h/100),
                                                                                                  topRight:  Radius.circular(h/100),

                                                                                                ),
                                                                                                color: Colors.transparent,
                                                                                                boxShadow : [BoxShadow(
                                                                                                    color: Color(state.BUBBLElistS6![index].Color!).withOpacity(.4),
                                                                                                    offset: Offset(0,0),
                                                                                                    blurRadius: 8.628571510314941
                                                                                                )],

                                                                                              )
                                                                                          ),
                                                                                          Container(
                                                                                              width: w / 1.8,
                                                                                              height: h/14.89,
                                                                                              margin: EdgeInsets.only(left: w/25),
                                                                                              child:Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                   Row(
                                                                                                    children: [
                                                                                                      CircleAvatar(
                                                                                                        radius: 10,
                                                                                                        backgroundColor: Color(int.parse(state.BUBBLElistS6![index].Creator_Color!)),
                                                                                                        backgroundImage: NetworkImage(state.BUBBLElistS6![index].Creator_Avatar!),
                                                                                                      ),
                                                                                                      SizedBox(width: 10,),
                                                                                                      Text(state.BUBBLElistS6![index].Creator_Alias!,
                                                                                                        textAlign: TextAlign.left, style: TextStyle(
                                                                                                            color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                            fontFamily: 'Red Hat Display',
                                                                                                            fontSize: 6.5.sp,
                                                                                                            letterSpacing: 0 ,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            height: 1
                                                                                                        ),),

                                                                                                    ],
                                                                                                  ),


                                                                                                  Text(""),

                                                                                                  Container(
                                                                                                    width:w/8,
                                                                                                    height: h/12.89,
                                                                                                    child:
                                                                                                    IconButton(
                                                                                                      icon:SvgPicture.asset(
                                                                                                        state.BUBBLElistS6![index].is_Saved!
                                                                                                            ?"Assets/images/Save_Marker(1).svg"
                                                                                                            :"Assets/images/Save_outline.svg",
                                                                                                        width: w/30,
                                                                                                        color: Colors.white,
                                                                                                      ) ,
                                                                                                      onPressed: (){

                                                                                                        for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                          if (state.BUBBLElistS6![index].id==state.DetailUiSaveID![i])
                                                                                                            _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                              ..index = i
                                                                                                              ..status = !state.DetailUiSaveStatus![i]
                                                                                                              ..Want_Request = false
                                                                                                            ));
                                                                                                        }
                                                                                                        for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                                          if (state.BUBBLElistS6![index].id ==state.BUBBLElistS1![i].id) {
                                                                                                            _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'New Bubbles'
                                                                                                              ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            )
                                                                                                            );
                                                                                                          }
                                                                                                        }


                                                                                                        for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                                          if (state.BUBBLElistS6![index].id ==state.BUBBLElistS2![i].id) {
                                                                                                            _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'Nearby'
                                                                                                              ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            )
                                                                                                            );
                                                                                                          }
                                                                                                        }

                                                                                                        for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                                          if (state.BUBBLElistS6![index].id== state.BUBBLElistS3![i].id) {
                                                                                                            _HomeBloc
                                                                                                                .add(
                                                                                                                ToggleSaveBubble((
                                                                                                                    b) =>b
                                                                                                                  ..index = i
                                                                                                                  ..List_type = 'Popular Now'
                                                                                                                  ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                                                  ..Want_Request = false
                                                                                                                )
                                                                                                            );
                                                                                                          }
                                                                                                        }


                                                                                                        for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                          if (state.BUBBLElistS6![index].id == state.BUBBLElistS5![i].id) {
                                                                                                            _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                              ..index = i
                                                                                                              ..List_type = 'Upcoming Bubbles'
                                                                                                              ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                              ..Want_Request = false
                                                                                                            ));
                                                                                                          }
                                                                                                        }
                                                                                                        _HomeBloc.add(
                                                                                                            ToggleSaveBubble((b) => b
                                                                                                              ..Bubble_id = state.BUBBLElistS6![index].id
                                                                                                              ..index = index
                                                                                                              ..List_type = 'Active Bubbles'
                                                                                                              ..Saved_Status =   state.BUBBLElistS6![index].is_Saved!
                                                                                                              ..Want_Request = true
                                                                                                            )
                                                                                                        );
                                                                                                        // for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                        //   if (state.BUBBLElistS6![index].id== state.BUBBLElistS6![i].id) {
                                                                                                        //     _HomeBloc.add(
                                                                                                        //         ToggleSaveBubble(( b) =>b
                                                                                                        //           ..index = i
                                                                                                        //           ..List_type = 'Active Bubbles'
                                                                                                        //           ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                        //           ..Want_Request = false
                                                                                                        //         )
                                                                                                        //     );
                                                                                                        //   }
                                                                                                        // }
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )
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
                                                                                                   SizedBox(
                                                                                                    height:
                                                                                                    4,
                                                                                                  ),

                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w /3,
                                                                                                        child:  Text(
                                                                                                          state.BUBBLElistS6![index].Title.toString(),
                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                            color: Color(state.BUBBLElistS6![index].Color!.toInt()),
                                                                                                            fontSize: 11.sp,
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
                                                                                                      'At ${state.BUBBLElistS6![index].location.toString()}',
                                                                                                      textAlign: TextAlign.left,
                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                      style : GoogleFonts.roboto().copyWith(
                                                                                                        fontSize: 8.5.sp,
                                                                                                        letterSpacing: 0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),

                                                                                                    ),

                                                                                                  ),

                                                                                                  SizedBox(height: 4,),
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: w/39,
                                                                                                        child:
                                                                                                        Image.network(state.BUBBLElistS6![index].Cateogory_Icon!),
                                                                                                      ),
                                                                                                      SizedBox(width: 3,),
                                                                                                      Container(
                                                                                                        width: w/2.5,
                                                                                                        child: Text("${state.BUBBLElistS6![index].Category!} Event",
                                                                                                          textAlign: TextAlign.left,
                                                                                                          style : GoogleFonts.roboto().copyWith(
                                                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                              fontSize: 6.5.sp,
                                                                                                              letterSpacing: 0 ,
                                                                                                              fontWeight: FontWeight.w300,
                                                                                                              height: 1
                                                                                                          ),),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SvgPicture.asset(
                                                                                            "Assets/images/Exclude.svg",
                                                                                            color : Color(state.BUBBLElistS6![index].Color!),
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
                                                                            return  Text(
                                                                                "      ");
                                                                          },
                                                                        )))
                                                                    : state.GetNewBubblesIsloading ==true
                                                                    ? Container(
                                                                    padding:
                                                                     EdgeInsets
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
                                                                          child:  Text(
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

                                                            SizedBox(height: h/50,),

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

                                                                childAspectRatio: (5 / 4.7),),
                                                              itemBuilder: (BuildContext context, int index) {

                                                                return   InkWell(
                                                                    onTap: (){
                                                                      var test =   Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              Plan_Screen(
                                                                                Bubble:state.FilteredBubbleList![index],
                                                                                my_id: id ,    is_saved:state.FilteredBubbleList![index].is_Saved,    ),
                                                                        ),
                                                                      ).then((value) {
                                                                        bool status = false;
                                                                        print(value);
                                                                        if (value=="true"){
                                                                          status = true;
                                                                        }else if (value=="false"){
                                                                          status = false;
                                                                        }
                                                                        if (state.FilteredBubbleList![index].is_Saved==status) {
                                                                          print( "Gucci");

                                                                        }
                                                                        else{
                                                                          _HomeBloc.add(
                                                                              ToggleSaveBubble((b) => b
                                                                                ..Bubble_id = state.FilteredBubbleList![index].id
                                                                                ..index = index
                                                                                ..List_type = 'Nearby'
                                                                                ..Saved_Status =   state.FilteredBubbleList![index].is_Saved!
                                                                                ..Want_Request = false
                                                                              )
                                                                          );

                                                                          for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                            if (state.FilteredBubbleList![index].id==state.DetailUiSaveID![i])
                                                                              _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                ..index = i
                                                                                ..status = !state.DetailUiSaveStatus![i]
                                                                                ..Want_Request = false
                                                                              ));
                                                                          }

                                                                          for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                            if (state.FilteredBubbleList![index].id ==state.BUBBLElistS1![i].id) {
                                                                              _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                ..index = i
                                                                                ..List_type = 'New Bubbles'
                                                                                ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                ..Want_Request = false
                                                                              )
                                                                              );
                                                                            }
                                                                          }

                                                                          for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                            if (state.FilteredBubbleList![index].id ==state.BUBBLElistS2![i].id) {
                                                                              _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                ..index = i
                                                                                ..List_type = 'Nearby'
                                                                                ..Saved_Status = state.BUBBLElistS2![i].is_Saved!
                                                                                ..Want_Request = false
                                                                              )
                                                                              );
                                                                            }
                                                                          }


                                                                          for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                            if (state.FilteredBubbleList![index].id== state.BUBBLElistS3![i].id) {
                                                                              _HomeBloc
                                                                                  .add(
                                                                                  ToggleSaveBubble((
                                                                                      b) =>b
                                                                                    ..index = i
                                                                                    ..List_type = 'Popular Now'
                                                                                    ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                    ..Want_Request = false
                                                                                  )
                                                                              );
                                                                            }
                                                                          }

                                                                          for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                            if (state.FilteredBubbleList![index].id == state.BUBBLElistS5![i].id) {
                                                                              _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                ..index = i
                                                                                ..List_type = 'Upcoming Bubbles'
                                                                                ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                ..Want_Request = false
                                                                              ));
                                                                            }
                                                                          }

                                                                          for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                            if (state.FilteredBubbleList![index].id== state.BUBBLElistS6![i].id) {
                                                                              _HomeBloc.add(
                                                                                  ToggleSaveBubble(( b) =>b
                                                                                    ..index = i
                                                                                    ..List_type = 'Active Bubbles'
                                                                                    ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                    ..Want_Request = false
                                                                                  )
                                                                              );
                                                                            }
                                                                          }


                                                                        }
                                                                      });



                                                                    },
                                                                    child:Center(
                                                                      child: Container(

                                                                          width:w/1.15,
                                                                          height: h/2.1,
                                                                          margin:  EdgeInsets.all(10),
                                                                          decoration:  BoxDecoration(
                                                                            borderRadius : BorderRadius.only(
                                                                              topLeft:Radius.circular(h/90.5),
                                                                              topRight:Radius.circular(h/90.5),
                                                                              bottomLeft: Radius.circular(h/90.5),
                                                                              bottomRight:Radius.circular(h/90.5),
                                                                            ),
                                                                            color : Color.fromRGBO(96, 96, 96, 1),
                                                                          ),
                                                                          child :Column(
                                                                            children: [
                                                                              Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      width:w/1.15,
                                                                                      height: h/3.05,
                                                                                      child: ClipRRect(
                                                                                        borderRadius:  BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
                                                                                        child:CachedNetworkImage(
                                                                                          fit: BoxFit.fill,
                                                                                          imageUrl:  state.FilteredBubbleList![index].image.toString(),
                                                                                          placeholder: (context, url) => Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(width:w/8,height:h/20,child:  Center(child: CircularProgressIndicator())),
                                                                                            ],
                                                                                          ),
                                                                                          errorWidget: (context, url, error) =>  Icon(Icons.error),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                        width:w/1.15,
                                                                                        height: h/8.05,

                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius :  BorderRadius.only(
                                                                                            topLeft: Radius.circular(h/100),
                                                                                            topRight:  Radius.circular(h/100),

                                                                                          ),
                                                                                          color: Colors.transparent,
                                                                                          boxShadow : [BoxShadow(
                                                                                              color: Color(state.FilteredBubbleList![index].Color!).withOpacity(.4),
                                                                                              offset: Offset(0,0),
                                                                                              blurRadius: 8.628571510314941
                                                                                          )],

                                                                                        )
                                                                                    ),
                                                                                    // Container(
                                                                                    //   width:w/8,
                                                                                    //   height: h/12.89,
                                                                                    //   child:
                                                                                    //   IconButton(
                                                                                    //     icon:SvgPicture.asset(
                                                                                    //       state.BUBBLElistS2![index].is_Saved!
                                                                                    //           ?"Assets/images/Save_Marker(1).svg"
                                                                                    //           :"Assets/images/Save_outline.svg",
                                                                                    //       width: w/30,
                                                                                    //       color: Colors.white,
                                                                                    //     ) ,
                                                                                    //     onPressed: (){
                                                                                    //
                                                                                    //
                                                                                    //       for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                    //         if (state.BUBBLElistS2![index].id==state.DetailUiSaveID![i])
                                                                                    //           _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                    //             ..index = i
                                                                                    //             ..status = !state.DetailUiSaveStatus![i]
                                                                                    //             ..Want_Request = false
                                                                                    //           ));
                                                                                    //       }
                                                                                    //
                                                                                    //       for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                    //         if (state.BUBBLElistS2![index].id ==state.BUBBLElistS1![i].id) {
                                                                                    //           _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                    //             ..index = i
                                                                                    //             ..List_type = 'New Bubbles'
                                                                                    //             ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                    //             ..Want_Request = false
                                                                                    //           )
                                                                                    //           );
                                                                                    //         }
                                                                                    //       }
                                                                                    //
                                                                                    //       for (int i=0;i<state.BUBBLElistS3!.length;i++) {
                                                                                    //         if (state.BUBBLElistS2![index].id== state.BUBBLElistS3![i].id) {
                                                                                    //           _HomeBloc
                                                                                    //               .add(
                                                                                    //               ToggleSaveBubble((
                                                                                    //                   b) =>b
                                                                                    //                 ..index = i
                                                                                    //                 ..List_type = 'Popular Now'
                                                                                    //                 ..Saved_Status = state .BUBBLElistS3![i].is_Saved!
                                                                                    //                 ..Want_Request = false
                                                                                    //               )
                                                                                    //           );
                                                                                    //         }
                                                                                    //       }
                                                                                    //
                                                                                    //       for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                    //         if (state.BUBBLElistS2![index].id == state.BUBBLElistS5![i].id) {
                                                                                    //           _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                    //             ..index = i
                                                                                    //             ..List_type = 'Upcoming Bubbles'
                                                                                    //             ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                    //             ..Want_Request = false
                                                                                    //           ));
                                                                                    //         }
                                                                                    //       }
                                                                                    //
                                                                                    //       for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                    //         if (state.BUBBLElistS2![index].id== state.BUBBLElistS6![i].id) {
                                                                                    //           _HomeBloc.add(
                                                                                    //               ToggleSaveBubble(( b) =>b
                                                                                    //                 ..index = i
                                                                                    //                 ..List_type = 'Active Bubbles'
                                                                                    //                 ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                    //                 ..Want_Request = false
                                                                                    //               )
                                                                                    //           );
                                                                                    //         }
                                                                                    //       }
                                                                                    //       _HomeBloc.add(
                                                                                    //           ToggleSaveBubble((b) => b
                                                                                    //             ..Bubble_id = state.BUBBLElistS2![index].id
                                                                                    //             ..index = index
                                                                                    //             ..List_type = 'Nearby'
                                                                                    //             ..Saved_Status =   state.BUBBLElistS2![index].is_Saved!
                                                                                    //             ..Want_Request = true
                                                                                    //           )
                                                                                    //       );
                                                                                    //
                                                                                    //     },
                                                                                    //   ),
                                                                                    // ),
                                                                                    Container(
                                                                                        width:w/1.3,
                                                                                        height: h/12.89,
                                                                                        margin: EdgeInsets.only(left: w/20),
                                                                                        child:Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                          Row(
                                                                                              children: [
                                                                                                CircleAvatar(
                                                                                                  radius: 13.5.w,
                                                                                                  backgroundColor: Color(int.parse(state.FilteredBubbleList![index].Creator_Color!)),
                                                                                                  backgroundImage: NetworkImage(state.FilteredBubbleList![index].Creator_Avatar!),
                                                                                                ),
                                                                                                 SizedBox(width: 10,),
                                                                                                Text(state.FilteredBubbleList![index].Creator_Alias!, textAlign: TextAlign.left, style:  TextStyle(
                                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                    fontFamily: 'Red Hat Display',
                                                                                                    fontSize: 7.22.sp,
                                                                                                    letterSpacing: 0 ,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    height: 1
                                                                                                ),),

                                                                                              ],
                                                                                            ),
                                                                                             Text(""),
                                                                                            Container(
                                                                                              width:w/6,
                                                                                              height: h/7.89,
                                                                                              child:
                                                                                              IconButton(
                                                                                                icon:SvgPicture.asset(
                                                                                                  state.FilteredBubbleList![index].is_Saved!
                                                                                                      ?"Assets/images/Save_Marker(1).svg"
                                                                                                      :"Assets/images/Save_outline.svg",
                                                                                                  width: w/30,
                                                                                                  color: Colors.white,
                                                                                                ) ,
                                                                                                onPressed: (){

                                                                                                  for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                                    if (state.FilteredBubbleList![index].id==state.DetailUiSaveID![i])
                                                                                                      _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                                        ..index = i
                                                                                                        ..status = !state.DetailUiSaveStatus![i]
                                                                                                        ..Want_Request = false
                                                                                                      ));
                                                                                                  }

                                                                                                  for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                                    if (state.FilteredBubbleList![index].id ==state.BUBBLElistS1![i].id)
                                                                                                    {
                                                                                                      _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                                        ..index = i
                                                                                                        ..List_type = 'New Bubbles'
                                                                                                        ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                                        ..Want_Request = false
                                                                                                      )
                                                                                                      );
                                                                                                    }
                                                                                                  }
                                                                                                  for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                                    if (state.FilteredBubbleList![index].id== state.BUBBLElistS2![i].id) {
                                                                                                      _HomeBloc
                                                                                                          .add(
                                                                                                          ToggleSaveBubble((
                                                                                                              b) =>
                                                                                                          b
                                                                                                            ..index = i
                                                                                                            ..List_type = 'Nearby'
                                                                                                            ..Saved_Status = state
                                                                                                                .BUBBLElistS2![i]
                                                                                                                .is_Saved!
                                                                                                            ..Want_Request = false
                                                                                                          )
                                                                                                      );
                                                                                                    }
                                                                                                  }
                                                                                                  // for (int i = 0; i <
                                                                                                  //     state
                                                                                                  //         .BUBBLElistS3!
                                                                                                  //         .length; i++) {
                                                                                                  //   if (state
                                                                                                  //       .DetailBubbledata!
                                                                                                  //       .id ==
                                                                                                  //       state
                                                                                                  //           .BUBBLElistS3![i]
                                                                                                  //           .id) {
                                                                                                  //     _HomeBloc
                                                                                                  //         .add(
                                                                                                  //         ToggleSaveBubble((
                                                                                                  //             b) =>
                                                                                                  //         b
                                                                                                  //           ..index = i
                                                                                                  //           ..List_type = 'Popular Now'
                                                                                                  //           ..Saved_Status = state
                                                                                                  //               .BUBBLElistS3![i]
                                                                                                  //               .is_Saved!
                                                                                                  //           ..Want_Request = false
                                                                                                  //         )
                                                                                                  //     );
                                                                                                  //   }
                                                                                                  // }
                                                                                                  for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                                    if (state.FilteredBubbleList![index].id == state.BUBBLElistS5![i].id) {
                                                                                                      _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                                        ..index = i
                                                                                                        ..List_type = 'Upcoming Bubbles'
                                                                                                        ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                                        ..Want_Request = false
                                                                                                      ));
                                                                                                    }
                                                                                                  }

                                                                                                  for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                                    if (state.FilteredBubbleList![index].id== state.BUBBLElistS6![i].id) {
                                                                                                      _HomeBloc.add(
                                                                                                          ToggleSaveBubble(( b) =>b
                                                                                                            ..index = i
                                                                                                            ..List_type = 'Active Bubbles'
                                                                                                            ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                                            ..Want_Request = false
                                                                                                          )
                                                                                                      );
                                                                                                    }
                                                                                                  }
                                                                                                  _HomeBloc
                                                                                                      .add(
                                                                                                      ToggleSaveBubble(( b) =>  b
                                                                                                        ..Bubble_id = state.FilteredBubbleList![index].id
                                                                                                        ..index = index
                                                                                                        ..List_type = 'Search'
                                                                                                        ..Saved_Status = state.FilteredBubbleList![index] .is_Saved!
                                                                                                        ..Want_Request = true
                                                                                                      )
                                                                                                  );




                                                                                                },
                                                                                              ),
                                                                                            ),

                                                                                          ],
                                                                                        )






                                                                                    ),

                                                                                    // Positioned(
                                                                                    //   left: w/1.7,
                                                                                    //   child: Container(
                                                                                    //     width:w/3,
                                                                                    //     height: h/10.89,
                                                                                    //     child:
                                                                                    //     Center(
                                                                                    //         child: InkWell(
                                                                                    //           onTap: (){
                                                                                    //
                                                                                    //             for(int i=0;i<state.DetailUiSaveID!.length;i++) {
                                                                                    //               if (state.FilteredBubbleList![index].id==state.DetailUiSaveID![i])
                                                                                    //                 _HomeBloc.add(ChangeSaveStatusInDetailUi((b) =>b
                                                                                    //                   ..index = i
                                                                                    //                   ..status = !state.DetailUiSaveStatus![i]
                                                                                    //                   ..Want_Request = false
                                                                                    //                 ));
                                                                                    //             }
                                                                                    //
                                                                                    //             for (int i=0;i<state.BUBBLElistS1!.length;i++) {
                                                                                    //               if (state.FilteredBubbleList![index].id ==state.BUBBLElistS1![i].id)
                                                                                    //               {
                                                                                    //                 _HomeBloc.add( ToggleSaveBubble((b) => b
                                                                                    //                   ..index = i
                                                                                    //                   ..List_type = 'New Bubbles'
                                                                                    //                   ..Saved_Status = state.BUBBLElistS1![i].is_Saved!
                                                                                    //                   ..Want_Request = false
                                                                                    //                 )
                                                                                    //                 );
                                                                                    //               }
                                                                                    //             }
                                                                                    //             for (int i=0;i<state.BUBBLElistS2!.length;i++) {
                                                                                    //               if (state.FilteredBubbleList![index].id== state.BUBBLElistS2![i].id) {
                                                                                    //                 _HomeBloc
                                                                                    //                     .add(
                                                                                    //                     ToggleSaveBubble((
                                                                                    //                         b) =>
                                                                                    //                     b
                                                                                    //                       ..index = i
                                                                                    //                       ..List_type = 'Nearby'
                                                                                    //                       ..Saved_Status = state
                                                                                    //                           .BUBBLElistS2![i]
                                                                                    //                           .is_Saved!
                                                                                    //                       ..Want_Request = false
                                                                                    //                     )
                                                                                    //                 );
                                                                                    //               }
                                                                                    //             }
                                                                                    //             // for (int i = 0; i <
                                                                                    //             //     state
                                                                                    //             //         .BUBBLElistS3!
                                                                                    //             //         .length; i++) {
                                                                                    //             //   if (state
                                                                                    //             //       .DetailBubbledata!
                                                                                    //             //       .id ==
                                                                                    //             //       state
                                                                                    //             //           .BUBBLElistS3![i]
                                                                                    //             //           .id) {
                                                                                    //             //     _HomeBloc
                                                                                    //             //         .add(
                                                                                    //             //         ToggleSaveBubble((
                                                                                    //             //             b) =>
                                                                                    //             //         b
                                                                                    //             //           ..index = i
                                                                                    //             //           ..List_type = 'Popular Now'
                                                                                    //             //           ..Saved_Status = state
                                                                                    //             //               .BUBBLElistS3![i]
                                                                                    //             //               .is_Saved!
                                                                                    //             //           ..Want_Request = false
                                                                                    //             //         )
                                                                                    //             //     );
                                                                                    //             //   }
                                                                                    //             // }
                                                                                    //             for (int i=0;i<state.BUBBLElistS5!.length; i++) {
                                                                                    //               if (state.FilteredBubbleList![index].id == state.BUBBLElistS5![i].id) {
                                                                                    //                 _HomeBloc.add(ToggleSaveBubble(( b) => b
                                                                                    //                   ..index = i
                                                                                    //                   ..List_type = 'Upcoming Bubbles'
                                                                                    //                   ..Saved_Status = state.BUBBLElistS5![i].is_Saved!
                                                                                    //                   ..Want_Request = false
                                                                                    //                 ));
                                                                                    //               }
                                                                                    //             }
                                                                                    //
                                                                                    //             for (int i=0;i<state.BUBBLElistS6!.length;i++) {
                                                                                    //               if (state.FilteredBubbleList![index].id== state.BUBBLElistS6![i].id) {
                                                                                    //                 _HomeBloc.add(
                                                                                    //                     ToggleSaveBubble(( b) =>b
                                                                                    //                       ..index = i
                                                                                    //                       ..List_type = 'Active Bubbles'
                                                                                    //                       ..Saved_Status = state.BUBBLElistS6![i] .is_Saved!
                                                                                    //                       ..Want_Request = false
                                                                                    //                     )
                                                                                    //                 );
                                                                                    //               }
                                                                                    //             }
                                                                                    //             _HomeBloc
                                                                                    //                 .add(
                                                                                    //                 ToggleSaveBubble(( b) =>  b
                                                                                    //                   ..Bubble_id = state.FilteredBubbleList![index].id
                                                                                    //                   ..index = index
                                                                                    //                   ..List_type = 'Search'
                                                                                    //                   ..Saved_Status = state.FilteredBubbleList![index] .is_Saved!
                                                                                    //                   ..Want_Request = true
                                                                                    //                 )
                                                                                    //             );
                                                                                    //
                                                                                    //
                                                                                    //
                                                                                    //
                                                                                    //           },
                                                                                    //           child:
                                                                                    //           SvgPicture.asset(
                                                                                    //               state.FilteredBubbleList![index].is_Saved!
                                                                                    //                   ?"Assets/images/Save_Marker(1).svg"
                                                                                    //                   :"Assets/images/Save_outline.svg",
                                                                                    //           ) ,
                                                                                    //         )
                                                                                    //     ),
                                                                                    //   ),
                                                                                    // ),

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
                                                                                           SizedBox(
                                                                                            height:
                                                                                            4,
                                                                                          ),

                                                                                          Container(
                                                                                            width:w/1.5,
                                                                                            child: Text(
                                                                                              state.FilteredBubbleList![index].Title.toString(),
                                                                                              textAlign: TextAlign.left,
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              style : GoogleFonts.roboto().copyWith(
                                                                                                color: Color(state.FilteredBubbleList![index].Color!),
                                                                                                fontSize: 12.22.sp,
                                                                                                letterSpacing: 0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                            ),

                                                                                          ),

                                                                                           SizedBox(height: 1,),
                                                                                          Container(
                                                                                            width:w/1.15,
                                                                                            child:  Text(
                                                                                              "At ${ state.FilteredBubbleList![index].location.toString()}",
                                                                                              textAlign: TextAlign.left,
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              style : GoogleFonts.roboto().copyWith(
                                                                                                fontSize: 9.44.sp,
                                                                                                letterSpacing: 0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),

                                                                                            ),
                                                                                          ),
                                                                                           SizedBox(height: 5,),
                                                                                          Row(
                                                                                            children: [
                                                                                              Container(
                                                                                                width: w/39,
                                                                                                child:
                                                                                                Image.network(state.FilteredBubbleList![index].Cateogory_Icon!),
                                                                                              ),
                                                                                              SizedBox(width: 3,),
                                                                                              Container(
                                                                                                width:w/1.9,
                                                                                                child: Text("${state.FilteredBubbleList![index].Category.toString()} Event",
                                                                                                  textAlign: TextAlign.left,  style : GoogleFonts.roboto().copyWith(
                                                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                                                    fontFamily: 'Red Hat Text',
                                                                                                      fontSize: 7.22.sp,
                                                                                                    letterSpacing: 0 ,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    height: 1
                                                                                                ),),
                                                                                              ),
                                                                                            ],
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                   SizedBox(width: 5,),
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(""),
                                                                                      SvgPicture.asset(
                                                                                        "Assets/images/Exclude.svg",
                                                                                        width: w/8,
                                                                                        color : Color(state.FilteredBubbleList![index].Color!),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                   SizedBox(width: 10,),

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
                                            ),
                                          )
                                              :Expanded(child: Column(children: [
                                            SizedBox(height: h/20,),
                                            Image.asset("Assets/images/DirectEmpty.png",),
                                            SizedBox(height: h/40,),

                                            Container(
                                              width: w/1.6,
                                              child: Text('Looks like there are no Bubbles in your area.', textAlign: TextAlign.center, style: TextStyle(
                                                  color: Color.fromRGBO(96, 96, 96, 1),
                                                  fontFamily: 'Red Hat Display',
                                                  fontSize: 14.sp,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1
                                              ),),
                                            ),
                                            SizedBox(height: h/20,),
                                            InkWell(
                                              onTap: (){
                                                // WidgetsBinding.instance
                                                //     .adspostFrameCallback((_) => Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             Friendlist(is_WithoutTopBar: true,)
                                                //     )));
                                              },
                                              child: Container(
                                                width: w/1.4,
                                                height: h/13,
                                                decoration: BoxDecoration(
                                                  borderRadius : BorderRadius.only(
                                                    topLeft: Radius.circular( h/20.5),
                                                    topRight:Radius.circular( h/20.5),
                                                    bottomLeft: Radius.circular( h/20.5),
                                                    bottomRight:Radius.circular( h/20.5),
                                                  ),
                                                  boxShadow : [BoxShadow(
                                                      color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
                                                      offset: Offset(0,0),
                                                      blurRadius: 10
                                                  )],
                                                  color : Color.fromRGBO(207, 109, 56, 1),
                                                ),
                                                child: Center(
                                                  child:
                                                  Text('Learn More', textAlign: TextAlign.center, style: TextStyle(
                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                      fontFamily: 'Red Hat Text',
                                                      fontSize: 18.sp,
                                                      letterSpacing: 0,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1
                                                  ),),
                                                ),
                                              ),
                                            ),



                                          ],))




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
                                        shape:  RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20.0),
                                          ),
                                        ),
                                        onClosing: () {},
                                        builder: (context) {
                                          return Container(
                                            height: h / 2.8,
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
                                                               Color(
                                                                  0xffCF6D38),
                                                          inactiveColor: ColorS
                                                              .onErrorContainer,
                                                          onChanged: (double  value) async {
                                                          if (state.Bubble_lat!=0 || state.Bubble_lng!=0) {
                                                              this.value = value;
                                                              _HomeBloc.add(ChangeSliderValue( (b) => b..value = value));
                                                              _HomeBloc.add(SetNewBubble((b)=>b
                                                                        ..Radius = value / 1.06
                                                                        ..lat = state.Bubble_lat
                                                                        ..lng = state.Bubble_lng
                                                                      ));

                                                            }else{
                                                            CommingSoonPopup(context, h, w,  "Choose bubble location by clicking on any spot on map", "OK!", 18);

                                                            }

                                                          },
                                                        ),
                                                      ),
                                                    ),

                                                     SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${state.NewValue!.toInt()}m",
                                                          style:
                                                               TextStyle(
                                                                   fontSize: 20.sp,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [

                                                    InkWell(
                                                      onTap: () async {
                                                        try {
                                                          indexx = state.GetBubbles!.data!.length;
                                                          Dataa.lng =
                                                              state.Bubble_lng;
                                                          Dataa.lat =
                                                              state.Bubble_lat;

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
                                                                    Context: context,
                                                                  ),
                                                            ),
                                                          ).then((value) async {
                                                            if (value ==
                                                                "Yep!") {
                                                              if (markerIcon ==
                                                                  null)
                                                                markerIcon =
                                                                await getBytesFromAsset(
                                                                    'Assets/images/Simple Pin(1).png',
                                                                    50);
                                                              CommingSoonPopup(
                                                                  Context, h, w,
                                                                  "Bubble was made Successfully",
                                                                  "Sounds good!",
                                                                  24);
                                                              // _HomeBloc.add(CreateBubbless((b) => b
                                                              //   ..Radius = 13
                                                              //   ..lat = 12
                                                              //   ..lng = 12));
                                                              _HomeBloc.add(
                                                                  AddMarker((
                                                                      b) =>
                                                                  b
                                                                    ..circle = Circle(
                                                                        circleId: CircleId(
                                                                            Bubbledata
                                                                                .id
                                                                                .toString()
                                                                        ),
                                                                        radius: Bubbledata
                                                                            .Raduis!
                                                                            .toDouble(),
                                                                        zIndex: 2,
                                                                        strokeColor: Colors
                                                                            .transparent,
                                                                        center: LatLng(
                                                                            Bubbledata
                                                                                .lat!,
                                                                            Bubbledata
                                                                                .lng!),
                                                                        fillColor: Color(
                                                                            Bubbledata
                                                                                .Color!)
                                                                            .withAlpha(
                                                                            100),
                                                                        onTap: () async {
                                                                          _HomeBloc
                                                                              .add(
                                                                              ChangeToDetailUiState((
                                                                                  b) =>
                                                                              b
                                                                                ..Bubbledata = Bubbledata
                                                                                ..Status = true));
                                                                        })
                                                                    ..marker = Marker(
                                                                      draggable: false,
                                                                      markerId: MarkerId(
                                                                          (Bubbledata
                                                                              .id! +
                                                                              1000)
                                                                              .toString()),
                                                                      position: LatLng(
                                                                          Bubbledata
                                                                              .lat!,
                                                                          Bubbledata
                                                                              .lng!),
                                                                      icon: BitmapDescriptor
                                                                          .fromBytes(
                                                                          markerIcon!),
                                                                      onTap: () {
                                                                        _HomeBloc
                                                                            .add(
                                                                            ChangeToDetailUiState((
                                                                                b) =>
                                                                            b
                                                                              ..Bubbledata = Bubbledata
                                                                              ..Status = true));
                                                                      },

                                                                    )
                                                                  ));
                                                              distance =
                                                                  geo.Geolocator
                                                                      .distanceBetween(
                                                                      User_lat!,
                                                                      User_long!,
                                                                      Bubbledata
                                                                          .lat!,
                                                                      Bubbledata
                                                                          .lng!);
                                                              print(distance);
                                                              print(Bubbledata
                                                                  .Raduis);
                                                              print(
                                                                  AllBubblesIDS);
                                                              AllBubblesIDS![state
                                                                  .locationn!
                                                                  .length] =
                                                              Bubbledata.id!;
                                                              print(
                                                                  AllBubblesIDS);
                                                              print(
                                                                  AllBubblesStatus);
                                                              if (distance <=
                                                                  Bubbledata
                                                                      .Raduis) {
                                                                AllBubblesStatus![state
                                                                    .locationn!
                                                                    .length] =
                                                                1;
                                                                print(
                                                                    AllBubblesStatus);

                                                                _HomeBloc.add(
                                                                    UserJoinedBubble((
                                                                        b) =>
                                                                    b
                                                                      ..Bubble_id = Bubbledata
                                                                          .id!
                                                                    ));
                                                              }
                                                              _HomeBloc.add(
                                                                  OpenDoorTObeAbleTOsetBubble(
                                                                          (
                                                                          b) => b..MakeHimBEableTOSEtBubbles = false));

                                                              _HomeBloc.add(
                                                                  ShowDialoog());
                                                            }
                                                          });
                                                        }catch(e){
                                                          print(e);
                                                        }
                                                      },
                                                      //   },
                                                      child: Center(
                                                        child: Container(
                                                          width: w / 2,
                                                          height: h / 15,
                                                          margin: EdgeInsets.only(bottom: 10.h,top: 10.h),
                                                          decoration:
                                                               BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(7.r),
                                                              topRight: Radius
                                                                  .circular(7.r),
                                                              bottomLeft: Radius
                                                                  .circular(7.r),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          7.r),
                                                            ),
                                                            color:
                                                                Color.fromRGBO(
                                                                    148,
                                                                    38,
                                                                    87,
                                                                    1),
                                                          ),
                                                          child:  Center(
                                                            child:
                                                            Text('Next', textAlign: TextAlign.center, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Red Hat Text',
                                                                fontSize: 18.sp,
                                                                letterSpacing: 0 ,
                                                                fontWeight: FontWeight.w600,
                                                                height: 1
                                                            ),)
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        // _HomeBloc.add(CreateBubbless((b)=>b
                                                        //   ..Radius = 0
                                                        //   ..lat =0
                                                        //   ..lng = 0
                                                        // ));
                                                        _HomeBloc.add(
                                                            OpenDoorTObeAbleTOsetBubble(
                                                                    (b) => b  ..MakeHimBEableTOSEtBubbles =  false));

                                                        _HomeBloc.add( ShowDialoog());



                                                      },
                                                      child: Center(
                                                        child: Center(
                                                          child: Text(' Back',
                                                              textAlign:
                                                              TextAlign
                                                                  .center,
                                                              style: _TextTheme
                                                                  .headline3!
                                                                  .copyWith(
                                                                fontSize: 19.sp,
                                                              )),
                                                        ),
                                                      ),
                                                    ),

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
                            :  Text(""),

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
    return  SpinKitThreeBounce(
      color: Color(0xff942657),
      size: 30.0.w,
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
                                    fontSize: 17.sp,
                                    letterSpacing: 0 ,
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
                                            fontSize: 16.sp,
                                            letterSpacing: 0 ,
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
  // Future<void> GetAvatarr(String avatar)async{
  //   var request = await http.get(Uri.parse("${avatar}"));
  //   bytes = await request.bodyBytes;
  //   dataBytes = await bytes;
  //
  // }
  //Assets/images/Map-Marker-Free-Download-PNG.png
  Future<void> SetLatLng(double lat,double lng) async {
    await pref.SetLatLng(lat, lng);
  }
  Future<void> GetUserData() async {
    User_lat = await pref.Getlat();
    User_long = await pref.GetLng();
    UserModel user = await pref.getUser();
    // print(user.user!.data!.id);
    // print("Gotten");

    id = user.data!.id!;
    Avatar = user.data!.avatar!;
    Alias = user.data!.alias!;
    Background_Color = user.data!.background_color!;
    IS_Creator = user.data!.is_creator!;
    // GetAvatarr(Avatar);
    _HomeBloc.add(Change_Is_Creator((b) => b..ChangeISCreator = IS_Creator==1));
  }
  Future<void> SetTimeZone(double lat, double lng) async {
    double latitude = lat;
    double longitude = lng;

    String tz = tzmap.latLngToTimezoneString(latitude, longitude);
    print('User is in the $tz time zone.');

    await pref.SetTimeZone(tz);
  }

  Future<void> GetTimeZone() async {
    Time_zonE = await pref.GetTimeZone();
  }

  Future<void> GetnearBybubbles() async {
    bool enabled = await Location.instance.serviceEnabled();
    if (enabled) {
      var location = await _locationTracker.getLocation();
      SetTimeZone(location.latitude!,location.longitude!);
      SetLatLng(location.latitude!,location.longitude!);
      _HomeBloc.add(GetNearbyBubbles((b) =>
      b
        ..lng = location.longitude
        ..lat = location.latitude
      ));
      _HomeBloc.add(GetPrimeBubbles((b) =>
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
        // print(dataBytes);
        // print(Avatar);

        _locationSubscription =
            _locationTracker.onLocationChanged.listen((newLocalData) {
              if (_googleMapController != null) {
                // UserLocation = LatLng(newLocalData.latitude! ,newLocalData.longitude!);
                _HomeBloc.add(UserMoved((b) => b
                  ..lng = newLocalData.longitude!
                  ..lat = newLocalData.latitude!
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
  Future<void> setlogout() async {
    await pref.logout();
  }
  // Future<void> getCenter() async {
  //   final GoogleMapController controller = await _controller.future;
  //   LatLngBounds visibleRegion = await controller.getVisibleRegion();
  //   centerLatLng = LatLng(
  //     (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
  //     (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
  //         2,
  //   );
  // }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  // changeMapMode() {
  //
  //   if (theme!) {
  //     getJsonFile('Assets/dark_map_style.json').then(setMapStyle);
  //   } else {
  //     getJsonFile('Assets/light_map_style.json').then(setMapStyle);
  //   }
  //
  // }

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

