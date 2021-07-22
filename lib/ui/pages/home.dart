import 'dart:developer';

import 'package:easy_rich_text/easy_rich_text.dart';
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

class Home extends StatefulWidget {
  static const String route = '/home';

  int? divisionId;
  int? townshipId;

  Home({
    Key? key,
    this.divisionId,
    this.townshipId,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class ScreenArguments {
  final String serviceId;

  ScreenArguments(this.serviceId);
}

class _HomeState extends State<Home> {
  late RefreshController _refreshController;

  String? _divisionId;

  String? _townshipId;

  final _storage = FlutterSecureStorage();
  late ServicesBloc servicesBloc;

  void initState() {
    super.initState();

    _refreshController = RefreshController();
    servicesBloc = BlocProvider.of<ServicesBloc>(context);
    // servicesBloc
    //   ..add(GetServices(
    //       divisionId: widget.divisionId, townshipId: widget.townshipId));
//    candidateBloc..add(GetCandidate(divisionId: widget.division,districId: widget.distric));
    getInitData();
  }

  Future<Null> getInitData() async {
    _divisionId = await _storage.read(key: AppSetting.initialDivision);
    _townshipId = await _storage.read(key: AppSetting.initialTownship);
    if (servicesBloc.state is ServicesInitial) {
      servicesBloc
        ..add(GetServices(divisionId: _divisionId, townshipId: _townshipId));
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

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
        body: BlocListener<ServicesBloc, ServicesState>(
          listener: (context, state) {
            if (state is ServicesLoaded) {
              _refreshController
                ..loadComplete()
                ..refreshCompleted();
              if (state.loadNoMore!) {
                _refreshController.loadNoData();
              }
            }

            if (state is ServicesError) {
              _refreshController
                ..loadFailed()
                ..refreshFailed();
            }
          },
          child: BlocBuilder<ServicesBloc, ServicesState>(
            builder: (context, state) {
              if (state is ServicesLoaded) {
                return SmartRefresher(
                    header: WaterDropHeader(
                      waterDropColor: Colors.pink.shade800,
                    ),
                    controller: _refreshController,
                    enablePullUp: true,
                    enablePullDown: true,
                    onRefresh: () async {
                      servicesBloc
                        ..add(ShowServicesLoading())
                        ..add(GetServices(
                            divisionId: _divisionId, townshipId: _townshipId));
                    },
                    onLoading: () async {
                      servicesBloc
                        ..add(GetServices(
                            divisionId: _divisionId, townshipId: _townshipId));
                    },
                    child: state.services!.length > 0
                        ? Padding(
                            padding: EdgeInsets.all(5.5),
                            child: ListView.builder(
                                primary: false,
                                itemCount: state.services!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, Detail.route,
                                          arguments: ScreenArguments(
                                              state.services![index].id!));
                                    },
                                    child: SupporterCard(
                                        name: state.services![index].name!,
                                        isActive:
                                            state.services![index].isActive!,
                                        timeago:
                                            state.services![index].timeAgo!,
                                        desc: state
                                                .services![index].updatedAt! +
                                            ' က နောက်ဆုံးဆက်ထားပါတယ် ရှင့်'),
                                  );
                                }),
                          )
                        : Container(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "ဒေတာမရှိသေးပါ",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "MyanmarSansPro",
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ));
              } else if (state is ServicesError) {
                _refreshController
                  ..loadFailed()
                  ..refreshFailed();
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ));
  }
}
