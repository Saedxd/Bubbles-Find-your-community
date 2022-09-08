import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_Bloc.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/bloc/Sprints_state.dart';
import 'package:bubbles/UI/Bubbles/Sprints/DirectChat/pages/SprintChat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SprintMatch extends StatefulWidget{

  SprintMatch({Key? key,
    required this.Image1
    ,required this.Image2
    ,required this.BackgroundColor1,
    required this.BackgroundColor2
    ,required this.His_Alias,
    required this.MY_ID,
    required this.His_ID,
    required this.Bubble_id,
    required this.Plan_title,
    required this.bubble_Color
  })
      : super(key: key,);
  String Image1;
  String Image2;
  String His_Alias;
  int BackgroundColor1;
  int BackgroundColor2;
  int MY_ID;
  int His_ID;
  int Bubble_id;
  String Plan_title;
  int? bubble_Color;

  @override
  State<SprintMatch> createState() => _SprintMatchState();
}

class _SprintMatchState extends State<SprintMatch> {
  final _SprintsChatBloc = sl<SprintsBloc>();

  @override
  void initState(){
    super.initState();
    // _SprintsChatBloc.add(GetUsersInsideBubble((b) =>b
    //   ..Bubble_id = widget.Bubble_id
    // ));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _SprintsChatBloc,
        builder: (BuildContext Context, SprintsState state) {

          return
            Scaffold(
              backgroundColor: Color(0xff303030),
              body: SafeArea(
                child: Container(
                  width: w,
                  height: h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(""),
                      Column(
                      children: [
                        Text(widget.His_Alias, textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 39.78947448730469.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                            height: 1
                        ),),
                        SizedBox(height: h/20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: w/3,
                              height: h / 5,
                              child:   CachedNetworkImage(
                                imageUrl:
                                widget.Image1,
                                errorWidget: (context, url, error) => Center(child: Text("Error")),
                                imageBuilder: (context, imageProvider) => CircleAvatar(
                                  radius: 28.w,
                                  backgroundImage: imageProvider,
                                  backgroundColor:   Color( widget.BackgroundColor1),
                                ),
                              ),

                            ),
                            SizedBox(width: h/20,),
                            Container(
                              width: w/3,
                              height: h / 5,
                              child:   CachedNetworkImage(
                                imageUrl:
                                widget.Image2,
                                errorWidget: (context, url, error) => Center(child: Text("Error")),
                                imageBuilder: (context, imageProvider) => CircleAvatar(
                                  radius: 28.w,
                                  backgroundImage: imageProvider,
                                  backgroundColor:   Color( widget.BackgroundColor2),
                                ),
                              ),

                            ),
                          ],
                        ),

                      ],
                    ),
                      Text(""),
                      InkWell(
                        onTap: (){
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                Sprints(
                                  my_ID: widget.MY_ID,
                                  receiver_id: widget.His_ID,
                                  IS_sprints: true,His_Alias: widget.His_Alias,
                                  Bubble_id: widget.Bubble_id,Plan_Title: widget.Plan_title,
                                  Color: widget.bubble_Color,
                                )),

                          ));
                        },
                        child: Text('Tap to Continue', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 22.729999542236328.sp,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.w400,
                            height: 1
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            );
        }
    );
  }
  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
}