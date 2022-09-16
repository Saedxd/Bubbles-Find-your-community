import 'dart:io';
import 'package:address_search_field/address_search_field.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_Bloc.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_Event.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/bloc/CreateBubble_State.dart';
import 'package:bubbles/UI/Home/CreateBubble_Screen/data/data.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_bloc.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_event.dart';
import 'package:bubbles/UI/Home/Home_Screen/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'CustomizeBubble_Screen.dart';


class Options_screen extends StatefulWidget {
  Data? Dataa;

  Options_screen({Key? key,this.Dataa,required  this.Context})
      : super(key: key);
  BuildContext? Context;
  @override
  State<Options_screen> createState() => _Options_screenState();
}

class _Options_screenState extends State<Options_screen> {
  File? image;
  final _CreateBubbleBloc = sl<CreateBubbleBloc>();
  final _formKey3 = GlobalKey<FormState>();
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final pref = sl<IPrefsHelper>();
  late FocusNode FocuseNODE;
  bool done1 = false;
  bool done2 = false;
  String date = "";
  String STartTimeString = "";
  String EndTimeString = "";
  DateTime? STartTime;
  DateTime? EndTime;
  DateTime selectedDate = DateTime.now();
  final DateRangePickerController _pickerController =
  DateRangePickerController();
  String time = "";
  List<DateTime>? LISTdate;
  List<String> LISTdateFormated = [];
  DateTime? SingleDate;
  List<DateTime> ListOfSingleDates = [];
  List<String> ListOfSingleDatesString = [];
  List<int> OrganizersId = [];
  List<String> AvatarsSelected = [];
  List<String> BackGroundColorTOAvatars = [];
  bool DiditONCE = false;
  List<int> Array2 = [];
  DateTime?  start;
  DateTime?  End;
  var geoMethodss;
  late GeoMethods geoMethods;
  late Address destinationAddress;
  // bool Changed = false;
  late FocusNode FoucesNodePass;
  late FocusNode FoucesNodeEmail;
  late FocusNode FoucesNodeConfirm;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _AddPlainController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    _pickerController.dispose();
    _DescriptionController.dispose();
    _AddPlainController.dispose();
    _LocationController.dispose();
    FocuseNODE.dispose();
    // FoucesNodeConfirm.dispose();
    // FoucesNodeEmail.dispose();
    // FoucesNodePass.dispose();

  }


  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    geoMethods =GeoMethods(
      googleApiKey: Platform.isIOS?'AIzaSyDU_37KrySa8XKoPivA5jKvsuVGG5OVxW8':"AIzaSyB5LMtZr6xsMbx6EJ2US_MHH6eefTsxFDU",
      language: 'en',
    );
    geoMethods.autocompletePlace(query: _LocationController.text);
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return BlocBuilder(
        bloc: _CreateBubbleBloc,
        builder: (BuildContext Context, CreateBubbleState state) {
          return WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                  body: SafeArea(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only( bottom: 18.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                        Container(
                              margin: EdgeInsets.only(top:h/100,left: w/30,),
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
                                      margin: EdgeInsets.only(top: h/75,right: w/10),
                                      child: Text('Bubble Options', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 18.sp,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600,
                                          height: 1,
                                      ),),
                                    ),
                                  ),
                                  Text(""),
                                ],
                              ),
                            ),

                    Container(
                      margin: EdgeInsets.only( bottom: 7.h),
                      child:
                      Row(
                              children: [
                                Container(
                                  width: w/2.8,
                                  height: h/13,
                                  margin: EdgeInsets.only(left: w/14.5),
                                  child: Center(
                                    child: Text('Bubble Duration:', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 14.sp,
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
                                      margin: EdgeInsets.only(left: w/20),
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
                                            fontSize: 14.sp,
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
                    ),
                    Container(
                      margin: EdgeInsets.only( bottom: 20.h),
                      child:
                            Container(
                              width: w/1.3,
                              child: Center(
                                child:
                                Text('Select the duration of your bubble. Event dates and information can be customised in later steps.', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 10.sp,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.w300,
                                    height: 1.7
                                ),),
                              ),
                            ),
                    ),
                            Container(
                                width: w/1.2,
                                height: h / 1.9,
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
                                          margin: EdgeInsets.only(bottom: 3.h),
                                          child: TextFormField(
                                            keyboardAppearance:
                                            Brightness.dark,
                                            textInputAction:
                                            TextInputAction.next,
                                            controller: _AddPlainController,
                                            cursorHeight: 20,
                                            cursorColor: Colors
                                                .black,
                                            style : GoogleFonts.roboto().copyWith(
                                                fontSize: 14.sp,
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
                                                errorBorder:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:  OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular( h/200.5)
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),
                                                filled: true,
                                                fillColor: ColorS.primaryContainer,
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 14,vertical: 10),
                                                // helperText: "HELLO",
                                                hintText: 'Add Bubble Name',
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                  fontSize: 14.sp,
                                                )),
                                            keyboardType:
                                            TextInputType.text,
                                            // obscureText: SecureInput_pass,
                                          ),
                                        ),
                                        Container(
                                          width: w/1.2,
                                          height: h/5,
                                          margin: EdgeInsets.only(bottom:20.h ),
                                          child: TextFormField(
                                            keyboardAppearance:
                                            Brightness.dark,
                                            textInputAction:
                                            TextInputAction.next,
                                            controller:
                                            _DescriptionController,
                                            maxLines: 17,
                                            style : GoogleFonts.roboto().copyWith(
                                                fontSize: 14.sp,
                                                height: 0.9.h,
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
                                                errorBorder:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular( h/200.5)
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),

                                                filled: true,
                                                fillColor: ColorS.primaryContainer,
                                                hintText: "Add Description",
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                  fontSize: 14.sp,
                                                )),
                                            keyboardType:
                                            TextInputType.text,
                                            // obscureText: SecureInput_pass,
                                          ),
                                        ),
                                        Container(
                                          width: w/1.2,
                                          height: h / 10,
                                          margin: EdgeInsets.only(bottom: 7.h),
                                          child: TextFormField(
                                            keyboardAppearance:
                                            Brightness.dark,
                                            textInputAction:
                                            TextInputAction.done,
                                            style : GoogleFonts.roboto().copyWith(
                                                fontSize: 14.sp,
                                                height: 0.9.h,
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
                                                          useButtons: false
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
                                            decoration: InputDecoration(
                                                errorStyle: const TextStyle(
                                                  color: Colors.red,),
                                                errorBorder:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                focusedErrorBorder:  OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular( h/200.5),
                                                  borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 0.0),
                                                ),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular( h/200.5)
                                                ),
                                                enabledBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),
                                                focusedBorder:
                                                UnderlineInputBorder(
                                                  borderSide:
                                                  const BorderSide(
                                                      color: Colors
                                                          .transparent),
                                                  borderRadius:BorderRadius.circular( h/200.5)
                                                ),
                                                filled: true,
                                                fillColor: ColorS.primaryContainer,
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,),
                                                hintText: 'Location Name',
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                  fontSize: 14.sp,
                                                )),
                                            keyboardType:
                                            TextInputType.text,
                                            // obscureText: SecureInput_pass,
                                          ),
                                        ),
                                        Container(
                                          width: w/1.3,
                                          child: Center(
                                              child:
                                              Text('Adding the name of the location, venue, establishment etc can help your audience reach your bubble.', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                  fontFamily: 'Red Hat Text',
                                                  fontSize: 10.sp,
                                                  letterSpacing: 0 ,
                                                  fontWeight: FontWeight.w300,
                                                  height: 1.7
                                              ),)
                                          ),
                                        ),
                                      ]),
                                )),


                            InkWell(
                              onTap: (){
                                if (state.DoneChoose1!) {
                                  if (_formKey3.currentState!.validate()) {
                                    widget.Dataa!.Start_Date = state.Start_Time;
                                    widget.Dataa!.End_Date = state.End_Time;
                                    widget.Dataa!.Description =
                                        _DescriptionController.text;
                                    widget.Dataa!.Title =
                                        _AddPlainController.text;
                                    widget.Dataa!.Location =
                                        _LocationController.text;


                                    WidgetsBinding
                                        .instance
                                        .addPostFrameCallback((_) =>
                                        Navigator
                                            .push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Customize_Screen(
                                                  Context: context,
                                                  Dataa: widget.Dataa,
                                                  Start: STartTime!,
                                                  End: EndTime!,),

                                          ),
                                        ));
                                  }
                                }
                              },
                              child: Container(
                                  width: w / 2.4,
                                 height: h / 14,
                                  margin: EdgeInsets.only(top: 20.h),
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.only(
                                      topLeft:  Radius.circular(h/90.5),
                                      topRight: Radius.circular(h/90.5),
                                      bottomLeft: Radius.circular(h/90.5),
                                      bottomRight: Radius.circular(h/90.5),
                                    ),
                                    color :
                                        state.Start_Time!="" && state.End_Time!=""?Color(0xffA83063): Color.fromRGBO(96, 96, 96, 1),
                                  ),
                                child: Center(
                                    child:
                                    Text('Next', textAlign: TextAlign.center,
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



                          ],
                        ),
                      )));
        });
  }

  void showBottom() {
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
    showMaterialModalBottomSheet(
        context: context,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(h/90.0),
          ),
        ),
        builder: (context) {
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
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: _textthem.headline1!.copyWith(
                                color: COLOR.onSurfaceVariant,
                                fontSize: 14.sp,
                                letterSpacing: 0.2199999988079071,
                                fontWeight: FontWeight.normal,
                                height: 1.5714285714285714),
                            disabledDatesTextStyle: _textthem.headline1!
                                .copyWith(
                                color: const Color.fromRGBO(96, 96, 96, 1),//todo : fix the disabled dates on the light theme.
                                fontSize: 14.sp,
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
                        _CreateBubbleBloc.add(AddStartandEndTime((b) =>
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
                          _CreateBubbleBloc.add(
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
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.r),
                          topRight: Radius.circular(7.r),
                          bottomLeft: Radius.circular(7.r),
                          bottomRight: Radius.circular(7.r),
                        ),
                        color: Color.fromRGBO(148, 38, 87, 1),
                      ),
                      child: Center(

                        child:
                        Text('Confirm', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Red Hat Display',
                            fontSize: 18.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
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

  // Future<void> dIALOG1() {
  //   TextTheme _textthem = Theme
  //       .of(context)
  //       .textTheme;
  //   ColorScheme COLOR = Theme
  //       .of(context)
  //       .colorScheme;
  //   var w = MediaQuery
  //       .of(context)
  //       .size
  //       .width;
  //   var h = MediaQuery
  //       .of(context)
  //       .size
  //       .height;
  //   return   showMaterialModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return FractionallySizedBox(
  //             heightFactor: h / 950,
  //             child: Container(
  //               child: Column(
  //                 children:[
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: [
  //                           Container(
  //                             width: w / 2,
  //                             height: h / 20,
  //                             margin: EdgeInsets.only(top: h / 50),
  //                             child: Row(
  //                               children: [
  //                                 Center(
  //                                   child: Text('Event Dates:',
  //                                       textAlign: TextAlign.left,
  //                                       style: _textthem.headlineLarge!
  //                                           .copyWith(
  //                                           fontFamily: 'Red Hat Display',
  //                                           fontSize: 18,
  //                                           letterSpacing: 0.4,
  //                                           fontWeight: FontWeight.w600,
  //                                           height: 1)),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           const Text(""),
  //                         ],
  //                       ),
  //                       const Text(""),
  //                     ],
  //                   ),
  //                   Container(
  //                     color: const Color(0xff942657),
  //                     width: w,
  //                     height: h / 180,
  //                   ),
  //                   Expanded(
  //                     child: Container(
  //                       width: double.infinity,
  //                       height: h / 1.5,
  //                       child: SfDateRangePicker(
  //                         minDate: start,
  //                         maxDate: End,
  //                         monthCellStyle: DateRangePickerMonthCellStyle(
  //                           textStyle: _textthem.headline1!.copyWith(
  //                               color: COLOR.onSurfaceVariant,
  //                               fontSize: 14,
  //                               letterSpacing: 0.2199999988079071,
  //                               fontWeight: FontWeight.normal,
  //                               height: 1.5714285714285714),
  //                           disabledDatesTextStyle: _textthem.headline1!
  //                               .copyWith(
  //                               color: const Color.fromRGBO(96, 96, 96, 1),
  //                               fontSize: 14,
  //                               letterSpacing: 0.2199999988079071,
  //                               fontWeight: FontWeight.normal,
  //                               height: 1.5714285714285714),
  //                         ),
  //                         showNavigationArrow: true,
  //                         toggleDaySelection: true,
  //                         selectionColor: const Color(0xffCF6D38),
  //                         view: DateRangePickerView.month,
  //                         selectionMode: DateRangePickerSelectionMode.multiple,
  //                         onSelectionChanged: _onSelectionChanged1,
  //                       ),
  //                     ),
  //                   ),
  //                   InkWell(
  //                     onTap: () async {
  //                       await FormateDate();
  //                       Navigator.pop(context);
  //                       if (ListOfSingleDates.isNotEmpty) {
  //                         _CreateBubbleBloc.add(
  //                             ChangeDone2((b) => b..DoneColor2 = true));
  //                         print("Done");
  //                         print(ListOfSingleDates);
  //                       }
  //                       print("Done");
  //                     },
  //                     child: Container(
  //                       width: w / 2,
  //                       height: h / 16,
  //                       decoration: const BoxDecoration(
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(7),
  //                           topRight: Radius.circular(7),
  //                           bottomLeft: Radius.circular(7),
  //                           bottomRight: Radius.circular(7),
  //                         ),
  //                         color: Color.fromRGBO(148, 38, 87, 1),
  //                       ),
  //                       child: const Center(
  //                         child: Text(
  //                           'Confirm',
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(
  //                               color: Color.fromRGBO(255, 255, 255, 1),
  //                               fontFamily: 'Gill Sans Nova',
  //                               fontSize: 18,
  //                               letterSpacing:
  //                               0 ,
  //                               fontWeight: FontWeight.normal,
  //                               height: 1),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                 ],
  //               ),
  //             ));
  //       });
  // }

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
                    bloc: _CreateBubbleBloc,
                    builder: (BuildContext Context, CreateBubbleState state) {
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
                                            focusNode: FocuseNODE,
                                            cursorColor: Colors.grey,
                                            cursorHeight: 20,
                                            onChanged: (Keyword){
                                              _CreateBubbleBloc.add(SearchFreinds((b) => b
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
                                                  if (Array2[index]==1){
                                                    SetState(() {
                                                      Array2[index] = 0;
                                                    });
                                                    OrganizersId.remove(state.FilteredFriendlist![index].id);
                                                    AvatarsSelected.remove(state.FilteredFriendlist![index].Avatar.toString());
                                                    BackGroundColorTOAvatars.remove(state.FilteredFriendlist![index].backgroundColor.toString());
                                                  }else{
                                                    SetState(() {
                                                      Array2[index] = 1;
                                                    });
                                                    OrganizersId.add(state.FilteredFriendlist![index].id!);
                                                    AvatarsSelected.add(state.FilteredFriendlist![index].Avatar.toString());
                                                    BackGroundColorTOAvatars.add(state.FilteredFriendlist![index].backgroundColor.toString());
                                                  }

                                                  print(OrganizersId);
                                                  print(Array2);
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
                                                        color: Array2[index]==1?Colors.greenAccent:
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
      _CreateBubbleBloc.add(ChangeDone3((b) => b..ChangeDone33 = true));
    }

    );
  }

  Widget listLoader({context}) {
    return  SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0.w,
    );
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

  // void _onSelectionChanged2(DateRangePickerSelectionChangedArgs args) {
  //   try {
  //     String value1 = args.value.toString();
  //     String? Start;
  //     String? End2;
  //     DateTime Time1;
  //     DateTime Time2;
  //     print("im here");
  //     print(value1.length);
  //     print(value1);
  //     print(value1);
  //     print(value1);
  //     print(value1);
  //     if (value1.length != 91) {
  //       Start = value1.substring(33, 43);
  //       Time1 = DateTime.parse(Start);
  //       STartTime = DateFormat.yMMMMd('en_US').format(Time1);
  //       print(STartTime);
  //     } else {
  //       End2 = value1.substring(67, 77);
  //       Start = value1.substring(33, 43);
  //       Time1 = DateTime.parse(Start);
  //       Time2 = DateTime.parse(End2);
  //       STartTime = DateFormat.yMMMMd('en_US').format(Time1);
  //       EndTime = DateFormat.yMMMMd('en_US').format(Time2);
  //       print(STartTime);
  //       print(EndTime);
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  // }


  Future<void> FormateDate() async {
    for (int i = 0; i < LISTdate!.length; i++) {
      SingleDate = DateTime.parse(LISTdate![i].toString());
      time = DateFormat.yMMMMd('en_US').format(SingleDate!);
      ListOfSingleDatesString.add(time.toString());
      print(ListOfSingleDatesString);


      String man = LISTdate![i].toString().substring(0,10);
      SingleDate = DateTime.parse(man);



      ListOfSingleDates.add(SingleDate!);
      print(ListOfSingleDates);
    }
  }

// static List getSuggestions(String query) =>
//     List.of().where((user) {
//       final userLower = user.name.toLowerCase();
//       final queryLower = query.toLowerCase();
//
//       return userLower.contains(queryLower);
//     }).toList();
}




// import 'dart:io';
//
// import 'package:bubbles/App/app.dart';
// import 'package:bubbles/Data/prefs_helper/iprefs_helper.dart';
// import 'package:bubbles/Injection.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_Bloc.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_Event.dart';
// import 'package:bubbles/UI/Home/Home_Screen/bloc/CreateBubble_State.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
// import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';
// import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'CustomizeBubble_Screen.dart';
//
// class Options_screen extends StatefulWidget {
//   Data? Dataa;
//
//    Options_screen({Key? key,this.Dataa,required  this.Context})
//       : super(key: key);
//   BuildContext? Context;
//   @override
//   State<Options_screen> createState() => _Options_screenState();
// }
//
// class _Options_screenState extends State<Options_screen> {
//   final TextEditingController _SearchController = TextEditingController();
//   final _formkey1 = GlobalKey<FormState>();
//   final pref = sl<IPrefsHelper>();
//   final _CreateBubbleBloc = sl<HomeBloc>();
//   late FocusNode FocuseNODE;
//   bool done1 = false;
//   bool done2 = false;
//   String date = "";
//   String STartTimeString = "";
//   String EndTimeString = "";
//   DateTime? STartTime;
//   DateTime? EndTime;
//   DateTime selectedDate = DateTime.now();
//   final DateRangePickerController _pickerController =
//   DateRangePickerController();
//   String time = "";
//   List<DateTime>? LISTdate;
//   List<String> LISTdateFormated = [];
//   DateTime? SingleDate;
//   List<DateTime> ListOfSingleDates = [];
//   List<String> ListOfSingleDatesString = [];
//   List<int> OrganizersId = [];
//   List<String> AvatarsSelected = [];
//   List<String> BackGroundColorTOAvatars = [];
//   bool DiditONCE = false;
//   List<int> Array2 = [];
//   DateTime?  start;
//   DateTime?  End;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _SearchController.dispose();
//     _pickerController.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     FocuseNODE = FocusNode();
//     Array2 = List.filled(5000, 0);
//   }
//   List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//     'Item4',
//     'Item5',
//     'Item6',
//     'Item7',
//     'Item8',
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme _textthem = Theme.of(context).textTheme;
//     ColorScheme COLOR = Theme.of(context).colorScheme;
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return BlocBuilder(
//         bloc: _CreateBubbleBloc,
//         builder: (BuildContext Context, HomeState state) {
//           return WillPopScope(
//               onWillPop: () async {
//                 print(ListOfSingleDates);
//                     if (OrganizersId.isNotEmpty){
//                       _CreateBubbleBloc.add(ChangeDone3((b) => b..ChangeDone33 = false));
//                       print("HIM HEREEE");
//                       OrganizersId.clear();
//                       AvatarsSelected.clear();
//                       BackGroundColorTOAvatars.clear();
//                       Array2 = List.filled(
//                           5000,
//                           0);
//
//                       print(state.ChangeDone33);
//                       return false;
//                     }
//
//                 if (ListOfSingleDates.isNotEmpty && OrganizersId.isEmpty) {
//                   ListOfSingleDates.clear();
//                   _CreateBubbleBloc.add(ChangeDone2((b) => b..DoneColor2 = false));
//
//                   print("im here");
//
//                   return false;
//                 }
//                 if (state.DoneChoose1!&& OrganizersId.isEmpty && ListOfSingleDates.isEmpty) {
//                   STartTimeString = "";
//                   EndTimeString = "";
//                   _CreateBubbleBloc.add(ChangeDone1((b) => b..DoneColor1 = false));
//                   return false;
//                 }
//                 print(state.DoneChoose1!);
//                 print(state.DoneChoose2!);
//                 return true;
//               },
//               child: Scaffold(
//                   body: SafeArea(
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 height: h / 4.7,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment
//                                       .spaceBetween,
//                                   children: [
//                                     Container(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Container(
//                                             margin: EdgeInsets.only(top: h/100),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 Container(
//                                                     margin: EdgeInsets.only(
//                                                         right: h / 20),
//                                                     child: IconButton(
//                                                       icon: SvgPicture.asset(
//                                                           "Assets/images/Frame 11.svg",
//                                                           width: 30,
//                                                           color: COLOR.surface),
//                                                       onPressed:(){
//                                                         if (OrganizersId.isEmpty) {
//                                                           if (ListOfSingleDates
//                                                               .isEmpty &&
//                                                               state
//                                                                   .DoneChoose1!) {
//                                                             STartTimeString =
//                                                             "";
//                                                             EndTimeString = "";
//                                                             _CreateBubbleBloc
//                                                                 .add(
//                                                                 ChangeDone1((
//                                                                     b) => b..DoneColor1 = false));
//                                                           }
//                                                           ListOfSingleDates
//                                                               .clear();
//                                                           _CreateBubbleBloc
//                                                               .add(
//                                                               ChangeDone2((
//                                                                   b) => b..DoneColor2 = false));
//                                                           print(
//                                                               "im here");
//
//                                                           if (ListOfSingleDates
//                                                               .isEmpty) {
//                                                             if (!state
//                                                                 .DoneChoose1!) {
//                                                               Navigator
//                                                                   .pop(
//                                                                   context);
//                                                             }
//                                                           }
//                                                         }
//                                                           print(state.DoneChoose1);
//                                                           if (OrganizersId.isNotEmpty){
//                                                             _CreateBubbleBloc.add(ChangeDone3((b) => b..ChangeDone33 = false));
//                                                             print("HIM HEREEE");
//                                                             OrganizersId.clear();
//                                                             AvatarsSelected.clear();
//                                                             BackGroundColorTOAvatars.clear();
//                                                             Array2 = List.filled(
//                                                                 5000,
//                                                                 0);
//                                                             print(state.ChangeDone33);
//                                                           }
//
//
//
//                                                       },
//                                                     )),
//                                                 Text('Options', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 23
//                                                 ),),
//                                                 Text(""),
//                                                 Text(""),
//
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(height: 10,),
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                             children: [
//                                               Container(
//                                                   width: w / 2.7,
//                                                   height: h / 44,
//                                                   margin:
//                                                   EdgeInsets.only(
//                                                       right: h / 100,left: h/23),
//                                                   child: Text(
//                                                       'Bubble Duration:',
//                                                       textAlign: TextAlign.left,
//                                                       style: _textthem
//                                                           .headlineLarge!
//                                                           .copyWith(
//                                                         fontFamily: 'Red Hat Display',
//                                                         fontWeight: FontWeight
//                                                             .w400,
//                                                         fontSize: 15,
//                                                       ))),
//                                               SizedBox(
//                                                   width: w / 3.5,
//                                                   height: h / 44,
//                                                   child: Text('Bubble Date:',
//                                                       textAlign: TextAlign.left,
//                                                       style: _textthem
//                                                           .headlineLarge!
//                                                           .copyWith(
//                                                         fontFamily: 'Red Hat Display',
//                                                         fontWeight: FontWeight
//                                                             .w400,
//                                                         fontSize: 15,
//                                                       ))),
//                                             ],
//                                           ),
//                                           const SizedBox(
//                                             height: 7,
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               state.DoneChoose1!
//                                                   ? Expanded(
//                                                 flex: 1,
//                                                 child: Container(
//                                                   width: w / 2.7,
//                                                   height: h / 3,
//                                                   // color: Colors.black,
//                                                   margin:EdgeInsets.only(
//                                                       right: h / 100,left: h/23),
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           const SizedBox(
//                                                             width: 10,
//                                                           ),
//                                                           SizedBox(
//                                                             height: h / 13,
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceAround,
//                                                               children: [
//                                                                 Image.asset(
//                                                                     "Assets/images/Group 229.png"),
//                                                                 Image.asset(
//                                                                     "Assets/images/Group 229.png"),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Text(
//                                                               ' $STartTimeString\n'
//                                                                   '  To \n'
//                                                                   ' $EndTimeString',
//                                                               textAlign:
//                                                               TextAlign.left,
//                                                               style: _textthem
//                                                                   .headline5),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )
//                                                   : Container(
//                                                   width: w / 2.7,
//                                                   height: h / 3,
//                                                   margin:EdgeInsets.only(
//                                                       right: h / 100,left: h/50),
//                                                   child: Column(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                       children: [
//                                                         Container(
//                                                           width: w / 3,
//                                                           height: h / 20,
//                                                           margin: EdgeInsets
//                                                               .only(
//                                                               left: h / 20),
//                                                           decoration:
//                                                           const BoxDecoration(
//                                                             borderRadius:
//                                                             BorderRadius.only(
//                                                               topLeft:
//                                                               Radius.circular(
//                                                                   5),
//                                                               topRight:
//                                                               Radius.circular(
//                                                                   5),
//                                                               bottomLeft:
//                                                               Radius.circular(
//                                                                   5),
//                                                               bottomRight:
//                                                               Radius.circular(
//                                                                   5),
//                                                             ),
//                                                             color: Color
//                                                                 .fromRGBO(
//                                                                 168, 48, 99, 1),
//                                                           ),
//                                                           child: InkWell(
//                                                             onTap: () {
//                                                               showBottom();
//                                                           //  showBottom();
//                                                             },
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'Schedule',
//                                                                 textAlign: TextAlign
//                                                                     .center,
//                                                                 style: _textthem
//                                                                     .headline4!
//                                                                     .copyWith(
//                                                                   fontWeight:
//                                                                   FontWeight
//                                                                       .w300,
//                                                                   color:
//                                                                   Colors.white,
//                                                                   fontSize: 15,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ])),
///

///
//                                     Container(
//                                       margin: EdgeInsets.only(bottom: h / 4),
//                                       child: Column(
//                                         children: [
//                                           Container(
//                                             margin: EdgeInsets.only(
//                                                 right: h / 7, bottom: h / 40),
//                                             width: w / 2,
//                                             height: h / 50,
//                                             child: Text('Add Organisers',
//                                                 textAlign: TextAlign.left,
//                                                 style: _textthem.headlineLarge!
//                                                     .copyWith(
//                                                     fontSize: 15,
//                                                     letterSpacing: 0.2,
//                                                     fontWeight: FontWeight.w400,
//                                                     height: 1)),
//                                           ),
//                                           Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                             children: [
//                                               SizedBox(width: h/20,),
//                                                 Container(
//                                                   width: w / 4,
//                                                   child: CircleAvatar(
//                                                     backgroundColor:
//                                                     const Color(0xffCF6D38),
//                                                     child: IconButton(
//                                                         icon: SvgPicture.asset(
//                                                           "Assets/images/Vector(4).svg",
//                                                           width: h / 38,
//                                                         ),
//                                                         onPressed: () {
//                                                         //  FreindDilog();
//                                                           _CreateBubbleBloc.add(GetFreinds());
//                                                           print("clicked");
//                                                           FreindDilog();
//                                                           DiditONCE = true;
//                                                         }),
//                                                   ),
//
//                                               ),
//                                              state.ChangeDone33!?
//                                              Expanded(
//                                                child: Container(
//                                              //   color: Colors.black,
//                                                  width: w/1.5,height: h/15,
//                                                  child: ListView.builder(
//                                                      itemCount: AvatarsSelected.length,
//                                                    scrollDirection: Axis.horizontal,
//                                                    itemBuilder: (BuildContext context, int index) {
//                                                      String Value = BackGroundColorTOAvatars[index];
//                                                      var myInt = int.parse(Value);
//                                                      var BackgroundColor= myInt;
//                                                        return    Align(
//                                                          widthFactor: 0.75,
//                                                          alignment: Alignment.topCenter,
//                                                          child:
//                                                          Container(
//                                                          child: Column(
//                                                            children: [
//                                                              Wrap(
//                                                                children: [
//                                                                  CircleAvatar(
//                                                                      backgroundColor: Color(BackgroundColor),
//                                                                      backgroundImage: NetworkImage(AvatarsSelected[index]),
//                                                                    )
//                                                               ],
//
//                                                              ),
//                                                            ],
//
//                                                          ),
//                                                          )
//                                                        );
//                                                    },
//                                                  ),
//                                                ),
//                                              ):Text(""),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Container(
//                                 margin: EdgeInsets.only(bottom: h / 50),
//                                 width: w / 2,
//                                 height: h / 17,
//                                 decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(7),
//                                     topRight: Radius.circular(7),
//                                     bottomLeft: Radius.circular(7),
//                                     bottomRight: Radius.circular(7),
//                                   ),
//                                   color: state.DoneChoose1! &&
//                                       state.DoneChoose2!
//                                       ? const Color.fromRGBO(168, 48, 99, 1)
//                                       : const Color(0xff606060),
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     print(STartTime);
//                                     print(EndTime);
//                                     print(ListOfSingleDates); //this is a list
//                                     print(OrganizersId); //this is a list
//                                     if (state.DoneChoose1! && state.DoneChoose2! && ListOfSingleDates.isNotEmpty && STartTime != "" && EndTime != "") {
//                                       widget.Dataa!.Dates = ListOfSingleDatesString;
//                                       widget.Dataa!.Start_Date = STartTimeString;
//                                       widget.Dataa!.End_Date = EndTimeString;
//                                       widget.Dataa!.OrganizersId = OrganizersId;
//                                       WidgetsBinding.instance!
//                                           .addPostFrameCallback((_) =>
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (
//                                                   context) =>  Information(Dataa: widget.Dataa, Context: widget.Context,),
//                                             ),
//                                           ));
//                                     }
//                                   },
//                                   child:  Center(
//                                   child: Text(
//                                     'Next',
//                                     textAlign: TextAlign.center,
//                                     style: _textthem.headline1,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ))));
//         });
//   }
//
//   void showBottom() {
//     showMaterialModalBottomSheet(
//       context: context,
//       builder: (context) {
//         TextTheme _textthem = Theme
//             .of(context)
//             .textTheme;
//         ColorScheme COLOR = Theme
//             .of(context)
//             .colorScheme;
//         var w = MediaQuery
//             .of(context)
//             .size
//             .width;
//         var h = MediaQuery
//             .of(context)
//             .size
//             .height;
//         return FractionallySizedBox(
//             heightFactor: h / 950,
//             child:Column(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: w / 2,
//                       height: h / 20,
//                       margin: EdgeInsets.only(top: h / 50),
//                       child: Row(
//                         children: [
//                           Center(
//                             child: Text('Bubble Duration:',
//                                 textAlign: TextAlign.left,
//                                 style: _textthem.headlineLarge!.copyWith(
//                                     fontFamily: 'Red Hat Display',
//                                     fontSize: 18,
//                                     letterSpacing: 0.4,
//                                     fontWeight: FontWeight.w600,
//                                     height: 1)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Text(""),
//                   ],
//                 ),
//                 const Text(""),
//               ],
//             ),
//             Container(
//               color: const Color(0xff942657),
//               width: w,
//               height: h / 180,
//             ),
//             Expanded(
//               child: Container(
//                   width: double.infinity,
//                   height: h / 1.5,
//                   child: SfDateRangePicker(
//                     monthCellStyle: DateRangePickerMonthCellStyle(
//                       textStyle: _textthem.headline1!.copyWith(
//                           color: COLOR.onSurfaceVariant,
//                           fontSize: 14,
//                           letterSpacing: 0.2199999988079071,
//                           fontWeight: FontWeight.normal,
//                           height: 1.5714285714285714),
//                       disabledDatesTextStyle: _textthem.headline1!
//                           .copyWith(
//                           color: const Color.fromRGBO(96, 96, 96, 1),//todo : fix the disabled dates on the light theme.
//                           fontSize: 14,
//                           letterSpacing: 0.2199999988079071,
//                           fontWeight: FontWeight.normal,
//                           height: 1.5714285714285714),
//                     ),
//                     minDate: DateTime.now(),
//                     controller: _pickerController,
//                     showNavigationArrow: true,
//                     toggleDaySelection: true,
//                     rangeSelectionColor: const Color(0xffCF6D38),
//                     endRangeSelectionColor: const Color(0xffA83063),
//                     startRangeSelectionColor: const Color(0xffA83063),
//                     view: DateRangePickerView.month,
//                     selectionMode: DateRangePickerSelectionMode.range,
//                   )),
//             ),
//             InkWell(
//               onTap: () {
//                 try {
//
//
//
//                 DateTime Start = _pickerController.selectedRange!.startDate!;
//                 DateTime Ends = _pickerController.selectedRange!.endDate!;
//                 STartTime = Start;
//                 EndTime = Ends;
//                 STartTimeString = DateFormat.yMMMMd('en_US').format(Start);
//                 EndTimeString = DateFormat.yMMMMd('en_US').format(Ends);
//                 print(STartTime);
//                 print(EndTime);
//
//                    ////I/flutter (29748): 2022-06-14 00:00:00.000
//                   // // I/flutter (29748): 2022-06-30 00:00:00.000
//
//                   print(_pickerController.selectedRange!.startDate);
//                   print(_pickerController.selectedRange!.endDate);
//                   start = _pickerController.selectedRange!.startDate!;
//                   End = _pickerController.selectedRange!.endDate!;
//                   if (STartTime == "" || EndTime == "") {
//                     Navigator.pop(context);
//                   } else if (STartTime != "" && EndTime != "") {
//                     _CreateBubbleBloc.add(
//                         ChangeDone1((b) => b..DoneColor1 = true));
//                     Navigator.pop(context);
//                   }
//                 }catch(e){
//                   print(e);
//                 }
//               },
//               child: Container(
//                 width: w / 2,
//                 height: h / 16,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(7),
//                     topRight: Radius.circular(7),
//                     bottomLeft: Radius.circular(7),
//                     bottomRight: Radius.circular(7),
//                   ),
//                   color: Color.fromRGBO(148, 38, 87, 1),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Confirm',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//             ));
//       }
//     );
//   }
//
//   Future<void> dIALOG1() {
//     TextTheme _textthem = Theme
//         .of(context)
//         .textTheme;
//     ColorScheme COLOR = Theme
//         .of(context)
//         .colorScheme;
//     var w = MediaQuery
//         .of(context)
//         .size
//         .width;
//     var h = MediaQuery
//         .of(context)
//         .size
//         .height;
//     return   showMaterialModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return FractionallySizedBox(
//               heightFactor: h / 950,
//               child: Container(
//                 child: Column(
//                   children:[
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               width: w / 2,
//                               height: h / 20,
//                               margin: EdgeInsets.only(top: h / 50),
//                               child: Row(
//                                 children: [
//                                   Center(
//                                     child: Text('Event Dates:',
//                                         textAlign: TextAlign.left,
//                                         style: _textthem.headlineLarge!
//                                             .copyWith(
//                                             fontFamily: 'Red Hat Display',
//                                             fontSize: 18,
//                                             letterSpacing: 0.4,
//                                             fontWeight: FontWeight.w600,
//                                             height: 1)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const Text(""),
//                           ],
//                         ),
//                         const Text(""),
//                       ],
//                     ),
//                     Container(
//                       color: const Color(0xff942657),
//                       width: w,
//                       height: h / 180,
//                     ),
//                     Expanded(
//                       child: Container(
//                         width: double.infinity,
//                         height: h / 1.5,
//                         child: SfDateRangePicker(
//                             minDate: start,
//                             maxDate: End,
//                           monthCellStyle: DateRangePickerMonthCellStyle(
//                             textStyle: _textthem.headline1!.copyWith(
//                                 color: COLOR.onSurfaceVariant,
//                                 fontSize: 14,
//                                 letterSpacing: 0.2199999988079071,
//                                 fontWeight: FontWeight.normal,
//                                 height: 1.5714285714285714),
//                             disabledDatesTextStyle: _textthem.headline1!
//                                 .copyWith(
//                                 color: const Color.fromRGBO(96, 96, 96, 1),
//                                 fontSize: 14,
//                                 letterSpacing: 0.2199999988079071,
//                                 fontWeight: FontWeight.normal,
//                                 height: 1.5714285714285714),
//                           ),
//                           showNavigationArrow: true,
//                           toggleDaySelection: true,
//                           selectionColor: const Color(0xffCF6D38),
//                           view: DateRangePickerView.month,
//                           selectionMode: DateRangePickerSelectionMode.multiple,
//                           onSelectionChanged: _onSelectionChanged1,
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () async {
//                         await FormateDate();
//                         Navigator.pop(context);
//                         if (ListOfSingleDates.isNotEmpty) {
//                           _CreateBubbleBloc.add(
//                               ChangeDone2((b) => b..DoneColor2 = true));
//                           print("Done");
//                           print(ListOfSingleDates);
//                         }
//                         print("Done");
//                       },
//                       child: Container(
//                         width: w / 2,
//                         height: h / 16,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(7),
//                             topRight: Radius.circular(7),
//                             bottomLeft: Radius.circular(7),
//                             bottomRight: Radius.circular(7),
//                           ),
//                           color: Color.fromRGBO(148, 38, 87, 1),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             'Confirm',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Color.fromRGBO(255, 255, 255, 1),
//                                 fontFamily: 'Gill Sans Nova',
//                                 fontSize: 18,
//                                 letterSpacing:
//                                 0 ,
//                                 fontWeight: FontWeight.normal,
//                                 height: 1),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
//
//   Future<void> FreindDilog() {
//     TextTheme _textthem = Theme
//         .of(context)
//         .textTheme;
//     ColorScheme COLOR = Theme
//         .of(context)
//         .colorScheme;
//     var w = MediaQuery
//         .of(context)
//         .size
//         .width;
//     var h = MediaQuery
//         .of(context)
//         .size
//         .height;
//     return showModalBottomSheet<void>(
//         isScrollControlled: true,
//         isDismissible: true,
//         context: context,
//         shape: const RoundedRectangleBorder(
//           // <-- SEE HERE
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(10.0),
//           ),
//         ),
//         builder: (BuildContext context) {
//
//           return  StatefulBuilder(
//               builder:(BuildContext context,
//                   void Function(void Function()) SetState){
//                 return BlocBuilder(
//                     bloc: _CreateBubbleBloc,
//                     builder: (BuildContext Context, HomeState state) {
//
//
//                       return
//                         Padding(
//                           padding: EdgeInsets.only(
//                           bottom: MediaQuery
//                               .of(context)
//                           .viewInsets
//                           .bottom),
//                         child :
//                         FractionallySizedBox(
//                           heightFactor: h / 1100,
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 Container(
//                                     margin: EdgeInsets.only(top: h / 20),
//                                     decoration: const BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(15),
//                                         bottomRight: Radius.circular(15),
//                                         topLeft: Radius.circular(15),
//                                         topRight: Radius.circular(15),
//                                       ),
//                                     ),
//                                     width: w / 1.1,
//                                     height: h / 15,
//                                     child: Form(
//                                       key: _formkey1,
//                                       child: TextFormField(
//                                         textInputAction: TextInputAction.search,
//                                         controller: _SearchController,
//                                         focusNode: FocuseNODE,
//                                         cursorColor: Colors.grey,
//                                         cursorHeight: 20,
//                                         onChanged: (Keyword){
//                                           _CreateBubbleBloc.add(SearchFreinds((b) => b
//                                           ..Keyword = Keyword
//                                           ));
//                                         },
//                                         decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(30.0),
//                                               borderSide: const BorderSide(
//                                                   color: Color(0xff939393),
//                                                   width: 10),
//                                             ),
//                                             focusedBorder: const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(30.0)),
//                                               borderSide: BorderSide(
//                                                   color: Color(0xff939393), width: 2),
//                                             ),
//                                             enabledBorder: const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(30.0)),
//                                               borderSide: BorderSide(
//                                                   color: Color(0xff939393), width: 2),
//                                             ),
//                                             prefixIcon: IconButton(
//                                                 icon: SvgPicture.asset(
//                                                   'Assets/images/Vector(1).svg',
//                                                   width: w / 20,
//                                                 ),
//                                                 onPressed: null //do something,
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.transparent,
//                                             contentPadding:
//                                             const EdgeInsets.symmetric(
//                                                 horizontal: 12, vertical: 20),
//                                             hintText: "Search User",
//                                             hintStyle: _textthem.headline6!
//                                                 .copyWith(fontSize: 15)),
//                                         keyboardType: TextInputType.text,
//                                       ),
//                                     )),
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                       top: h / 30, right: h / 5, bottom: h / 30),
//                                   child: Text(
//                                     'Friend list',
//                                     textAlign: TextAlign.left,
//                                     style: _textthem.headlineLarge!.copyWith(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 22,
//                                         letterSpacing: .5),
//                                   ),
//                                 ),
//
//                                 state.success!
//                                     ? state.FilteredFriendlist!.length != 0
//                                     ? Expanded(
//                                   child: Container(
//                                     height: h / 1.49,
//                                     margin: EdgeInsets.only(
//                                       right: h / 20,
//                                     ),
//                                     child: ScrollConfiguration(
//                                       behavior: MyBehavior(),
//                                       child: ListView.separated(
//                                         shrinkWrap: true,
//                                         padding: EdgeInsets.zero,
//                                         physics:
//                                         const BouncingScrollPhysics(),
//                                         scrollDirection: Axis.vertical,
//                                         itemCount: state
//                                             .FilteredFriendlist!.length,
//                                         separatorBuilder:
//                                             (BuildContext context,
//                                             int index) {
//                                           return const SizedBox(
//                                             height: 5,
//                                           );
//                                         },
//                                         itemBuilder: (BuildContext context,
//                                             int index) {
//
//                                         //state.FilteredFriendlist![index].backgroundColor!;
//
//                                           return InkWell(
//                                             onTap: () {
//                                               if (Array2[index]==1){
//                                                 SetState(() {
//                                                   Array2[index] = 0;
//                                                 });
//                                                 OrganizersId.remove(state.FilteredFriendlist![index].id);
//                                                 AvatarsSelected.remove(state.FilteredFriendlist![index].Avatar.toString());
//                                                 BackGroundColorTOAvatars.remove(state.FilteredFriendlist![index].backgroundColor.toString());
//                                               }else{
//                                                 SetState(() {
//                                                   Array2[index] = 1;
//                                                 });
//                                                 OrganizersId.add(state.FilteredFriendlist![index].id!);
//                                                 AvatarsSelected.add(state.FilteredFriendlist![index].Avatar.toString());
//                                                 BackGroundColorTOAvatars.add(state.FilteredFriendlist![index].backgroundColor.toString());
//                                               }
//
//                                               print(OrganizersId);
//                                               print(Array2);
//                                             },
//                                             child:  Column(
//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                       left: h / 30),
//                                                   width: w / 1.01,
//                                                   height: h / 10,
//                                                   decoration:
//                                                   BoxDecoration(
//                                                     color: Array2[index]==1?Colors.greenAccent:
//                                                     COLOR.secondaryContainer,
//
//                                                     borderRadius:
//                                                     const BorderRadius
//                                                         .only(
//                                                       bottomLeft:
//                                                       Radius.circular(
//                                                           40),
//                                                       bottomRight:
//                                                       Radius.circular(
//                                                           5),
//                                                       topLeft:
//                                                       Radius.circular(
//                                                           40),
//                                                       topRight:
//                                                       Radius.circular(
//                                                           5),
//                                                     ),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                           color: COLOR
//                                                               .primaryContainer,
//                                                           offset:
//                                                           const Offset(
//                                                               0, 0),
//                                                           blurRadius: 1)
//                                                     ],
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Column(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                         children: [
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                             children: [
//                                                               Text("  "),
//                                                               CircleAvatar(
//                                                                 backgroundColor: Color(state.FilteredFriendlist![index].backgroundColor!),
//                                                                 radius:
//                                                                 28,
//                                                                 backgroundImage: NetworkImage(
//                                                                     state
//                                                                         .FilteredFriendlist!
//                                                                         [
//                                                                     index]
//                                                                         .Avatar
//                                                                         .toString()),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Column(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceAround,
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                         children: [
//                                                           const Text(""),
//                                                           Row(
//                                                             children: [
//                                                               const Text(
//                                                                   "    "),
//                                                               Text(
//                                                                   state
//                                                                       .FilteredFriendlist!
//                                                                   [index].alias
//                                                                       .toString(),
//                                                                   textAlign: TextAlign.left,
//                                                                   style: _textthem.headline3!.copyWith(
//                                                                       fontWeight: FontWeight.w400
//                                                                       ,fontSize: 20
//                                                                   )
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           const Text(""),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                     : Text(
//                                     "You have no Freinds with that name ")
//                                     : state.isLoading!
//                                     ? Expanded(
//                                     flex: 1,
//                                     child: Container(
//                                         width: w,
//                                         height: h / 3,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                           children: [
//                                             Center(
//                                                 child: listLoader(
//                                                     context: context)),
//                                           ],
//                                         )))
//                                     : Column(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.center,
//                                   children: [
//                                     Center(
//                                       child: Container(
//                                         width: w,
//                                         height: h / 10,
//                                         child: const Text("Error"),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ))  );
//                     });
//
//               });
//
//
//
//
//
//         }).whenComplete(() {
//           setState(() {
//           });
//        //   _CreateBubbleBloc.add(SearchFreinds((b) => b..Keyword=""));
//           _CreateBubbleBloc.add(ChangeDone3((b) => b..ChangeDone33 = true));
//     }
//
//     );
//   }
//
//   Widget listLoader({context}) {
//     return const SpinKitThreeBounce(
//       color: Colors.blue,
//       size: 30.0,
//     );
//   }
//
//   void _onSelectionChanged1(DateRangePickerSelectionChangedArgs args) {
//     try{
//     LISTdate = args.value;
//     print(LISTdate);
//     print("im here");
//     print(LISTdate!.length);
//     print(args);
//     print(LISTdate);
//   }catch(e){
//   print(e);
//   }
//   }
//
//   // void _onSelectionChanged2(DateRangePickerSelectionChangedArgs args) {
//   //   try {
//   //     String value1 = args.value.toString();
//   //     String? Start;
//   //     String? End2;
//   //     DateTime Time1;
//   //     DateTime Time2;
//   //     print("im here");
//   //     print(value1.length);
//   //     print(value1);
//   //     print(value1);
//   //     print(value1);
//   //     print(value1);
//   //     if (value1.length != 91) {
//   //       Start = value1.substring(33, 43);
//   //       Time1 = DateTime.parse(Start);
//   //       STartTime = DateFormat.yMMMMd('en_US').format(Time1);
//   //       print(STartTime);
//   //     } else {
//   //       End2 = value1.substring(67, 77);
//   //       Start = value1.substring(33, 43);
//   //       Time1 = DateTime.parse(Start);
//   //       Time2 = DateTime.parse(End2);
//   //       STartTime = DateFormat.yMMMMd('en_US').format(Time1);
//   //       EndTime = DateFormat.yMMMMd('en_US').format(Time2);
//   //       print(STartTime);
//   //       print(EndTime);
//   //     }
//   //   }catch(e){
//   //     print(e);
//   //   }
//   // }
//
//
//   Future<void> FormateDate() async {
//     for (int i = 0; i < LISTdate!.length; i++) {
//       SingleDate = DateTime.parse(LISTdate![i].toString());
//       time = DateFormat.yMMMMd('en_US').format(SingleDate!);
//       ListOfSingleDatesString.add(time.toString());
//       print(ListOfSingleDatesString);
//
//
//       String man = LISTdate![i].toString().substring(0,10);
//       SingleDate = DateTime.parse(man);
//
//
//
//     ListOfSingleDates.add(SingleDate!);
//       print(ListOfSingleDates);
//     }
//   }
//
// // static List getSuggestions(String query) =>
// //     List.of().where((user) {
// //       final userLower = user.name.toLowerCase();
// //       final queryLower = query.toLowerCase();
// //
// //       return userLower.contains(queryLower);
// //     }).toList();
// }
