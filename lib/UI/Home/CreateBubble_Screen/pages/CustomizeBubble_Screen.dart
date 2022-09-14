
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui'as ui;
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_Bloc.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_Event.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_State.dart';

import 'package:bubbles/UI/Home/Home_Screen/pages/HomeScreen.dart';
import 'package:bubbles/core/Classes/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
class Customize_Screen extends StatefulWidget {
  Data? Dataa;

  Customize_Screen({Key? key,required this.Dataa,required this.Context,required this.Start,required this.End});
  BuildContext? Context;
  DateTime Start;
  DateTime End;
  @override
  State<Customize_Screen> createState() => _Customize_ScreenState();
}
BubbleData Bubbledata = BubbleData();
class _Customize_ScreenState extends State<Customize_Screen> {
  File? image;
  final _formKey3 = GlobalKey<FormState>();
  List<DateTime>? LISTdate;
  List<String> LISTdateFormated = [];
  DateTime? SingleDate;
  List<DateTime> ListOfSingleDates = [];
  List<String> ListOfSingleDatesString = [];
  final List<String> Event_Cateogory_List = [  ];
  final List<int> Event_Cateogory_List_id = [  ];
  String? selectedValue;
  List<String> BubbleColors = ["0xffD1B964","0xff34A853","0xff77C08A","0xff6FA191","0xff4ECEB6","0xff80BFC5","0xff7B78F5","0xffD96799","0xffE06859","0xffCF6D38","0xffEB9B5D","0xffE0A41E"];
  String time = "";
  bool Diditonce = true;
  bool Diditonce2 = true;
  final pref = sl<IPrefsHelper>();
  final _CreateBubbleBloc = sl<CreateBubbleBloc>();

