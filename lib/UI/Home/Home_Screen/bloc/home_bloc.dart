
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
        markerId:  MarkerId("UserLocation"),
        position:  LatLng(event.lat! ,event.lng!),
      ));


      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesError = ""
        ..GetAllBubblesSuccess= true
          ..Userlng= event.lng
          ..Userlat = event.lat
      );

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
          ..GetAllPrimeIsloading = true
          ..GetAllPrimeError = ""
          ..GetAllPrimeSuccess= false
          ..GetPrimeBubbles=null
        );

        final date = await _repository.GetPrimeBubblees();
        print(date);

        yield state.rebuild((b) => b
          ..GetAllPrimeIsloading = false
          ..GetAllPrimeError = ""
          ..GetAllPrimeSuccess= true
          ..GetPrimeBubbles.replace(date)
        );

      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetAllPrimeIsloading = false
          ..GetAllPrimeError = "Something went wrong"
          ..GetAllPrimeSuccess = false
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
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = "Something went wrong"
          ..GetNewBubblesSuccess = false
          ..GetNewBubbles = null
        );
      }
    }
    if (event is CreateBubbless) {
      try {
      //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
Circle Circle22 = Circle(
    circleId: CircleId("New bubble"),
    radius: event.Radius!,
    zIndex: 2,
    strokeColor: Colors.transparent,
    center: LatLng(event.lat! ,event.lng!),
    fillColor: Colors.red.withAlpha(100));

Marker Marker22 = Marker(
  markerId:  MarkerId("New Marker"),
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
      } catch (e) {
      print(e);

      yield state.rebuild((b) => b
        ..GetAllBubblesIsloading = false
        ..GetAllBubblesError = "Error"
        ..GetAllBubblesSuccess= false
      );
      }
    }
    if (event is DeleteBubble) {
      try {
        //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);

        Circle Circle22 = Circle(
            circleId: CircleId("New bubble"),
     );
        Marker Marker22 = Marker(
          markerId:  MarkerId("New Marker"),
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
      print(e);

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

    state.BUBBLElistS1!.forEach((BubbbleOBject) {
      if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
        state.FilteredBUBBLElists1!.add(BubbbleOBject);
      }
      if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && BubbbleOBject.location!=BubbbleOBject.Title) {
        state.FilteredBUBBLElists1!.add(BubbbleOBject);
      }
    });


    state.BUBBLElistS2!.forEach((BubbbleOBject) {
      if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
        state.FilteredBUBBLElists2!.add(BubbbleOBject);
      }
      if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && BubbbleOBject.location!=BubbbleOBject.Title) {
        state.FilteredBUBBLElists2!.add(BubbbleOBject);
      }
    });


    state.BUBBLElistS3!.forEach((BubbbleOBject) {
      if (BubbbleOBject.location!.toLowerCase().contains(event.Keyword!.toLowerCase())) {
        state.FilteredBUBBLElists3!.add(BubbbleOBject);
      }
      if (BubbbleOBject.Title!.toLowerCase().contains(event.Keyword!.toLowerCase()) && BubbbleOBject.location!=BubbbleOBject.Title) {
        state.FilteredBUBBLElists3!.add(BubbbleOBject);
      }
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



  }


}


