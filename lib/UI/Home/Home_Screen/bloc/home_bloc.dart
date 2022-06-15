
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:bubbles/Data/repository/irepository.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';

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

    // if (event is UserMoved) {
    //   LatLng latlng = LatLng(event.lat!,event.lng!);
    //   try {
    //     yield state.rebuild((b) => b
    //       ..marker = Marker(
    //         markerId: MarkerId("UserLocation"),
    //         position: latlng,
    //         draggable: false,
    //         zIndex: 2,
    //         anchor: Offset(0.5, 0.5),
    //       )
    //       ..success =true
    //     );
    //
    //
    //   } catch (e) {
    //     print('get Error $e');
    //     yield state.rebuild((b) => b
    //       ..isLoading = false
    //       ..error = "Something went wrong"
    //       ..success = false
    //         ..marker =  Marker(
    //           markerId: MarkerId("UserLocation"),
    //           position: LatLng(0,0),
    //           draggable: false,
    //           zIndex: 2,
    //           anchor: Offset(0.5, 0.5),
    //         )
    //
    //
    //     );
    //   }
    // }//
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
      );

    }

    if (event is OpenDoorTObeAbleTOsetBubble){
      yield state.rebuild((b) => b
        ..MakeHimBEableTOSEtBubble = event.MakeHimBEableTOSEtBubbles!
      );
    }

    if (event is GetAllBubbles) {
      try {
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

            String Value = state.GetBubbles!.data![i].color!;
            if (Value.contains("#",0)){
              Value = Value.substring(1);
              Value = "0xff$Value";
            }
            var myInt = int.parse(Value);
            var BackgroundColor= myInt;
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







      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = false
          ..GetAllBubblesError = "Something went wrong"
          ..GetAllBubblesSuccess = false
          ..GetBubbles = null
        );
      }
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
          ..GetNewBubblesIsloading = false
          ..GetNewBubblesError = ""
          ..GetNewBubblesSuccess= true
          ..GetNewBubbles.replace(date)
        );

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

//     if (event is RaduisUpdated) {
//       try {
// //       //  final   Uint8List   markerIcon = await getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
// // Circle Circle22 = Circle(
// //     circleId: CircleId("New bubble"),
// //     radius: event.Radius!,
// //     center: LatLng(event.lat! ,event.lng!),
// // );
// // Marker Marker22 = Marker(
// //   markerId:  MarkerId("New Marker"),
// //   position: LatLng(event.lat! ,event.lng!),
// //   //  icon: BitmapDescriptor.fromBytes(markerIcon),
// // );
//
// yield state.rebuild((b) => b
//   ..GetAllBubblesIsloading = true
//   ..GetAllBubblesError = ""
//   ..GetAllBubblesSuccess= false
// );
//
//         yield state.rebuild((b) => b
//             ..circle!("New bubble") =
//              ..marker2!.add(Marker22)
//         );
//
//
//
// yield state.rebuild((b) => b
//   ..GetAllBubblesIsloading = false
//   ..GetAllBubblesError = ""
//   ..GetAllBubblesSuccess= true
// );
//         // yield state.rebuild((b) => b
//         //   ..circle!.add(Circle(
//         //       circleId: CircleId("New bubble"),
//         //       radius: event.Radius!,
//         //       zIndex: 2,
//         //       strokeColor: Colors.transparent,
//         //       center: LatLng(event.lat! ,event.lng!),
//         //       fillColor: Colors.red.withAlpha(100)))
//         //   ..marker2!.add(Marker(
//         //     markerId:  MarkerId("New Marker"),
//         //     position: LatLng(event.lat! ,event.lng!),
//         //     //  icon: BitmapDescriptor.fromBytes(markerIcon),
//         //   ))
//         // ) as HomeState;
//
//         //
//         //
//
//         // yield state.circle!.add(Circle(
//         //     circleId: CircleId("New bubble"),
//         //     radius: event.Radius!,
//         //     zIndex: 2,
//         //     strokeColor: Colors.transparent,
//         //     center: LatLng(event.lat! ,event.lng!),
//         //     fillColor: Colors.red.withAlpha(100))) as HomeState;
//         // yield state.marker2!.add(Marker(
//         //   markerId:  MarkerId("New Marker"),
//         //   position: LatLng(event.lat! ,event.lng!),
//         //   icon: BitmapDescriptor.fromBytes(markerIcon),
//         // )) as HomeState;
//
//         print("BUBBLE CREATED");
//       } catch (e) {
//       print(e);
//       }
//     }
    if (event is GetProfile) {
      try {
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

            String Value = state.GetBubbles!.data![i].color!;
            if (Value.contains("#",0)){
              Value = Value.substring(1);
              Value = "0xff$Value";
            }
            var myInt = int.parse(Value);
            var BackgroundColor= myInt;
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







      } catch (e) {
        print('get Error $e');
        yield state.rebuild((b) => b
          ..GetAllBubblesIsloading = false
          ..GetAllBubblesError = "Something went wrong"
          ..GetAllBubblesSuccess = false
          ..GetBubbles = null
        );
      }
    }//todo : implemment this on home screen

  }


}