  String base64Image="";
  List<String>? Base64Images=[];

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final  imagePath = File(image.path);
    this.image = imagePath;
    Convert(imagePath);
    print("Picked");
    print(imagePath);
  }
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
  @override
  void initState() {
    super.initState();
    _CreateBubbleBloc.add(GetEventCateogories());
    makeMarker();
  }
  Uint8List? markerIcon;
  void makeMarker()async{
    markerIcon   = await  getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
  }
  @override
  void dispose() {
    super.dispose();

  }

  CommingSoonPopup(
      BuildContext Context,
      double h,
      double w,
      String Value,
      String buttonValue,
      int FontSize
      ) async {
    return showDialog(
        context: Context,
           barrierDismissible: true,
        barrierColor: Colors.white.withOpacity(0),
        builder: (Context) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(h/100),
              content:Container(
                width: w/1.4,
                height: h/3,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(8.285714149475098.r),
                    topRight: Radius.circular(8.285714149475098.r),
                    bottomLeft: Radius.circular(8.285714149475098.r),
                    bottomRight: Radius.circular(8.285714149475098.r),
                  ),
                  color: Colors.transparent,
                ),


                child: Stack(
                  children: [

                    Positioned(
                      top: h/12.5,
                      child: Container(
                        width: w/1.4,
                        height: h/4.2,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(8.285714149475098.r),
                            topRight: Radius.circular(8.285714149475098.r),
                            bottomLeft: Radius.circular(8.285714149475098.r),
                            bottomRight: Radius.circular(8.285714149475098.r),
                          ),
                          color : Color.fromRGBO(47, 47, 47, 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(""),


                            Center(
                              child: Text(Value,
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Display',
                                    fontSize: 0.23.sp,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.w600,
                                    height: 1
                                ),),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: h/15.5,
                                      width: w/2,
                                      decoration: BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(4.142857074737549.r),
                                          topRight: Radius.circular(4.142857074737549.r),
                                          bottomLeft: Radius.circular(4.142857074737549.r),
                                          bottomRight: Radius.circular(4.142857074737549.r),
                                        ),
                                        boxShadow : [BoxShadow(
                                            color: Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(0,0),
                                            blurRadius: 6.628571510314941
                                        )],
                                        color : Color.fromRGBO(168, 48, 99, 1),
                                      ),
                                      child: Center(
                                        child:
                                        Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 18.sp,
                                            letterSpacing: 0 ,
                                            fontWeight: FontWeight.w400,
                                            height: 1
                                        ),),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: h/8,
                      bottom: h/5,
                      child: SvgPicture.asset(
                        "Assets/images/widget.svg",
                        width: 90,
                      ),
                    ),
                  ],
                ),
              )

          );
        });
  }

  Future<void> PhotoBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        shape:  RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0.r),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Color.fromRGBO(148, 38, 87, 1),
            ),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.camera);
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'Open Camera',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: w,
                  height: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      width: w,
                      height: h / 7.5,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          'From Library',
                          textAlign: TextAlign.center,
                          style: _TextTheme.headline2!.copyWith(
                              fontWeight: FontWeight.w600,   fontSize: 30.sp,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
        bloc: _CreateBubbleBloc,
        builder: (BuildContext Context, CreateBubbleState state){

          if (state.CreateBUbbleSuccess! && Diditonce){
            if (state.CreateBubble!.status==200) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) {
                Bubbledata.isAvailable =
                state.CreateBubble!.data!.is_available.toString()=="available"
                    ? true
                    :false;
                Bubbledata.Category = state.CreateBubble!.data!.category!.name!;
                Bubbledata.Cateogory_Icon = state.CreateBubble!.data!.category!.image!;
                Bubbledata.lat = state.CreateBubble!.data!.lat;
                Bubbledata.lng = state.CreateBubble!.data!.lng;
                Bubbledata.Raduis = state.CreateBubble!.data!.radius!.toInt();
                Bubbledata.Title =  state.CreateBubble!.data!.title.toString();
                Bubbledata.location = state.CreateBubble!.data!.location.toString();
                Bubbledata.StartDate = state.CreateBubble!.data!.start_event_date.toString();
                Bubbledata.endDate = state.CreateBubble!.data!.end_event_date.toString();
                Bubbledata.dates = state.CreateBubble!.data!.dates;
                Bubbledata.image = state.CreateBubble!.data!.images![0].image.toString();
                Bubbledata.id = state.CreateBubble!.data!.id!.toInt();
                Bubbledata.type =state.CreateBubble!.data!.type.toString();
                Bubbledata.Creator_Alias = state.CreateBubble!.data!.created_by!.user!.alias ?? "";
                Bubbledata.Creator_Avatar = state.CreateBubble!.data!.created_by!.user!.avatar;
                Bubbledata.Creator_Color = state.CreateBubble!.data!.created_by!.user! .background_color;
                Bubbledata.User_type = state.CreateBubble!.data!.created_by!.type;
                Bubbledata.Description =state.CreateBubble!.data!.description.toString();
                Bubbledata.Organizers =state.CreateBubble!.data!.organizers!;
                Bubbledata.is_Saved = false;
                Bubbledata.users_in_bubble = state.CreateBubble!.data!.users_in_bubble!;
                Bubbledata.saved_users = state.CreateBubble!.data!.saved_users!;
                Bubbledata.Color = int.parse(state.CreateBubble!.data!.color!);
                Bubbledata.index = indexx;



                Navigator.pop(context, 'Yep!');
                Navigator.pop(context, 'Yep!');
              }
              );
              Diditonce = false;
            }
          }

          if (state.EventCateogorySuccess! && Diditonce2){
            for(int i=0;i<state.EventCateogory!.event_category!.length;i++) {
              Event_Cateogory_List.add(  state.EventCateogory!.event_category![i].name.toString());
              Event_Cateogory_List_id.add(  state.EventCateogory!.event_category![i].id!.toInt());

            }
            print(Event_Cateogory_List);
            Diditonce2 = false;
          }

          return
            SafeArea(
              child: Scaffold(
                backgroundColor: ColorS.onInverseSurface,
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        height: h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: h / 150),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: w / 10),
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                            "Assets/images/Frame 11.svg",
                                            width: 30.w,
                                            color: ColorS.surface),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: w / 4,top: h/200),
                                    child: Text('Customise Bubble', textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Red Hat Display',
                                        fontSize: 18.sp,
                                        letterSpacing: 0.7 ,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),),
                                  ),
                  )
                                  // Text('Customize_Screen', textAlign: TextAlign.left,
                                  //   style: _TextTheme.headlineLarge!.copyWith(
                                  //       fontWeight: FontWeight.w600,
                                  //       fontSize: 23
                                  //   ),),


                                ],
                              ),
                            ),
                            SizedBox(height: h/50,),
                            Container(
                              width: w/1.19,
                              child: Text('Pick colour', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(237, 236, 241, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 14.sp,
                                  letterSpacing: 0.11999999731779099,
                                  fontWeight: FontWeight.w400,
                                  height: 1.7142857142857142
                              ),),
                            ),
                            SizedBox(height: h/70,),
                            Container(
                              width: w,
                              height: h/10,
                          margin: EdgeInsets.only(left: w/15),
                          child: ScrollConfiguration(
                          behavior: MyBehavior(),
                              child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: BubbleColors.length,
                              separatorBuilder:(BuildContext context, int index) {
                                return  SizedBox( width: 5.w, );
                              },
                              itemBuilder: (BuildContext context,
                              int index) {
                                return InkWell(
                                  onTap: (){
                                    _CreateBubbleBloc.add(SelectColor((b) => b..Index=index..PickedColor=BubbleColors[index]));
                                    // _CreateBubbleBloc.add(ChangePickedColor((b) => b..PickedColor=));
                                    print("Clicked1");
                                  },
                                  child: Container(
                                    child :CircleAvatar(
                                      radius: w/12.1,
                                    backgroundColor:state.IsChosen_Colors![index]? Colors.white:Colors.transparent,
                                    child: CircleAvatar(
                                        radius: w/13,
                                        backgroundColor:state.IsChosen_Colors![index]? Color(0xff303030):Color(0xff303030),
                                      child: CircleAvatar(
                                        radius: w/14,
                                        backgroundColor: Color(int.parse(BubbleColors[index])),
                                      ),
                                    )
                                    )
                                  ),
                                );
                              }
                              )
                              )
                            ),
                            SizedBox(height: h/100,),
                            // Container(
                            //   width: w,
                            //   child:
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Center(
                            //         child:
                            //         Text('Or use custom Hex code:', textAlign: TextAlign.left, style: TextStyle(
                            //             color: Color.fromRGBO(237, 236, 241, 1),
                            //             fontFamily: 'Red Hat Text',
                            //             fontSize: 16,
                            //             letterSpacing: 0.11999999731779099,
                            //             fontWeight: FontWeight.w400,
                            //             height: 1.7142857142857142
                            //         ),),
                            //       ),
                            //   //todo : fix this
                            //       Container(
                            //           width: 87,
                            //           height: 31,
                            //           decoration: BoxDecoration(
                            //             borderRadius : BorderRadius.only(
                            //               topLeft: Radius.circular(5),
                            //               topRight: Radius.circular(5),
                            //               bottomLeft: Radius.circular(5),
                            //               bottomRight: Radius.circular(5),
                            //             ),
                            //             color : Color.fromRGBO(96, 96, 96, 1),
                            //           )
                            //       )
                            //     ],
                            //   ),
                            // ),
                            SizedBox(height: h/20,),
                            Container(
                           width: w,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Column(
                                 children: [

                                       Container(
                                         width: w/2.3,
                                         margin: EdgeInsets.only(left: w/75),
                                         child: Text('Choose Category:', textAlign: TextAlign.left, style: TextStyle(
                                             color: Color.fromRGBO(237, 236, 241, 1),
                                             fontFamily: 'Red Hat Text',
                                             fontSize: 14.sp,
                                             letterSpacing: 0.11999999731779099,
                                             fontWeight: FontWeight.w400,
                                             height: 1.7142857142857142
                                         ),),
                                       ),

                                   Container(
                                     margin: EdgeInsets.only(top: h/60),
                                     child: DropdownButtonHideUnderline(
                                       child: DropdownButton2(
                                         isExpanded: true,
                                         hint: Row(

                                           children:  [
                                             Expanded(
                                               child: Text('General', textAlign: TextAlign.left,
                                                 style:  TextStyle(
                                                     color: Color.fromRGBO(196, 196, 196, 1),
                                                     fontFamily: 'Red Hat Text',
                                                     fontSize: 14.sp,
                                                     letterSpacing: 1 ,
                                                     fontWeight: FontWeight.w300,
                                                     height: 1
                                                 ),
                                                 overflow: TextOverflow.ellipsis,
                                               ),
                                             ),
                                           ],
                                         ),
                                         items: Event_Cateogory_List
                                             .map((item) => DropdownMenuItem<String>(
                                             value: item,
                                             child:
                                             //state.EventCateogorySuccess! && !Diditonce2?
                                             Text(
                                               item,
                                               style:  TextStyle(
                                                 fontSize: 14.sp,
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.white,
                                               ),
                                               overflow: TextOverflow.ellipsis,
                                             )
                                           //:Text("")
                                         ))
                                             .toList(),
                                         value: selectedValue,
                                         onChanged: (value) {
                                           setState(() {
                                             selectedValue = value as String;
                                           });
                                         },
                                         icon:  Icon(
                                           Icons.keyboard_arrow_down,
                                           size: 20.w,
                                           color: Color(0xffEAEAEA),
                                         ),
                                         iconSize: 20.w,
                                         iconEnabledColor: Colors.yellow,
                                         iconDisabledColor: Colors.grey,
                                         buttonHeight: h/15,
                                         buttonWidth: w/2.3,
                                         buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                         buttonDecoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(h/85.25),
                                           border: Border.all(
                                             color: Colors.black26,
                                           ),
                                           color: Color(0xff303030),
                                         ),
                                         buttonElevation: 2,
                                         itemHeight: h/20,
                                         dropdownMaxHeight: h/12,
                                         dropdownWidth: w/2.3,
                                         dropdownDecoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(h/45.25),
                                           color: Color(0xff303030),
                                         ),
                                         dropdownElevation: 8,
                                         scrollbarRadius: const Radius.circular(40),
                                         scrollbarThickness: 6,
                                         scrollbarAlwaysShow: false,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: h/10,),
                                   Row(
                                     children: [
                                       Container(
                                         width: w / 2,
                                         height: h / 8,
                                         child: Row(
                                           children: [
                                             Column(children: [
                                               Text(
                                                   '    Add Images',
                                                   style: _TextTheme.headline3!.copyWith(
                                                     fontSize: 14.sp,
                                                   )),
                                                SizedBox(height: 8.h,),
                                               InkWell(
                                                 onTap: () {
                                                   PhotoBottomSheet();
                                                 },
                                                 child: Container(
                                                   width: w / 7,
                                                   height: h / 15,
                                                   decoration: const BoxDecoration(
                                                     color: Color.fromRGBO(
                                                         207, 109, 56, 1),
                                                   ),
                                                   child: Center(child: SvgPicture.asset(
                                                     "Assets/images/Vector(4).svg",
                                                     width: h / 30,)),
                                                 ),
                                               ),

                                             ]),
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: h/5,),

                                 ],
                               ),

                               Container(
                                 height: h/2,
                                 margin: EdgeInsets.only(bottom: h/28,right: 20.w),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Center(
                                       child: Text('Event Dates:',
                                         textAlign: TextAlign.left,
                                         style: TextStyle(
                                             color: Color.fromRGBO(237, 236, 241, 1),
                                             fontFamily: 'Red Hat Text',
                                             fontSize: 14.sp,
                                             letterSpacing: 0.11999999731779099,
                                             fontWeight: FontWeight.w400,
                                             height: 1.7142857142857142
                                         ),),
                                     ),
                                     SizedBox(height: 10.h,),
                                     state.DoneChoose2!
                                         ?  Column(
                                       children: [

                                         SizedBox(height: h/75,),
                                         Container(
                                           width: w/3,
                                           height: h/5,
                                           child: ListView.separated(
                                             shrinkWrap: true,
                                             padding: EdgeInsets.zero,
                                             physics:
                                             const BouncingScrollPhysics(),
                                             scrollDirection:
                                             Axis.vertical,
                                             itemCount:
                                             ListOfSingleDates.length,
                                             itemBuilder:
                                                 (BuildContext context,
                                                 int index) {
                                               return Row(
                                                 children: [
                                                   Image.asset(
                                                       "Assets/images/Group 229.png"),
                                                    SizedBox(
                                                     width: 5.w,
                                                   ),
                                                   Flexible(
                                                     child: Text(
                                                         ListOfSingleDatesString[
                                                         index].toString(),
                                                         textAlign:
                                                         TextAlign
                                                             .left,
                                                         style: _TextTheme
                                                             .headline5!.copyWith(
                                                           fontSize: 11.sp
                                                         )),
                                                   ),
                                                 ],
                                               );
                                             },
                                             separatorBuilder:
                                                 (BuildContext context,
                                                 int index) {
                                               return  SizedBox(
                                                 height: 3.h,
                                               );
                                             },
                                           ),
                                         ),
                                       ],
                                     )
                                         :  Container(
                                       width: w/4,
                                       height:  h/16,
                                       decoration: BoxDecoration(
                                         borderRadius:
                                          BorderRadius
                                             .only(
                                           topLeft:
                                           Radius.circular(5.r),
                                           topRight:
                                           Radius.circular(5.r),
                                           bottomLeft:
                                           Radius.circular(5.r),
                                           bottomRight:
                                           Radius.circular(5.r),
                                         ),
                                         color: state
                                             .DoneChoose1!
                                             ? const Color
                                             .fromRGBO(
                                             168, 48, 99, 1)
                                             : const Color(
                                             0xff606060),
                                       ),
                                       child: InkWell(
                                         onTap: () {
                                           // print(state.Start_Time);
                                           // print(state.End_Time);
                                           // if (state.DoneChoose1!)
                                           dIALOG1();

                                         },
                                         child: Center(
                                           child: Text(
                                             'Schedule',
                                             textAlign:
                                             TextAlign.center,
                                             style: _TextTheme
                                                 .headline4!
                                                 .copyWith(
                                               fontWeight:
                                               FontWeight.w300,
                                               color: Colors
                                                   .white,
                                               fontSize: 14.sp,
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                            InkWell(
                              onTap: (){
                                int Wanted_Category_ID = 0;
                                for(int i=0;i<Event_Cateogory_List.length;i++){
                                  if (selectedValue==Event_Cateogory_List[i].toString()){
                                    Wanted_Category_ID = Event_Cateogory_List_id[i];
                                  }
                                }
                                if (Wanted_Category_ID!=0) {
                                  if (state.DoneChoose2!) {
                                    if (base64Image.isNotEmpty) {
                                      if (state.PickedColor!.isNotEmpty) {
                                        widget.Dataa!.Base64Image = base64Image;
                                        widget.Dataa!.Category_id =  Wanted_Category_ID;
                                        widget.Dataa!.Picked_Color =  state.PickedColor;
                                print( widget.Start.toString());
                                print( widget.End.toString());
                                print(dates);

                                        Diditonce = true;
                                        _CreateBubbleBloc.add(CreateBubble((b) =>
                                        b ..Title = widget.Dataa!.Title
                                          ..Description = widget.Dataa! .Description
                                          ..End_Date = widget.End.toString()
                                          ..Start_Date = widget.Start.toString()
                                          ..ColorS = state.PickedColor
                                          ..lng = widget.Dataa!.lng
                                          ..lat = widget.Dataa!.lat
                                          ..Base64Images = [ widget.Dataa!.Base64Image!]
                                          ..LOcation = widget.Dataa!.Location
                                          ..raduis = widget.Dataa!.raduis
                                          ..OrganizersId = []
                                          ..Cateogory_id = widget.Dataa!.Category_id
                                          ..Dates = dates

                                        ));
                                      }
                                    }
                                  }
                                }
                              },
                              child: Container(
                                width: w / 2.4,
                                height: h / 14,
                                decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft:Radius.circular(7.r),
                                      topRight:Radius.circular(7.r),
                                      bottomLeft:Radius.circular(7.r),
                                      bottomRight: Radius.circular(7.r),
                                    ),
                                    color :
                                    Color(0xffA83063)
                                ),
                                child: Center(
                                  child:
                                  Text('Done', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                        Color.fromRGBO(255, 255, 255, 1),

                                        fontFamily: 'Red Hat Text',
                                        fontSize: 18.sp,
                                        letterSpacing: 0 ,
                                        fontWeight: FontWeight.w600,
                                        height: 1
                                    ),),
                                ),
                              ),
                            )
                  ]
                )
                      ),

                      state.CreateBubbleISloading!
                          ?Container(
                          width: w,
                          height: h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: listLoader(context: context)),
                            ],
                          ))
                          :Text(""),
                    ],

                  ),
                ),
              ),
            );
        }
    );
  }


  void Convert(File path){
    Uint8List bytes = path.readAsBytesSync();
    base64Image ="data:image/png;base64,${base64Encode(bytes)}";
    print(base64Image);
    Base64Images!.add(base64Image);
    print(Base64Images);
    print("Converted");
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }
  List<String>? dates = [];
  Future<void> dIALOG1() {
    TextTheme _textthem = Theme
        .of(context)
        .textTheme;
    ColorScheme COLOR = Theme
        .of(context)
        .colorScheme;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    return   showMaterialModalBottomSheet(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(h/90.0),
          ),
        ),
        builder: (context) {
          return   BlocBuilder(
              bloc: _CreateBubbleBloc,
              builder: (BuildContext Context, CreateBubbleState state){
                return FractionallySizedBox(
                    heightFactor: h / 950,
                    child: Container(
                      child: Column(
                        children:[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: w / 2,
                                    height: h / 20,
                                    margin: EdgeInsets.only(top: h / 50),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Text('Event Dates:',
                                              textAlign: TextAlign.left,
                                              style: _textthem.headlineLarge!
                                                  .copyWith(
                                                  fontFamily: 'Red Hat Display',
                                                  fontSize: 18.sp,
                                                  letterSpacing: 0.4,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(""),
                                ],
                              ),
                              const Text(""),
                            ],
                          ),
                          Container(
                            color: const Color(0xff942657),
                            width: w,
                            height: h / 180,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: h / 1.5,
                              child: SfDateRangePicker(
                                minDate:widget.Start,
                                maxDate: widget.End,
                                monthCellStyle: DateRangePickerMonthCellStyle(
                                  textStyle: _textthem.headline1!.copyWith(
                                      color: COLOR.onSurfaceVariant,
                                      fontSize: 14.sp,
                                      letterSpacing: 0.2199999988079071,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5714285714285714),
                                  disabledDatesTextStyle: _textthem.headline1!
                                      .copyWith(
                                      color: const Color.fromRGBO(96, 96, 96, 1),
                                      fontSize: 14.sp,
                                      letterSpacing: 0.2199999988079071,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5714285714285714),
                                ),
                                showNavigationArrow: true,
                                toggleDaySelection: true,
                                selectionColor: const Color(0xffCF6D38),
                                view: DateRangePickerView.month,
                                selectionMode: DateRangePickerSelectionMode.multiple,
                                onSelectionChanged: _onSelectionChanged1,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await FormateDate();
                              Navigator.pop(context);
                              if (ListOfSingleDates.isNotEmpty) {
                                _CreateBubbleBloc.add(
                                    ChangeDone2((b) => b..DoneColor2 = true));
                                print("Done");
                                print(ListOfSingleDates);
                              }
                              print("Done");
                            },
                            child: Container(
                              width: w / 2,
                              height: h / 16,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(7.r),
                                  topRight: Radius.circular(7.r),
                                  bottomLeft: Radius.circular(7.r),
                                  bottomRight: Radius.circular(7.r),
                                ),
                                color: Color.fromRGBO(148, 38, 87, 1),
                              ),
                              child:  Center(
                                child: Text(
                                  'Confirm',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Gill Sans Nova',
                                      fontSize: 18.sp,
                                      letterSpacing:
                                      0 ,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ));
              }
          );


        }
        );
  }
  Future<void> FormateDate() async {
    for (int i = 0; i < LISTdate!.length; i++) {
      SingleDate = DateTime.parse(LISTdate![i].toString());
      time = DateFormat.yMMMMd('en_US').format(SingleDate!);
      ListOfSingleDatesString.add(time.toString());
      print(ListOfSingleDatesString);


      String man = LISTdate![i].toString().substring(0,10);
      SingleDate = DateTime.parse(man);



      ListOfSingleDates.add(SingleDate!);
      dates!.add(SingleDate!.toString());
      print(ListOfSingleDates);
    }

  }

  void _onSelectionChanged1(DateRangePickerSelectionChangedArgs args) {
    try{
    LISTdate = args.value;
    print(LISTdate);
    print("im here");
    print(LISTdate!.length);
    print(args);
    print(LISTdate);
  }catch(e){
  print(e);
  }
  }

}


