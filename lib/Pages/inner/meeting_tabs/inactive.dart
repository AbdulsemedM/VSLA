import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InactiveMeeting extends StatefulWidget {
  const InactiveMeeting({super.key});

  @override
  State<InactiveMeeting> createState() => _InactiveMeetingState();
}

class MeetingData {
  final String meetingId;
  final String currentRound;
  final String meetingReason;
  final String meetingType;
  final String intervalDays;
  final String meetingInterval;
  final String nextMeetingDate;

  MeetingData(
      {required this.meetingId,
      required this.currentRound,
      required this.meetingReason,
      required this.meetingType,
      required this.intervalDays,
      required this.meetingInterval,
      required this.nextMeetingDate});
}

class _InactiveMeetingState extends State<InactiveMeeting> {
  var loading = false;
  List<MeetingData> newMeeting = [];
  final PageController _pageController = PageController();
  void initState() {
    super.initState();
    fetchMeetings();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: newMeeting.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // editModal(newMeeting[index]);
                  },
                  child: Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            newMeeting[index].meetingType,
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            newMeeting[index]
                                                .meetingReason
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Next Meeting Day",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        DateFormat('dd MMM, HH:mm').format(
                                            DateTime.parse(newMeeting[index]
                                                .nextMeetingDate)),
                                        style: GoogleFonts.roboto(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                );
              },
            ),
          );
  }

  Future<void> fetchMeetings() async {
    try {
      // var user = await SimplePreferences().getUser();
      setState(() {
        loading = true;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      final String groupId = accessToken[2];

      final response = await http.get(
        Uri.http('10.1.177.121:8111',
            '/api/v1/meetings/getInActiveMeetings/$groupId'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);

      // print(data);
      setState(() {
        newMeeting.clear();
        for (var meeting in data) {
          newMeeting.add(MeetingData(
              meetingId: meeting['meetingId'],
              currentRound: meeting['currentRound'],
              meetingReason: meeting['meetingReason'],
              meetingType: meeting['meetingType'],
              intervalDays: meeting['intervalDays'],
              meetingInterval: meeting['meetingInterval'],
              nextMeetingDate: meeting['nextMeetingDate']));
        }
        loading = false;
      });

      print(newMeeting.length);

      // print(transactions[0]);
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e.toString());
      var message =
          'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }
}
