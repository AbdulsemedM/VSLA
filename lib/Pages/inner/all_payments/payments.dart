import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vsla/Pages/inner/all_payments/attendance.dart';
import 'package:vsla/Pages/inner/all_payments/round_payment.dart';
import 'package:vsla/Pages/inner/all_payments/social_funds.dart';
import 'package:vsla/Pages/inner/meeting_tabs/active.dart';
import 'package:vsla/Pages/inner/meeting_tabs/inactive.dart';
import 'package:vsla/utils/api_config.dart';
import 'package:vsla/utils/role.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments>
    with SingleTickerProviderStateMixin {
  List<MeetingTypeData> meetingTypes = [];
  List<MeetingIntevalData> meetingIntervals = [];
  TextEditingController currentRound = new TextEditingController();
  TextEditingController meetingReason = new TextEditingController();
  String? meeetingType;
  String? meetingInterval;
  String? meeetingTypeId;
  String? meetingIntervalId;
  String? nextMeetingDate;
  String? intervalDays;
  final GlobalKey<FormState> myKey = GlobalKey();
  TabController? _tabController;
  var loading = false;
  String selectedDate = "";
  bool? done;

  final List<Tab> _tabs = const [
    Tab(text: "Attendance"),
    Tab(text: "Round Payment"),
    Tab(text: "Social funds"),
  ];
  final List<Widget> _pages = const [
    Attendance(),
    RoundPayments(),
    SocialFundsPayment(),
  ];
  void initState() {
    super.initState();
    // fetchMeetingTypes();
    // fetchMeetingIntervals();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height * 1;
    // var sWidth = MediaQuery.of(context).size.width * 1;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_new_sharp)),
                        Image(
                            height: MediaQuery.of(context).size.height * 0.05,
                            image: const AssetImage("assets/images/vsla.png"))
                      ],
                    ),
                  ),
                  TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.orange,
                      labelColor: Colors.orange,
                      controller: _tabController,
                      tabs: _tabs),
                  SizedBox(
                    height: sHeight * 0.85,
                    child: TabBarView(
                      controller: _tabController,
                      children: _pages,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
