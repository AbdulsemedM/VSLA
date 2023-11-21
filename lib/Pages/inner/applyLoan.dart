import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApplyLoan extends StatefulWidget {
  const ApplyLoan({super.key});

  @override
  State<ApplyLoan> createState() => _ApplyLoanState();
}

class MemberData {
  final String userId;
  final String fullName;
  final String gender;
  final String proxy;
  final String round;

  MemberData(
      {required this.userId,
      required this.fullName,
      required this.round,
      required this.proxy,
      required this.gender});
}

class _ApplyLoanState extends State<ApplyLoan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<MemberData> allMembers = [];
  TextEditingController loanAmountController = new TextEditingController();
  String? selectedMember;
  var loading = false;
  void onChanged(String? value) {
    // print(value);
    setState(() {
      selectedMember = value;
    });
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    fetchMembersRound();
  }

  @override
  Widget build(BuildContext context) {
    final loanAmount = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: loanAmountController,
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
          labelText: "Loan Amount *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    final loanInterest = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: loanAmountController,
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
          labelText: "Loan Interest % *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    final fullName = Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(12, 10.0, 12.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 208, 208, 208)),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
              value: selectedMember, // Initially selected value (can be null)
              onChanged: onChanged, // Function to handle value changes

              items: allMembers.map((MemberData members) {
                return DropdownMenuItem<String>(
                  value: members.userId.toString(),
                  child: Text(
                    members.fullName,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                );
              }).toList(),
            )),
      ),
    );
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(children: [
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Text(
                      "Select a member",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              fullName,
              Row(
                children: [
                  Expanded(
                    child: loanAmount,
                  ),
                  const SizedBox(
                    width:
                        1.0, // Adjust this value as needed for the gap between the widgets
                  ),
                  Expanded(
                    child: loanInterest,
                  ),
                ],
              ),
            ])),
      )),
    );
  }

  Future<void> fetchMembersRound() async {
    try {
      setState(() {
        loading = true;
      });
      // var user = await SimplePreferences().getUser();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      final String groupId = accessToken[2];

      final response = await http.get(
        Uri.http('10.1.177.121:8111',
            '/api/v1/groups/$groupId/constributors/roundPayment'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      // final json = "[" + response.body + "]";
      var data = jsonDecode(response.body);

      List<MemberData> newMember = [];
      for (var member in data) {
        newMember.add(MemberData(
          round: member['round'],
          proxy: member['proxy'],
          userId: member['userId'],
          fullName: member['fullName'],
          gender: member['gender'],
        ));
      }

      // setState(() {
      //   male = data['genderStatics']['male'];
      //   female = data['genderStatics']['female'];
      // });
      allMembers.clear();
      allMembers.addAll(newMember);
      print(allMembers.length);
      print("hereee");

      // print(transactions[0]);

      setState(() {
        loading = false;
      });
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
