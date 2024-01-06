import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ActiveMeeting extends StatefulWidget {
  const ActiveMeeting({super.key});

  @override
  State<ActiveMeeting> createState() => _ActiveMeetingState();
}

class MeetingData {
  final String meetingId;
  final String currentRound;
  final String meetingReason;
  final String meetingType;
  final String meetingTypeId;
  final String intervalDays;
  final String meetingInterval;
  final String meetingIntervalId;
  final String nextMeetingDate;

  MeetingData(
      {required this.meetingId,
      required this.currentRound,
      required this.meetingReason,
      required this.meetingType,
      required this.meetingTypeId,
      required this.intervalDays,
      required this.meetingInterval,
      required this.meetingIntervalId,
      required this.nextMeetingDate});
}

class MeetingTypeData {
  final String meetingTypeId;
  final String meetingTypeName;

  MeetingTypeData({
    required this.meetingTypeId,
    required this.meetingTypeName,
  });
}

class MeetingIntevalData {
  final String meetingIntervalId;
  final String meetingIntervalName;
  final int intervalInDays;

  MeetingIntevalData({
    required this.meetingIntervalId,
    required this.meetingIntervalName,
    required this.intervalInDays,
  });
}

class _ActiveMeetingState extends State<ActiveMeeting> {
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
        Uri.http(
            '10.1.177.121:8111', '/api/v1/meetings/getActiveMeetings/$groupId'),
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
              meetingTypeId: meeting['meetingTypeId'],
              intervalDays: meeting['intervalDays'],
              meetingInterval: meeting['meetingInterval'],
              meetingIntervalId: meeting['meetingIntervalId'],
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

  // void editModal(MeetingData allMeeting) {
  //   TextEditingController fullNameController = TextEditingController();
  //   TextEditingController phoneNumberController = TextEditingController();
  //   var loading1 = false;
  //   // bool selectedProxy = allMeeting.proxy;
  //   // print(selectedProxy);
  //   // fullNameController.text = allMeeting.fullName;
  //   // phoneNumberController.text = allMeeting.phoneNumber;
  //   String? _validateField(String? value) {
  //     if (value == null || value.isEmpty) {
  //       return 'This field is required';
  //     }
  //     return null;
  //   }

