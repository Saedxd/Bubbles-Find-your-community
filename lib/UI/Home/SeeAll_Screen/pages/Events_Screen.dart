
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/pages/Plan_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PrimePlanPage/pages/PrimePlanPage.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Bloc.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_Event.dart';
import 'package:bubbles/UI/Home/SeeAll_Screen/bloc/SeeAll_State.dart';
import 'package:bubbles/core/Classes/Classes.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Events_Screen extends StatefulWidget {
  Events_Screen({Key? key, required this.Bubble ,required this.Type,required this.my_id});
  List<BubbleData> Bubble;
  String Type;
  int my_id;
  @override
  State<Events_Screen> createState() => _Events_ScreenState();
}
List<int>? Event_IDS=[];
List<bool>? Event_Statuses=[];
String Type ="";
class _Events_ScreenState extends State<Events_Screen> {

  final _formKey3 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool>? Saved_Status=[];
  final _SeeAllBloc = sl<SeeAllBloc>();

@override
  void initState() {
    super.initState();


    Type  = widget.Type;
    if (widget.Type!='Nearby Primes') {
      Event_Statuses = List.filled(widget.Bubble.length,false);
      Event_IDS = List.filled(widget.Bubble.length,0);
      for (int i = 0; i < widget.Bubble.length; i++) {
        Saved_Status!.add(widget.Bubble[i].is_Saved!);
        Event_IDS![i] = widget.Bubble[i].id!;
       Event_Statuses![i] = widget.Bubble[i].is_Saved!;
      }

      _SeeAllBloc.add(GiveHimListOfBoolean((b) =>b
      ..List_Saved_Status = Saved_Status
      ));
    }
}

  @override
  void dispose() {
    super.dispose();
    print(Event_Statuses);
  }



