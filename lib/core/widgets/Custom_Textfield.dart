
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:form_field_validator/form_field_validator.dart';


class textfeild extends StatefulWidget {
  bool isEMAIL = true;
  bool WantSearch = false;
  String Text2;
  bool WantIcon = false;
  final Function OnIconPressed;
  final TextInputAction TextInputaction; // this will make the arrow in the phone keybaord
  final Function(String) Onchanged;  // this function gives me the value which was written in the feild
  // and we changed i mean by changed is the curser moved to the other feild while its filed
  final Function(String) Onsubmitted;
  // when click on submit or sign up or login something like that
  final FocusNode FoucesNode; //fouces on curser where is it at right now

  textfeild(
      {
        required this.WantIcon,
        required this.WantSearch,
        required this.OnIconPressed,
        required this.Text2,
        required this.isEMAIL,
        required this.Onchanged,
        required this.Onsubmitted,
        required this.TextInputaction,
        required this.FoucesNode,
      }
      );

  @override
  _State createState() => _State();
}

class _State extends State<textfeild> {


  var _formkey2 = GlobalKey<FormState>(); //password textfeild key
  var _formkey3 = GlobalKey<FormState>(); //email textfield key
   FocusNode? focusNode;
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  bool SecureInput_pass =  false;

  String? hintText ;
  String? LabelText ;


  void initState() {
    super.initState();
    _EmailController.addListener(() {setState(() {});});
    _PassController.addListener(() {setState(() {});});
    focusNode = widget.FoucesNode;
    focusNode!.addListener(() {
      if (focusNode!.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Search here..';
      }
    });
  }

  void dispose() {
    _EmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width ;

    return Column(
        children: [
      Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: .3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          width: w/1.1,
          height: h/15,
          child: Form(
            key: widget.isEMAIL ? _formkey3 : _formkey2,
            child: TextFormField(
              textInputAction: widget.TextInputaction,
              controller: widget.isEMAIL ? _EmailController : _PassController,
              onChanged: widget.Onchanged,
              onFieldSubmitted: widget.Onsubmitted,
              focusNode: focusNode,

              cursorColor: Colors.grey,

              style: TextStyle(color: Colors.black87,fontSize: 20),
              decoration: InputDecoration(

                  border: widget.WantSearch? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xff939393),width: 2 ),
                  ):null,
                  focusedBorder:widget.WantSearch? OutlineInputBorder(

                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Color(0xff939393),width: 2 ),
                ):null,
                  enabledBorder: widget.WantSearch? OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Color(0xff939393),width: 2 ),
                  ):null,
                  prefixIcon: IconButton(
                          icon: SvgPicture.asset(
                            'Assets/images/Vector(1).svg',
                          ),
                          onPressed: null //do something,
                      ),

                  filled: true,
                  fillColor:Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                  hintText: hintText,
                  labelText: widget.Text2,

                  hintStyle: TextStyle(


                   color:Colors.black,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(widget.WantIcon
                        ? widget.isEMAIL
                        ? (_EmailController.text.isEmpty ? null : Icons.close)
                        : (SecureInput_pass
                            ? Icons.remove_red_eye_outlined
                            : Icons.security):null),

                    onPressed: () {
                      setState(() {
                       if ( widget.isEMAIL && widget.WantIcon){
                             _EmailController.clear();
                             widget.OnIconPressed();
                       }
                            else if (widget.WantIcon)
                            { SecureInput_pass = !SecureInput_pass;}
                      });
                    },
                  )),
                  keyboardType: TextInputType.text,
                   obscureText: SecureInput_pass,
            ),
          )),

    ]




    );
  }
}
