
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';

import 'dart:ui' as ui;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker_updates.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  IRepository _repository;


  HomeBloc(this._repository) : super(HomeState.initail()) ;

  @override
  HomeState get initialState => HomeState.initail();

  @override
  Stream<HomeState> mapEventToState(
      HomeEvent event,
      ) async* {

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
      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = true
        ..GetAllBubblesError = ""
        ..GetAllBubblesSuccess= false
      );
      state.marker2!.add(Marker(
        markerId:  const MarkerId("UserLocation"),
        position:  LatLng(event.lat! ,event.lng!),
      ));


      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesError = ""
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
    if (event is Getprofile) {
      try {
        yield state.rebuild((b) => b
          ..GetprofileISloading = true
          ..GetprofileSuccess= false
          ..ProfileDate=null
        );

        final date = await _repository.GetProfile();
        print(date);

        yield state.rebuild((b) => b
          ..GetprofileISloading = false
          ..GetprofileSuccess= true
          ..ProfileDate.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetprofileISloading = false
          ..GetprofileSuccess= false
        );
      }
    }

    if (event is CreateBubbless) {
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
  markerId:  const MarkerId("New Marker"),
  position: LatLng(event.lat! ,event.lng!),
  //  icon: BitmapDescriptor.fromBytes(markerIcon),
);

yield state.rebuild((b) => b
  ..GetAllBubblesIsloading = true
  ..GetAllBubblesError = ""
  ..GetAllBubblesSuccess= false
);

        yield state.rebuild((b) => b
            ..circle!.add(Circle22)
             ..marker2!.add(Marker22)
        );