  bool Diditonce = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _SeeAllBloc,
        builder: (BuildContext Context, SeeAllState state)
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
                                    width: 30.w,
                                    color: ColorS.surface),
                                onPressed: () {
                                  Navigator.pop(context,"Yes!");
                                },
                              )),
                          Text('${widget.Type}', textAlign: TextAlign.left,
                            style: _TextTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp
                            ),),
                          const Text(""),
                          const Text(""),
                          widget.Type=="Nearby Primes"?Container():      IconButton(
                        icon: SvgPicture.asset(
                          state.ShapStatus!?
                            "Assets/images/reshap1.svg"
                              : "Assets/images/reshap2.svg"
                            ,width:w/18
                        ),
                          onPressed:() async {
                            _SeeAllBloc.add(ChangeShapStatus());
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
                                    childAspectRatio: (5 / (widget.Type!="Nearby Primes"?4.8: 4.9)),),
                                  itemBuilder: (BuildContext context, int index) {
                                    return
                                      state.ShapStatus!
                                              ?widget.Type!="Nearby Primes"
                                                  ? InkWell(
                                                onTap: (){

                                                  WidgetsBinding
                                                      .instance
                                                      .addPostFrameCallback(
                                                          (_) =>   Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (
                                                              context) =>

                                                              Plan_Screen(
                                                                Bubble:widget.Bubble[index],
                                                                my_id: widget.my_id,
                                                                is_saved:widget.Bubble[index].is_Saved,
                                                              ),
                                                        ),
                                                      ));

                                                },
                                                child: Container(
                                                  width: w/2.2,
                                                  height:  h / 3.5,
                                                  margin:  EdgeInsets.all(h/90.9),
                                                  decoration:  BoxDecoration(
                                                    borderRadius : BorderRadius.only(
                                                      topLeft: Radius.circular(h/90.5),
                                                      topRight: Radius.circular(h/90.5),
                                                      bottomLeft:Radius.circular(h/90.5),
                                                      bottomRight: Radius.circular(h/90.5),
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
                                                            height: h/6.8,
                                                            child: ClipRRect(
                                                              borderRadius:  BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5),),
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
                                                              height: h/15.2,

                                                              decoration: BoxDecoration(
                                                                borderRadius :  BorderRadius.only(
                                                                  topLeft: Radius.circular(h/90.5),
                                                                  topRight:  Radius.circular(h/90.5),

                                                                ),
                                                                color: Colors.transparent,
                                                                boxShadow : [BoxShadow(
                                                                    color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                    offset: Offset(0,2),
                                                                    blurRadius: 8.628571510314941
                                                                )],

                                                              )
                                                          ),

                                                          Container(
                                                            width: w/2.8,
                                                            height: h/22,
                                                            margin: EdgeInsets.only(left: w/20,top: h/100),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                    Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left, style:  TextStyle(
                                                                        color: Color.fromRGBO(255, 255, 255, 1),
                                                                        fontFamily: 'Red Hat Display',
                                                                        fontSize: 5.48.sp,
                                                                        letterSpacing: 0 ,
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1
                                                                    ),),

                                                                  ],
                                                                )
                                                                    : const Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontFamily: 'Red Hat Display',
                                                                    fontSize: 10.477987289428711,
                                                                    letterSpacing: 0 ,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                                Text(""),
                                                                IconButton(
                                                                  icon:SvgPicture.asset(
                                                                    state.success!?
                                                                    state.Saved_Status![index]
                                                                        ?"Assets/images/Save_Marker(1).svg"
                                                                        :"Assets/images/Save_outline.svg"
                                                                        :""
                                                                    ,color: Colors.white,
                                                                    width: w/25,
                                                                  ) ,
                                                                  onPressed: (){
                                                                    if (state.Saved_Status![index]) {
                                                                      Event_Statuses![index] =false;
                                                                    }else{
                                                                      Event_Statuses![index] =true;
                                                                    }
                                                                    _SeeAllBloc.add(
                                                                        ToggleSaveBubbleEventScreen((b) => b
                                                                          ..Bubble_id = widget.Bubble[index].id
                                                                          ..index = index
                                                                          ..List_type = widget.Type
                                                                          ..Saved_Status =state.Saved_Status![index]
                                                                        )
                                                                    );
                                                                  },
                                                                ),

                                                              ],
                                                            ),
                                                          ),
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
                                                                      4,
                                                                    ),


                                                                        Container(
                                                                          width: w/2.8,
                                                                          child:      Text(
                                                                            widget.Bubble[index].Title.toString(),
                                                                            textAlign: TextAlign.left,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style : GoogleFonts.roboto().copyWith(
                                                                              color: Color(widget.Bubble[index].Color!),
                                                                              fontSize: 9.sp,
                                                                              letterSpacing: 0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                    SizedBox(height: 3,),
                                                                    Container(
                                                                      width: w/2.8,
                                                                      child:  Text(
                                                                        "At ${ widget.Bubble[index].location.toString()}",
                                                                        textAlign: TextAlign.left,
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style : GoogleFonts.roboto().copyWith(
                                                                          fontSize: 7.sp,
                                                                          letterSpacing: 0,
                                                                          fontWeight: FontWeight.w600,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 3,),
                                                                    Row(
                                                                      children:[

                                                                        Container(
                                                                          width: w/55,
                                                                          child:
                                                                          Image.network(widget.Bubble[index].Cateogory_Icon!),
                                                                        ),
                                                                        SizedBox(width: 3,),
                                                                Container(
                                                                    width: w/4,
                                                                    child:Text(
                                                                       "${widget.Bubble[index].Category!} Event", textAlign: TextAlign.left, style: TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Red Hat Text',
                                                                              fontSize: 5.5.sp,
                                                                                letterSpacing: 0,
                                                                                fontWeight: FontWeight.w600,
                                                                              height: 1
                                                                          ),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [

                                                                SvgPicture.asset(
                                                                  "Assets/images/Exclude.svg",
                                                                  width: w/12,
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
                                              .instance
                                              .addPostFrameCallback(
                                                  (_) =>   Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (
                                                      context) =>
                                                      PrimePlan_page(
                                                        Bubble:widget.Bubble[index],   my_id:widget.my_id ,     List_Type: "PRIME",is_saved: widget.Bubble[index].is_Saved,  ),
                                                ),
                                              ));

                                        },
                                        child:



                                        Container(
                                          width: w/2.5,
                                          margin: EdgeInsets.all( 6.w,),
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(h/1.233),
                                              topRight: Radius.circular(h/1.233),
                                              bottomRight: Radius.circular(h/10),
                                              bottomLeft:  Radius.circular(h/10),

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
                                                      margin: EdgeInsets.only(left: w/500,right: w/500,top: h/600),
                                                      decoration: BoxDecoration(
                                                        borderRadius : BorderRadius.only(
                                                          topLeft: Radius.circular(364.2384033203125.r),
                                                          topRight: Radius.circular(364.2384033203125.r),
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
                                                                              radius: 6.w,
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
                                                        fontSize: 0.184.sp,
                                                        letterSpacing: 0 ,
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
                                                      bottomRight: Radius.circular(6.569536209106445.r),
                                                      bottomLeft: Radius.circular(6.569536209106445.r),
                                                    ),
                                                    color: Color(0xff606060),
                                                  ),
                                                  child:
                                                  Row(
                                                    children: [
                                                      SizedBox(height: 2,),
                                                      Column(
                                                        children: [
                                                          SizedBox(height: 3,),
                                                          Stack(
                                                            children:[
                                                              SvgPicture.asset(
                                                                "Assets/images/Exclude.svg",
                                                                color : Color(widget.Bubble[index].Color!),
                                                                width: w/9.5,
                                                              ),
                                                              Positioned(
                                                                  left: 0,
                                                                  right: 0,
                                                                  top: 2,
                                                                  bottom: 0,
                                                                  child:  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Container(
                                                                        width: w/45,
                                                                        child:
                                                                        Image.network(widget.Bubble[index].Cateogory_Icon!,  fit: BoxFit.fill,),
                                                                      )
                                                                    ],
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
                                                                textAlign: TextAlign.left,
                                                                style : GoogleFonts.roboto().copyWith(
                                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                                    fontSize: 11.sp,
                                                                    letterSpacing: 0,
                                                                    fontWeight: FontWeight.w600,
                                                                    height: 1
                                                                ),),
                                                            ),
                                                          ),
                                                          SizedBox(height: 2,),
                                                          Container(
                                                            width: w/4.2,
                                                            child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                                fontFamily: 'Red Hat Text',
                                                                fontSize: 6.5.sp,
                                                                letterSpacing: 0 ,
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
                                          :widget.Type!="Nearby Primes"
                                          ?InkWell(
                                        onTap: (){
                                      WidgetsBinding
                                          .instance
                                          .addPostFrameCallback(
                                              (_) =>   Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) =>
                                                  Plan_Screen(
                                                    Bubble:widget.Bubble[index],my_id: widget.my_id,                is_saved:widget.Bubble[index].is_Saved, ),
                                            ),
                                          ));

                                    },
                                    child:Center(
                                        child: Container(
                                            width:w/1.15,
                                            height: h/2.2,
                                            margin:  EdgeInsets.all(h/85.5),
                                            decoration:  BoxDecoration(
                                              borderRadius : BorderRadius.only(
                                                topLeft: Radius.circular(h/90.5),
                                                topRight: Radius.circular(h/90.5),
                                                bottomLeft: Radius.circular(h/90.5),
                                                bottomRight: Radius.circular(h/90.5),
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
                                                          borderRadius:  BorderRadius.only(topRight:Radius.circular(h/90.5),topLeft:Radius.circular(h/90.5), ),
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
                                                            borderRadius :  BorderRadius.only(
                                                              topLeft: Radius.circular(h/90.5),
                                                              topRight:  Radius.circular(h/90.5),

                                                            ),
                                                            color: Colors.transparent,
                                                            boxShadow : [BoxShadow(
                                                                color: Color(widget.Bubble[index].Color!).withOpacity(.5),
                                                                offset: Offset(0,2),
                                                                blurRadius: 8.628571510314941
                                                            )],

                                                          )
                                                      ),
                                                      Container(
                                                          width:w/1.3,
                                                          height: h/13.89,
                                                          margin: EdgeInsets.only(left: w/20),
                                                          child:Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              widget.Bubble[index].User_type=="user"
                                                                  ?Row(
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 13.5.w,
                                                                    backgroundColor: Color(int.parse(widget.Bubble[index].Creator_Color!)),
                                                                    backgroundImage: NetworkImage(widget.Bubble[index].Creator_Avatar!),
                                                                  ),
                                                                  const SizedBox(width: 10,),
                                                                  Text(widget.Bubble[index].Creator_Alias!, textAlign: TextAlign.left,
                                                                    style:  TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Display',
                                                                      fontSize: 7.22.sp,
                                                                      letterSpacing: 0 ,
                                                                      fontWeight: FontWeight.w600,
                                                                      height: 1
                                                                  ),),

                                                                ],
                                                              )
                                                                  :  Text("Prime", textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                                  fontFamily: 'Red Hat Display',
                                                                  fontSize: 7.22.sp,
                                                                  letterSpacing: 0 ,
                                                                  fontWeight: FontWeight.w600,
                                                                  height: 1
                                                              ),),
                                                              Text(""),

                                                              IconButton(
                                                                icon:SvgPicture.asset(
                                                                    state.success!?
                                                                    state.Saved_Status![index]
                                                                        ?"Assets/images/Save_Marker(1).svg"
                                                                        :"Assets/images/Save_outline.svg"
                                                                        :""
                                                                        ,color: Colors.white,
                                                                  width: w/25,
                                                                ) ,
                                                                onPressed: (){
                                                                  _SeeAllBloc.add(
                                                                      ToggleSaveBubbleEventScreen((b) => b
                                                                        ..Bubble_id = widget.Bubble[index].id
                                                                        ..index = index
                                                                        ..List_type = widget.Type
                                                                        ..Saved_Status =state.Saved_Status![index]
                                                                      )
                                                                  );
                                                                },
                                                              ),

                                                            ],
                                                          )






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
                                                              5,
                                                            ),
                                                                Container(
                                                                  width:w/1.15,
                                                                  child: Text(
                                                                    widget.Bubble[index].Title.toString(),
                                                                    textAlign: TextAlign.left,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style : GoogleFonts.roboto().copyWith(
                                                                      color: Color(widget.Bubble[index].Color!),
                                                                      fontSize: 12.22.sp,
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
                                                                style : GoogleFonts.roboto().copyWith(
                                                                  fontSize: 9.44.sp,
                                                                  letterSpacing: 0,
                                                                  fontWeight: FontWeight.w600,
                                                                ),

                                                              ),
                                                            ),
                                                            const SizedBox(height: 4,),
                                                            Row(
                                                              children:[

                                                                Container(
                                                                  width: w/25,
                                                                  child:
                                                                  Image.network(widget.Bubble[index].Cateogory_Icon!),
                                                                ),
                                                                SizedBox(width: 3,),
                                                                Container(
                                                                  width:w/2,
                                                                  child: Text( widget.Bubble[index].Category!, textAlign: TextAlign.left, style: TextStyle(
                                                                      color: Color.fromRGBO(255, 255, 255, 1),
                                                                      fontFamily: 'Red Hat Text',
                                                                      fontSize: 7.22.sp,
                                                                      letterSpacing: 0 ,
                                                                      fontWeight: FontWeight.normal,
                                                                      height: 1
                                                                  ),),
                                                                )
                                                              ],
                                                            ),

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
                                          :Container();
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
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }

}