//
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
// import 'package:bubbles/Injection.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_Bloc.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_Event.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_State.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';
// import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
// import 'package:bubbles/core/Colors/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:address_search_field/address_search_field.dart';
// class Customize_Screen extends StatefulWidget {
//   Data? Dataa;
//
//   Customize_Screen({Key? key,this.Dataa,required this.Context});
//   BuildContext? Context;
//   @override
//   State<Customize_Screen> createState() => _Customize_ScreenState();
// }
//
// class _Customize_ScreenState extends State<Customize_Screen> {
//   File? image;
//   final _formKey3 = GlobalKey<FormState>();
//   // Color pickerColor = const Color(0xff443a49);
//   // Color currentColor = const Color(0xff443a49);
//
//
//
//
//
//
//
//
//
//
//
//
//
//   List<String> BubbleColors = ["0xff8D4624","0xff31576D","0xffE0A41E","0xff4ECEB6","0xffDEDDBF",
//     "0xff578274","0xff77C08A","0xffD588B1","0xff7B78F5","0xffBA477A","0xff80BFC5","0xffEB9B5D","0xffCD6356"];
//   // bool Changed2 = false;
//   bool Changed3 = false;
//   // bool Changed = false;
//   late FocusNode FoucesNodePass;
//   late FocusNode FoucesNodeEmail;
//   late FocusNode FoucesNodeConfirm;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final TextEditingController _AddPlainController = TextEditingController();
//   final TextEditingController _DescriptionController = TextEditingController();
//   final TextEditingController _LocationController = TextEditingController();
//   late GeoMethods geoMethods;
//   late Address destinationAddress;
//   final pref = sl<IPrefsHelper>();
//   final _CreateBubbleBloc = sl<HomeBloc>();
//   var geoMethodss;
//   String base64Image="";
//   List<String>? Base64Images=[];
//
//   Future<void> pickImage() async {
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (image == null) return;
//     final  imagePath = File(image.path);
//     this.image = imagePath;
//     Convert(imagePath);
//     print(imagePath);
//   }
//   //
//   // void changeColor(Color color) {
//   //   setState(() => pickerColor = color);
//   // }
//   //
//   // alreatDialogBuilder() async {
//   //   return showDialog(
//   //     builder: (BuildContext context) {
//   //       var h = MediaQuery.of(context).size.height;
//   //       var w = MediaQuery.of(context).size.width;
//   //       return Container(
//   //         child: AlertDialog(
//   //           backgroundColor: ChooseAvatarBack,
//   //           title: const Text('Pick a color!'),
//   //           content: SingleChildScrollView(
//   //             child: ColorPicker(
//   //               pickerColor: pickerColor,
//   //               onColorChanged: changeColor,
//   //             ),
//   //           ),
//   //           actions: <Widget>[
//   //             ElevatedButton(
//   //               child: const Text('Got it'),
//   //               onPressed: () {
//   //                 setState(() => currentColor = pickerColor);
//   //                 Navigator.of(context).pop();
//   //               },
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //     context: context,
//   //   );
//   // }
//
//   @override
//   void initState() {
//     FoucesNodePass = FocusNode();
//     FoucesNodeEmail = FocusNode();
//     FoucesNodeConfirm = FocusNode();
//     super.initState();
//     geoMethods =GeoMethods(
//       googleApiKey: Platform.isIOS?'AIzaSyDU_37KrySa8XKoPivA5jKvsuVGG5OVxW8':"AIzaSyB5LMtZr6xsMbx6EJ2US_MHH6eefTsxFDU",
//       language: 'en',
//     );
//     geoMethods.autocompletePlace(query: _LocationController.text);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _AddPlainController.dispose();
//     _DescriptionController.dispose();
//     _LocationController.dispose();
//     FoucesNodeEmail.dispose();
//     FoucesNodePass.dispose();
//     FoucesNodeConfirm.dispose();
//   }
//
//   CommingSoonPopup(
//       BuildContext Context,
//       double h,
//       double w,
//       String Value,
//       String buttonValue,
//       int FontSize
//       ) async {
//     return showDialog(
//         context: Context,
//            barrierDismissible: true,
//         builder: (Context) {
//           return AlertDialog(
//               backgroundColor: Colors.transparent,
//               insetPadding: EdgeInsets.all(h/100),
//               content:Container(
//                 width: w/1.4,
//                 height: h/3,
//                 decoration: BoxDecoration(
//                   borderRadius : BorderRadius.only(
//                     topLeft: Radius.circular(8.285714149475098),
//                     topRight: Radius.circular(8.285714149475098),
//                     bottomLeft: Radius.circular(8.285714149475098),
//                     bottomRight: Radius.circular(8.285714149475098),
//                   ),
//                   color: Colors.transparent,
//                 ),
//
//
//                 child: Stack(
//                   children: [
//
//                     Positioned(
//                       top: h/12.5,
//                       child: Container(
//                         width: w/1.4,
//                         height: h/4.2,
//                         decoration: BoxDecoration(
//                           borderRadius : BorderRadius.only(
//                             topLeft: Radius.circular(8.285714149475098),
//                             topRight: Radius.circular(8.285714149475098),
//                             bottomLeft: Radius.circular(8.285714149475098),
//                             bottomRight: Radius.circular(8.285714149475098),
//                           ),
//                           color : Color.fromRGBO(47, 47, 47, 1),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(""),
//
//
//                             Center(
//                               child: Text(Value,
//                                 textAlign: TextAlign.center, style: TextStyle(
//                                     color: Color.fromRGBO(234, 234, 234, 1),
//                                     fontFamily: 'Red Hat Display',
//                                     fontSize: FontSize.toDouble(),
//                                     letterSpacing: 0 ,
//                                     fontWeight: FontWeight.w600,
//                                     height: 1
//                                 ),),
//                             ),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Center(
//                                   child: InkWell(
//                                     onTap: (){
//                                       Navigator.pop(context);
//                                     },
//                                     child: Container(
//                                       height: h/15.5,
//                                       width: w/2,
//                                       decoration: BoxDecoration(
//                                         borderRadius : BorderRadius.only(
//                                           topLeft: Radius.circular(4.142857074737549),
//                                           topRight: Radius.circular(4.142857074737549),
//                                           bottomLeft: Radius.circular(4.142857074737549),
//                                           bottomRight: Radius.circular(4.142857074737549),
//                                         ),
//                                         boxShadow : [BoxShadow(
//                                             color: Color.fromRGBO(0, 0, 0, 0.25),
//                                             offset: Offset(0,0),
//                                             blurRadius: 6.628571510314941
//                                         )],
//                                         color : Color.fromRGBO(168, 48, 99, 1),
//                                       ),
//                                       child: Center(
//                                         child:
//                                         Text(buttonValue, textAlign: TextAlign.center, style: TextStyle(
//                                             color: Color.fromRGBO(234, 234, 234, 1),
//                                             fontFamily: 'Red Hat Text',
//                                             fontSize: 14,
//                                             letterSpacing: 0 ,
//                                             fontWeight: FontWeight.w400,
//                                             height: 1
//                                         ),),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: h/8,
//                       bottom: h/5,
//                       child: SvgPicture.asset(
//                         "Assets/images/widget.svg",
//                         width: 90,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//
//           );
//         });
//   }
// bool Diditonce = false;
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _TextTheme = Theme.of(context).textTheme;
//     ColorScheme ColorS = Theme.of(context).colorScheme;
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return  BlocBuilder(
//         bloc: _CreateBubbleBloc,
//         builder: (BuildContext Context, HomeState state){
//
//
//       if (state.CreateBUbbleSuccess! && Diditonce){
//
//         WidgetsBinding.instance!
//             .addPostFrameCallback((_) {
//               Navigator.pop(context,'Yep!');
//               Navigator.pop(context,'Yep!');
//            //   CommingSoonPopup(widget.Context!, h, w, "Bubble was made Successfully","Sounds good!",24);
//         }
//         );
//         Diditonce = true;
//       }
//       return
//       SafeArea(
//         child: Scaffold(
//           key: _scaffoldKey,
//           backgroundColor: ColorS.onInverseSurface,
//           resizeToAvoidBottomInset: false,
//           body: SafeArea(
//             child: Stack(
//               children: [
//                 SizedBox(
//                   height: h,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: h / 100),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                                 margin: EdgeInsets.only(
//                                     right: h / 20),
//                                 child: IconButton(
//                                   icon: SvgPicture.asset(
//                                       "Assets/images/Frame 11.svg",
//                                       width: 30,
//                                       color: ColorS.surface),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 )),
//                             Text('Customize_Screen', textAlign: TextAlign.left,
//                               style: _TextTheme.headlineLarge!.copyWith(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 23
//                               ),),
//                             Text(""),
//                             Text(""),
//
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                           width: w / 1.1,
//                           height: h / 1.7,
//                           child: Form(
//                             key: _formKey3,
//                             autovalidateMode:
//                             AutovalidateMode
//                                 .onUserInteraction,
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container(
//                                     width: w / 1.25,
//                                     height: h / 10,
//                                     child: TextFormField(
//                                       keyboardAppearance:
//                                       Brightness.dark,
//                                       textInputAction:
//                                       TextInputAction.next,
//                                       controller: _AddPlainController,
//                                       style: TextStyle(
//                                           fontSize: 19,
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           color: Colors.red),
//                                       onFieldSubmitted: (value) {},
//                                       validator: MultiValidator([
//                                         RequiredValidator(
//                                             errorText:
//                                             "Required"),
//                                       ]),
//
//                                       cursorColor: Colors.black,
//                                       decoration: InputDecoration(
//                                           errorStyle: const TextStyle(
//                                             color: Colors.red,),
//                                           errorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           focusedErrorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(5)
//                                           ),
//                                           enabledBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           focusedBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           filled: true,
//                                           fillColor: ColorS.primaryContainer,
//                                           contentPadding:
//                                           EdgeInsets.symmetric(
//                                             horizontal: 12,),
//                                           hintText: 'Add Plan Title',
//                                           hintStyle: _TextTheme.headline6),
//                                       keyboardType:
//                                       TextInputType.text,
//                                       // obscureText: SecureInput_pass,
//                                     ),
//                                   ),
//                                   Container(
//                                     width: w / 1.25,
//                                     child: TextFormField(
//                                       keyboardAppearance:
//                                       Brightness.dark,
//                                       textInputAction:
//                                       TextInputAction.next,
//                                       controller:
//                                       _DescriptionController,
//                                       maxLines: 7,
//                                       style: TextStyle(
//                                           fontSize: 19,
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           color: Colors.red),
//                                       onFieldSubmitted: (value) {},
//                                       validator: MultiValidator([
//                                         RequiredValidator(
//                                             errorText:
//                                             "Required"),
//
//                                       ]),
//
//                                       cursorColor: Colors.black,
//                                       // style: TextStyle(
//                                       //     fontSize: 19,
//                                       //     fontWeight:
//                                       //     FontWeight.w500,
//                                       //     color: Colors.brown),
//                                       decoration: InputDecoration(
//                                           errorStyle: const TextStyle(
//                                             color: Colors.red,),
//                                           errorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           focusedErrorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(5)
//                                           ),
//                                           enabledBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           focusedBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           filled: true,
//                                           fillColor: ColorS.primaryContainer,
//                                           hintText: "Description",
//                                           hintStyle: _TextTheme.headline6),
//                                       keyboardType:
//                                       TextInputType.text,
//                                       // obscureText: SecureInput_pass,
//                                     ),
//                                   ),
//
//                                   Container(
//                                     width: w / 1.25,
//                                     height: h / 10,
//                                     child: TextFormField(
//                                       keyboardAppearance:
//                                       Brightness.dark,
//                                       textInputAction:
//                                       TextInputAction.done,
//                                       style: TextStyle(
//                                           fontSize: 19,
//                                           fontWeight:
//                                           FontWeight.w500,
//                                           color: Colors.red),
//                                       controller:
//                                       _LocationController,
//                                       onTap: () =>
//                                           showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) =>
//                                                 AddressSearchDialog(
//                                                   style: AddressDialogStyle(
//                                                       color: Color(0xffCF6D38),
//                                                       backgroundColor: Color(
//                                                           0xff942657)
//                                                   ),
//                                                   geoMethods: geoMethods,
//                                                   controller: _LocationController,
//                                                   onDone: (Address address) =>
//                                                   destinationAddress = address,
//                                                 ),
//                                           ),
//                                       validator: MultiValidator([
//                                         RequiredValidator(
//                                             errorText:
//                                             "Required"),
//
//                                       ]),
//
//                                       cursorColor: Colors.black,
//                                       // style: TextStyle(
//                                       //     fontSize: 19,
//                                       //     fontWeight:
//                                       //     FontWeight.w500,
//                                       //     color: Colors.brown),
//                                       decoration: InputDecoration(
//                                           errorStyle: const TextStyle(
//                                             color: Colors.red,),
//                                           errorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           focusedErrorBorder: const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Colors.transparent,
//                                                 width: 0.0),
//                                           ),
//                                           border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(5)
//                                           ),
//                                           enabledBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           focusedBorder:
//                                           UnderlineInputBorder(
//                                             borderSide:
//                                             const BorderSide(
//                                                 color: Colors
//                                                     .transparent),
//                                             borderRadius:
//                                             BorderRadius
//                                                 .circular(5),
//                                           ),
//                                           filled: true,
//                                           fillColor: ColorS.primaryContainer,
//                                           contentPadding:
//                                           EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: Changed3
//                                                   ? _formKey3.currentState!
//                                                   .validate()
//                                                   ? h / 100
//                                                   : h / 70
//                                                   : h / 100),
//                                           hintText: 'Location Name',
//                                           hintStyle: _TextTheme.headline6),
//                                       keyboardType:
//                                       TextInputType.text,
//                                       // obscureText: SecureInput_pass,
//                                     ),
//                                   ),
//
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment
//                                         .spaceAround,
//                                     children: [
//                                       SizedBox(
//                                         //  color: Colors.black,
//                                         width: w / 2.3,
//                                         height: h / 10,
//                                         child: Column(children: [
//                                           Text(
//                                               '  Add Images',
//                                               style: _TextTheme.headline3),
//                                           const SizedBox(height: 5,),
//                                           InkWell(
//                                             onTap: () {
//                                               pickImage();
//                                             },
//                                             child: Container(
//                                               width: w / 7,
//                                               height: h / 15,
//                                               decoration: const BoxDecoration(
//                                                 color: Color.fromRGBO(
//                                                     207, 109, 56, 1),
//                                               ),
//                                               child: Center(child: SvgPicture.asset(
//                                                 "Assets/images/Vector(4).svg",
//                                                 width: h / 30,)),
//                                             ),
//                                           ),
//
//                                         ]),
//                                       ),
//                                       // SizedBox(
//                                       //   //    color: Colors.black,
//                                       //   width: w / 2.3,
//                                       //   height: h / 10,
//                                       //   child: Column(
//                                       //     mainAxisAlignment: MainAxisAlignment
//                                       //         .spaceAround,
//                                       //     children: [
//                                       //       Text(
//                                       //           'Choose Bubble Color',
//                                       //           style: _TextTheme.headline3),
//                                       //       const SizedBox(height: 5,),
//                                       //       SizedBox(
//                                       //         width: w / 7,
//                                       //         height: h / 15,
//                                       //         child: InkWell(
//                                       //           onTap: () {
//                                       //             // alreatDialogBuilder();
//                                       //             // print(pickerColor);
//                                       //           },
//                                       //           child: SvgPicture.asset(
//                                       //             "Assets/images/Exclude.svg",
//                                       //             color: pickerColor,
//                                       //           ),
//                                       //         ),
//                                       //       ),
//                                       //     ],
//                                       //   ),
//                                       // ),
//
//
//
//                                     ],
//                                   ),
//                                 ]),
//                           )),
//                       const Text(""),
//                       InkWell(
//                         onTap: () {
//                          // print(pickerColor);
//                           if (_formKey3.currentState!.validate()) {
//                             if (base64Image != "") {
//                               // Diditonce = true;
//                               // print(pickerColor);
//                               // print(pickerColor
//                               //     .toString()
//                               //     .length);
//                               // String ColorS = "";
//                               // pickerColor
//                               //     .toString()
//                               //     .length == 47
//                               //     ? ColorS = pickerColor.toString().substring(35,
//                               //     45)
//                               //     : pickerColor
//                               //     .toString()
//                               //     .length == 17
//                               //     ? ColorS = pickerColor.toString().substring(6, 16)
//                               //     : ColorS =
//                               //     pickerColor.toString().substring(33, 43);
//                               print(ColorS);
//                               print(Base64Images);
//                               print(widget.Dataa!.OrganizersId);
//                               print(widget.Dataa!.End_Date);
//                               print(widget.Dataa!.Start_Date);
//                               print(widget.Dataa!.Dates);
//                               print(widget.Dataa!.raduis);
//                               print(widget.Dataa!.lat);
//                               print(widget.Dataa!.lng);
//                               print(_LocationController.text);
//                               print(_AddPlainController.text);
//                               print(_DescriptionController.text);
//
//                               _CreateBubbleBloc.add(CreateBubble((b) => b
//                                 ..Base64Images=Base64Images
//                                 ..lng=widget.Dataa!.lng
//                                 ..lat=widget.Dataa!.lat
//                                 ..raduis = widget.Dataa!.raduis
//                                 ..Start_Date =widget.Dataa!.Start_Date
//                                 ..End_Date=widget.Dataa!.End_Date
//                                 ..OrganizersId=widget.Dataa!.OrganizersId
//                                 ..Dates=widget.Dataa!.Dates
//                                 ..ColorS = ""
//                                 ..Title = _AddPlainController.text
//                                 ..Description =_DescriptionController.text
//                                 ..LOcation =_LocationController.text
//
//
//
//
//                               ));
//                             } else {
//                               CommingSoonPopup(context, h, w,  "You should provide an image of that place!", "Can't wait!", 18);
//
//                             }
//                           }
//                         },
//                         child: Container(
//                           width: w / 2.7,
//                           height: h / 14.5,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(7),
//                               topRight: Radius.circular(7),
//                               bottomLeft: Radius.circular(7),
//                               bottomRight: Radius.circular(7),
//                             ),
//                             color: Color.fromRGBO(148, 38, 87, 1),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Next', textAlign: TextAlign.center, style: TextStyle(
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                                 fontFamily: 'ABeeZee',
//                                 fontSize: 18,
//                                 letterSpacing: 0 ,
//                                 fontWeight: FontWeight.normal,
//                                 height: 1
//                             ),),
//                           ),
//                         ),
//                       ),
//                       const Text(""),
//                       const Text(""),
//                     ],
//                   ),
//                 ),
//                 state.CreateBubbleISloading!
//                     ?Container(
//                     width: w,
//                     height: h,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                             child: listLoader(context: context)),
//                       ],
//                     ))
//                     :Text(""),
//               ],
//
//             ),
//           ),
//         ),
//       );
//     }
//     );
//   }
//
//
//   void Convert(File path){
//     Uint8List bytes = path.readAsBytesSync();
//     base64Image ="data:image/png;base64,${base64Encode(bytes)}";
//     print(base64Image);
//     Base64Images!.add(base64Image);
//     print(Base64Images);
//   }
//
//   Widget listLoader({context}) {
//     return const SpinKitThreeBounce(
//       color: Colors.blue,
//       size: 30.0,
//     );
//   }
// //Scaffold(
// //       body: Center(
// //         child: DropdownButtonHideUnderline(
// //           child: DropdownButton2(
// //             isExpanded: true,
// //             hint: Row(
// //               children: const [
// //                 Icon(
// //                   Icons.list,
// //                   size: 16,
// //                   color: Colors.yellow,
// //                 ),
// //                 SizedBox(
// //                   width: 4,
// //                 ),
// //                 Expanded(
// //                   child: Text(
// //                     'Select Item',
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.yellow,
// //                     ),
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             items: items
// //                 .map((item) => DropdownMenuItem<String>(
// //                       value: item,
// //                       child: Text(
// //                         item,
// //                         style: const TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white,
// //                         ),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ))
// //                 .toList(),
// //             value: selectedValue,
// //             onChanged: (value) {
// //               setState(() {
// //                 selectedValue = value as String;
// //               });
// //             },
// //             icon: const Icon(
// //               Icons.arrow_forward_ios_outlined,
// //             ),
// //             iconSize: 14,
// //             iconEnabledColor: Colors.yellow,
// //             iconDisabledColor: Colors.grey,
// //             buttonHeight: 50,
// //             buttonWidth: 160,
// //             buttonPadding: const EdgeInsets.only(left: 14, right: 14),
// //             buttonDecoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(14),
// //               border: Border.all(
// //                 color: Colors.black26,
// //               ),
// //               color: Colors.redAccent,
// //             ),
// //             buttonElevation: 2,
// //             itemHeight: 40,
// //             itemPadding: const EdgeInsets.only(left: 14, right: 14),
// //             dropdownMaxHeight: 200,
// //             dropdownWidth: 200,
// //             dropdownPadding: null,
// //             dropdownDecoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(14),
// //               color: Colors.redAccent,
// //             ),
// //             dropdownElevation: 8,
// //             scrollbarRadius: const Radius.circular(40),
// //             scrollbarThickness: 6,
// //             scrollbarAlwaysShow: true,
// //             offset: const Offset(-20, 0),
// //           ),
// //         ),
// //       ),
// //     );
// }
