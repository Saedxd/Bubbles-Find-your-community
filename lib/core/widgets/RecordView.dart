
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

  const RecorderView({Key? key, required this.onSaved}) : super(key: key);
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
        padding: EdgeInsets.only(top: h / 50),
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
                if (mounted) {
                  StopedRecording = false;
                  await _onRecordButtonPressed();
                  setState(() {});
                }
              },
              icon: SvgPicture.asset(
                "Assets/images/MIC.svg",
                width: w / 16,)),
        ));
  }

  Future<void> _onRecordButtonPressed() async {
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

  _initRecorder() async {
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

  _startRecording() async {
    if (mounted) {


    await audioRecorder.start();
    StopedRecording = false;
    setState((){});
    // await audioRecorder.current(channel: 0);
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
