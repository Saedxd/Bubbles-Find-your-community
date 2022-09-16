import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Bubbles/InBubble/EventChat/pages/GroupChat_Screen.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Bloc.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_Event.dart';
import 'package:bubbles/UI/Bubbles/InBubble/PlanPage/bloc/PlanPage_State.dart';
import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/UI/NavigatorTopBar_Screen/pages/NavigatorTopBar.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_questions/conditional_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class PrimePlan_page extends StatefulWidget {
  PrimePlan_page({Key? key,
    required  this.Bubble,
    required  this.my_id,
    required this.is_saved
    ,this.List_Type
  }) : super(key: key);
  BubbleData? Bubble;
  int? my_id;
bool? is_saved;
 String? List_Type = "";
  @override
  State<PrimePlan_page> createState() => _PrimePlan_pageState();
}


class _PrimePlan_pageState extends State<PrimePlan_page> {
bool selected = false;
final _PlanPage_Bloc = sl<PlanPageBloc>();

@override
  void initState() {
    super.initState();
    _PlanPage_Bloc.add(GiveMeifItsSaved((b) => b..is_saved =widget.is_saved ));
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(
          statusBarColor: Color(widget.Bubble!.Color!),
       //   systemNavigationBarColor: Color(widget.Bubble!.Color!),
      ),
    );
    // _PlanPage_Bloc.add(GetWhoSavedBubble((b) =>
    // b..Bubble_id = widget.Bubble!.id
    //   ..is_saved = widget.Bubble!.is_Saved
    // ));
    socket!.io..disconnect()..connect();
}
@override
  void dispose() {
    super.dispose();
}


  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  WillPopScope(
        onWillPop: () async {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Color(0xff303030),
            systemNavigationBarColor: Color(0xff303030)
        ),
      );
      return true;
    },
    child: BlocBuilder(
        bloc: _PlanPage_Bloc,
        builder: (BuildContext Context, PlanPageState state){

      String Value = widget.Bubble!.Color.toString();
      if (Value.contains("#", 0)) {
        Value = Value.substring(1);
        Value = "0xff$Value";
      }
      var BackgroundColor;
      var myInt = int.parse(Value);
      BackgroundColor  = myInt;


      return Scaffold(
        body: SafeArea(
          child: Container(
              width: w,
              height: h,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                                width: w,
                                height: h / 2.4,
                                margin: EdgeInsets.only(top: h / 50),
                                child:  CachedNetworkImage(
                                  imageUrl: widget.Bubble!.image.toString(),
                                  imageBuilder: (context, imageProvider) => Container(
                                    width: w,
                                    height: h / 3,

                                    decoration: BoxDecoration(
                                      image:DecorationImage(image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),

                                    ),

                                  ),
                                  placeholder: (context, url) => Container(
                                      width: w,
                                      height: h / 3,child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  )),
                                  errorWidget: (context, url, error) => Container(
                                      width: w,
                                      height: h / 3,child: Icon(Icons.error)),
                                )


                            ),
                            Container(
                              width: w,
                              height: h/14,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(h/40),
                                    bottomRight:  Radius.circular(h/40),
                                  ),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 4),
                                      blurRadius: 4
                                  )
                                  ],
                                  color:
                                  Color(  BackgroundColor)



                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [


                                      Container(
                                        width: w/7,
                                        margin: EdgeInsets.only(top: h/300),
                                        child: IconButton(
                                          icon: SvgPicture.asset(
                                              "Assets/images/Frame 11.svg",
                                              width: 30.w,
                                              color: Colors.white),
                                          onPressed: () {
                                            SystemChrome.setSystemUIOverlayStyle(
                                              const SystemUiOverlayStyle(
                                                  statusBarColor: Color(0xff303030),
                                                  systemNavigationBarColor: Color(0xff303030)
                                              ),
                                            );
                                            Navigator.pop(context,"${state.is_Saved!}");
                                          },
                                        ),
                                      ),

                                  Flexible(
                                    child: Container(
                                      child:
                                          Text(
                                            widget.Bubble!.Title!,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            style : GoogleFonts.roboto().copyWith(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontSize: 22.sp,
                                                letterSpacing: 0.2,
                                                fontWeight: FontWeight.w600,
                                                height: 1
                                            ),),

                                    ),
                                  ),
                                  Container(
                                    width: w/5,
                                    child: InkWell(
                                      onTap: (){
                                        _PlanPage_Bloc.add(ToggleSaveBubble((b) =>
                                        b..Bubble_id = widget.Bubble!.id
                                        ));
                                      },
                                      child: SvgPicture.asset(
                                        state.is_Saved!
                                            ?"Assets/images/Save_Marker(1).svg"
                                            :"Assets/images/Save_outline.svg",
                                        color: Colors.white,
                                        width: w/24,

                                      ),
                                    ),
                                  ),





                                ],
                              ),

                            ),
                            Positioned(
                              left: widget.Bubble!.users_in_bubble!.length>=3? w/1.45:w/1.4,
                              top: h/2.63,
                              child:
                              Container(
                                width: w/4,height: h/15,
                                margin: EdgeInsets.only(left:widget.Bubble!.users_in_bubble!.length==1
                                    ?  w/20
                                    :widget.Bubble!.users_in_bubble!.length==2
                                    ?w/50
                                    :    w/1000
                                    ,bottom: h/10

                                ,
                                right: widget.Bubble!.users_in_bubble!.length>=3?w/6:0),    child: ListView.builder(
                                itemCount: widget.Bubble!.users_in_bubble!.length<3? widget.Bubble!.users_in_bubble!.length:3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  String Value = widget.Bubble!.users_in_bubble![index].background_color.toString();
                                  if (Value.contains("#",0)){
                                    Value = Value.substring(1);
                                    Value = "0xff$Value";
                                  }
                                  var myInt = int.parse(Value);
                                  var BackgroundColor= myInt;
                                  return    Row(
                                    children: [
                                      index==0
                                          ? SizedBox(width: 5,)
                                          : Container(),
                                      Align(
                                          widthFactor: 0.6,
                                          alignment: Alignment.topCenter,
                                          child:
                                          Container(
                                            child: Column(
                                              children: [
                                                Wrap(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor: Color(BackgroundColor),
                                                      backgroundImage: NetworkImage(widget.Bubble!.users_in_bubble![index].avatar.toString()),
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
                              left: w/1.12,
                              top: h/2.5,
                              child: Text("+${widget.Bubble!.users_in_bubble!.length.toString()}", textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 15.309549331665039.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                  height: 1
                              ),),
                            ),
                            Positioned(
                              top: h/2.55,
                              left: w/20,
                              child: Row(
                                children: [
                                  Container(
                                    width: w/20,
                                      child: Image.network(widget.Bubble!.Cateogory_Icon!,fit: BoxFit.fill,)),
                                  SizedBox(width: 5,),
                                  Text(widget.Bubble!.Category!, textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Red Hat Display',
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15.528663635253906.sp,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w300,
                                      height: 1
                                  ),),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: h/7,),
                            Container(
                              width: w/1.9,
                              child:
                              Text('This is a prime bubble.  '
                       , textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Red Hat Text',
                                    fontSize: 14.sp,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        height: 1.2857142857142858
                    ),),),
                            Container(
                              width: w/1.9,
                              child: Text('Primes are public bubbles located in key locations.', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 14.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w300,
                                  height: 1.2857142857142858
                              ),),
                            )
                          ],
                        ),
                        SizedBox(height: h/4,),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 10,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          WidgetsBinding.instance.addPostFrameCallback(
                                  (_) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GroupChat(plan_Title:widget.Bubble!.Title!,
                                              MY_ID: widget.my_id,
                                              bubble_id: widget.Bubble!.id!,
                                              Plan_Description: widget.Bubble!.Description!,
                                              Bubble_Color: BackgroundColor,
                                              Want_LOcation_cHECK : true
                                          ),),
                                  ));
                        },
                        child:Container(
                          width: w / 2.3,
                          height: h / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(h/12.5),
                              topRight:Radius.circular(h/12.5),
                              bottomLeft: Radius.circular(h/12.5),
                              bottomRight:Radius.circular(h/12.5),
                            ),
                            color:   Color(BackgroundColor),
                          ),
                          child:   Center(
                            child:
                            Text('Enter Bubble', textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 47, 47, 1),
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 18.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                  height: 1
                              ),)
                            ,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),

      );

    }
    ));
  }

Widget listLoader({context}) {
  return  SpinKitThreeBounce(
    color: Colors.blue,
    size: 30.0.w,
  );
}
}