yield state.rebuild((b) => b
  ..GetAllBubblesIsloading = false
  ..GetAllBubblesError = ""
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
    if (event is DeleteBubble) {
      try {
        //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);

        Circle Circle22 = const Circle(
            circleId: CircleId("New bubble"),
          radius: 0,
          visible: false
     );
        Marker Marker22 =  Marker(
            markerId:   MarkerId("New Marker"),
          //  icon: BitmapDescriptor.fromBytes(markerIcon),
            visible: false,
          onDrag: (LatLng){
              print("SAEDDD");
          }
        );

        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = true
          ..GetAllBubblesError = ""
          ..GetAllBubblesSuccess= false
        );

        yield state.rebuild((b) => b
          ..circle!.add(Circle22)
          ..marker2!.add(Marker22)
        );

        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = false
          ..GetAllBubblesError = ""
          ..GetAllBubblesSuccess= false
        );



      } catch (e) {
        print(e);

        yield state.rebuild((b) => b
          ..ValueLOading = false
        );
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
    if (event is SearchBubblesLists){
      try {
        yield state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
        );

        state.FilteredBUBBLElists1!.clear();
        state.FilteredBUBBLElists2!.clear();
        state.FilteredBUBBLElists3!.clear();
        print("Cleared");
        bool Didit1= false;
        bool Didit2= false;
        bool Didit3= false;

        state.BUBBLElistS1!.forEach((BubbbleOBject) {
          if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredBUBBLElists1!.add(BubbbleOBject);
            Didit1 = true;
          }
          if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && !Didit1) {
            state.FilteredBUBBLElists1!.add(BubbbleOBject);
          }
          Didit1 = false;
        });


        state.BUBBLElistS2!.forEach((BubbbleOBject) {
          if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredBUBBLElists2!.add(BubbbleOBject);
            Didit2 = true;
          }
          if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && !Didit2) {
            state.FilteredBUBBLElists2!.add(BubbbleOBject);
          }
          Didit2 = false;
        });


        state.BUBBLElistS3!.forEach((BubbbleOBject) {
          if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
            state.FilteredBUBBLElists3!.add(BubbbleOBject);
            Didit3 = true;
          }

          if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && !Didit3) {
            state.FilteredBUBBLElists3!.add(BubbbleOBject);
          }
          Didit3 = false;
        });





        yield state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
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
        state.FilteredBUBBLElists2!.clear();
        state.BUBBLElistS2!.clear();
        for(int i=0;i<state.GetNearbyBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetNearbyBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetNearbyBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetNearbyBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetNearbyBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetNearbyBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetNearbyBubbles!.data![i].id!.toInt();
          Bubbledata.TYPE = state.GetNearbyBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetNearbyBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetNearbyBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetNearbyBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetNearbyBubbles!.data![i].created_by!.type;
          String Value = state.GetNearbyBubbles!.data![i].color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.FilteredBUBBLElists2!.add(Bubbledata);
          state.BUBBLElistS2!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
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

        state.FilteredBUBBLElists3!.clear();
        state.BUBBLElistS3!.clear();
        for(int i=0;i<state.GetPopularNowBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetPopularNowBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetPopularNowBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetPopularNowBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetPopularNowBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetPopularNowBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetPopularNowBubbles!.data![i].id!.toInt();
          Bubbledata.TYPE = state.GetPopularNowBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetPopularNowBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetPopularNowBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetPopularNowBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetPopularNowBubbles!.data![i].created_by!.type;

          String Value = state.GetPopularNowBubbles!.data![i].color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.FilteredBUBBLElists3!.add(Bubbledata);
          state.BUBBLElistS3!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
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

      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = true
        ..GetAllBubblesError = ""
        ..GetAllBubblesSuccess= false
        ..GetBubbles=null
      );

      final date = await _repository.GetAllBubbles();
      print(date);

      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesError = ""
        ..GetAllBubblesSuccess= true
        ..GetBubbles.replace(date)
      );



      final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
      for(int i=0;i<state.GetBubbles!.data!.length;i++) {
        if (state.GetBubbles!.data![i].draw_type!="polygon") {
          LatLng latlng = LatLng(state.GetBubbles!.data![i].lat!,
              state.GetBubbles!.data![i].lng!);
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

          state.circle!.add(Circle(
              circleId: CircleId(state.GetBubbles!.data![i].id.toString()),
              radius:
              state.GetBubbles!.data![i].radius!.toDouble(),
              zIndex: 2,
              strokeColor: Colors.transparent,
              center: latlng,
              fillColor: Color(BackgroundColor).withAlpha(100)));
          state.marker2!.add(Marker(
            markerId:  MarkerId((state.GetBubbles!.data![i].id!+1000).toString()),
            position: latlng,
            icon: BitmapDescriptor.fromBytes(markerIcon),
          ));
        }
      }





      //
      //
      // } catch (e) {
      //   print('get Error $e');
      //   yield state.rebuild((b) => b
      //     ..GetAllBubblesIsloading = false
      //     ..GetAllBubblesError = "Something went wrong"
      //     ..GetAllBubblesSuccess = false
      //     ..GetBubbles = null
      //   );
      // }
    }
    if (event is GetPrimeBubbles) {
      try {
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetPrimeBubbles=null
        );

        final date = await _repository.GetPrimeBubblees();
        print(date);

        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = true
          ..GetNewBubblesSuccess= false
          ..GetPrimeBubbles.replace(date)
        );
        for(int i=0;i<state.GetPrimeBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetPrimeBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetPrimeBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetPrimeBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetPrimeBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetPrimeBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetPrimeBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetPrimeBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetPrimeBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetPrimeBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetPrimeBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetPrimeBubbles!.data![i].created_by!.type;
          String Value = state.GetPrimeBubbles!.data![i].color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;


          state.Used_From_All_Lists!.add(Bubbledata);
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesSuccess= true
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetPrimeBubbles = null
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
        state.FilteredBUBBLElists1!.clear();
        state.BUBBLElistS1!.clear();
        for(int i=0;i<state.GetNewBubbles!.data!.length;i++){


          BubbleData Bubbledata = BubbleData();

          Bubbledata.Title = state.GetNewBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetNewBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetNewBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetNewBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetNewBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetNewBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetNewBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetNewBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetNewBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetNewBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetNewBubbles!.data![i].created_by!.type;
          String Value = state.GetNewBubbles!.data![i].color.toString();

          if (Value.contains("#", 0)) {
            Value = Value.substring(1);
            Value = "0xff$Value";
          }
          var myInt = int.parse(Value);
          var BackgroundColor = myInt;

          Bubbledata.Color = BackgroundColor;

          state.FilteredBUBBLElists1!.add(Bubbledata);
          state.BUBBLElistS1!.add(Bubbledata);
          state.Used_From_All_Lists!.add(Bubbledata);
        }
        yield state.rebuild((b) => b
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
        );

        // state.FilteredBUBBLElists1!.clear();
        // state.BUBBLElistS1!.clear();


      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetNewBubbles = null
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

          Bubbledata.Title = state.GetSavedBubbles!.data![i].title.toString();
          Bubbledata.location = state.GetSavedBubbles!.data![i].location.toString();
          Bubbledata.StartDate = state.GetSavedBubbles!.data![i].start_event_date.toString();
          Bubbledata.endDate =state.GetSavedBubbles!.data![i].end_event_date.toString();
          Bubbledata.image = state.GetSavedBubbles!.data![i].images![0].image.toString();
          Bubbledata.id = state.GetSavedBubbles!.data![i].id!.toInt();
          Bubbledata.type = state.GetSavedBubbles!.data![i].type.toString();
          Bubbledata.Creator_Alias = state.GetSavedBubbles!.data![i].created_by!.user!.alias;
          Bubbledata.Creator_Avatar = state.GetSavedBubbles!.data![i].created_by!.user!.avatar;
          Bubbledata.Creator_Color = state.GetSavedBubbles!.data![i].created_by!.user!.background_color;
          Bubbledata.User_type = state.GetSavedBubbles!.data![i].created_by!.type;
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
        print('get Error $e');
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
      try {

        // yield state.rebuild((b) =>
        // b ..ToggleSaveIsloading = true  );
    //    state.SavedBubbleList!.removeAt(event.index!);
        final date = await _repository.SaveBubble(event.Bubble_id!);

        yield state.rebuild((b) =>
        b
          //..ToggleSaveIsloading = false
          ..SaveBubble.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) =>
        b
          ..isLoading = false
          ..error = "Something went wrong"
          ..success = false
          ..SaveBubble = null
        );
      }
    }
  }


}


