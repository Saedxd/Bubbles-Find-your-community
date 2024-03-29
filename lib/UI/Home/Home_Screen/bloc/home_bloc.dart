
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/prefs_helper/prefs_helper.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/Injection.dart';

import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'dart:ui' as ui;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker_updates.dart';




class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BitmapDescriptor? customIMAGE;
  BitmapDescriptor? customIcon;


  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  IRepository _repository;
  // getMarkerWidget() {
  //   return Transform.translate(
  //     offset: Offset(50, 50),
  //     child: RepaintBoundary(
  //       child: SizedBox(
  //         height: 40,
  //         width: 40,
  //         child: Stack(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 image: DecorationImage(
  //                   image: AssetImage(
  //                       'Assets/images/Map-Marker-Free-Download-PNG.png'),
  //                   fit: BoxFit.fitHeight,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               left: 5,
  //               top: 6,
  //               child: ClipOval(
  //                 child: Container(
  //                   width: 20,
  //                   height: 20,
  //                   child:Image.asset("'Assets/images/DefaultAvatar.png',")
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
 // final _HomeBloc = sl<HomeBloc>();
  HomeBloc(this._repository) : super(HomeState.initail()) ;

  @override
  HomeState get initialState => HomeState.initail();

  @override
  Stream<HomeState> mapEventToState(
      HomeEvent event,
      ) async* {
    if (event is Change_Is_Creator) {
      try {

        yield state.rebuild((b) => b
          ..is_Creator = event.ChangeISCreator
        );

      } catch (e) {

        print('get Error $e Change_Is_Creator');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is SaveStatusInDetailUi) {
      try {

        yield state.rebuild((b) => b
          ..DetailUiSaveStatus = event.status
            ..DetailUiSaveID = event.Bubble_IDS
        );

      } catch (e) {

        print('get Error $e SaveStatusInDetailUi');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is ChangeSaveStatusInDetailUi) {
      try {
        print(event.status!);


        yield state.rebuild((b) => b
          ..DetailUiSaveISloading = true
        );
        yield state.rebuild((b) => b
          ..DetailUiSaveStatus![event.index!] = event.status!
        );

        yield state.rebuild((b) => b
          ..DetailUiSaveISloading = false
        );
        if(event.Want_Request!) {
          final date = await _repository.SaveBubble(event.bubble_id!);
        }

      } catch (e) {

        print('get Error $e');
        yield state.rebuild((b) => b
        );

      }
    }
    if (event is ClearError) {
      yield state.rebuild((b) => b..error = "");
    }

    if (event is ChangeValue) {
      try {
        yield state.rebuild((b) => b
           ..Value = event.Value!
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false


        );
      }
    }
    if (event is ShowDialoog) {

      try {
        yield state.rebuild((b) => b
          ..showDialogg = !b.showDialogg!
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false


        );
      }
    }
    if (event is MakeDone) {

      try {
        yield state.rebuild((b) => b
         ..done = !b.done!
        );


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false


        );
      }
    }


    if (event is UserMoved){
    final   Uint8List   markerIcon1 = await getBytesFromAsset('Assets/images/Map-Marker-Free-Download-PNG.png', 100);
//
//
//
//
//
//       // await BitmapDescriptor.(ImageConfiguration(size: Size(12, 12)),
//       //     'Assets/images/Map-Marker-Free-Download-PNG.png').then((d) {
//       //   customIcon =BitmapDescriptor.fromBytes(d);
//       //
//       // });
//      // await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(2, 2)),
//      //      'Assets/images/DefaultAvatar.png').then((d) {
//      //   customIMAGE = d;
//      // });
//
//
//
//
// print("usermoved");
      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = true
        ..GetAllBubblesSuccess= false
      );

     state.marker2!.add(Marker(
       draggable: false,
         markerId:  const MarkerId("UserLocationImage"),
         position:  LatLng(event.lat!,event.lng!),
         icon: BitmapDescriptor.fromBytes(markerIcon1),
         onTap: (){}
     ));


      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesSuccess= true
          ..Userlng= event.lng
          ..Userlat = event.lat
      );
      // print("inside bloc file : ${state.Userlat}");
      // print("inside bloc file : ${state.Userlng}");


    }
    if (event is OpenDoorTObeAbleTOsetBubble){
      yield state.rebuild((b) => b
        ..MakeHimBEableTOSEtBubble = event.MakeHimBEableTOSEtBubbles!
      );
    }
    // if (event is Getprofile) {
    //   try {
    //     yield state.rebuild((b) => b
    //       ..GetprofileISloading = true
    //       ..GetprofileSuccess= false
    //       ..ProfileDate=null
    //     );
    //
    //     final date = await _repository.GetProfile();
    //     print(date);
    //
    //     yield state.rebuild((b) => b
    //
    //       ..ProfileDate.replace(date)
    //       ..GetprofileISloading = false
    //       ..GetprofileSuccess= true
    //     );
    //
    //   } catch (e) {
    //     print('get Error $e OpenDoorTObeAbleTOsetBubble');
    //     yield state.rebuild((b) => b
    //       ..GetprofileISloading = false
    //       ..GetprofileSuccess= false
    //     );
    //   }
    // }

    if (event is SetNewBubble) {
      // try {
      //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
Circle Circle22 = Circle(
    circleId: const CircleId("New bubble"),
    radius: event.Radius!,
    zIndex: 2,
    strokeColor: Colors.transparent,
    center: LatLng(event.lat! ,event.lng!),
    fillColor: Colors.red.withAlpha(100));

Marker Marker22 = Marker(
  draggable: false,
  markerId:  const MarkerId("New Marker"),
  position: LatLng(event.lat! ,event.lng!),
  //  icon: BitmapDescriptor.fromBytes(markerIcon),
);

yield state.rebuild((b) => b
  ..GetAllBubblesIsloading = true
  ..GetAllBubblesSuccess= false
    ..Bubble_lat = event.lat
    ..Bubble_lng = event.lng
);

state.NewBubble_circle!.clear();
state.NewBubble_circle!.clear();

yield state.rebuild((b) => b
  ..NewBubble_circle!.add(Circle22)
 ..NewBubble_marker2!.add(Marker22)
);

      print("BUBBLE length :${state.circle!.length} ");





yield state.rebuild((b) => b
  ..GetAllBubblesIsloading = false
  ..GetAllBubblesSuccess= true
);

        print("BUBBLE CREATED");
      // } catch (e) {
      // print(e);
      // print('CreateBubbless');
      //
      // yield state.rebuild((b) => b
      //   ..GetAllBubblesIsloading = false
      //   ..GetAllBubblesError = "Error"
      //   ..GetAllBubblesSuccess= false
      // );
      // }
    }
