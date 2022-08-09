
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
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
  Events_Screen({Key? key, required this.Bubble ,required this.Type,required this.my_id});
  List<BubbleData> Bubble;
  String Type;
  int my_id;
  @override
  State<Events_Screen> createState() => _Events_ScreenState();
}

class _Events_ScreenState extends State<Events_Screen> {
  final _formKey3 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<bool>? Saved_Status=[];

@override
  void initState() {
    super.initState();
    if (widget.Type!='Nearby Primes') {
      for (int i = 0; i < widget.Bubble.length; i++) {
        Saved_Status!.add(widget.Bubble[i].is_Saved!);
      }
      _HomeBloc.add(GiveHimListOfBoolean((b) =>
      b..List_Saved_Status = Saved_Status
      ));
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
                          Text('${widget.Type}', textAlign: TextAlign.left,
                            style: _TextTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 23
                            ),),
                          const Text(""),
                          const Text(""),
                          widget.Type=="Primes"?Container():      IconButton(
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
                    Center(
                        child: Container(
                          width: w/1.1,
                          height: h/1.141,
                          child :
                          ScrollConfiguration(
                              behavior: MyBehavior(),
                              child:
                              GridView.builder(
                                  itemCount: widget.Bubble.length,
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:
                                  state.ShapStatus!? 2:1,
                                    childAspectRatio: (5 / (widget.Type!="Nearby Primes"?5.3: 5.7)),),
                                  itemBuilder: (BuildContext context, int index) {
                                    return
                                      state.ShapStatus!
                                              ?widget.Type!="Primes"
                                                  ? InkWell(
                                                onTap: (){
                                                  WidgetsBinding
                                                      .instance!
                                                      .addPostFrameCallback(
                                                          (_) =>   Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (
                                                              context) =>

                                                              Plan_Screen(
                                                                Bubble:widget.Bubble[index],
                                                                my_id: widget.my_id,
                                                              ),
                                                        ),
                                                      ));

                                                },
                                                child: Container(
                                                  width: w/2.2,
                                                  height:  h / 3.5,
                                                  margin: const EdgeInsets.all(6),
                                                  decoration: const BoxDecoration(
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
                                                              borderRadius: const BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                              child:CachedNetworkImage(
                                                                fit: BoxFit.fitWidth,
                                                                imageUrl:
                                                                widget.Bubble[index].image.toString(),

                                                                placeholder: (context, url) => Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(width:w/8,height:h/20,child: const Center(child: CircularProgressIndicator())),
                                                                  ],
                                                                ),
                                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                              width: w/2.2,
                                                              height: h/12.2,

                                                              decoration: BoxDecoration(
                                                                borderRadius : const BorderRadius.only(
                                                                  topLeft: Radius.circular(10),
                                                                  topRight:  Radius.circular(10),

                                                                ),
                                                                color: Colors.transparent,
                                                                boxShadow : [BoxShadow(
                                                                    color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                    offset: Offset(0,0),
                                                                    blurRadius: 8.628571510314941
                                                                )],

                                                              )
                                                          ),
                                                          // Transform.rotate(
                                                          //   angle: -179.99999499104388 * (math.pi / 180),
                                                          //   child: Container(
                                                          //       width: w/2.2,
                                                          //       height: h/6.2,
                                                          //       decoration: BoxDecoration(
                                                          //         borderRadius : const BorderRadius.only(
                                                          //           topLeft: Radius.circular(7),
                                                          //           //    topRight: Radius.circular(7),
                                                          //           bottomLeft: Radius.circular(7),
                                                          //           bottomRight: Radius.circular(7),
                                                          //         ),
                                                          //         gradient : LinearGradient(
                                                          //             begin: const Alignment(5.730259880964636e-14,-2),
                                                          //             end: const Alignment(2,3.9593861611176705e-16),
                                                          //             colors: [Colors.transparent,Color(widget.Bubble[index].Color!),]
                                                          //         ),
                                                          //       )
                                                          //   ),
                                                          // ),



                                                          Container(
                                                            width: w/2.8,
                                                            height: h/22,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                widget.Bubble[index].User_type=="user"
                                                                    ? Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                      radius: 8,
                                                                      backgroundColor: Color(int.parse(widget.Bubble[index].Creator_Color!)),
                                                                      backgroundImage: NetworkImage(widget.Bubble[index].Creator_Avatar!),
                                                                    ),
                                                                    const SizedBox(width: 10,),
                                                                    Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left, style: const TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Display',
                                                                        fontSize: 10.477987289428711,
                                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1
                                                                    ),),

                                                                  ],
                                                                )
                                                                    : const Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 10.477987289428711,
                                                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                                const SizedBox(width: 5,),

                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: h/12,
                                                            bottom: h/10.7,
                                                            child: Container(
                                                              width:w/2.5,
                                                              height: h/10.99,
                                                              child:
                                                              IconButton(
                                                                icon:SvgPicture.asset(
                                                                  !state.isLoading!?
                                                                  state.success!?
                                                                  state.Saved_Status![index]
                                                                      ?"Assets/images/BiggerSaved.svg"
                                                                      :"Assets/images/SAVE.svg"
                                                                      :""
                                                                      :""
                                                                  ,width:   state.Saved_Status![index]?w/2:w/8 ,
                                                                ) ,
                                                                onPressed: (){
                                                                  _HomeBloc.add(
                                                                      ToggleSaveBubbleEventScreen((b) => b
                                                                        ..Bubble_id = widget.Bubble[index].id
                                                                        ..index = index
                                                                        ..List_type = widget.Type
                                                                        ..Saved_Status =state.Saved_Status![index]
                                                                      )
                                                                  );
                                                                },
                                                              ),
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
                                                                          width: w/2.2,
                                                                          child:      Text(
                                                                            widget.Bubble[index].Title.toString(),
                                                                            textAlign: TextAlign.left,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: _TextTheme.headlineLarge!.copyWith(
                                                                              color: Color(widget.Bubble[index].Color!),
                                                                              fontSize: 13,
                                                                              letterSpacing: 0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                    SizedBox(height: 3,),
                                                                    Container(
                                                                      width: w/2.2,
                                                                      child:  Text(
                                                                        "At ${ widget.Bubble[index].location.toString()}",
                                                                        textAlign: TextAlign.left,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: _TextTheme.headlineLarge!.copyWith(
                                                                          fontSize: 8,
                                                                          letterSpacing: 0,
                                                                          fontWeight: FontWeight.w600,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Container(
                                                                      width: w/2.2,
                                                                      child:Text(
                                                                        widget.Bubble[index].Category!,
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
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(""),
                                                                SvgPicture.asset(
                                                                  "Assets/images/Exclude.svg",
                                                                  width: w/13,
                                                                  color : Color(widget.Bubble[index].Color!),
                                                                ),

                                                              ],
                                                            ),

                                                          ],
                                                        ),
                                                      )


                                                    ],
                                                  ),
                                                ),
                                              )
                                                  :   InkWell(
                                        onTap: () {
                                          WidgetsBinding
                                              .instance!
                                              .addPostFrameCallback(
                                                  (_) =>   Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      context) =>
                                                      PrimePlan_page(
                                                        Bubble:widget.Bubble[index],   my_id:widget.my_id ,     List_Type: "PRIME",  ),
                                                ),
                                              ));

                                        },
                                        child:



                                        Container(
                                          width: w/2.5,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(364.2384033203125),
                                              topRight: Radius.circular(364.2384033203125),
                                              bottomRight: Radius.circular(40.569536209106445),
                                              bottomLeft: Radius.circular(40.569536209106445),

                                            ),
                                            color: Colors.white,
                                          ),child:

                                        Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl:widget.Bubble[index].image!,
                                                    imageBuilder: (context, imageProvider) => Container(
                                                      width: w/2.2,
                                                      height: h / 6,
                                                      margin: EdgeInsets.only(left: w/200,right: w/200,top: h/400),
                                                      decoration: BoxDecoration(
                                                        borderRadius : BorderRadius.only(
                                                          topLeft: Radius.circular(364.2384033203125),
                                                          topRight: Radius.circular(364.2384033203125),
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
                                                              blurRadius: 15.628571510314941
                                                          )],

                                                        )
                                                    ),
                                                  ),

                                                  // Positioned(
                                                  //   top: h/7,
                                                  //   child: Container(
                                                  //       width: w/2.5,
                                                  //       height: h/8,
                                                  //       padding: EdgeInsets.only(top: h/2),
                                                  //       decoration: BoxDecoration(
                                                  //         borderRadius : BorderRadius.only(
                                                  //           // topLeft: Radius.circular(30.2384033203125),
                                                  //           // topRight: Radius.circular(30.2384033203125),
                                                  //         ),
                                                  //         gradient : LinearGradient(
                                                  //             begin: Alignment(5.730259880964636e-14,-1),
                                                  //             end: Alignment(1,3.9593861611176705e-16),
                                                  //             colors: [Color(0xff000000).withOpacity(.02),Color(0xff000000).withOpacity(.02)]
                                                  //         ),
                                                  //       )
                                                  //   ),
                                                  // ),
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
                                                      margin: EdgeInsets.only(left:widget.Bubble[index].users_in_bubble!.length==1
                                                          ?  w/20
                                                          :widget.Bubble[index].users_in_bubble!.length==2
                                                          ?w/50
                                                          :    w/130
                                                          ,bottom: h/10),   child: ListView.builder(
                                                        itemCount: widget.Bubble[index].users_in_bubble!.length<3?  widget.Bubble[index].users_in_bubble!.length:3,
                                                        scrollDirection: Axis.horizontal,
                                                        itemBuilder: (BuildContext context, int index2) {
                                                          String Value =   widget.Bubble[index].users_in_bubble![index2].background_color.toString();
                                                          if (Value.contains("#",0)){
                                                            Value = Value.substring(1);
                                                            Value = "0xff$Value";
                                                          }
                                                          var myInt = int.parse(Value);
                                                          var BackgroundColor= myInt;
                                                          return    Row(
                                                            children: [
                                                              index2==0
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
                                                                              backgroundImage: NetworkImage( widget.Bubble[index].users_in_bubble![index2].avatar.toString()),
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
                                                    child: Text("+${ widget.Bubble[index].users_in_bubble!.length.toString()}", textAlign: TextAlign.left, style: TextStyle(
                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                        fontFamily: 'Red Hat Text',
                                                        fontSize: 8.309549331665039,
                                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
                                                      SizedBox(height: 2,),
                                                      Column(
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              SvgPicture.asset(
                                                                "Assets/images/Exclude.svg",
                                                                color : Color(widget.Bubble[index].Color!),
                                                                width: w/7.9,
                                                              ),
                                                              Positioned(
                                                                  left: 0,
                                                                  right: 0,
                                                                  top: 0,
                                                                  bottom: 0,
                                                                  child:  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Container(
                                                                        width: w/26,
                                                                        child:
                                                                        Image.asset("Assets/images/icons.png",  fit: BoxFit.fill,),
                                                                      )      ],
                                                                  ))

                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Flexible(
                                                            child: Container(
                                                              width: w/4.2,
                                                              color: Colors.transparent,
                                                              child: Text( widget.Bubble[index].Title.toString(),
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 13,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Container(
                                                            width: w/4.2,
                                                            child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Red Hat Text',
                                                                fontSize: 11,
                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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







                                      )

                                          :widget.Type!="Primes"
                                          ?InkWell(
                                        onTap: (){
                                      WidgetsBinding
                                          .instance!
                                          .addPostFrameCallback(
                                              (_) =>   Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) =>
                                                  Plan_Screen(
                                                    Bubble:widget.Bubble[index],my_id: widget.my_id,  ),
                                            ),
                                          ));

                                    },
                                    child:Center(
                                        child: Container(
                                            width:w/1.15,
                                            height: h/2.2,
                                            margin: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
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
                                                          borderRadius: const BorderRadius.only(topRight:Radius.circular(10),topLeft:Radius.circular(10)  ),
                                                          child:CachedNetworkImage(
                                                            fit: BoxFit.fill,
                                                            imageUrl:  widget.Bubble[index].image.toString(),
                                                            placeholder: (context, url) => Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(width:w/8,height:h/20,child: const Center(child: CircularProgressIndicator())),
                                                              ],
                                                            ),
                                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                          width:w/1.15,
                                                          height: h/8.2,

                                                          decoration: BoxDecoration(
                                                            borderRadius : const BorderRadius.only(
                                                              topLeft: Radius.circular(10),
                                                              topRight:  Radius.circular(10),

                                                            ),
                                                            color: Colors.transparent,
                                                            boxShadow : [BoxShadow(
                                                                color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                offset: Offset(0,0),
                                                                blurRadius: 8.628571510314941
                                                            )],

                                                          )
                                                      ),


                                                      Container(
                                                          width:w/1.15,
                                                          height: h/13.89,
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              SizedBox(width: w/20,),
                                                              widget.Bubble[index].User_type=="user"
                                                                  ?Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 13.5,
                                                                    backgroundColor: Color(int.parse(widget.Bubble[index].Creator_Color!)),
                                                                    backgroundImage: NetworkImage(widget.Bubble[index].Creator_Avatar!),
                                                                  ),
                                                                  const SizedBox(width: 10,),
                                                                  Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left, style: const TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Display',
                                                                      fontSize: 10.477987289428711,
                                                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                      fontWeight: FontWeight.w600,
                                                                      height: 1
                                                                  ),),

                                                                ],
                                                              )
                                                                  : const Text("Admin", textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 10.477987289428711,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),),

                                                              const Text(""),
                                                              const Text(""),

                                                            ],
                                                          )






                                                      ),
                                                      Positioned(
                                                        left: h/9,
                                                        bottom: h/3.95,
                                                        child: Container(
                                                          width:w,
                                                          height: h/8.89,
                                                          child:
                                                          IconButton(
                                                            icon:SvgPicture.asset(
                                                              !state.isLoading!?
                                                                  state.success!?
                                                             state.Saved_Status![index]
                                                                  ?"Assets/images/BiggerSaved.svg"
                                                                  :"Assets/images/SAVE.svg"
                                                                  :""
                                                                  :""
                                                            ) ,
                                                            onPressed: (){
                                                              _HomeBloc.add(
                                                                  ToggleSaveBubbleEventScreen((b) => b
                                                                    ..Bubble_id = widget.Bubble[index].id
                                                                    ..index = index
                                                                    ..List_type = widget.Type
                                                                    ..Saved_Status =state.Saved_Status![index]
                                                                  )
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      )
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
                                                                  width:w/1.15,
                                                                  child: Text(
                                                                    widget.Bubble[index].Title.toString(),
                                                                    textAlign: TextAlign.left,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: _TextTheme.headlineLarge!.copyWith(
                                                                      color: Color(widget.Bubble[index].Color!),
                                                                      fontSize: 19,
                                                                      letterSpacing: 0,
                                                                      fontWeight: FontWeight.w600,
                                                                    ),
                                                                  ),

                                                                ),

                                                            const SizedBox(height: 3,),
                                                            Container(
                                                              width:w/1.5,
                                                              child:  Text(
                                                                "At ${ widget.Bubble[index].location.toString()}",
                                                                textAlign: TextAlign.left,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: _TextTheme.headlineLarge!.copyWith(
                                                                  fontSize: 15,
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                ),

                                                              ),
                                                            ),
                                                            const SizedBox(height: 7,),
                                                             Container(
                                                               width:w/1.5,
                                                               child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Text',
                                                                  fontSize: 12.222221851348877,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1
                                                            ),),
                                                             )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(""),
                                                        SvgPicture.asset(
                                                          "Assets/images/Exclude.svg",
                                                          width: w/8,
                                                          color : Color(widget.Bubble[index].Color!),
                                                        ),
                                                      ],
                                                    ),         const SizedBox(width: 5,),         const SizedBox(width: 5,),

                                                  ],
                                                )
                                              ],
                                            )

                                        ),
                                      ))
                                          :InkWell(
                                        onTap: (){
                                          WidgetsBinding
                                              .instance!
                                              .addPostFrameCallback(
                                                  (_) =>   Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      context) =>
                                                      PrimePlan_page(
                                                          Bubble:widget.Bubble[index],   my_id:widget.my_id ,     List_Type: "PRIME",  ),
                                                ),
                                              ));
                                        },
                                        child: Container(
                                          width: w/2.5,
                                          height: h / 4,
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(364.2384033203125),
                                              topRight: Radius.circular(364.2384033203125),
                                              bottomLeft: Radius.circular(14.569536209106445),
                                              bottomRight: Radius.circular(14.569536209106445),
                                            ),
                                            color: Color(0xff606060),
                                          ),child:

                                        Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: widget.Bubble[index].image.toString(),
                                                    imageBuilder: (context, imageProvider) => Container(
                                                      width: w/2.2,
                                                      height: h/5.5,
                                                      decoration: BoxDecoration(
                                                        borderRadius : BorderRadius.only(
                                                          topLeft: Radius.circular(364.2384033203125),
                                                          topRight: Radius.circular(364.2384033203125),
                                                          bottomLeft: Radius.circular(14.569536209106445),
                                                          bottomRight: Radius.circular(14.569536209106445),
                                                        ),
                                                        image:DecorationImage(image: imageProvider
                                                            ,fit: BoxFit.fill
                                                        ),

                                                      ),

                                                    ),
                                                    placeholder: (context, url) => Container(    width: w/2.5,
                                                        height: h/6.5,child: CircularProgressIndicator()),
                                                    errorWidget: (context, url, error) => Container(    width: w/2.5,
                                                        height: h/6.5,child: Icon(Icons.error)),
                                                  ),
                                                  Positioned(
                                                    top: h/9,
                                                    child: Container(
                                                        width: w/2.5,
                                                        height: h/8,
                                                        padding: EdgeInsets.only(top: h/4),
                                                        decoration: BoxDecoration(
                                                          borderRadius : BorderRadius.only(
                                                            // topLeft: Radius.circular(30.2384033203125),
                                                            // topRight: Radius.circular(30.2384033203125),
                                                          ),
                                                          gradient : LinearGradient(
                                                              begin: Alignment(7.730259880964636e-14,-0.5),
                                                              end: Alignment(-2,3.9593861611176705e-16),
                                                              colors: [Colors.transparent,Color(widget.Bubble[index].Color!).withOpacity(.5)]
                                                          ),
                                                        )
                                                    ),
                                                  ),

                                                ],
                                              ),

                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      bottomLeft: Radius.circular(14.569536209106445),
                                                      bottomRight: Radius.circular(14.569536209106445),
                                                    ),
                                                    color: Color(0xff606060),
                                                  ),
                                                  child:
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            "Assets/images/Exclude.svg",
                                                            color : Color(widget.Bubble[index].Color!),
                                                            width: w/10,
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                              color: Colors.transparent,
                                                              child: Text(widget.Bubble[index].Title!,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 13,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      // Text('Park', textAlign: TextAlign.left, style: TextStyle(
                                                      //     color: Color.fromRGBO(255, 255, 255, 1),
                                                      //     fontFamily: 'Red Hat Text',
                                                      //     fontSize: 10,
                                                      //     letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                      //     fontWeight: FontWeight.w300,
                                                      //     height: 1
                                                      // ),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]





                                        ),


                                        ),
                                      );
                                  }
                              )
                          ),
                        )
                    )
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
