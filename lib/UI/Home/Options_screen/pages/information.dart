
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bubbles/Injection.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_Bloc.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_event.dart';
import 'package:bubbles/UI/Home/Options_screen/bloc/Options_state.dart';
import 'package:bubbles/UI/Home/Options_screen/data/data.dart';
import 'package:bubbles/core/Colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:address_search_field/address_search_field.dart';
class Information extends StatefulWidget {
  Data? Dataa;

  Information({Key? key,this.Dataa});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  File? image;
  final _formKey3 = GlobalKey<FormState>();
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  bool Changed2 = false;
  bool Changed3 = false;
  bool Changed = false;
  late FocusNode FoucesNodePass;
  late FocusNode FoucesNodeEmail;
  late FocusNode FoucesNodeConfirm;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _AddPlainController = TextEditingController();
  final TextEditingController _DescriptionController = TextEditingController();
  final TextEditingController _LocationController = TextEditingController();
  late GeoMethods geoMethods;
  late Address destinationAddress;
  final _OptionsBloc = sl<OptionsBloc>();
  var geoMethodss;
  String base64Image="";
  List<String>? Base64Images=[];

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final  imagePath = File(image.path);
    this.image = imagePath;
    Convert(imagePath);
    print(imagePath);
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  alreatDialogBuilder() async {
    return showDialog(
      builder: (BuildContext context) {
        var h = MediaQuery.of(context).size.height;
        var w = MediaQuery.of(context).size.width;
        return Container(
          child: AlertDialog(
            backgroundColor: ChooseAvatarBack,
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }

  @override
  void initState() {
    FoucesNodePass = FocusNode();
    FoucesNodeEmail = FocusNode();
    FoucesNodeConfirm = FocusNode();
    super.initState();
    geoMethods =GeoMethods(
      googleApiKey: Platform.isIOS?'AIzaSyDU_37KrySa8XKoPivA5jKvsuVGG5OVxW8':"AIzaSyB5LMtZr6xsMbx6EJ2US_MHH6eefTsxFDU",
      language: 'en',
    );
    geoMethods.autocompletePlace(query: _LocationController.text);


  }

  @override
  void dispose() {
    super.dispose();
    _AddPlainController.dispose();
    _DescriptionController.dispose();
    _LocationController.dispose();
    FoucesNodeEmail.dispose();
    FoucesNodePass.dispose();
    FoucesNodeConfirm.dispose();
  }
bool Diditonce = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return  BlocBuilder(
        bloc: _OptionsBloc,
        builder: (BuildContext Context, OptionsState state)
    {

      if (state.CreateBUbbleSuccess! && Diditonce){
        WidgetsBinding.instance!
            .addPostFrameCallback((_) {
              Navigator.pop(context);
              Navigator.pop(context);
              Page2().method(
                  _scaffoldKey
                      .currentContext!,
                  "Bubble Message",
                  """Your Bubble was successfully Made""",
                  "Back");
        }
        );
        Diditonce = true;
      }
      return
      SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorS.onInverseSurface,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox(
                  height: h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text('Information', textAlign: TextAlign.left,
                              style: _TextTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23
                              ),),
                            Text(""),
                            Text(""),

                          ],
                        ),
                      ),
                      SizedBox(
                          width: w / 1.1,
                          height: h / 1.7,
                          child: Form(
                            key: _formKey3,
                            autovalidateMode:
                            AutovalidateMode
                                .onUserInteraction,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: w / 1.25,
                                    height: h / 10,
                                    child: TextFormField(
                                      keyboardAppearance:
                                      Brightness.dark,
                                      textInputAction:
                                      TextInputAction.next,
                                      controller: _AddPlainController,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight:
                                          FontWeight.w500,
                                          color: Colors.red),
                                      onFieldSubmitted: (value) {},
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText:
                                            "Required"),
                                      ]),

                                      cursorColor: Colors.black,
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
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          enabledBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          focusedBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          filled: true,
                                          fillColor: ColorS.primaryContainer,
                                          contentPadding:
                                          EdgeInsets.symmetric(
                                            horizontal: 12,),
                                          hintText: 'Add Plan Title',
                                          hintStyle: _TextTheme.headline6),
                                      keyboardType:
                                      TextInputType.text,
                                      // obscureText: SecureInput_pass,
                                    ),
                                  ),
                                  Container(
                                    width: w / 1.25,
                                    child: TextFormField(
                                      keyboardAppearance:
                                      Brightness.dark,
                                      textInputAction:
                                      TextInputAction.next,
                                      controller:
                                      _DescriptionController,
                                      maxLines: 7,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight:
                                          FontWeight.w500,
                                          color: Colors.red),
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
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          enabledBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          focusedBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          filled: true,
                                          fillColor: ColorS.primaryContainer,
                                          hintText: "Description",
                                          hintStyle: _TextTheme.headline6),
                                      keyboardType:
                                      TextInputType.text,
                                      // obscureText: SecureInput_pass,
                                    ),
                                  ),
                                  Container(
                                    width: w / 1.25,
                                    height: h / 10,
                                    child: TextFormField(
                                      keyboardAppearance:
                                      Brightness.dark,
                                      textInputAction:
                                      TextInputAction.done,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight:
                                          FontWeight.w500,
                                          color: Colors.red),
                                      controller:
                                      _LocationController,
                                      onTap: () =>
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AddressSearchDialog(
                                                  style: AddressDialogStyle(
                                                      color: Color(0xffCF6D38),
                                                      backgroundColor: Color(
                                                          0xff942657)
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
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          enabledBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          focusedBorder:
                                          UnderlineInputBorder(
                                            borderSide:
                                            const BorderSide(
                                                color: Colors
                                                    .transparent),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5),
                                          ),
                                          filled: true,
                                          fillColor: ColorS.primaryContainer,
                                          contentPadding:
                                          EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: Changed3
                                                  ? _formKey3.currentState!
                                                  .validate()
                                                  ? h / 100
                                                  : h / 70
                                                  : h / 100),
                                          hintText: 'Location Name',
                                          hintStyle: _TextTheme.headline6),
                                      keyboardType:
                                      TextInputType.text,
                                      // obscureText: SecureInput_pass,
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      SizedBox(
                                        //  color: Colors.black,
                                        width: w / 2.3,
                                        height: h / 10,
                                        child: Column(children: [
                                          Text(
                                              '  Add Images',
                                              style: _TextTheme.headline3),
                                          const SizedBox(height: 5,),
                                          InkWell(
                                            onTap: () {
                                              pickImage();
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
                                      ),
                                      SizedBox(
                                        //    color: Colors.black,
                                        width: w / 2.3,
                                        height: h / 10,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Text(
                                                'Choose Bubble Color',
                                                style: _TextTheme.headline3),
                                            const SizedBox(height: 5,),
                                            SizedBox(
                                              width: w / 7,
                                              height: h / 15,
                                              child: InkWell(
                                                onTap: () {
                                                  alreatDialogBuilder();
                                                  print(pickerColor);
                                                },
                                                child: SvgPicture.asset(
                                                  "Assets/images/Exclude.svg",
                                                  color: pickerColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),


                                    ],
                                  ),
                                ]),
                          )),
                      const Text(""),
                      InkWell(
                        onTap: () {
                          print(pickerColor);
                          if (_formKey3.currentState!.validate()) {
                            if (base64Image != "") {
                              Diditonce = true;
                              print(pickerColor);
                              print(pickerColor
                                  .toString()
                                  .length);
                              String ColorS = "";
                              pickerColor
                                  .toString()
                                  .length == 47
                                  ? ColorS = pickerColor.toString().substring(35,
                                  45)
                                  : pickerColor
                                  .toString()
                                  .length == 17
                                  ? ColorS = pickerColor.toString().substring(6, 16)
                                  : ColorS =
                                  pickerColor.toString().substring(33, 43);
                              //TODO : CHECK THIS ON RELEASE MODE ON FLUTTER LOGS on terminal.

                              print(ColorS);
                              print(Base64Images);
                              print(widget.Dataa!.OrganizersId);
                              print(widget.Dataa!.End_Date);
                              print(widget.Dataa!.Start_Date);
                              print(widget.Dataa!.Dates);
                              print(widget.Dataa!.raduis);
                              print(widget.Dataa!.lat);
                              print(widget.Dataa!.lng);
                              print(_LocationController.text);
                              print(_AddPlainController.text);
                              print(_DescriptionController.text);

                              _OptionsBloc.add(CreateBubble((b) => b
                                ..Base64Images=Base64Images
                                ..lng=widget.Dataa!.lng
                                ..lat=widget.Dataa!.lat
                                ..raduis = widget.Dataa!.raduis
                                ..Start_Date =widget.Dataa!.Start_Date
                                ..End_Date=widget.Dataa!.End_Date
                                ..OrganizersId=widget.Dataa!.OrganizersId
                                ..Dates=widget.Dataa!.Dates
                                ..ColorS = ColorS
                                ..Title = _AddPlainController.text
                                ..Description =_DescriptionController.text
                                ..LOcation =_LocationController.text




                              ));
                            } else {
                              Page2().method(
                                  _scaffoldKey
                                      .currentContext!,
                                  "Bubble Message",
                                  """You should provide an image of that place""",
                                  "Back");
                            }
                          }
                        },
                        child: Container(
                          width: w / 2.7,
                          height: h / 14.5,
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
                              'Next', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'ABeeZee',
                                fontSize: 18,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            ),),
                          ),
                        ),
                      ),
                      const Text(""),
                      const Text(""),
                    ],
                  ),
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
  }

  Widget listLoader({context}) {
    return const SpinKitThreeBounce(
      color: Colors.blue,
      size: 30.0,
    );
  }

}