//     if (event is RaduisUpdated) {
// //       // try {
// //       //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
// // Circle Circle22 = Circle(
// //     circleId: const CircleId("New bubble"),
// //     radius: event.Radius!,
// //     zIndex: 2,
// //     strokeColor: Colors.transparent,
// //     center: LatLng(event.lat! ,event.lng!),
// //     fillColor: Colors.red.withAlpha(100));
// //
// // Marker Marker22 = Marker(
// //   draggable: false,
// //   markerId:  const MarkerId("New Marker"),
// //   position: LatLng(event.lat! ,event.lng!),
// //   //  icon: BitmapDescriptor.fromBytes(markerIcon),
// // );
// //
// yield state.rebuild((b) => b
//   ..GetAllBubblesIsloading = true
//
//   ..GetAllBubblesSuccess= false
// );
//       print(state.circle!.elementAt(0).radius);
//      //  state.circle!.elementAt(0).radius = event.Radius;
//
//        print(state.circle!.elementAt(0).radius);
//
//         print("BUBBLE length :${state.circle!.length} ");
//
//
//
// yield state.rebuild((b) => b
//   ..GetAllBubblesIsloading = false
//
//   ..GetAllBubblesSuccess= true
// );
//
//         print("BUBBLE CREATED");
//       // } catch (e) {
//       // print(e);
//       // print('CreateBubbless');
//       //
//       // yield state.rebuild((b) => b
//       //   ..GetAllBubblesIsloading = false
//       //   ..GetAllBubblesError = "Error"
//       //   ..GetAllBubblesSuccess= false
//       // );
//       // }
//     }

    if (event is DeleteBubble) {
      try {


        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = true
          ..GetAllBubblesSuccess= false
        );

     //    Circle Circle22 =  Circle(
     //        circleId: const CircleId("New bubble"),
     //      radius: 0,
     //        center: LatLng(0,0),
     //        strokeColor: Colors.transparent,
     //      fillColor: Colors.transparent,
     //      visible: false
     // );
     //    Marker Marker22 =  Marker(
     //        draggable: false,
     //        markerId:  const MarkerId("New Marker"),
     //      //  icon: BitmapDescriptor.fromBytes(markerIcon),
     //        visible: false,
     //      position:  LatLng(0,0),
     //      onDrag: (LatLng){
     //          print("SAEDDD");
     //      }
     //    );


     //
     //    yield state.rebuild((b) => b
     //      ..circle!.add()
     //      ..marker2!.add(Marker22)
     //    );

        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = false
          ..GetAllBubblesSuccess= false
        );


      } catch (e) {
        print(e);
      }
    }
    if (event is ClearMarkers) {
      try {
state.circle!.clear();
state.marker2!.clear();

      } catch (e) {
        print(e);

      }
    }
    if (event is ChangeSliderValue) {
      try {
      //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);

        yield state.rebuild((b) => b
          ..ValueLOading = true
        );

        yield state.rebuild((b) => b
          ..ValueLOading = false
          ..NewValue = event.value!
        );

      } catch (e) {
      print("ChangeSliderValue :$e");

      yield state.rebuild((b) => b
        ..ValueLOading = false
      );
      }
    }

    if (event is SearchBubblesList){

      yield state.rebuild((b) => b
        ..Searchsuccess = false
      );




        yield state.rebuild((b) => b
          ..ChangeViewStatus = event.Change_ViewStatus
        );

        state.FilteredBubbleList!.clear();

        state.Used_From_All_Lists!.forEach((BubbbleOBject) {
          print( BubbbleOBject.Creator_Alias!.toLowerCase());
          if (

          BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())
          ||  BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase())
          ||   BubbbleOBject.Creator_Alias!.toLowerCase().contains(event.Keyword!.toLowerCase())
          ) {
            //todo : remove one of the objects of one of them contains Same id
            state.FilteredBubbleList!.add(BubbbleOBject);
          }

        });


      yield state.rebuild((b) => b
        ..Searchsuccess = true
      );
    }
    if (event is UserJoinedBubble) {

      try {
        final date = await _repository.ChangeUserStatusToIN(event.Bubble_id!);

      } catch (e) {
        print('get Error $e');
      }
    }
    if (event is UserLeftBubble) {

      try {

        final date = await _repository.ChangeUserStatusToOut(event.Bubble_id!);

      } catch (e) {
        print('get Error $e');

      }
    }

    if (event is NotifyNearBubble) {
      try {
  
        final date = await _repository.NotifyMeImCloseToBubble(event.Distance!, event.Title!);
        print(date);

      } catch (e) {
        print('get Error $e');

      }
    }
    if (event is ChangeShapStatus) {
      try {
        yield state.rebuild((b) => b
          ..ShapStatus = !b.ShapStatus!
        );



      } catch (e) {
        print('get Error $e');

      }
    }



    if (event is GetNearbyBubbles) {
      try {
        yield state.rebuild((b) => b
          ..NearbyIsloading = true
          ..NearbySuccess = false
        );
        final date = await _repository.NearByEventList(event.lat!,event.lng!);
        print(date);

        yield state.rebuild((b) => b
          ..NearbyIsloading = false
          ..NearbySuccess = true
          ..GetNearbyBubbles.replace(date)
        );

        state.BUBBLElistS2!.clear();
        for(int i=0;i<state.GetNearbyBubbles!.data!.length;i++){



          BubbleData Bubbledata = BubbleData();
          if (      state.GetNearbyBubbles!.data![i].type.toString()!="Prime"){

          Bubbledata.StartDate = state.GetNearbyBubbles!.data![i].start_event_date.toString();
          Bubbledata.isAvailable =
              state.GetNearbyBubbles!.data![i].is_available.toString()=="available"
                  ? true
                  :false;
          Bubbledata.endDate =state.GetNearbyBubbles!.data![i].end_event_date.toString();
          Bubbledata.dates = state.GetNearbyBubbles!.data![i].dates!;
          Bubbledata.Title = state.GetNearbyBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetNearbyBubbles!.data![i].location.toString();
          Bubbledata.image = state.GetNearbyBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetNearbyBubbles!.data![i].id!.toInt();
          Bubbledata.TYPE = state.GetNearbyBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetNearbyBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetNearbyBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetNearbyBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetNearbyBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetNearbyBubbles!.data![i].description.toString();
          String Value = state.GetNearbyBubbles!.data![i].color.toString();
          Bubbledata.Organizers = state.GetNearbyBubbles!.data![i].organizers!;
          Bubbledata.Category =  state.GetNearbyBubbles!.data![i].category!.name!;
          Bubbledata.is_Saved = state.GetNearbyBubbles!.data![i].is_save;
          Bubbledata.users_in_bubble = state.GetNearbyBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetNearbyBubbles!.data![i].saved_users!;
            Bubbledata.Cateogory_Icon =  state.GetNearbyBubbles!.data![i].category!.image!;
          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.BUBBLElistS2!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
          state.FilteredBubbleList!.add(Bubbledata);
          }
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesSuccess= true
        );

      } catch (e) {
        print('get Error $e GetNearbyBubbles');

      }
    }
    if (event is GetPopularNowBubbles) {
      try {
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetNearbyBubbles=null
        );

        final date = await _repository.PopularNowBubbles();
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetPopularNowBubbles.replace(date)
        );


        state.BUBBLElistS3!.clear();
        for(int i=0;i<state.GetPopularNowBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();
          if (      state.GetPopularNowBubbles!.data![i].type.toString()!="Prime") {
            Bubbledata.isAvailable =
            state.GetPopularNowBubbles!.data![i].is_available.toString()=="available"
                ? true
                :false;
            Bubbledata.Cateogory_Icon =  state.GetPopularNowBubbles!.data![i].category!.image!;
            Bubbledata.Title =
                state.GetPopularNowBubbles!.data![i].title.toString();
            Bubbledata.location =
                state.GetPopularNowBubbles!.data![i].location.toString();
            Bubbledata.StartDate =
                state.GetPopularNowBubbles!.data![i].start_event_date
                    .toString();
            Bubbledata.endDate =
                state.GetPopularNowBubbles!.data![i].end_event_date.toString();
            Bubbledata.image =
                state.GetPopularNowBubbles!.data![i].images![0].image
                    .toString();
            Bubbledata.id = state.GetPopularNowBubbles!.data![i].id!.toInt();
            Bubbledata.TYPE =
                state.GetPopularNowBubbles!.data![i].type.toString();
            Bubbledata.Creator_Alias =
                state.GetPopularNowBubbles!.data![i].created_by!.user!.alias ??
                    "";
            Bubbledata.Creator_Avatar =
                state.GetPopularNowBubbles!.data![i].created_by!.user!.avatar;
            Bubbledata.Creator_Color =
                state.GetPopularNowBubbles!.data![i].created_by!.user!
                    .background_color;
            Bubbledata.User_type =
                state.GetPopularNowBubbles!.data![i].created_by!.type;
            Bubbledata.Description =
                state.GetPopularNowBubbles!.data![i].description.toString();
            String Value = state.GetPopularNowBubbles!.data![i].color
                .toString();
            Bubbledata.Organizers =
            state.GetPopularNowBubbles!.data![i].organizers!;
            Bubbledata.dates = state.GetPopularNowBubbles!.data![i].dates!;
            Bubbledata.is_Saved = state.GetPopularNowBubbles!.data![i].is_save;
            Bubbledata.Category =
            state.GetPopularNowBubbles!.data![i].category!.name!;
            Bubbledata.users_in_bubble =
            state.GetPopularNowBubbles!.data![i].users_in_bubble!;
            Bubbledata.saved_users =
            state.GetPopularNowBubbles!.data![i].saved_users!;
            if (Value.contains("#", 0)) {
              Value = Value.substring(1);
              Value = "0xff$Value";
            }
            var myInt = int.parse(Value);
            var BackgroundColor = myInt;

            Bubbledata.Color = BackgroundColor;


            state.BUBBLElistS3!.add(Bubbledata);
            state.Used_From_All_Lists!.add(Bubbledata);
            state.FilteredBubbleList!.add(Bubbledata);
          }
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
        );

      } catch (e) {
        print('get Error $e');

      }
    }
    if (event is GetAllBubbles) {
try{
      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = true
        ..GetAllBubblesSuccess= false
        ..GetBubbles=null
      );

      final date = await _repository.GetAllBubbles();
      print(date);

      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = true
        ..GetAllBubblesSuccess= false
        ..GetBubbles.replace(date)
      );



  //    final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
      for(int i=0;i<state.GetBubbles!.data!.length;i++) {
        if (state.GetBubbles!.data![i].draw_type!="polygon") {
          // LatLng latlng = LatLng(state.GetBubbles!.data![i].lat!,
          //     state.GetBubbles!.data![i].lng!);
          Locationss Location = Locationss();
          Location.lng = state.GetBubbles!.data![i].lng;
          Location.lat = state.GetBubbles!.data![i].lat;
          Location.bubble_id = state.GetBubbles!.data![i].id;
          Location.Title = state.GetBubbles!.data![i].title;
          state.locationn!.add(Location);
          state.BubblesRaduis!.add(state.GetBubbles!.data![i].radius!.toInt());

          String Value = state.GetBubbles!.data![i].color!;
          if (Value.contains("#",0)){
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor= myInt;
          print(state.GetBubbles!.data![i].title.toString());

          // state.circle!.add(Circle(
          //     circleId: CircleId(state.GetBubbles!.data![i].id.toString()),
          //     radius: state.GetBubbles!.data![i].radius!.toDouble(),
          //     zIndex: 2,
          //     strokeColor: Colors.transparent,
          //     center: latlng,
          //     fillColor: Color(BackgroundColor).withAlpha(100)
          // ,onTap: ()async{
          //   ChangeUistatus = true;
          // }
          // ));
          // state.marker2!.add(Marker(
          //   markerId: MarkerId((state.GetBubbles!.data![i].id!+1000).toString()),
          //   position: latlng,
          //   icon: BitmapDescriptor.fromBytes(markerIcon),
          //   onTap:(){
          //
          //   },
          // ));


        }
      }





      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesSuccess= true
      );


      } catch (e) {
        print('get Error $e GetAllBubbles');
        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = false
          ..GetAllBubblesError = "Something went wrong"
          ..GetAllBubblesSuccess = false
        );
      }
    }
    if (event is GetPrimeBubbles) {
try{
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetPrimeBubbles=null
        );

        final date = await _repository.NearByPrimes(event.lat!, event.lng!);
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetPrimeBubbles.replace(date)
        );
        print("Prime bubblesss");

        for(int i=0;i<state.GetPrimeBubbles!.data!.length;i++){
          print("Prime bubblesss 2");

          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetPrimeBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetPrimeBubbles!.data![i].location.toString();
          //
          // Bubbledata.StartDate = state.GetPrimeBubbles!.data![i].start_event_date.toString();
          // Bubbledata.endDate =state.GetPrimeBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetPrimeBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetPrimeBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetPrimeBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetPrimeBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetPrimeBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetPrimeBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetPrimeBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetPrimeBubbles!.data![i].description.toString();
          Bubbledata.Organizers = state.GetPrimeBubbles!.data![i].organizers!;
          Bubbledata.is_Saved = state.GetPrimeBubbles!.data![i].is_save!;
          Bubbledata.Category = state.GetPrimeBubbles!.data![i].category!.name!;
          Bubbledata.users_in_bubble = state.GetPrimeBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetPrimeBubbles!.data![i].saved_users!;
          String Value = state.GetPrimeBubbles!.data![i].color.toString();
          Bubbledata.Cateogory_Icon =  state.GetPrimeBubbles!.data![i].category!.image!;
          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.BUBBLElistS4!.add(Bubbledata);
          print("added");
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesSuccess= true
        );

    } catch (e) {
    print('get Error $e GetPrimeBubbles');
    yield state.rebuild((b) => b
    ..GetAllBubblesIsloading = false

    ..GetAllBubblesSuccess = false


    );
    }
    }
    if (event is GetNewBubbles) {
try {
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetNewBubbles=null
        );

        final date = await _repository.GetNewBubbles();
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetNewBubbles.replace(date)
        );
        state.BUBBLElistS1!.clear();
        for(int i=0;i<state.GetNewBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();
if (      state.GetNewBubbles!.data![i].type.toString()!="Prime"){
  Bubbledata.isAvailable =
  state.GetNewBubbles!.data![i].is_available.toString()=="available"
      ? true
      :false;
  Bubbledata.StartDate = state.GetNewBubbles!.data![i].start_event_date.toString();
  Bubbledata.endDate =state.GetNewBubbles!.data![i].end_event_date.toString();
  Bubbledata.dates = state.GetNewBubbles!.data![i].dates!;

          Bubbledata.Category = state.GetNewBubbles!.data![i].category!.name!;
          Bubbledata.Title = state.GetNewBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetNewBubbles!.data![i].location.toString();

          Bubbledata.image = state.GetNewBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetNewBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetNewBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetNewBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetNewBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetNewBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetNewBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetNewBubbles!.data![i].description.toString();
          Bubbledata.Organizers = state.GetNewBubbles!.data![i].organizers!;
          Bubbledata.users_in_bubble = state.GetNewBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetNewBubbles!.data![i].saved_users!;
          String Value = state.GetNewBubbles!.data![i].color.toString();
          Bubbledata.is_Saved = state.GetNewBubbles!.data![i].is_save;
  Bubbledata.Cateogory_Icon =  state.GetNewBubbles!.data![i].category!.image!;
          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.BUBBLElistS1!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
          state.FilteredBubbleList!.add(Bubbledata);
}
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
        );

    } catch (e) {
    print('get Error $e GetNewBubbles');
    yield state.rebuild((b) => b
    ..GetAllBubblesIsloading = false

    ..GetAllBubblesSuccess = false


    );
    }


    }
    if (event is GetUpcomingBubbles) {
try{
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetNewBubbles=null
        );

        final date = await _repository.GetUpcomingBubbles();
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetUpcomingBubbles.replace(date)
        );
        state.BUBBLElistS5!.clear();
        for(int i=0;i<state.GetUpcomingBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();
          String Value = state.GetUpcomingBubbles!.data![i].color.toString();
          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          if (state.GetUpcomingBubbles!.data![i].type.toString()!="Prime"){
            Bubbledata.isAvailable =
            state.GetUpcomingBubbles!.data![i].is_available.toString()=="available"
                ? true
                :false;
          Bubbledata.StartDate = state.GetUpcomingBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetUpcomingBubbles!.data![i].end_event_date.toString();
          Bubbledata.dates = state.GetUpcomingBubbles!.data![i].dates!;
          Bubbledata.Category = state.GetUpcomingBubbles!.data![i].category!.name!;
          Bubbledata.Title = state.GetUpcomingBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetUpcomingBubbles!.data![i].location.toString();
          Bubbledata.image = state.GetUpcomingBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetUpcomingBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetUpcomingBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetUpcomingBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetUpcomingBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetUpcomingBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetUpcomingBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetUpcomingBubbles!.data![i].description.toString();
          Bubbledata.Organizers = state.GetUpcomingBubbles!.data![i].organizers!;
          Bubbledata.users_in_bubble = state.GetUpcomingBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetUpcomingBubbles!.data![i].saved_users!;
          Bubbledata.is_Saved = state.GetUpcomingBubbles!.data![i].is_save;
          Bubbledata.Cateogory_Icon =  state.GetUpcomingBubbles!.data![i].category!.image!;
          Bubbledata.Color = BackgroundColor;

          state.BUBBLElistS5!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
          state.FilteredBubbleList!.add(Bubbledata);
                }
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
        );

    } catch (e) {
    print('get Error $e GetUpcomingBubbles');
    yield state.rebuild((b) => b
    ..GetAllBubblesIsloading = false

    ..GetAllBubblesSuccess = false


    );
    }


    }
    if (event is GetActiveBubbles) {
try{
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetActiveBubbles=null
        );

        final date = await _repository.GetActiveBubbles();
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= false
          ..GetActiveBubbles.replace(date)
        );
        state.BUBBLElistS6!.clear();
        for(int i=0;i<state.GetActiveBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();
          String Value = state.GetActiveBubbles!.data![i].color.toString();
          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
            var BackgroundColor = myInt;
        if (state.GetActiveBubbles!.data![i].type.toString()!="Prime"){
          Bubbledata.isAvailable =
          state.GetActiveBubbles!.data![i].is_available.toString()=="available"
              ? true
              :false;
          Bubbledata.StartDate = state.GetActiveBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetActiveBubbles!.data![i].end_event_date.toString();
          Bubbledata.dates = state.GetActiveBubbles!.data![i].dates!;
          Bubbledata.Category = state.GetActiveBubbles!.data![i].category!.name!;
          Bubbledata.Title = state.GetActiveBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetActiveBubbles!.data![i].location.toString();
          Bubbledata.image = state.GetActiveBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetActiveBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetActiveBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetActiveBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetActiveBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetActiveBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetActiveBubbles!.data![i].created_by!.type;
          Bubbledata.Description = state.GetActiveBubbles!.data![i].description.toString();
          Bubbledata.Organizers = state.GetActiveBubbles!.data![i].organizers!;
          Bubbledata.users_in_bubble = state.GetActiveBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetActiveBubbles!.data![i].saved_users!;
          Bubbledata.is_Saved = state.GetActiveBubbles!.data![i].is_save;
          Bubbledata.Cateogory_Icon =  state.GetActiveBubbles!.data![i].category!.image!;

          Bubbledata.Color = BackgroundColor;

          state.BUBBLElistS6!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
          state.FilteredBubbleList!.add(Bubbledata);
}
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
        );

    } catch (e) {
    print('get Error $e GetActiveBubbles');
    yield state.rebuild((b) => b
    ..GetAllBubblesIsloading = false

    ..GetAllBubblesSuccess = false


    );
    }


    }

    if (event is GetSavedBubbles) {
      try {
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetSavedBubbles = null
        );

        final date = await _repository.GetSavedBubbles(event.User_id!);


        print('get Success data ${date}');
        yield state.rebuild((b) =>
        b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..GetSavedBubbles.replace(date)

        );
        for(int i=0;i<state.GetSavedBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();
          Bubbledata.isAvailable =
          state.GetSavedBubbles!.data![i].is_available.toString()=="available"
              ? true
              :false;
          Bubbledata.Category =  state.GetSavedBubbles!.data![i].category!.name!;
          Bubbledata.Cateogory_Icon =  state.GetSavedBubbles!.data![i].category!.image!;
          Bubbledata.Title = state.GetSavedBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetSavedBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetSavedBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetSavedBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetSavedBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetSavedBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetSavedBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetSavedBubbles!.data![i].created_by!.user!.alias??"";
          Bubbledata.Creator_Avatar = state.GetSavedBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetSavedBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetSavedBubbles!.data![i].created_by!.type;
          Bubbledata.users_in_bubble = state.GetSavedBubbles!.data![i].users_in_bubble!;
          Bubbledata.saved_users = state.GetSavedBubbles!.data![i].saved_users!;
          String Value = state.GetSavedBubbles!.data![i].color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.SavedBubbleList!.add(Bubbledata);
        }
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = ""
          ..success = true
        );
      } catch (e) {
        print('get Error $e GetSavedBubbles');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..GetSavedBubbles = null
        );
      }
    }
    if (event is ToggleSaveBubble) {
try{
        yield state.rebuild((b) =>
        b..isLoading = true
        );


        //'Subscribed Feed'


        if (event.List_type=='New Bubbles'){
          state.BUBBLElistS1![event.index!].is_Saved = !event.Saved_Status!;
        }else if (event.List_type=='Nearby'){
          state.BUBBLElistS2![event.index!].is_Saved = !event.Saved_Status!;
        }else if (event.List_type=='Popular Now'){
          state.BUBBLElistS3![event.index!].is_Saved = !event.Saved_Status!;
        }else if (event.List_type=='Upcoming Bubbles'){
          state.BUBBLElistS5![event.index!].is_Saved = !event.Saved_Status!;
        }   else if (event.List_type== "Search"){
          state.FilteredBubbleList![event.index!].is_Saved = !event.Saved_Status!;
        }else if (event.List_type=='Active Bubbles'){
          state.BUBBLElistS6![event.index!].is_Saved = !event.Saved_Status!;
        }else if (event.List_type=='PRIME'){
          state.BUBBLElistS4![event.index!].is_Saved = !event.Saved_Status!;
        }




        yield state.rebuild((b) =>
        b ..isLoading = false
        );

      if (event.Want_Request!) {
        final date = await _repository.SaveBubble(event.Bubble_id!);


        yield state.rebuild((b) =>
        b..SaveBubble.replace(date)
        );
      }
    } catch (e) {
    print('get Error $e ToggleSaveBubble');
    // yield state.rebuild((b) => b
    // ..GetAllBubblesIsloading = false
    //
    // ..GetAllBubblesSuccess = false
    //
    //
    // );
    }

    }


    if (event is ChangeToDetailUiState) {
      try {


        yield state.rebuild((b) =>
        b ..DetailBubbledata = event.Bubbledata
        );

        yield state.rebuild((b) =>b
          ..ShowBubbleDetailsUI = event.Status
        );
      } catch (e) {

      }
    }
    if (event is SwitchBetweenDetailUi) {
      try {

        yield state.rebuild((b) =>
        b ..isLoading = true
        );

      } catch (e) {

      }
    }
    if (event is AddMarker) {
      try {

        yield state.rebuild((b) => b
          ..circle!.add(event.circle)
          ..marker2!.add(event.marker)
        );






      } catch (e) {

      }
    }




  }


//   Stream<void> DoIT(
//       HomeEvent event,
//       ) async* {
//     if (event is ChangeUiState) {
//       try {
//         print("GOT IT");
//
//         yield state.rebuild((b) =>
//            b..ShowBubbleDetailsUI = b.ShowBubbleDetailsUI!
//         );
//
//       } catch (e) {
// print(e);
//       }
//     }
//
//   }

}


