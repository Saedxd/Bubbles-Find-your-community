import 'dart:developer';
import 'dart:io';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Profile/QrScanner_Screen/bloc/QrScreen_bloc.dart';
import 'package:bubbles/UI/Profile/QrScanner_Screen/bloc/QrScreen_event.dart';
import 'package:bubbles/UI/Profile/QrScanner_Screen/bloc/QrScreen_state.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QR_Scanner extends StatefulWidget {
  const QR_Scanner({Key? key}) : super(key: key);

  @override
  State<QR_Scanner> createState() => _QR_ScannerState();
}

class _QR_ScannerState extends State<QR_Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool Diditonce = false;
  final _QrBloc = sl<QrScreenBLoc>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void reassemble(){
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState(){
    super.initState();
    Diditonce = true;
  }
  // CommingSoonPopup(
  //     BuildContext Context,
  //     double h,
  //     double w,
  //     String Value,
  //     String buttonValue,
  //     int FontSize
  //     ) async {
  //   return showDialog(
  //       context: Context,
  //          barrierDismissible: true,
  //       builder: (Context) {
  //         return AlertDialog(
  //             backgroundColor: Colors.transparent,
  //             insetPadding: EdgeInsets.all(h/100),
  //             content:Container(
  //               width: w/1.4,
  //               height: h/3,
  //               decoration: BoxDecoration(
  //                 borderRadius : BorderRadius.only(
  //                   topLeft: Radius.circular(8.285714149475098),
  //                   topRight: Radius.circular(8.285714149475098),
  //                   bottomLeft: Radius.circular(8.285714149475098),
  //                   bottomRight: Radius.circular(8.285714149475098),
  //                 ),
  //                 color: Colors.transparent,
  //               ),
  //
  //
  //               child: Stack(
  //                 children: [
  //
  //                   Positioned(
  //                     top: h/12.5,
  //                     child: Container(
  //                       width: w/1.4,
  //                       height: h/4.2,
  //                       decoration: BoxDecoration(
  //                         borderRadius : BorderRadius.only(
  //                           topLeft: Radius.circular(8.285714149475098),
  //                           topRight: Radius.circular(8.285714149475098),
  //                           bottomLeft: Radius.circular(8.285714149475098),
  //                           bottomRight: Radius.circular(8.285714149475098),
  //                         ),
  //                         color : Color.fromRGBO(47, 47, 47, 1),
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Text(""),
  //
  //
  //                           Center(
  //                             child: Text(Value,
  //                               textAlign: TextAlign.center, style: TextStyle(
  //                                   color: Color.fromRGBO(234, 234, 234, 1),
  //                                   fontFamily: 'Red Hat Display',
  //                                   fontSize: FontSize.toDouble(),
  //                                   letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                                   fontWeight: FontWeight.w600,
  //                                   height: 1
  //                               ),),
  //                           ),
  //
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Center(
  //                                 child: InkWell(
  //                                   onTap: (){
  //                                     Navigator.pop(context);
  //                                   },
  //                                   child: Container(
  //                                     height: h/15.5,
  //                                     width: w/2,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius : BorderRadius.only(
  //                                         topLeft: Radius.circular(4.142857074737549),
  //                                         topRight: Radius.circular(4.142857074737549),
  //                                         bottomLeft: Radius.circular(4.142857074737549),
  //                                         bottomRight: Radius.circular(4.142857074737549),
  //                                       ),
  //                                       boxShadow : [BoxShadow(
  //                                           color: Color.fromRGBO(0, 0, 0, 0.25),
  //                                           offset: Offset(0,0),
  //                                           blurRadius: 6.628571510314941
  //                                       )],
  //                                       color : Color.fromRGBO(168, 48, 99, 1),
  //                                     ),
  //                                     child: Center(
  //                                       child:
  //                                       Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
  //                                           color: Color.fromRGBO(234, 234, 234, 1),
  //                                           fontFamily: 'Red Hat Text',
  //                                           fontSize: 14,
  //                                           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
  //                                           fontWeight: FontWeight.w400,
  //                                           height: 1
  //                                       ),),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Positioned(
  //                     left: h/8,
  //                     bottom: h/5,
  //                     child: SvgPicture.asset(
  //                       "Assets/images/widget.svg",
  //                       width: 90,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //
  //         );
  //       });
  // }

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
        bloc: _QrBloc,
        builder: (BuildContext Context, QrScreenState state) {

          void _onQRViewCreated(QRViewController controller) {
            this.controller = controller;
            controller.scannedDataStream.listen((scanData) {

              String value = scanData.code.toString();
              String substring = value.substring(value.length-5, value.length-4);

              if(substring=="#"&& Diditonce) {
                print("IM INNNN");
                _QrBloc.add(AddfriendWithQr((b) =>b
                ..serial = value.toString()
                ));
                Diditonce =false;
              }

            });
          }

          Widget _buildQrView(BuildContext context) {
            return QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderRadius: 10,
                  borderLength: 100,
                  borderWidth: 10,
                  cutOutSize: MediaQuery.of(context).size.width * 0.5
              ),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            );
          }

          if (state.FreindAdded! &&!Diditonce){
            if (state.AddFreindBarCode!.statuscode==200){
              WidgetsBinding.instance.addPostFrameCallback((_){
                Navigator.pop(context, 'Yep!');
              });
              Diditonce = true;
            }
          }

          return  Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: <Widget>[
                Container(width: w, height: h, child: _buildQrView(context)),
                Container(
                        margin: EdgeInsets.only(top: h/30, left: h/70),
                        width: w / 6,
                        height: h / 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                  "Assets/images/Frame 11.svg",
                                  width: 30.w,
                                  color: COLOR.surface),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )),
                Positioned(
                  bottom: h/3.5,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                        Text('Scan QR Code', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Sofia Pro',
                            fontSize: 0.285.sp,
                            letterSpacing: 0.5 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),),
                    ],
                  ),

                ),
              ],
            ),
          );
        });
  }

}

//  Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.toggleFlash();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getFlashStatus(),
//                               builder: (context, snapshot) {
//                                 return Text('Flash: ${snapshot.data}');
//                               },
//                             )),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                             onPressed: () async {
//                               await controller?.flipCamera();
//                               setState(() {});
//                             },
//                             child: FutureBuilder(
//                               future: controller?.getCameraInfo(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.data != null) {
//                                   return Text(
//                                       'Camera facing ${describeEnum(snapshot.data!)}');
//                                 } else {
//                                   return const Text('loading');
//                                 }
//                               },
//                             )),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.pauseCamera();
//                           },
//                           child: const Text('pause',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.all(8),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             await controller?.resumeCamera();
//                           },
//                           child: const Text('resume',
//                               style: TextStyle(fontSize: 20)),
//                         ),
//                       )
//                     ],
//                   ),