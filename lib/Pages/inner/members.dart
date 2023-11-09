import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/Pages/routes/home3.dart';
import 'package:vsla/Pages/inner/addMember.dart';
import 'package:http/http.dart' as http;

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class MemberData {
  final int userId;
  final String fullName;
  final String phoneNumber;
  final double loanBalance;
  final double paid;
  final double totalOwning;
  final String gender;
  final bool proxy;

  MemberData(
      {required this.userId,
      required this.fullName,
      required this.phoneNumber,
      required this.proxy,
      required this.loanBalance,
      required this.paid,
      required this.totalOwning,
      required this.gender});
}

class _MembersState extends State<Members> {
  var members = true;
  @override
  void initState() {
    super.initState();
    fetchMembers();
  }

  List<MemberData> allMembers = [];
  var male = 0;
  var female = 0;
  var loading = true;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return members == false
        ? const Home3()
        : WillPopScope(
            onWillPop: () async {
              if (members) {
                // Set the new state outside onWillPop
                setState(() {
                  members = false;
                });
                // Allow back navigation
                return false;
              } else {
                // Set the new state outside onWillPop
                members = true;
                // Prevent back navigation
                return false;
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                members = false;
                              });
                            },
                            child: const Icon(Icons.arrow_back_ios_new_sharp)),
                        Image(
                            height: MediaQuery.of(context).size.height * 0.05,
                            image: const AssetImage("assets/images/vsla.png"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 6, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Members",
                          style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total members",
                          style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          allMembers.length.toString(),
                          style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 15, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddMember()));
                          },
                          child: Container(
                            height: screenWidth * 0.12,
                            width: screenWidth * 0.12,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.12)),
                            child: const Center(
                              child: Icon(FontAwesomeIcons.plus),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  FontAwesomeIcons.mars,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  "Male: $male",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: screenWidth * 0.015,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(0)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Icon(
                                  FontAwesomeIcons.venus,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  "Female: $female",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  loading
                      ? const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.53,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            controller: _pageController,
                            itemCount: allMembers.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  editModal(allMembers[index]);
                                },
                                child: Card(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: screenWidth * 0.05,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: allMembers[
                                                                  index]
                                                              .gender
                                                              .toLowerCase() ==
                                                          "male"
                                                      ? const AssetImage(
                                                          "assets/images/male.png")
                                                      : const AssetImage(
                                                          "assets/images/female.png"),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          allMembers[index]
                                                              .fullName,
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 0, 10, 0),
                                                          child: Text(
                                                            "Loan balance",
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    color: Colors
                                                                            .red[
                                                                        400]),
                                                          ),
                                                        ),
                                                        Text(
                                                          allMembers[index]
                                                              .loanBalance
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  color: Colors
                                                                          .red[
                                                                      400]),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  10, 0, 10, 0),
                                                          child: Text(
                                                            " Paid",
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    color: Colors
                                                                            .blue[
                                                                        400]),
                                                          ),
                                                        ),
                                                        Text(
                                                          allMembers[index]
                                                              .paid
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  color: Colors
                                                                          .blue[
                                                                      400]),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text("Total Owing",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  color: Colors
                                                                          .orange[
                                                                      900])),
                                                    ),
                                                    Text(
                                                      " ${allMembers[index].totalOwning.toString()} ETB",
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: screenWidth * 0.05,
                                                  width: screenWidth * 0.05,
                                                  color: Colors.orange,
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .diagramProject,
                                                    size: screenWidth * 0.04,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
  }

  Future<void> fetchMembers() async {
    try {
      // var user = await SimplePreferences().getUser();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      final String groupId = accessToken[2];

      final response = await http.get(
        Uri.http('10.1.177.121:8111', '/api/v1/groups/$groupId/members'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);

      // print(data);
      List<MemberData> newMember = [];
      for (var member in data['memberList']) {
        newMember.add(MemberData(
          phoneNumber: member['phoneNumber'],
          proxy: member['proxy'],
          userId: member['userId'],
          fullName: member['fullName'],
          gender: member['gender'],
          loanBalance: member['loanBalance'],
          paid: member['paid'],
          totalOwning: member['totalOwning'],
        ));
      }

      setState(() {
        male = data['genderStatics']['male'];
        female = data['genderStatics']['female'];
      });
      allMembers.addAll(newMember);
      print(allMembers.length);

      // print(transactions[0]);

      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e.toString());
      var message =
          'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }

  void editModal(MemberData allMember) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    var selectedProxy = allMember.proxy;
    fullNameController.text = allMember.fullName;
    phoneNumberController.text = allMember.phoneNumber;
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
          // content: Text(allMember.fullName), // Set your dialog content
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 0, 8),
              child: TextFormField(
                validator: _validateField,
                controller: fullNameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xFFF89520)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xFFF89520)),
                  ),
                  labelText: "Full name *",
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xFFF89520)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                value: selectedProxy.toString(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                  labelText: "Proxy enabled *",
                  hintText: "yes / no",
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xFFF89520)),
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 14, color: Color(0xFFF89520)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xFFF89520)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xFFF89520)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Color(0xFFF89520)),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: "true",
                    child: Center(
                      child: Text('Yes',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.black)),
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "false",
                    child: Center(
                      child: Text('No',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.black)),
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedProxy = value as bool;
                  });
                },
                hint: Text("yes / no",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: const Color(0xFFF89520))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                validator: _validateField,
                controller: phoneNumberController,
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
                  labelText: "Phone number / Username *",
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14, color: const Color(0xFFF89520)),
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close the dialog when the user presses the button
                  },
                  child: Text('Delete User',
                      style: GoogleFonts.poppins(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Close the dialog when the user presses the button
                  },
                  child: Text(
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
