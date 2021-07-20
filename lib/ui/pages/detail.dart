import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Detail extends StatefulWidget {
  static const String route = '/detail';
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('အသေးစိတ်'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(40)),
              Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                overflow: Overflow.visible,
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    width: mediaQuery.size.width,
                    margin: EdgeInsets.all(20.10),
                    padding: EdgeInsets.all(30.10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.all(10.10),
                          child: Text(
                            'မိဘဂုဏ်',
                            style: TextStyle(
                                fontFamily: 'MyanmarHeadOne',
                                fontSize: 30,
                                color: HexColor('#484761')),
                          ),
                        ),
                        Container(
                          child: Text(
                            'အောက်စီဂျင် ထုတ်လုပ်၊ ဖြန့်ချီရေး',
                            style: TextStyle(
                                fontFamily: 'MyanmarSansPro',
                                fontSize: 20,
                                color: Colors.black54),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'ရောင်း , ငှား',
                            style: TextStyle(
                                fontFamily: 'MyanmarChatu',
                                fontSize: 20,
                                color: Colors.pink.shade800),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: -35,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/oxygen.jpeg'),
                          radius: 50,
                        ),
                        width: 100,
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Remark',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'မြေပြင်မှဆက်သွယ်ရန် ပြောပါသည် ',
                  style: TextStyle(
                      fontFamily: 'Pyidaungsu',
                      color: HexColor('#605D73'),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Fees',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  '၃၀၀၀ ကျပ်',
                  style: TextStyle(
                      fontFamily: 'Pyidaungsu',
                      color: HexColor('#605D73'),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Phone',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '097793939',
                            style: TextStyle(
                                letterSpacing: 2.1,
                                fontFamily: 'Pyidaungsu',
                                color: HexColor('#605D73'),
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.all(3.3)),
                          Container(
                            padding: EdgeInsets.all(5.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.8),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Icon(
                                Icons.phone,
                                color: Colors.green.shade800,
                                size: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(5.5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '097793939',
                            style: TextStyle(
                                letterSpacing: 2.1,
                                fontFamily: 'Pyidaungsu',
                                color: HexColor('#605D73'),
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          Padding(padding: EdgeInsets.all(3.3)),
                          Container(
                            padding: EdgeInsets.all(5.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.8),
                                color: Colors.grey.shade200),
                            child: Center(
                              child: Icon(
                                Icons.phone,
                                color: Colors.green.shade800,
                                size: 27,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Address',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'သာစည်လမ်းမီးပွိုင့်',
                  style: TextStyle(
                      fontFamily: 'Pyidaungsu',
                      color: HexColor('#605D73'),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'City',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'မုံရွာမြို့',
                  style: TextStyle(
                      fontFamily: 'Pyidaungsu',
                      color: HexColor('#605D73'),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Region',
                  style: TextStyle(
                      fontFamily: 'RobotoRegular',
                      color: Colors.black26,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  'စစ်ကိုင်းတိုင်းဒေသကြီး',
                  style: TextStyle(
                      fontFamily: 'Pyidaungsu',
                      color: HexColor('#605D73'),
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
