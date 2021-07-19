import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:o2findermyanmar/constant/svg_constant.dart';

class LocationPicker extends StatefulWidget {
  static const String route = '/location_picker';
  const LocationPicker({Key? key}) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _divisionController = TextEditingController();
  final _districController = TextEditingController();
  final _townshipController = TextEditingController();

  late String divisionCode;
  late String districCode;
  late String townshipCode;

  late int divisionId;
  late int districId;
  late int townshipId;
  bool isNeedToFill = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
              child: ConstrainedBox(
            //forza il Center ad avere l'altezza dello scaffold body
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 200),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(1),
                          child: Text(
                            "Oxygen ",
                            style: TextStyle(
                                color: Colors.pink.shade800,
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                fontFamily: "OdibeeSans"),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Finder ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 26,
                                fontFamily: "OdibeeSans"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //board title
                  Container(
                      padding: EdgeInsets.only(bottom: 16, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "သင်နေထိုင်ရာ ဒေသရွေးချယ်ပါ",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: "MyanmarSansPro"),
                          ),
                        ],
                      )),

                  Container(
                    alignment: AlignmentDirectional.center,
                    width: mediaQuery.size.width - 36,
                    height: 65,
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius:
                                0, // has the effect of softening the shadow
                            offset: Offset(
                              0, // horizontal, move right 10
                              0, // vertical, move down 10
                            ),
                          ),
                        ]),
                    child: TextFormField(
                      enabled: false,
                      autofocus: false,
                      controller: _divisionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "သင်နေထိုင်ရာ တိုင်း/ ပြည်နယ် ရွေးချယ်ရန်";
                        }
                        return null;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            LineIcons.mapMarked,
                            color: Colors.pink.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent, //this has no effect
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: "တိုင်း / ပြည်နယ် ရွေးချယ်ပါ",
                          errorStyle: TextStyle(height: 0, fontSize: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500)),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Container(
                    alignment: AlignmentDirectional.center,
                    width: mediaQuery.size.width - 36,
                    height: 65,
                    margin: EdgeInsets.only(right: 10, left: 10, top: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius:
                                0, // has the effect of softening the shadow
                            offset: Offset(
                              0, // horizontal, move right 10
                              0, // vertical, move down 10
                            ),
                          ),
                        ]),
                    child: TextFormField(
                      enabled: false,
                      autofocus: false,
                      controller: _districController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "သင်နေထိုင်ရာ မြို့နယ် ရွေးချယ်ရန်";
                        }
                        return null;
                      },
                      obscureText: false,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            LineIcons.mapMarker,
                            color: Colors.pink.shade800,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent, //this has no effect
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: "မြို့နယ် ရွေးချယ်ပါ",
                          errorStyle: TextStyle(height: 0, fontSize: 15),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500)),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(15.5)),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade800,
                          padding: EdgeInsets.all(15.5),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, Home.route);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ရွေးချယ်ပြီးပါပြီ',
                              style: TextStyle(fontFamily: 'MyanmarSansPro'),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            // SvgPicture.string(
                            //   SvgConstant.nextSvg,
                            //   width: 25,
                            //   color: Colors.grey.shade100,
                            // )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
