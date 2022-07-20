import 'dart:io';

import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';
import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'information.dart';

class Options_screen extends StatefulWidget {
  Data? Dataa;

   Options_screen({Key? key,this.Dataa})
      : super(key: key);

  @override
  State<Options_screen> createState() => _Options_screenState();
}

class _Options_screenState extends State<Options_screen> {
  final TextEditingController _SearchController = TextEditingController();
  final _formkey1 = GlobalKey<FormState>();
  final _OptionsBloc = sl<OptionsBloc>();
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

  @override
  void dispose() {
    super.dispose();
    _SearchController.dispose();
    _pickerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    FocuseNODE = FocusNode();
    Array2 = List.filled(5000, 0);
  }


  @override
  Widget build(BuildContext context) {
    TextTheme _textthem = Theme.of(context).textTheme;
    ColorScheme COLOR = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocBuilder(
        bloc: _OptionsBloc,
        builder: (BuildContext Context, OptionsState state) {
          return WillPopScope(
              onWillPop: () async {
                print(ListOfSingleDates);
                    if (OrganizersId.isNotEmpty){
                      _OptionsBloc.add(ChangeDone3((b) => b..ChangeDone33 = false));
                      print("HIM HEREEE");
                      OrganizersId.clear();
                      AvatarsSelected.clear();
                      BackGroundColorTOAvatars.clear();
                      Array2 = List.filled(
                          5000,
                          0);

                      print(state.ChangeDone33);
                      return false;
                    }

                if (ListOfSingleDates.isNotEmpty && OrganizersId.isEmpty) {
                  ListOfSingleDates.clear();
                  _OptionsBloc.add(ChangeDone2((b) => b..DoneColor2 = false));

                  print("im here");

                  return false;
                }
                if (state.DoneChoose1!&& OrganizersId.isEmpty && ListOfSingleDates.isEmpty) {
                  STartTimeString = "";
                  EndTimeString = "";
                  _OptionsBloc.add(ChangeDone1((b) => b..DoneColor1 = false));
                  return false;
                }
                print(state.DoneChoose1!);
                print(state.DoneChoose2!);
                return true;
              },
              child: Scaffold(
                  body: SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: h / 4.7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: h/100),
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
                                                          color: COLOR.surface),
                                                      onPressed:(){
                                                        if (OrganizersId.isEmpty) {
                                                          if (ListOfSingleDates
                                                              .isEmpty &&
                                                              state
                                                                  .DoneChoose1!) {
                                                            STartTimeString =
                                                            "";
                                                            EndTimeString = "";
                                                            _OptionsBloc
                                                                .add(
                                                                ChangeDone1((
                                                                    b) => b..DoneColor1 = false));
                                                          }
                                                          ListOfSingleDates
                                                              .clear();
                                                          _OptionsBloc
                                                              .add(
                                                              ChangeDone2((
                                                                  b) => b..DoneColor2 = false));
                                                          print(
                                                              "im here");

                                                          if (ListOfSingleDates
                                                              .isEmpty) {
                                                            if (!state
                                                                .DoneChoose1!) {
                                                              Navigator
                                                                  .pop(
                                                                  context);
                                                            }
                                                          }
                                                        }
                                                          print(state.DoneChoose1);
                                                          if (OrganizersId.isNotEmpty){
                                                            _OptionsBloc.add(ChangeDone3((b) => b..ChangeDone33 = false));
                                                            print("HIM HEREEE");
                                                            OrganizersId.clear();
                                                            AvatarsSelected.clear();
                                                            BackGroundColorTOAvatars.clear();
                                                            Array2 = List.filled(
                                                                5000,
                                                                0);
                                                            print(state.ChangeDone33);
                                                          }



                                                      },
                                                    )),
                                                Text('Options', textAlign: TextAlign.left, style: _textthem.headlineLarge!.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 23
                                                ),),
                                                Text(""),
                                                Text(""),

                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  width: w / 2.7,
                                                  height: h / 44,
                                                  margin:
                                                  EdgeInsets.only(
                                                      right: h / 100,left: h/23),
                                                  child: Text(
                                                      'Bubble Duration:',
                                                      textAlign: TextAlign.left,
                                                      style: _textthem
                                                          .headlineLarge!
                                                          .copyWith(
                                                        fontFamily: 'Red Hat Display',
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        fontSize: 15,
                                                      ))),
                                              SizedBox(
                                                  width: w / 3.5,
                                                  height: h / 44,
                                                  child: Text('Bubble Date:',
                                                      textAlign: TextAlign.left,
                                                      style: _textthem
                                                          .headlineLarge!
                                                          .copyWith(
                                                        fontFamily: 'Red Hat Display',
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        fontSize: 15,
                                                      ))),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              state.DoneChoose1!
                                                  ? Expanded(
                                                flex: 1,
                                                child: Container(
                                                  width: w / 2.7,
                                                  height: h / 3,
                                                  // color: Colors.black,
                                                  margin:EdgeInsets.only(
                                                      right: h / 100,left: h/23),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            height: h / 13,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                              children: [
                                                                Image.asset(
                                                                    "Assets/images/Group 229.png"),
                                                                Image.asset(
                                                                    "Assets/images/Group 229.png"),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                              ' $STartTimeString\n'
                                                                  '  To \n'
                                                                  ' $EndTimeString',
                                                              textAlign:
                                                              TextAlign.left,
                                                              style: _textthem
                                                                  .headline5),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                                  : Container(
                                                  width: w / 2.7,
                                                  height: h / 3,
                                                  margin:EdgeInsets.only(
                                                      right: h / 100,left: h/50),
                                                  child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: w / 3,
                                                          height: h / 20,
                                                          margin: EdgeInsets
                                                              .only(
                                                              left: h / 20),
                                                          decoration:
                                                          const BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.only(
                                                              topLeft:
                                                              Radius.circular(
                                                                  5),
                                                              topRight:
                                                              Radius.circular(
                                                                  5),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  5),
                                                              bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                            color: Color
                                                                .fromRGBO(
                                                                168, 48, 99, 1),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showBottom();
                                                          //  showBottom();
                                                            },
                                                            child: Center(
                                                              child: Text(
                                                                'Schedule',
                                                                textAlign: TextAlign
                                                                    .center,
                                                                style: _textthem
                                                                    .headline4!
                                                                    .copyWith(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                                  color:
                                                                  Colors.white,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ])),

                                              state.DoneChoose1! &&
                                                  state.DoneChoose2!
                                                  ? Expanded(
                                                flex: 0,
                                                child: Container(
                                                  width: w / 2.7,
                                                  height: h / 3,
                                                  margin: EdgeInsets.only(
                                                      left: h / 40),
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
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                                ListOfSingleDatesString[
                                                                index].toString(),
                                                                textAlign:
                                                                TextAlign
                                                                    .left,
                                                                style: _textthem
                                                                    .headline5),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                        int index) {
                                                      return const SizedBox(
                                                        height: 3,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                                  : Container(
                                                width: w / 2.7,
                                                height: h / 3,
                                                margin:
                                                EdgeInsets.only(left: w / 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: w / 3,
                                                      height: h / 20,
                                                      margin: EdgeInsets.only(
                                                          right: h / 20),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius
                                                            .only(
                                                          topLeft:
                                                          Radius.circular(5),
                                                          topRight:
                                                          Radius.circular(5),
                                                          bottomLeft:
                                                          Radius.circular(5),
                                                          bottomRight:
                                                          Radius.circular(5),
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
                                                          dIALOG1();
                                                          // if (state
                                                          //     .DoneChoose1!) {
                                                          //   ListOfSingleDates
                                                          //       .clear();
                                                          //   dIALOG1();
                                                          // }
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            'Schedule',
                                                            textAlign:
                                                            TextAlign.center,
                                                            style: _textthem
                                                                .headline4!
                                                                .copyWith(
                                                              fontWeight:
                                                              FontWeight.w300,
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 15,
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
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: h / 4),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: h / 7, bottom: h / 40),
                                            width: w / 2,
                                            height: h / 50,
                                            child: Text('Add Organisers',
                                                textAlign: TextAlign.left,
                                                style: _textthem.headlineLarge!
                                                    .copyWith(
                                                    fontSize: 15,
                                                    letterSpacing: 0.2,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: h/20,),
                                                Container(
                                                  width: w / 4,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                    const Color(0xffCF6D38),
                                                    child: IconButton(
                                                        icon: SvgPicture.asset(
                                                          "Assets/images/Vector(4).svg",
                                                          width: h / 38,
                                                        ),
                                                        onPressed: () {
                                                        //  FreindDilog();
                                                          _OptionsBloc.add(GetFreinds());
                                                          print("clicked");
                                                          FreindDilog();
                                                          DiditONCE = true;
                                                        }),
                                                  ),

                                              ),
                                             state.ChangeDone33!?
                                             Expanded(
                                               child: Container(
                                             //   color: Colors.black,
                                                 width: w/1.5,height: h/15,
                                                 child: ListView.builder(
                                                     itemCount: AvatarsSelected.length,
                                                   scrollDirection: Axis.horizontal,
                                                   itemBuilder: (BuildContext context, int index) {
                                                     String Value = BackGroundColorTOAvatars[index];
                                                     var myInt = int.parse(Value);
                                                     var BackgroundColor= myInt;
                                                       return    Align(
                                                         widthFactor: 0.75,
                                                         alignment: Alignment.topCenter,
                                                         child:
                                                         Container(
                                                         child: Column(
                                                           children: [
                                                             Wrap(
                                                               children: [
                                                                 CircleAvatar(
                                                                     backgroundColor: Color(BackgroundColor),
                                                                     backgroundImage: NetworkImage(AvatarsSelected[index]),
                                                                   )
                                                              ],

                                                             ),
                                                           ],

                                                         ),
                                                         )
                                                       );
                                                   },
                                                 ),
                                               ),
                                             ):Text(""),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: h / 50),
                                width: w / 2,
                                height: h / 17,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7),
                                  ),
                                  color: state.DoneChoose1! &&
                                      state.DoneChoose2!
                                      ? const Color.fromRGBO(168, 48, 99, 1)
                                      : const Color(0xff606060),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    print(STartTime);
                                    print(EndTime);
                                    print(ListOfSingleDates); //this is a list
                                    print(OrganizersId); //this is a list
                                    if (state.DoneChoose1! && state.DoneChoose2! && ListOfSingleDates.isNotEmpty && STartTime != "" && EndTime != "") {
                                      widget.Dataa!.Dates = ListOfSingleDatesString;
                                      widget.Dataa!.Start_Date = STartTimeString;
                                      widget.Dataa!.End_Date = EndTimeString;
                                      widget.Dataa!.OrganizersId = OrganizersId;
                                      WidgetsBinding.instance!
                                          .addPostFrameCallback((_) =>
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (
                                                  context) =>  Information(Dataa: widget.Dataa,),
                                            ),
                                          ));
                                    }
                                  },
                                  child:  Center(
                                  child: Text(
                                    'Next',
                                    textAlign: TextAlign.center,
                                    style: _textthem.headline1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))));
        });
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
                STartTimeString = DateFormat.yMMMMd('en_US').format(Start);
                EndTimeString = DateFormat.yMMMMd('en_US').format(Ends);
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
                    _OptionsBloc.add(
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
        builder: (context) {
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
                            minDate: start,
                            maxDate: End,
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: _textthem.headline1!.copyWith(
                                color: COLOR.onSurfaceVariant,
                                fontSize: 14,
                                letterSpacing: 0.2199999988079071,
                                fontWeight: FontWeight.normal,
                                height: 1.5714285714285714),
                            disabledDatesTextStyle: _textthem.headline1!
                                .copyWith(
                                color: const Color.fromRGBO(96, 96, 96, 1),
                                fontSize: 14,
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
                          _OptionsBloc.add(
                              ChangeDone2((b) => b..DoneColor2 = true));
                          print("Done");
                          print(ListOfSingleDates);
                        }
                        print("Done");
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
                        child: const Center(
                          child: Text(
                            'Confirm',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Gill Sans Nova',
                                fontSize: 18,
                                letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ));
        });
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
                    bloc: _OptionsBloc,
                    builder: (BuildContext Context, OptionsState state) {


                      return
                        Padding(
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
                                          _OptionsBloc.add(SearchFreinds((b) => b
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
       //   _OptionsBloc.add(SearchFreinds((b) => b..Keyword=""));
          _OptionsBloc.add(ChangeDone3((b) => b..ChangeDone33 = true));
    }

    );
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
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
