import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:address_search_field/address_search_field.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditBubble_Screen/bloc/EditBubble_Bloc.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditBubble_Screen/bloc/EditBubble_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditBubble_Screen/bloc/EditBubble_State.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'dart:ui'as ui;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditBubble_Screen extends StatefulWidget {
  const EditBubble_Screen({Key? key}) : super(key: key);

  @override
  State<EditBubble_Screen> createState() => _EditBubble_ScreenState();
}

class _EditBubble_ScreenState extends State<EditBubble_Screen> {
  List<String> BubbleColors=["0xffD1B964","0xff34A853","0xff77C08A","0xff6FA191","0xff4ECEB6","0xff80BFC5","0xff7B78F5","0xffD96799","0xffE06859","0xffCF6D38","0xffEB9B5D","0xffE0A41E"];
  final DateRangePickerController _pickerController =  DateRangePickerController();
  final TextEditingController _AddPlainController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  final TextEditingController _SearchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> Event_Cateogory_List = [];
  final List<int> Event_Cateogory_List_id = [];
  List<String> ListOfSingleDatesString = [];
  List<DateTime> ListOfSingleDates = [];
  List<String> LISTdateFormated = [];
  final _formKey3 = GlobalKey<FormState>();
  final _formkey1 = GlobalKey<FormState>();
  final _EditBubbleBloc = sl<EditBubbleBloc>();
  final pref = sl<IPrefsHelper>();
  late Address destinationAddress;
  late GeoMethods geoMethods;
  late FocusNode FoucesNodelocation;
  late FocusNode FoucesNodetitle;
  late FocusNode FoucesNodeDescription;
  late FocusNode FoucesNodeSearch;
  DateTime? SingleDate;
  String STartTimeString = "";
  String EndTimeString = "";
  String? selectedValue;
  DateTime? start;
  DateTime? End;
  var geoMethodss;
  DateTime? STartTime;
  DateTime? EndTime;
  File? image;
  List<DateTime>? LISTdate;
  String base64Image = "";
  String time = "";
  bool Diditonce = true;
  bool Diditonce2 = true;
  Uint8List? markerIcon;
  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    _DescriptionController.dispose();
    _AddPlainController.dispose();
    _LocationController.dispose();
    FoucesNodeDescription.dispose();
    FoucesNodetitle.dispose();
    FoucesNodelocation.dispose();
    FoucesNodeSearch.dispose();
  }

  @override
  void initState() {
    super.initState();
    FoucesNodeDescription =FocusNode();
    FoucesNodetitle =FocusNode();
    FoucesNodelocation =FocusNode();
    FoucesNodeSearch =FocusNode();

    _EditBubbleBloc.add(GetEventCateogories());
    makeMarker();
    geoMethods =GeoMethods(
      googleApiKey: Platform.isIOS?'AIzaSyDU_37KrySa8XKoPivA5jKvsuVGG5OVxW8':"AIzaSyB5LMtZr6xsMbx6EJ2US_MHH6eefTsxFDU",
      language: 'en',
    );
    geoMethods.autocompletePlace(query: _LocationController.text);
  }

  @override
  Widget build (BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return BlocBuilder(
        bloc: _EditBubbleBloc,
        builder:(BuildContext Context, EditBubbleState state){

          if (state.EventCateogorySuccess! && Diditonce2){
            for(int i=0;i<state.EventCateogory!.event_category!.length;i++) {
              Event_Cateogory_List.add(  state.EventCateogory!.event_category![i].name.toString());
              Event_Cateogory_List_id.add(  state.EventCateogory!.event_category![i].id!.toInt());
            }
            Diditonce2 = false;
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            key:_scaffoldKey,
            body:SafeArea(
              child:Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: h/200,left: w/30),
                                // margin: EdgeInsets.only(
                                //     right: h / 20),
                                child: IconButton(
                                    icon: SvgPicture.asset(
                                        "Assets/images/Frame 11.svg",
                                        width: 30.w,
                                        color: COLOR.surface),
                                    onPressed:(){
                                      Navigator.pop(context);
                                    }
                                )),


                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: h/200,right: w/10),
                                child: Text('Bubble Information', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 20.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),),
                              ),
                            ),
                            Text(""),
                          ],
                        ),
                        SizedBox(height: h/300,),
                      ],
                    ),
                  ),
                  Container(
                    height: h/1.3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          Row(
                            children: [
                              Container(
                                width: w/2.3,
                                height: h/15,
                                margin: EdgeInsets.only(left: w/14.5),
                                child: Center(
                                  child: Text('Bubble Duration:', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 18.sp,
                                      letterSpacing: 0.3,
                                      fontWeight: FontWeight.w400,
                                      height: 1
                                  ),),
                                ),
                              ),
                              SizedBox(width: w/100,),

                              !state.DoneChoose1!?
                              InkWell(
                                onTap:()=>showBottom(),
                                child: Container(
                                  width: w/2.4,
                                  height: h/22,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      topRight: Radius.circular(5.r),
                                      bottomLeft: Radius.circular(5.r),
                                      bottomRight: Radius.circular(5.r),
                                    ),
                                    color : Color.fromRGBO(168, 48, 99, 1),
                                  ),
                                  child: Center(
                                    child:
                                    Text('Schedule', textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 14.sp,
                                        letterSpacing: 0.5 ,
                                        fontWeight: FontWeight.w300,
                                        height: 1
                                    ),)
                                    ,
                                  ),
                                ),
                              ):
                              Row(
                                children: [
                                  Text('${state.Start_Time} - ${state.End_Time}', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(207, 109, 56, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 16.sp,
                                      letterSpacing: 0.4,
                                      fontWeight: FontWeight.w400,
                                      height: 1
                                  ),),
                                  IconButton(
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        size: h / 34,
                                      ),
                                      onPressed: ()=>showBottom()
                                  ),

                                ],
                              ),


                            ],
                          ),
                          Container(
                            width: w/1.2,
                            child: Center(
                              child:
                              Text('Select the duration of your bubble. Event dates and information can be customised in later steps.', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 11.sp,
                                  letterSpacing: 0 ,
                                  fontWeight: FontWeight.w300,
                                  height: 1.7
                              ),),
                            ),
                          ),
                          SizedBox(height: h/45,),
                          Container(
                              width: w/1.2,
                              height: h / 1.95,
                              child: Form(
                                key: _formKey3,
                                autovalidateMode:
                                AutovalidateMode
                                    .onUserInteraction,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: w/1.2,
                                        height: h / 10,

                                        child: TextFormField(
                                          keyboardAppearance:
                                          Brightness.dark,
                                          textInputAction:
                                          TextInputAction.next,
                                          controller: _AddPlainController,
                                          cursorHeight: 20.w,
                                          cursorColor: Colors
                                              .black,
                                          style: TextStyle(
                                              fontFamily: 'Red Hat Text',
                                              fontSize: 16.sp,
                                              height: 1.4,
                                              fontWeight:
                                              FontWeight.w300,
                                              color: Color(0xffC4C4C4)),


                                          onFieldSubmitted: (value) {},
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                "Required"),
                                          ]),

                                          decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,),
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.r)
                                              ),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),
                                              filled: true,
                                              fillColor: ColorS.primaryContainer,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 14,vertical: 10),
                                              // helperText: "HELLO",
                                              hintText: 'Bubble Name',
                                              hintStyle: _TextTheme.headline6!.copyWith(
                                                fontSize: 21.sp
                                              )),
                                          keyboardType:
                                          TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      ),
                                      Container(
                                        width: w/1.2,
                                        height: h/3.9,
                                        margin: EdgeInsets.only(bottom: 16.h),
                                        child: TextFormField(
                                          keyboardAppearance:
                                          Brightness.dark,
                                          textInputAction:
                                          TextInputAction.next,
                                          controller:
                                          _DescriptionController,
                                          maxLines: 7,
                                          style: TextStyle(
                                              fontFamily: 'Red Hat Text',
                                              fontSize: 16.sp,
                                              height: 1.4,
                                              fontWeight:
                                              FontWeight.w300,
                                              color: Color(0xffC4C4C4)),
                                          onFieldSubmitted: (value) {},
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                "Required"),

                                          ]),

                                          cursorColor: Colors.black,
                                          // style: TextStyle(
                                          //     fontSize: 19,
                                          //     fontWeight:
                                          //     FontWeight.w500,
                                          //     color: Colors.brown),
                                          decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,),
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.r)
                                              ),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),

                                              filled: true,
                                              fillColor: ColorS.primaryContainer,
                                              hintText: "Description",
                                              hintStyle: _TextTheme.headline6!.copyWith(
                                                  fontSize: 21.sp
                                              )),
                                          keyboardType:
                                          TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      ),
                                      Container(
                                        width: w/1.2,
                                        height: h / 10,
                                        child: TextFormField(
                                          keyboardAppearance:
                                          Brightness.dark,
                                          textInputAction:
                                          TextInputAction.done,
                                          style: TextStyle(
                                              fontFamily: 'Red Hat Text',
                                              fontSize: 16.sp,
                                              height: 1.4,
                                              fontWeight:
                                              FontWeight.w300,
                                              color: Color(0xffC4C4C4)),
                                          controller:
                                          _LocationController,
                                          onTap: () =>
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) =>
                                                    AddressSearchDialog(
                                                      style: AddressDialogStyle(
                                                        color: Color(0xff942657),
                                                        backgroundColor: Color(
                                                            0xff303030),

                                                      ),
                                                      geoMethods: geoMethods,
                                                      controller: _LocationController,
                                                      onDone: (Address address) =>
                                                      destinationAddress = address,
                                                    ),
                                              ),
                                          validator: MultiValidator([
                                            RequiredValidator(
                                                errorText:
                                                "Required"),

                                          ]),
                                          cursorColor: Colors.black,
                                          // style: TextStyle(
                                          //     fontSize: 19,
                                          //     fontWeight:
                                          //     FontWeight.w500,
                                          //     color: Colors.brown),
                                          decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                color: Colors.red,),
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              focusedErrorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0.0),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.r)
                                              ),
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                borderSide:
                                                const BorderSide(
                                                    color: Colors
                                                        .transparent),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.r),
                                              ),
                                              filled: true,
                                              fillColor: ColorS.primaryContainer,
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                horizontal: 12.w,),
                                              hintText: 'Location Name',
                                              hintStyle: _TextTheme.headline6!.copyWith(
                                                  fontSize: 21
                                              )),
                                          keyboardType:
                                          TextInputType.text,
                                          // obscureText: SecureInput_pass,
                                        ),
                                      ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment
                                      //       .spaceAround,
                                      //   children: [
                                      //     SizedBox(
                                      //       //  color: Colors.black,
                                      //       width: w / 2.3,
                                      //       height: h / 10,
                                      //       child: Column(children: [
                                      //         Text(
                                      //             '  Add Images',
                                      //             style: _TextTheme.headline3),
                                      //         const SizedBox(height: 5,),
                                      //         InkWell(
                                      //           onTap: () {
                                      //             pickImage();
                                      //           },
                                      //           child: Container(
                                      //             width: w / 7,
                                      //             height: h / 15,
                                      //             decoration: const BoxDecoration(
                                      //               color: Color.fromRGBO(
                                      //                   207, 109, 56, 1),
                                      //             ),
                                      //             child: Center(child: SvgPicture.asset(
                                      //               "Assets/images/Vector(4).svg",
                                      //               width: h / 30,)),
                                      //           ),
                                      //         ),
                                      //
                                      //       ]),
                                      //     ),
                                      //     // SizedBox(
                                      //     //   //    color: Colors.black,
                                      //     //   width: w / 2.3,
                                      //     //   height: h / 10,
                                      //     //   child: Column(
                                      //     //     mainAxisAlignment: MainAxisAlignment
                                      //     //         .spaceAround,
                                      //     //     children: [
                                      //     //       Text(
                                      //     //           'Choose Bubble Color',
                                      //     //           style: _TextTheme.headline3),
                                      //     //       const SizedBox(height: 5,),
                                      //     //       SizedBox(
                                      //     //         width: w / 7,
                                      //     //         height: h / 15,
                                      //     //         child: InkWell(
                                      //     //           onTap: () {
                                      //     //             // alreatDialogBuilder();
                                      //     //             // print(pickerColor);
                                      //     //           },
                                      //     //           child: SvgPicture.asset(
                                      //     //             "Assets/images/Exclude.svg",
                                      //     //             color: pickerColor,
                                      //     //           ),
                                      //     //         ),
                                      //     //       ),
                                      //     //     ],
                                      //     //   ),
                                      //     // ),
                                      //
                                      //
                                      //
                                      //   ],
                                      // ),
                                    ]),
                              )),
                          SizedBox(height: h/100,),


                          Column(
                            children: [
                              Container(
                                width: w/1.2,
                                child: Text(' Select Category:', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(237, 236, 241, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 17.sp,
                                    letterSpacing: 0.11999999731779099,
                                    fontWeight: FontWeight.w400,
                                    height: 1.7142857142857142
                                ),),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: w/1.2,
                                child: Row(
                                  children: [
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
                                                      fontSize: 16.sp,
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
                                          iconSize: 14,
                                          iconEnabledColor: Colors.yellow,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 40.h,
                                          buttonWidth: 134.w,
                                          buttonPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.r),
                                            border: Border.all(
                                              color: Colors.black26,
                                            ),
                                            color: Color(0xff303030),
                                          ),
                                          buttonElevation: 2,
                                          itemHeight:  31.h,
                                          itemPadding:  EdgeInsets.only(left: 14.w, right: 14.w),
                                          dropdownMaxHeight: 200.h,
                                          dropdownWidth:134.w,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(14.r),
                                            color: Color(0xff303030),
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius:  Radius.circular(40.r),
                                          scrollbarThickness: 6.sp,
                                          scrollbarAlwaysShow: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: h/20,),
                              Container(
                                width: w/1.19,
                                child: Text('Pick colour', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(237, 236, 241, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 16.sp,
                                    letterSpacing: 0.11999999731779099,
                                    fontWeight: FontWeight.w400,
                                    height: 1.7142857142857142
                                ),),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                  width: w,
                                  height: h / 10,
                                  margin: EdgeInsets.only(left: w / 15),
                                  child: ScrollConfiguration(
                                      behavior: MyBehavior(),
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics: const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: BubbleColors.length,
                                          separatorBuilder: (BuildContext context, int index) {
                                            return const SizedBox(width: 5,);
                                          },
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                _EditBubbleBloc.add(SelectColor((b) =>
                                                b
                                                  ..Index = index
                                                  ..PickedColor = BubbleColors[index]));
                                                // _CreateBubbleBloc.add(ChangePickedColor((b) => b..PickedColor=));
                                                print("Clicked1");
                                              },
                                              child: Container(
                                                  child: CircleAvatar(
                                                      radius: w / 12.1,
                                                      backgroundColor: state
                                                          .IsChosen_Colors![index] ? Colors
                                                          .white : Colors.transparent,
                                                      child: CircleAvatar(
                                                        radius: w / 13,
                                                        backgroundColor: state
                                                            .IsChosen_Colors![index] ? Color(
                                                            0xff303030) : Color(0xff303030),
                                                        child: CircleAvatar(
                                                          radius: w / 14,
                                                          backgroundColor: Color(
                                                              int.parse(BubbleColors[index])),
                                                        ),
                                                      )
                                                  )
                                              ),
                                            );
                                          }
                                      )
                                  )
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: w/1.2,
                                child: Row(
                                  children: [
                                    Container(
                                      width: w / 5,
                                      height: h / 10,
                                      child: Row(
                                        children: [
                                          Column(children: [
                                            Text(
                                                'Images',
                                                style: _TextTheme.headline3),
                                            const SizedBox(height: 8,),
                                            InkWell(
                                              onTap: ()=>PhotoBottomSheet(),
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
                                      Expanded(
                                        child: Container(
                                          child: Text('Recommended image sizes: 000x000 for profile image and 0000x000 for cover image.', textAlign: TextAlign.left, style: TextStyle(
                                            color: Color.fromRGBO(234, 234, 234, 1),
                                            fontFamily: 'Red Hat Text',
                                            fontSize: 12.sp,
                                            letterSpacing: 0.2 ,
                                            fontWeight: FontWeight.w300,
                                            height: 1
                                    ),),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child:     InkWell(
                            onTap: (){
                              if (state.DoneChoose1!) {
                                if (_formKey3.currentState!.validate()) {
                                  Data Dataa =Data();
                                  Dataa.Start_Date = state.Start_Time;
                                  Dataa.End_Date = state.End_Time;
                                  Dataa.Description =
                                      _DescriptionController.text;
                                  Dataa.Title =
                                      _AddPlainController.text;
                                  Dataa.Location =
                                      _LocationController.text;


                                  // WidgetsBinding
                                  //     .instance
                                  //     .addPostFrameCallback((_) =>
                                  //     Navigator
                                  //         .push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             Customize_Screen(
                                  //               Context: context,
                                  //               Dataa: Dataa,
                                  //               Start: STartTime!,
                                  //               End: EndTime!,
                                  //             ),
                                  //
                                  //       ),
                                  //     ));
                                }
                              }
                            },
                            child: Container(
                              width: w / 2.4,
                              height: h / 14,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(7.r),
                                  topRight: Radius.circular(7.r),
                                  bottomLeft: Radius.circular(7.r),
                                  bottomRight: Radius.circular(7.r),
                                ),
                                color :

                                // _formKey3.currentState!.validate()
                                //     &&
                                state.Start_Time!="" && state.End_Time!=""?Color(0xffA83063): Color.fromRGBO(96, 96, 96, 1),
                              ),
                              child: Center(
                                child:
                                Text('Next', textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color:
                                      Color.fromRGBO(255, 255, 255, 1),

                                      fontFamily: 'Red Hat Text',
                                      fontSize: 19.sp,
                                      letterSpacing: 0 ,
                                      fontWeight: FontWeight.w600,
                                      height: 1
                                  ),),
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
          );
        }
    );



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

  void makeMarker()async{
    markerIcon   = await  getBytesFromAsset('Assets/images/Simple Pin(1).png', 50);
  }

  void showBottom() {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) {
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
          return FractionallySizedBox(
              heightFactor: h / 950,
              child:Column(
                children: [
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
                                  child: Text('Bubble Duration:',
                                      textAlign: TextAlign.left,
                                      style: _textthem.headlineLarge!.copyWith(
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 18,
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
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: _textthem.headline1!.copyWith(
                                color: COLOR.onSurfaceVariant,
                                fontSize: 14,
                                letterSpacing: 0.2199999988079071,
                                fontWeight: FontWeight.normal,
                                height: 1.5714285714285714),
                            disabledDatesTextStyle: _textthem.headline1!
                                .copyWith(
                                color: const Color.fromRGBO(96, 96, 96, 1),//todo : fix the disabled dates on the light theme.
                                fontSize: 14,
                                letterSpacing: 0.2199999988079071,
                                fontWeight: FontWeight.normal,
                                height: 1.5714285714285714),
                          ),
                          minDate: DateTime.now(),
                          controller: _pickerController,
                          showNavigationArrow: true,
                          toggleDaySelection: true,
                          rangeSelectionColor: const Color(0xffCF6D38),
                          endRangeSelectionColor: const Color(0xffA83063),
                          startRangeSelectionColor: const Color(0xffA83063),
                          view: DateRangePickerView.month,
                          selectionMode: DateRangePickerSelectionMode.range,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      try {



                        DateTime Start = _pickerController.selectedRange!.startDate!;
                        DateTime Ends = _pickerController.selectedRange!.endDate!;
                        STartTime = Start;
                        EndTime = Ends;
                        STartTimeString = DateFormat.yMd('en_US').format(Start);
                        EndTimeString = DateFormat.yMd('en_US').format(Ends);
                        _EditBubbleBloc.add(AddStartandEndTime((b) =>
                        b   ..EndTime =EndTimeString
                          ..StartTime =STartTimeString
                        ));
                        print(STartTime);
                        print(EndTime);

                        ////I/flutter (29748): 2022-06-14 00:00:00.000
                        // // I/flutter (29748): 2022-06-30 00:00:00.000

                        print(_pickerController.selectedRange!.startDate);
                        print(_pickerController.selectedRange!.endDate);
                        start = _pickerController.selectedRange!.startDate!;
                        End = _pickerController.selectedRange!.endDate!;
                        if (STartTime == "" || EndTime == "") {
                          Navigator.pop(context);
                        } else if (STartTime != "" && EndTime != "") {
                          _EditBubbleBloc.add(
                              ChangeDone1((b) => b..DoneColor1 = true));
                          Navigator.pop(context);
                        }
                      }catch(e){
                        print(e);
                      }
                    },
                    child: Container(
                      width: w / 2,
                      height: h / 16,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        color: Color.fromRGBO(148, 38, 87, 1),
                      ),
                      child: Center(
                        child: Text(
                          'Confirm',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ));
        }
    );
  }

  Future<void> FreindDilog() {
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
    return showModalBottomSheet<void>(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {

          return  StatefulBuilder(
              builder:(BuildContext context,
                  void Function(void Function()) SetState){
                return BlocBuilder(
                    bloc: _EditBubbleBloc,
                    builder: (BuildContext Context, EditBubbleState state) {
                      return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom),
                          child :
                          FractionallySizedBox(
                              heightFactor: h / 1100,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: h / 20),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        width: w / 1.1,
                                        height: h / 15,
                                        child: Form(
                                          key: _formkey1,
                                          child: TextFormField(
                                            textInputAction: TextInputAction.search,
                                            controller: _SearchController,
                                            focusNode: FoucesNodeSearch,
                                            cursorColor: Colors.grey,
                                            cursorHeight: 20,
                                            onChanged: (Keyword){
                                              _EditBubbleBloc.add(SearchFreinds((b) => b
                                                ..Keyword = Keyword
                                              ));
                                            },
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(30.0),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff939393),
                                                      width: 10),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(30.0)),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff939393), width: 2),
                                                ),
                                                enabledBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(30.0)),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff939393), width: 2),
                                                ),
                                                prefixIcon: IconButton(
                                                    icon: SvgPicture.asset(
                                                      'Assets/images/Vector(1).svg',
                                                      width: w / 20,
                                                    ),
                                                    onPressed: null //do something,
                                                ),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12, vertical: 20),
                                                hintText: "Search User",
                                                hintStyle: _textthem.headline6!
                                                    .copyWith(fontSize: 15)),
                                            keyboardType: TextInputType.text,
                                          ),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: h / 30, right: h / 5, bottom: h / 30),
                                      child: Text(
                                        'Friend list',
                                        textAlign: TextAlign.left,
                                        style: _textthem.headlineLarge!.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22,
                                            letterSpacing: .5),
                                      ),
                                    ),

                                    state.success!
                                        ? state.FilteredFriendlist!.length != 0
                                        ? Expanded(
                                      child: Container(
                                        height: h / 1.49,
                                        margin: EdgeInsets.only(
                                          right: h / 20,
                                        ),
                                        child: ScrollConfiguration(
                                          behavior: MyBehavior(),
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                            const BouncingScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: state
                                                .FilteredFriendlist!.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return const SizedBox(
                                                height: 5,
                                              );
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {

                                              //state.FilteredFriendlist![index].backgroundColor!;

                                              return InkWell(
                                                onTap: () {
                                                  if (state.Chosen_Frineds![index]==1){
                                                    _EditBubbleBloc.add(Change_Chosen_frineds((b) => b
                                                      ..Status=0
                                                      ..Index = index
                                                    ));


                                                    // AdminsId.remove(state.FilteredFriendlist![index].id);
                                                    // AvatarsSelected.remove(state.FilteredFriendlist![index].Avatar.toString());
                                                    // BackGroundColorTOAvatars.remove(state.FilteredFriendlist![index].backgroundColor.toString());
                                                  }else{
                                                    _EditBubbleBloc.add(Change_Chosen_frineds((b) => b
                                                      ..Status=1
                                                      ..Index = index
                                                    ));


                                                    // AdminsId.add(state.FilteredFriendlist![index].id!);
                                                    // AvatarsSelected.add(state.FilteredFriendlist![index].Avatar.toString());
                                                    // BackGroundColorTOAvatars.add(state.FilteredFriendlist![index].backgroundColor.toString());
                                                  }
                                                },
                                                child:  Column(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: h / 30),
                                                      width: w / 1.01,
                                                      height: h / 10,
                                                      decoration:
                                                      BoxDecoration(
                                                        color:state.Chosen_Frineds![index]==1?Colors.greenAccent:
                                                        COLOR.secondaryContainer,

                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          bottomLeft:
                                                          Radius.circular(
                                                              40),
                                                          bottomRight:
                                                          Radius.circular(
                                                              5),
                                                          topLeft:
                                                          Radius.circular(
                                                              40),
                                                          topRight:
                                                          Radius.circular(
                                                              5),
                                                        ),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: COLOR
                                                                  .primaryContainer,
                                                              offset:
                                                              const Offset(
                                                                  0, 0),
                                                              blurRadius: 1)
                                                        ],
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Text("  "),
                                                                  CircleAvatar(
                                                                    backgroundColor: Color(state.FilteredFriendlist![index].backgroundColor!),
                                                                    radius:
                                                                    28,
                                                                    backgroundImage: NetworkImage(
                                                                        state
                                                                            .FilteredFriendlist!
                                                                        [
                                                                        index]
                                                                            .Avatar
                                                                            .toString()),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              const Text(""),
                                                              Row(
                                                                children: [
                                                                  const Text(
                                                                      "    "),
                                                                  Text(
                                                                      state
                                                                          .FilteredFriendlist!
                                                                      [index].alias
                                                                          .toString(),
                                                                      textAlign: TextAlign.left,
                                                                      style: _textthem.headline3!.copyWith(
                                                                          fontWeight: FontWeight.w400
                                                                          ,fontSize: 20
                                                                      )
                                                                  ),
                                                                ],
                                                              ),
                                                              const Text(""),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                        : Text(
                                        "You have no Freinds with that name ")
                                        : state.isLoading!
                                        ? Expanded(
                                        flex: 1,
                                        child: Container(
                                            width: w,
                                            height: h / 3,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                    child: listLoader(
                                                        context: context)),
                                              ],
                                            )))
                                        : Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: w,
                                            height: h / 10,
                                            child: const Text("Error"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))  );
                    });

              });





        }).whenComplete(() {
      setState(() {
      });
      //   _CreateBubbleBloc.add(SearchFreinds((b) => b..Keyword=""));
      _EditBubbleBloc.add(ChangeDone3((b) => b..ChangeDone33 = true));
    }

    );
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final  imagePath = File(image.path);
    this.image = imagePath;
    Convert(imagePath);
    print(imagePath);
  }

  void Convert(File path){
    Uint8List bytes = path.readAsBytesSync();
    base64Image ="data:image/png;base64,${base64Encode(bytes)}";
    print(base64Image);
    // Base64Images!.add(base64Image);
    // print(Base64Images);
  }

  Future<void> PhotoBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            width: w,
            height: h / 3.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
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
                              fontWeight: FontWeight.w600, fontSize: 30),
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
                              fontWeight: FontWeight.w600, fontSize: 30),
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

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
  }

}

