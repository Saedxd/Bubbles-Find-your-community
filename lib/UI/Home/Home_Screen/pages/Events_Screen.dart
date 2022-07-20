
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';
import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/models/GetBubblesModel/GetPrimeBubblesModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:address_search_field/address_search_field.dart';import 'dart:math' as math;
class Events_Screen extends StatefulWidget {
  Events_Screen({Key? key,this.type, this.User_long, this.User_lat});
String? type;
double? User_long;
double? User_lat;
  @override
  State<Events_Screen> createState() => _Events_ScreenState();
}

class _Events_ScreenState extends State<Events_Screen> {
  final _formKey3 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
if (widget.type=='Nearby Primes'){
  _HomeBloc.add(GetPrimeBubbles());
  _HomeBloc.add(GetNearbyBubbles((b) =>   b
    ..lng = widget.User_long
    ..lat = widget.User_lat
  ));




}else if (widget.type=='Subscribed Feed'){


}else if (widget.type=='Popular Now'){
  _HomeBloc.add(GetPopularNowBubbles());
}
else if (widget.type=='Nearby'){
  _HomeBloc.add(GetNearbyBubbles((b) =>   b
    ..lng = widget.User_long
    ..lat = widget.User_lat
  ));


}else if (widget.type=='New Bubbles'){
  _HomeBloc.add(GetNewBubbles());
}

}

  @override
  void dispose() {
    super.dispose();
  }

  final _HomeBloc = sl<HomeBloc>();
  bool Diditonce = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _HomeBloc,
        builder: (BuildContext Context, HomeState state)
    {
      return
      SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorS.onInverseSurface,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Container(
                width: w,
                height: h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: h / 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  right: h / 20),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                    "Assets/images/Frame 11.svg",
                                    width: 30,
                                    color: ColorS.surface),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                          Text('${widget.type}', textAlign: TextAlign.left,
                            style: _TextTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 23
                            ),),
                          Text(""),
                          Text(""),
                        IconButton(
                        icon: SvgPicture.asset(
                          state.ShapStatus!?
                            "Assets/images/reshap1.svg"
                              : "Assets/images/reshap2.svg"
                            ,width:w/18
                        ),
                          onPressed:() async {
                            _HomeBloc.add(ChangeShapStatus());
                               }
                            )
                        ],
                      ),
                    ),


                state.GetNewBubblesSuccess!?
    Center(
    child: Container(
      width: w/1.1,
    height: h/1.141,
    child :
    ScrollConfiguration(
      behavior: MyBehavior(),
      child:
    GridView.builder(
    itemCount: state.Used_From_All_Lists!.length,
    scrollDirection: Axis.vertical,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
    state.ShapStatus!? 2:1,
      childAspectRatio: (5 / 5),),
    itemBuilder: (BuildContext context, int index) {
      return
      state.ShapStatus!
          ?Container(
        width: w/2.2,
        height:  h / 3.5,
        margin: EdgeInsets.all(6),
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
                  width: w/2.2,
                  height: h/6.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                    child:CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      imageUrl:
                      state.Used_From_All_Lists![index].image.toString(),

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
                Transform.rotate(
                  angle: -179.99999499104388 * (math.pi / 180),
                  child: Container(
                      width: w/2.2,
                      height: h/6.2,
                      decoration: BoxDecoration(
                        borderRadius : BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        gradient : LinearGradient(
                            begin: Alignment(5.730259880964636e-14,-2),
                            end: Alignment(2,3.9593861611176705e-16),
                            colors: [Colors.transparent,Color(state.Used_From_All_Lists![index].Color!),]
                        ),
                      )
                  ),
                ),



                Container(
                  width: w/2.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      state.Used_From_All_Lists![index].User_type=="user"
                          ? Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Color(state.Used_From_All_Lists![index].Color!),
                            backgroundImage: NetworkImage(state.Used_From_All_Lists![index].Creator_Avatar!),
                          ),
                          SizedBox(width: 10,),
                          Text(state.Used_From_All_Lists![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Red Hat Display',
                              fontSize: 10.477987289428711,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.w600,
                              height: 1
                          ),),

                        ],
                      )
                          : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Red Hat Display',
                          fontSize: 10.477987289428711,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600,
                          height: 1
                      ),),
                      SizedBox(width: 5,),
                      IconButton(
                        icon:SvgPicture.asset("Assets/images/SAVE.svg") ,
                        onPressed: (){
                          _HomeBloc.add(ToggleSaveBubble((b) =>
                          b..Bubble_id = state.Used_From_All_Lists![index].id
                            ..index = index
                          ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),


            Expanded(
              child: Row(
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
                        Container(

                          child:      Text(
                            state.Used_From_All_Lists![index].Title.toString(),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: _TextTheme.headlineLarge!.copyWith(
                              color: Color(state.Used_From_All_Lists![index].Color!),
                              fontSize: 13,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child:  Text(
                            "At ${ state.Used_From_All_Lists![index].location.toString()}",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: _TextTheme.headlineLarge!.copyWith(
                              fontSize: 8,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ),
                        Container(
                          child:Text(

                            "",
//todo : event interest
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: _TextTheme.headlineLarge!.copyWith(
                              fontSize: 6,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
      ),
                  SvgPicture.asset(
                    "Assets/images/Exclude.svg",
                    width: w/13,
                    color : Color(state.Used_From_All_Lists![index].Color!),
                  ),

                ],
              ),
            )


          ],
        ),
      )
          :Center(
        child: Container(
            width:w/1.15,
            height: h/2.1,
            decoration: BoxDecoration(
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
                          borderRadius: BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                          child:CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:  state.Used_From_All_Lists![index].image.toString(),
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
                      Transform.rotate(
                        angle: -179.99999499423683 * (math.pi / 180),
                        child: Container(
                            width:w/1.15,
                            height: h/2.89,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(7.777777194976807),
                                topRight: Radius.circular(7.777777194976807),
                                bottomRight: Radius.circular(7.777777194976807),
                                  bottomLeft: Radius.circular(7.777777194976807),
                              ),
                              gradient : LinearGradient(
                                  begin: Alignment(5.730259880964636e-14,-2),
                                  end: Alignment(2,3.9593861611176705e-16),
                                  colors: [
                                    Colors.transparent,
                                    Color(state.Used_From_All_Lists![index].Color!),
                                  ]
                              ),
                            )
                        ),
                      ),
                      Container(
                        width:w/1.15,
                        height: h/9.89,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          state.Used_From_All_Lists![index].User_type=="user"
                                ? Row(
                              children: [
                                CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Color(state.Used_From_All_Lists![index].Color!),
                                  backgroundImage: NetworkImage(state.Used_From_All_Lists![index].Creator_Avatar!),
                                ),
                                SizedBox(width: 10,),
                                Text(state.Used_From_All_Lists![index].Creator_Alias!, textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 10.477987289428711,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),

                              ],
                            )
                                : Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Red Hat Display',
                                fontSize: 10.477987289428711,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.w600,
                                height: 1
                            ),),

                            SizedBox(width: 10,),
                            IconButton(
                              icon: SvgPicture.asset("Assets/images/SAVE.svg",width: w/12,    height: h/2.89,),
                              onPressed: (){
                                _HomeBloc.add(ToggleSaveBubble((b) =>
                                b..Bubble_id = state.Used_From_All_Lists![index].id
                                  ..index = index
                                ));
                              },
                            ),
                          ],
                        ),
                      ),
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
                          Container(
                            child: Text(
                            state.Used_From_All_Lists![index].Title.toString(),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: _TextTheme.headlineLarge!.copyWith(
                                    color: Color(state.Used_From_All_Lists![index].Color!),
                                fontSize: 25,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ),
                          SizedBox(height: 5,),
                          Container(
                            child:  Text(
                          "At ${ state.Used_From_All_Lists![index].location.toString()}",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: _TextTheme.headlineLarge!.copyWith(
                                fontSize: 17,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),

                            ),
                          ),
                          SizedBox(height: 5,),
                          Text('Music Event', textAlign: TextAlign.left, style: TextStyle(
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
                    SizedBox(width: 5,),
                    SvgPicture.asset(
                      "Assets/images/Exclude.svg",
                      width: w/8,
                      color : Color(state.Used_From_All_Lists![index].Color!),
                    ),

                  ],
                )
              ],
            )

        ),
      );
                              }
                          )
                      ),
                )
        )

                    :Text("")

                  ],
                ),
              )
          ),
        ),
      );
    }
    );
  }




  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

}
class BubbleData{
  String? image;
  String? TYPE;
  String? Title;
  String? location;
  String? StartDate;
  String? endDate;
  String? type;
  int? Color;
  int? id;
  String? Creator_Alias;
  String? Creator_Color;
  String? Creator_Avatar;
  String? User_type;

}
