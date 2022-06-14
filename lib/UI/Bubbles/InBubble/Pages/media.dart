import 'package:flutter/material.dart';

class MediaDisplayWidget extends StatefulWidget {
  @override
  State<MediaDisplayWidget> createState() => _MediaDisplayWidgetState();
}

class _MediaDisplayWidgetState extends State<MediaDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme _TextTheme = Theme.of(context).textTheme;
    ColorScheme ColorS = Theme.of(context).colorScheme;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              Container(
                height: h/15,
                color: Color.fromRGBO(21, 208, 120, 1),
                child: Center(
                    child: Text(
                  'Media',
                  style: TextStyle(
                      fontFamily: 'Gill Sans Nova',
                      color: Color.fromRGBO(48, 48, 48, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                )),
              ),
              SizedBox(height: 10,),
              Text(""),
              Container(
                width: w/1.1,
                height: h/1.169,
                child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 120,
                              childAspectRatio: 1,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7),
                      itemCount: 50,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          height: 10,
                          width: 10,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(147, 147, 147, 1),
                          ),
                        );
                      }),
              )
            ],
          ),

      ),
    );
  }
}