  //   showDialog(
  //     context: context, // Pass the BuildContext to showDialog
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Edit Member'), // Set your dialog title
  //         // content: Text(allMeeting.fullName), // Set your dialog content
  //         content: Form(
  //             key: myKey,
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: SizedBox(
  //                       height: MediaQuery.of(context).size.height * 0.05,
  //                       child: DropdownButtonFormField<String>(
  //                         decoration: InputDecoration(
  //                           contentPadding: const EdgeInsets.fromLTRB(
  //                               12.0, 10.0, 12.0, 10.0),
  //                           labelText: "Meeting Type*",
  //                           enabledBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           focusedBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           focusedErrorBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           filled: true,
  //                           fillColor: Colors.transparent,
  //                         ),
  //                         items: meetingTypes.map((MeetingTypeData meetTs) {
  //                           return DropdownMenuItem<String>(
  //                             value: meetTs.meetingTypeId.toString(),
  //                             child: Text(
  //                               meetTs.meetingTypeName,
  //                               style: const TextStyle(
  //                                   fontSize: 14, color: Colors.black),
  //                             ),
  //                           );
  //                         }).toList(),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             meeetingType = value;
  //                           });
  //                         },
  //                         validator: (value) {
  //                           if (value == null) {
  //                             return "Meeting type is required.";
  //                           } else {
  //                             return null;
  //                           }
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8),
  //                     child: TextFormField(
  //                       validator: (value) {
  //                         if (value == null) {
  //                           return null;
  //                         } else {
  //                           return null;
  //                         }
  //                       },
  //                       controller: meetingReason,
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
  //                         enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide: BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide: BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         labelText: "Meeting Reason",
  //                         labelStyle: GoogleFonts.poppins(
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: SizedBox(
  //                       height: MediaQuery.of(context).size.height * 0.05,
  //                       child: DropdownButtonFormField<String>(
  //                         decoration: InputDecoration(
  //                           contentPadding: const EdgeInsets.fromLTRB(
  //                               12.0, 10.0, 12.0, 10.0),
  //                           labelText: "Meeting Interval*",
  //                           enabledBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           focusedBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           focusedErrorBorder: OutlineInputBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             borderSide:
  //                                 const BorderSide(color: Color(0xFFF89520)),
  //                           ),
  //                           filled: true,
  //                           fillColor: Colors.transparent,
  //                         ),
  //                         items:
  //                             meetingIntervals.map((MeetingIntevalData meetIs) {
  //                           return DropdownMenuItem<String>(
  //                             value: meetIs.meetingIntervalId.toString(),
  //                             child: Text(
  //                               meetIs.meetingIntervalName,
  //                               style: const TextStyle(
  //                                   fontSize: 14, color: Colors.black),
  //                             ),
  //                           );
  //                         }).toList(),
  //                         onChanged: (value) {
  //                           setState(() {
  //                             meetingInterval = value;
  //                             MeetingIntevalData selectedMeetingInterval =
  //                                 meetingIntervals.firstWhere((meetIs) =>
  //                                     meetIs.meetingIntervalId.toString() ==
  //                                     value);
  //                             intervalDays = selectedMeetingInterval
  //                                 .intervalInDays
  //                                 .toString();
  //                           });
  //                         },
  //                         validator: (value) {
  //                           if (value == null) {
  //                             return "Meeting inteval is required.";
  //                           } else {
  //                             return null;
  //                           }
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: DateTimeFormField(
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
  //                         enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide:
  //                               const BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide:
  //                               const BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         labelText: "Next Meeting Date *",
  //                         labelStyle: GoogleFonts.poppins(
  //                             fontSize: 14, color: Color(0xFFF89520)),
  //                         hintText: "Select next Meeting Date",
  //                       ),
  //                       mode: DateTimeFieldPickerMode.date,
  //                       validator: (value) {
  //                         if (value == null) {
  //                           return "Next date is required.";
  //                         } else {
  //                           return null;
  //                         }
  //                       },
  //                       onDateSelected: (DateTime value) {
  //                         // Format the selected date as a string
  //                         nextMeetingDate =
  //                             DateFormat('yyyy-MM-dd').format(value);
  //                         print(
  //                             'Selected date: $nextMeetingDate'); // Output: 2023-11-17
  //                         // Handle the formatted date as needed
  //                       },
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8),
  //                     child: TextFormField(
  //                       controller: currentRound,
  //                       validator: (value) {
  //                         if (value == null) {
  //                           return null;
  //                         } else {
  //                           return null;
  //                         }
  //                       },
  //                       decoration: InputDecoration(
  //                         contentPadding:
  //                             const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
  //                         enabledBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide:
  //                               const BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         focusedBorder: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10.0),
  //                           borderSide:
  //                               const BorderSide(color: Color(0xFFF89520)),
  //                         ),
  //                         labelText: "Current Round*",
  //                         labelStyle: GoogleFonts.poppins(
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Row(
  //                     children: [
  //                       TextButton(
  //                         onPressed: () {
  //                           Navigator.of(context)
  //                               .pop(false); // User does not confirm deletion
  //                         },
  //                         child: const Text('Cancel'),
  //                       ),
  //                       TextButton(
  //                         onPressed: () async {
  //                           await apply();
  //                           if (done == true) {
  //                             Navigator.of(context)
  //                                 .pop(true); // User confirms deletion
  //                           } else {
  //                             const message =
  //                                 'Please check your network connection';
  //                             Fluttertoast.showToast(
  //                                 msg: message, fontSize: 18);
  //                           }
  //                         },
  //                         child: const Text('Yes'),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             )),
  //       );
  //     },
  //   );
  // }
}
