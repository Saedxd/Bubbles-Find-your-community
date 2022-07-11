
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:bubbles/UI/Onboarding/Permissions_Screen/pages/Permission1_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';

class RecorderView extends StatefulWidget {
  final Function onSaved;
  int? bubble_id;

   RecorderView({Key? key, required this.onSaved,this.bubble_id}) : super(key: key);
  @override
  _RecorderViewState createState() => _RecorderViewState();
}

enum RecordingState {
  UnSet,
  Set,
  Recording,
  Stopped,
}

class _RecorderViewState extends State<RecorderView> with TickerProviderStateMixin {
  RecordingState _recordingState = RecordingState.UnSet;

  late FlutterAudioRecorder2 audioRecorder;

  AnimationController? _animationController;
  Animation? _animation;
  bool? StopedRecording = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      StopedRecording = true;
      _animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 2));
      _animationController!.repeat(reverse: true);
      _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController!)
        ..addListener(() {
          setState(() {

          });
        });
      final status = Permission.microphone.request();

      status.isGranted.then((value) =>
      _recordingState = RecordingState.Set
      );
    }
  }

  Future OutsideBubbleAlreat()async
  {
    return       showDialog(
        builder: (BuildContext context) {
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Container(
              child: AlertDialog(
                backgroundColor: Color(0xffEAEAEA),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                content:  Container(
                  width: w,
                  height: h/3,
                  decoration: BoxDecoration(
                    borderRadius : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color : Color.fromRGBO(234, 234, 234, 1),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [

                          Container(
                              width: w/3,
                              child: Image.asset("Assets/images/Ellipse 26.png",fit: BoxFit.fill,)
                          ),

                          Positioned(
                              top: h/35,
                              left: h/35,
                              child: Image.asset("Assets/images/Vector.png")
                          )

                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('WOOPS!', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          fontFamily: 'Red Hat Display',
                          fontStyle: FontStyle.italic,
                          fontSize: 22,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1
                      ),),
                      SizedBox(height: h/40,),
                      Text('Looks like you are not in this bubble! Please move closer to activate additional features.', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(47, 47, 47, 1),
                          fontFamily: 'Red Hat Text',
                          fontSize: 12,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600,
                          height: 1.25
                      ),)


                    ],
                  ),
                ),

              )
          );
        }, context: context
    );

  }

  @override
  void dispose() {

    if (mounted) {
      _animationController!.dispose();
      _recordingState = RecordingState.UnSet;
      super.dispose();
      //  audioRecorder.stop();
      // StopedRecording = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  Container(
        child: Container(
          width: w / 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                  color:!StopedRecording! ? Color.fromARGB(130, 237, 125, 58):Colors.transparent,
                  blurRadius:!StopedRecording! ?_animation!.value:0,
                  spreadRadius:!StopedRecording! ?_animation!.value:0
              )]
          ),
          child: IconButton(
              onPressed: () async{
                bool GetInStatus = false;
                for(int j =0;j<AllBubblesIDS!.length;j++){
                  if (widget.bubble_id==AllBubblesIDS![j]){
                    if (AllBubblesStatus![j]==1)
                      GetInStatus = true;
                  }
                }
                if (GetInStatus) {
                  if (mounted) {
                    StopedRecording = false;
                    await _onRecordButtonPressed();
                    setState(() {});
                  }
                }else{
                  OutsideBubbleAlreat();
                }
              },
              icon: SvgPicture.asset(
                "Assets/images/MIC.svg",
                width: w / 16,)),
        ));
  }

  Future<void> _onRecordButtonPressed() async {
    bool GetInStatus = false;
    for(int j =0;j<AllBubblesIDS!.length;j++){
      if (widget.bubble_id==AllBubblesIDS![j]){
        if (AllBubblesStatus![j]==1)
          GetInStatus = true;
      }
    }
    if (GetInStatus) {
      if (mounted) {
        switch (_recordingState) {
          case RecordingState.Set:
            await _recordVoice();
            break;

          case RecordingState.Recording:
            await _stopRecording();
            _recordingState = RecordingState.Stopped;
            break;

          case RecordingState.Stopped:
            await _recordVoice();
            break;

          case RecordingState.UnSet:
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Please allow recording from settings.'),
            ));
            break;
        }
      }
    }
  }

  _initRecorder() async {
    bool GetInStatus = false;
    for(int j =0;j<AllBubblesIDS!.length;j++){
      if (widget.bubble_id==AllBubblesIDS![j]){
        if (AllBubblesStatus![j]==1)
          GetInStatus = true;
      }
    }
    if (GetInStatus) {
      if (mounted) {
        Directory appDirectory = await getApplicationDocumentsDirectory();
        String filePath = appDirectory.path +
            '/'
            +
            DateTime
                .now()
                .millisecondsSinceEpoch
                .toString()
            +
            '.aac';

        audioRecorder =
            FlutterAudioRecorder2(filePath, audioFormat: AudioFormat.AAC);
        await audioRecorder.initialized;
      }
    }
  }

  _startRecording() async {
    bool GetInStatus = false;
    for(int j =0;j<AllBubblesIDS!.length;j++){
      if (widget.bubble_id==AllBubblesIDS![j]){
        if (AllBubblesStatus![j]==1)
          GetInStatus = true;
      }
    }
    if (GetInStatus) {
      if (mounted) {
        await audioRecorder.start();
        StopedRecording = false;
        setState(() {});
        // await audioRecorder.current(channel: 0);
      }
    }

  }

  _stopRecording() async {
    if (mounted) {
      await audioRecorder.stop();


      StopedRecording = true;
      setState(() {});
      widget.onSaved(audioRecorder.recording!.path.toString());
    }
  }

  Future<void> _recordVoice() async {
    if (mounted) {
      final hasPermission = await FlutterAudioRecorder2.hasPermissions;
      if (hasPermission ?? false) {
        await _initRecorder();

        await _startRecording();
        _recordingState = RecordingState.Recording;
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please allow recording from settings.'),
        ));
      }
    }
  }
}
