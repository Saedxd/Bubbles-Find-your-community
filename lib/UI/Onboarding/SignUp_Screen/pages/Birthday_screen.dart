
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_bloc.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_event.dart';
import 'package:bubbles/UI/Onboarding/SignUp_Screen/bloc/SignUp_state.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:bubbles/core/theme/ResponsiveText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'Gender_screen.dart';
import 'UserData.dart';

class BirthDay extends StatefulWidget {
  UsersData? Users;
  BirthDay({this.Users});


  @override
  State<BirthDay> createState() => _BirthDayState();
}

class _BirthDayState extends State<BirthDay> {
  DateTime selectedDate = DateTime.now();
  DateTime? newDateTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateRangePickerController _pickerController = DateRangePickerController();
  String BirthDay="";
bool selected = false;
  final _SignUpBloc = sl<SignUpBloc>();
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder(
        bloc: _SignUpBloc,
        builder: (BuildContext context, SignUpState state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            backgroundColor: AppColor,
            body: SafeArea(
              child:
              Container(
                width: w,
                height: h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w / 1.2,
                        margin: EdgeInsets.only(top: h / 40),
                        child: InkWell(
                          onTap: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) =>
                                Navigator.of(context).pop()
                            );
                          },
                          child: Text('< Back',
                              textAlign: TextAlign.left,
                              style: _TextTheme.headline1!.copyWith(
                                  fontSize: 20.sp,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w300,
                                  height: 1
                              )),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: h / 30, top: h / 26),
                            child: Text(
                                'When is your Birthday?', textAlign: TextAlign.left,
                                style: _TextTheme.headlineLarge!.copyWith(
                                    letterSpacing: 1,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                )),
                          ),

                          Container(
                            width: w / 1.32,
                            height: h / 2.4,
                            margin: EdgeInsets.only(bottom: h / 50),
                            decoration: BoxDecoration(
                              color: Color(0xff303030),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular( 5.r),
                                topRight:Radius.circular( 5.r),
                                bottomLeft: Radius.circular( 5.r),
                                bottomRight:Radius.circular( 5.r),
                              ),
                            ),
                            child: SfDateRangePicker(
                              todayHighlightColor: Colors.white,
                              minDate: DateTime(1940),
                              maxDate: DateTime.now().subtract(
                                  Duration(days: 6570)),

                              monthCellStyle: DateRangePickerMonthCellStyle(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15.sp,
                                    letterSpacing: 0.1899598389863968,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5714285376177157
                                ),
                                disabledDatesTextStyle: TextStyle(

                                    color: Color.fromRGBO(120, 120, 133, 1),
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15.sp,
                                    letterSpacing: 0.1899598389863968,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5714285376177157
                                ),
                                // leadingDatesTextStyle: TextStyle(
                                //     color: Colors.red,
                                //     fontFamily: 'IBM Plex Sans',
                                //     fontSize: 14.088353157043457,
                                //     letterSpacing: 0.1899598389863968,
                                //     fontWeight: FontWeight.normal,
                                //     height: 1.5714285376177157
                                // ),
                                rangeTextStyle: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15.sp,
                                    letterSpacing: 0.1899598389863968,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5714285376177157
                                ),
                                trailingDatesTextStyle:
                                TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15.sp,
                                    letterSpacing: 0.1899598389863968,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5714285376177157
                                ),
                              ),
                              controller: _pickerController,
                              showNavigationArrow: true,
                              toggleDaySelection: false,
                              selectionColor: Color(0xffCF6D38),
                              selectionRadius: 25.r,
                              onSelectionChanged: _onSelectionChanged2,
                              view: DateRangePickerView.month,
                              selectionMode: DateRangePickerSelectionMode.single,
                            ),

                          ),
                        ],
                      ),

                      Container(
                        width: w / 1.32,
                        height: h / 13.9,
                        margin: EdgeInsets.only(top: h / 100, bottom: h / 8),

                        child: InkWell(
                          onTap: () {

                            if (BirthDay != "") {
                              widget.Users!.SetBirthDate(BirthDay.toString());
                              WidgetsBinding.instance.addPostFrameCallback((
                                  _) =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        Gender_Screen(
                                          Users: widget.Users,

                                        )),)
                              );
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.r),
                                  topRight:  Radius.circular(5.r),
                                  bottomLeft:  Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r),
                                ),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.15000000596046448),
                                    offset: Offset(0, 0),
                                    blurRadius: 6
                                )
                                ],
                                color: state.ChangeSelectedd! ?
                                Color.fromRGBO(207, 109, 56, 1)
                                    : Color(0xff939393),
                              ),
                              child:
                              Center(
                                child: Text(
                                  'Next', textAlign: TextAlign.center, style:
                                _TextTheme.headline1!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),),
                              )

                          ),

                        ),
                      ),
                    ]
                ),
              ),
            ),

          );
        }
          );
  }
  void _onSelectionChanged2(DateRangePickerSelectionChangedArgs args) {
    try {

      String TimeSelected = DateFormat.yMMMMd('en_US').format(args.value);
      BirthDay = TimeSelected.toString();
      print(BirthDay);
      _SignUpBloc.add(ChangeSelected((b) =>b..status = true ));
  }catch(e){
      print(e);
    }

  }
}