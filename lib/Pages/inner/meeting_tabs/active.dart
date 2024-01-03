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
                    editModal(newMeeting[index]);
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

  void editModal(MeetingData allMeeting) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    var loading1 = false;
    // bool selectedProxy = allMeeting.proxy;
    // print(selectedProxy);
    // fullNameController.text = allMeeting.fullName;
    // phoneNumberController.text = allMeeting.phoneNumber;
    String? _validateField(String? value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      return null;
    }

    showDialog(
      context: context, // Pass the BuildContext to showDialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Member'), // Set your dialog title
          // content: Text(allMeeting.fullName), // Set your dialog content
          actions: <Widget>[
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                        labelText: "Meeting Type",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: "all",
                          child: Center(
                            child: Text('Round',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "active",
                          child: Center(
                            child: Text('Social',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "pending",
                          child: Center(
                            child: Text('Emergency',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "repaid",
                          child: Center(
                            child: Text('Final',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "lost",
                          child: Center(
                            child: Text('Lost',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                        labelText: "Meeting Reason",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: "all",
                          child: Center(
                            child: Text('Round',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "active",
                          child: Center(
                            child: Text('Social',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "pending",
                          child: Center(
                            child: Text('Emergency',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "repaid",
                          child: Center(
                            child: Text('Final',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "lost",
                          child: Center(
                            child: Text('Lost',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                        labelText: "Meeting Interval",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFF89520)),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: "all",
                          child: Center(
                            child: Text('Round',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "active",
                          child: Center(
                            child: Text('Social',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "pending",
                          child: Center(
                            child: Text('Emergency',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "repaid",
                          child: Center(
                            child: Text('Final',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "lost",
                          child: Center(
                            child: Text('Lost',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimeFormField(
                    // validator: _validateDate,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFFF89520)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xFFF89520)),
                      ),
                      labelText: "Next Meeting Date *",
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Color(0xFFF89520)),
                      hintText: "Select next Meeting Date",
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    onDateSelected: (DateTime value) {
                      // Format the selected date as a string
                      // selectedDate = DateFormat('yyyy-MM-dd').format(value);
                      // print('Selected date: $formattedDate'); // Output: 2023-11-17
                      // Handle the formatted date as needed
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    onChanged: (value) {},
                    // validator: _validateAmountField,
                    // controller: currentRound,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFFF89520)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFFF89520)),
                      ),
                      labelText: "Current Round",
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            )),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    bool confirmDelete = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm Deletion'),
                          content: const Text(
                              'Are you sure you want to delete this user?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(
                                    false); // User does not confirm deletion
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(true); // User confirms deletion
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                    if (confirmDelete) {
                      loading1 = true;
                      if (fullNameController.text.isEmpty) {
                        const message = 'Full name is mandatory';
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Fluttertoast.showToast(msg: message, fontSize: 18);
                        });
                      } else if (phoneNumberController.text.length != 10 ||
                          phoneNumberController.text == "") {
                        const message = 'Invalid phone number format';
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Fluttertoast.showToast(msg: message, fontSize: 18);
                        });
                      } else {
                        setState(() {
                          loading = true;
                        });
                        // final body = {
                        //   "phoneNumber": phoneNumberController.text,
                        //   "fullName": fullNameController.text,
                        //   "proxyEnabled": selectedProxy
                        // };
                        // print(body);
                        try {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var accessToken = prefs.getStringList("_keyUser");
                          final String authToken = accessToken![0];
                          var response = await http.delete(
                            Uri.http("10.1.177.121:8111",
                                "/api/v1/groups/delete-member/${allMeeting.meetingId}"),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Authorization': 'Bearer $authToken',
                            },
                          );
                          // print("here" + "${response.statusCode}");
                          // print(response.body);
                          if (response.statusCode == 200) {
                            setState(() {
                              loading1 = false;
                            });
                            const message = 'Account Deleted Successfuly!';
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              Fluttertoast.showToast(
                                  msg: message, fontSize: 18);
                            });
                            Navigator.of(context)
                                .pop(); // Close the dialog when the user presses the button
                          } else if (response.statusCode != 200) {
                            final responseBody = json.decode(response.body);
                            final description = responseBody?[
                                'message']; // Extract 'description' field
                            if (description ==
                                "Phone number is already taken") {
                              Fluttertoast.showToast(
                                  msg:
                                      "This phone number is already registered",
                                  fontSize: 18);
                            } else {
                              var message = description ??
                                  "Account creation failed please try again";
                              Fluttertoast.showToast(
                                  msg: message, fontSize: 18);
                            }
                            setState(() {
                              loading1 = false;
                            });
                          }
                        } catch (e) {
                          var message = e.toString();
                          'Please check your network connection';
                          Fluttertoast.showToast(msg: message, fontSize: 18);
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    }
                  },
                  child: loading1
                      ? const CircularProgressIndicator(
                          color: Colors.orange,
                        )
                      : Text('Deactivate Meeting',
                          style: GoogleFonts.poppins(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () async {
                    loading1 = true;
                    if (fullNameController.text.isEmpty) {
                      const message = 'Full name is mandatory';
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Fluttertoast.showToast(msg: message, fontSize: 18);
                      });
                    } else if (phoneNumberController.text.length != 10 ||
                        phoneNumberController.text == "") {
                      const message = 'Invalid phone number format';
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Fluttertoast.showToast(msg: message, fontSize: 18);
                      });
                    } else {
                      setState(() {
                        loading = true;
                      });
                      final body = {
                        "phoneNumber": phoneNumberController.text,
                        "fullName": fullNameController.text,
                        // "proxyEnabled": selectedProxy
                      };
                      print(body);
                      try {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var accessToken = prefs.getStringList("_keyUser");
                        final String authToken = accessToken![0];
                        var response = await http.put(
                          Uri.http("10.1.177.121:8111",
                              "/api/v1/groups/edit-member/${allMeeting.meetingId}"),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization': 'Bearer $authToken',
                          },
                          body: jsonEncode(body),
                        );
                        // print("here" + "${response.statusCode}");
                        // print(response.body);
                        if (response.statusCode == 200) {
                          setState(() {
                            loading1 = false;
                          });
                          const message = 'Account Updated Successfuly!';
                          Future.delayed(const Duration(milliseconds: 100), () {
                            Fluttertoast.showToast(msg: message, fontSize: 18);
                          });
                          Navigator.of(context)
                              .pop(); // Close the dialog when the user presses the button
                        } else if (response.statusCode != 200) {
                          final responseBody = json.decode(response.body);
                          final description = responseBody?[
                              'message']; // Extract 'description' field
                          if (description == "Phone number is already taken") {
                            Fluttertoast.showToast(
                                msg: "This phone number is already registered",
                                fontSize: 18);
                          } else {
                            var message = description ??
                                "Account creation failed please try again";
                            Fluttertoast.showToast(msg: message, fontSize: 18);
                          }
                          setState(() {
                            loading1 = false;
                          });
                        }
                      } catch (e) {
                        var message = e.toString();
                        'Please check your network connection';
                        Fluttertoast.showToast(msg: message, fontSize: 18);
                      } finally {
                        setState(() {
                          loading = false;
                        });
                      }
                    }
                  },
                  child: loading1
                      ? const CircularProgressIndicator(
                          color: Colors.orange,
                        )
                      : Text(
                          'Edit',
                          style: GoogleFonts.poppins(color: Colors.green),
                        ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
