import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_icons/line_icons.dart';
import 'package:o2findermyanmar/bloc/services/services_bloc.dart';
import 'package:o2findermyanmar/constant/app_setting.dart';

import 'package:o2findermyanmar/ui/pages/detail.dart';
import 'package:o2findermyanmar/ui/pages/location_picker.dart';
import 'package:o2findermyanmar/ui/widgets/supporter_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OxygenDuration extends StatefulWidget {
  static const String route = '/oxygen_duration';

  int? divisionId;
  int? townshipId;

  OxygenDuration({
    Key? key,
    this.divisionId,
    this.townshipId,
  }) : super(key: key);

  @override
  _OxygenDurationState createState() => _OxygenDurationState();
}

class ScreenArguments {
  final String serviceId;

  ScreenArguments(this.serviceId);
}

class _OxygenDurationState extends State<OxygenDuration> {

  String? _psiValue = "600";
  String? _cylinderSizeValue = "5";
  String? _flowRateValue = "5";

  static const List<String> _psiSelections = ["600","800","1000","1200","1400","1500","1800","2000"];
  static const List<String> _cylinderSizes = ["5","10","15","20","25","30","35","40"];
  static const List<String> _flowRates = ["5","10","15","20","25","30","35","40"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: EasyRichText(
            "O 2 Finder",
            patternList: [
              EasyRichTextPattern(
                  targetString: '2',
                  subScript: true,
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)
              ),
            ],
            defaultStyle: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w900,
                fontSize: 20),
          ),
          leading: Icon(
            LineIcons.home,
            color: Colors.pink[800],
          ),
          iconTheme: new IconThemeData(color: Colors.pink[800]),
          backgroundColor: Colors.white,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, LocationPicker.route);
              },
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  LineIcons.mapMarker,
                  size: 27,
                ),
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select PSI"),
                  DropdownButton<String>(
                    value: _psiValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),
                    items: _psiSelections.map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "Please choose a language",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _psiValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Cylinder Size(L)"),
                  DropdownButton<String>(
                    value: _cylinderSizeValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),
                    items: _cylinderSizes.map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _cylinderSizeValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Flow Rate(L/min)"),
                  DropdownButton<String>(
                    value: _flowRateValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),
                    items: _flowRates.map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _flowRateValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
