import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:o2findermyanmar/ui/pages/location_picker.dart';
import 'package:o2findermyanmar/ui/widgets/supporter_card.dart';

class Home extends StatefulWidget {
  static const String route = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
                    fontSize: 14)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SupporterCard(
                name: 'Myanmar Rescue Organization',
                isActive: false,
                timeago: '19 hours ago',
                desc: 'Jul 18 09:32 PM ကနောက်ဆုံးဆက်ထားပါတယ် ရှင့် '),
            SupporterCard(
                name: 'ရေကြောင်းရုံး',
                isActive: false,
                timeago: '19 hours ago',
                desc: 'Jul 18 09:48 PM ကနောက်ဆုံးဆက်ထားပါတယ် ရှင့်'),
            SupporterCard(
                name: 'မိဘဂုဏ်',
                isActive: true,
                timeago: '6 days ago',
                desc: 'Jul 13 05:30 PM ကနောက်ဆုံးဆက်ထားပါတယ် ရှင့်'),
          ],
        ),
      ),
    );
  }
}
