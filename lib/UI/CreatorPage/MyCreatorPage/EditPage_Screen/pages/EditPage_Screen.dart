import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:address_search_field/address_search_field.dart';
import 'package:bubbles/App/app.dart';
import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditBubble_Screen/bloc/EditBubble_State.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/bloc/EditPage_Bloc.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/bloc/EditPage_Event.dart';
import 'package:bubbles/UI/CreatorPage/MyCreatorPage/EditPage_Screen/bloc/EditPage_State.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

class EditPage_Screen extends StatefulWidget {
  const EditPage_Screen({Key? key}) : super(key: key);

  @override
  State<EditPage_Screen> createState() => _EditPage_ScreenState();
}

class _EditPage_ScreenState extends State<EditPage_Screen> {
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  List<String> PageColors = ["0xffD1B964", "0xff34A853", "0xff77C08A","0xff6FA191","0xff4ECEB6","0xff80BFC5","0xff7B78F5","0xffD96799","0xffE06859","0xffCF6D38","0xffEB9B5D","0xffE0A41E"];
  final _EditPageBloc = sl<EditPageBloc>();
  final List<String> page_Cateogory_List = [  ];
  final List<int> page_Cateogory_List_id = [  ];
  String? selectedValue;
  String base64Image = "";

  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
        bloc: _EditPageBloc,
        builder: (BuildContext Context, EditPageState state){
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: w / 16.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: w / 100),
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                "Assets/images/Frame 11.svg",
                                                width: 30.w,
                                                color: ColorS.surface),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child:
                                    Text('Page Information', textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 22.sp,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w800,
                                          height: 1
                                      ),)
                                    ,
                                  ),
                                ),
                                Text("")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: h/1.27,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                width: w / 1.1,
                                height: h / 2.8,
                                child: Form(
                                  key: _formkey1,
                                  autovalidateMode:
                                  AutovalidateMode
                                      .onUserInteraction,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: w / 1.1,
                                          height: h / 10,
                                          child: TextFormField(
                                            keyboardAppearance:
                                            Brightness.dark,
                                            textInputAction:
                                            TextInputAction.next,
                                            controller: _UsernameController,
                                            cursorHeight: 20,
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
                                                    horizontal: 14, vertical: 10),
                                                // helperText: "HELLO",
                                                hintText: 'Username',
                                                hintStyle: _TextTheme.headline6!.copyWith(
                                                    color: Color(0xffEAEAEA)
                                                        ,fontSize: 14.sp
                                                )),
                                            keyboardType:
                                            TextInputType.text,
                                            // obscureText: SecureInput_pass,
                                          ),
                                        ),
                                        Container(
                                          width: w/1.1,
                                          height: h/3.9,
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
                                                    borderRadius:         BorderRadius
                                                        .circular(5.r),
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
                                                    color: Color(0xffEAEAEA)
                                                    ,fontSize: 14.sp
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

                            Container(
                              width: w/1.2,
                              child: Text('Select page category (1 or 2):', textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(237, 236, 241, 1),
                                  fontFamily: 'Red Hat Text',
                                  fontSize: 18.sp,
                                  letterSpacing: 0.11999999731779099,
                                  fontWeight: FontWeight.w400,
                                  height: 1.7142857142857142
                              ),),
                            ),
                            Container(
                              width: w / 1.15,
                              child :
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        items: page_Cateogory_List
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
                                        items: page_Cateogory_List
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


                            SizedBox(height: h / 70,),
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
                                        itemCount: PageColors.length,
                                        separatorBuilder: (BuildContext context, int index) {
                                          return const SizedBox(width: 5,);
                                        },
                                        itemBuilder: (BuildContext context,
                                            int index) {
                                          return InkWell(
                                            onTap: () {
                                              _EditPageBloc.add(SelectColor((b) =>
                                              b
                                                ..Index = index
                                                ..PickedColor = PageColors[index]));
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
                                                            int.parse(PageColors[index])),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Profile Image:', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(234, 234, 234, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 18,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w400,
                                      height: 1
                                  ),),
                                  Container(
                                    width: w/3,
                                    child: Text('Cover image:', textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(234, 234, 234, 1),
                                        fontFamily: 'Red Hat Text',
                                        fontSize: 18.sp,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w400,
                                        height: 1
                                    ),),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: w/1.2,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: w/4.8,
                                        height: h/9,
                                        child:
                                        Stack(
                                            children: [

                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  color: Colors.black,
                                                  width: w/5.7,
                                                  height: h/12,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 16.w,
                                                  backgroundColor: Colors.white,
                                                  child: Center(
                                                    child: IconButton(
                                                        icon: Icon(
                                                          Icons.edit_outlined,
                                                          size:17.w,
                                                          color: Color(0xffCF6D38),
                                                        ),
                                                        onPressed: ()=>PhotoBottomSheet()
                                                    ),
                                                  ),
                                                ),
                                              ),



                                            ]
                                        )
                                    ),
                                    Container(
                                        width: w/3,
                                        height: h/9,
                                        child:
                                        Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                child:
                                                Container(
                                                  color: Colors.black,
                                                  width: w/3.7,
                                                  height: h/12,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: CircleAvatar(
                                                  radius: 16.w,
                                                  backgroundColor: Colors.white,
                                                  child: Center(
                                                    child: IconButton(
                                                        icon: Icon(
                                                          Icons.edit_outlined,
                                                          size:17.w,
                                                          color: Color(0xffCF6D38),
                                                        ),
                                                        onPressed: ()=>PhotoBottomSheet()
                                                    ),
                                                  ),
                                                ),
                                              ),



                                            ]
                                        )
                                    )

                                  ],
                                )

                            ),
                            SizedBox(height: 10,),
                            Container(
                                width: w/1.2,
                                child:
                                Text('Recommended image sizes: 000x000 for profile image and 0000x000 for cover image.', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(234, 234, 234, 1),
                                    fontFamily: 'Red Hat Text',
                                    fontSize: 12.sp,
                                    letterSpacing: 0.2 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w300,
                                    height: 1
                                ),)
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child:
                              Container(
                                width: w/3,
                                height: h/15,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(7.r),
                                    topRight: Radius.circular(7.r),
                                    bottomLeft: Radius.circular(7.r),
                                    bottomRight: Radius.circular(7.r),
                                  ),
                                  color : Color.fromRGBO(168, 48, 99, 1),
                                ),
                                child: Center(
                                  child:
                                  Text('Save', textAlign: TextAlign.center, style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Red Hat Text',
                                      fontSize: 20.sp,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w600,
                                      height: 1
                                  ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
    }
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
   File Fileee =File(image!.path);
    if (image == null) return;
    final imagePath = File(image.path);
    print(imagePath);
    Convert(imagePath);
    print(imagePath);

  }

  void Convert(File path){
    Uint8List bytes = path.readAsBytesSync();
    base64Image ="data:image/png;base64,${base64Encode(bytes)}";
    print(base64Image);
  //  Base64Images!.add(base64Image);
  //  print(Base64Images);
  }

  Future<void> PhotoBottomSheet() {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    return showModalBottomSheet<void>(
        isDismissible: true,
        context: context,
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
                              fontWeight: FontWeight.w600, fontSize: 30.sp),
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
                              fontWeight: FontWeight.w600, fontSize: 30.sp),
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

}
