import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hexcolor/hexcolor.dart';
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

  static const List<String> _psiSelections = [
    "600",
    "800",
    "1000",
    "1200",
    "1400",
    "1500",
    "1800",
    "2000"
  ];
  static const List<String> _cylinderSizes = [
    "5",
    "10",
    "15",
    "20",
    "25",
    "30",
    "35",
    "40"
  ];
  static const List<String> _flowRates = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];

  @override
  Widget build(BuildContext contex) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Oxygen Duration',
          style:
              TextStyle(color: Colors.pink[800], fontFamily: 'RobotoRegular'),
        ),
        iconTheme: new IconThemeData(color: Colors.pink[800]),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: mediaQuery.size.width,
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.5),
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'ကြာချိန်',
                        style: TextStyle(
                            fontFamily: 'MyanmarHeadOne',
                            color: HexColor('#605D73'),
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(padding: EdgeInsets.all(5.10)),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      'ရက်',
                                      style: TextStyle(
                                          fontFamily: 'MyanmarSansPro',
                                          color: Colors.pink.shade800,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                        fontFamily: 'Digital',
                                        color: Colors.grey.shade600,
                                        fontSize: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      'နာရီ',
                                      style: TextStyle(
                                          fontFamily: 'MyanmarSansPro',
                                          color: Colors.pink.shade800,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                        fontFamily: 'Digital',
                                        color: Colors.grey.shade600,
                                        fontSize: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      'မိနစ်',
                                      style: TextStyle(
                                          fontFamily: 'MyanmarSansPro',
                                          color: Colors.pink.shade800,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.5),
                                    child: Text(
                                      '00',
                                      style: TextStyle(
                                        fontFamily: 'Digital',
                                        color: Colors.grey.shade600,
                                        fontSize: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(5.10)),
                            ],
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/images/time.png',
                            width: mediaQuery.size.width / 2.4,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         centerTitle: true,
  //         title: EasyRichText(
  //           "O 2 Finder",
  //           patternList: [
  //             EasyRichTextPattern(
  //                 targetString: '2',
  //                 subScript: true,
  //                 style: TextStyle(
  //                     fontFamily: 'RobotoCondensed',
  //                     color: Colors.grey.shade800,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 14)
  //             ),
  //           ],
  //           defaultStyle: TextStyle(
  //               fontFamily: 'RobotoCondensed',
  //               color: Colors.grey.shade800,
  //               fontWeight: FontWeight.w900,
  //               fontSize: 20),
  //         ),
  //         leading: Icon(
  //           LineIcons.home,
  //           color: Colors.pink[800],
  //         ),
  //         iconTheme: new IconThemeData(color: Colors.pink[800]),
  //         backgroundColor: Colors.white,
  //         actions: [
  //           InkWell(
  //             onTap: () {
  //               Navigator.pushNamed(context, LocationPicker.route);
  //             },
  //             child: Container(
  //               padding: EdgeInsets.only(right: 20),
  //               child: Icon(
  //                 LineIcons.mapMarker,
  //                 size: 27,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       resizeToAvoidBottomInset: false,
  //       body: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Select PSI"),
  //                 DropdownButton<String>(
  //                   value: _psiValue,
  //                   //elevation: 5,
  //                   style: TextStyle(color: Colors.black),
  //                   items: _psiSelections.map<DropdownMenuItem<String>>((dynamic value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   hint: Text(
  //                     "Please choose a language",
  //                     style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600),
  //                   ),
  //                   onChanged: (String? value) {
  //                     setState(() {
  //                       _psiValue = value!;
  //                     });
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Select Cylinder Size(L)"),
  //                 DropdownButton<String>(
  //                   value: _cylinderSizeValue,
  //                   //elevation: 5,
  //                   style: TextStyle(color: Colors.black),
  //                   items: _cylinderSizes.map<DropdownMenuItem<String>>((dynamic value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   onChanged: (String? value) {
  //                     setState(() {
  //                       _cylinderSizeValue = value!;
  //                     });
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Select Flow Rate(L/min)"),
  //                 DropdownButton<String>(
  //                   value: _flowRateValue,
  //                   //elevation: 5,
  //                   style: TextStyle(color: Colors.black),
  //                   items: _flowRates.map<DropdownMenuItem<String>>((dynamic value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   onChanged: (String? value) {
  //                     setState(() {
  //                       _flowRateValue = value!;
  //                     });
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //   );
  // }
}
