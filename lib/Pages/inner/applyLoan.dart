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
  TextEditingController loanAmountController = new TextEditingController();
  TextEditingController loanDescController = new TextEditingController();
  TextEditingController loanInterestController = new TextEditingController();
  TextEditingController repaymentPlanController = new TextEditingController();
  late String selectedPlan;
  List<MemberData> allMembers = [];
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

  apply() async {
    // print(pnumber);
    if (selectedMember == null) {
      const message = 'please select a member';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (loanAmountController.text == "") {
      const message = 'please enter a loan amount';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (loanInterestController.text == "") {
      const message = 'please enter an interest amount';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (loanDescController.text == "") {
      const message = 'Please enter a description';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (selectedPlan.isEmpty) {
      const message = 'please select a plan';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else {
      setState(() {
        loading = true;
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      final body = {
        "amount": loanAmountController.text,
        "interest": double.parse(loanInterestController.text) / 100,
        "description": loanDescController.text,
      };
      print(body);
      try {
        var response = await http.post(
          Uri.http("10.1.177.121:8111", "api/v1/Loan/Add/$selectedMember"),
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body),
        );
        // print("here" + "${response.statusCode}");
        // print(response.body);
        if (response.statusCode == 200) {
          setState(() {
            loading = false;
            loanAmountController.clear();
            loanDescController.clear();
            loanInterestController.clear();
            // selectedMember = "";
            // selectedPlan = "";
          });
          const message = 'Loan applied successfully';
          Future.delayed(const Duration(milliseconds: 100), () {
            Fluttertoast.showToast(msg: message, fontSize: 18);
          });

          // ignore: use_build_context_synchronously

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Otp()));
          setState(() {
            loading = false;
          });
        } else if (response.statusCode != 201) {
          final responseBody = json.decode(response.body);
          final description =
              responseBody?['message']; // Extract 'description' field
          if (description == "Phone number is already taken") {
            Fluttertoast.showToast(
                msg: "This phone number is already registered", fontSize: 18);
          } else {
            var message =
                description ?? "Account creation failed please try again";
            Fluttertoast.showToast(msg: message, fontSize: 18);
          }
          setState(() {
            loading = false;
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
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
      ),
    );
    final loanDescription = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: loanDescController,
        maxLines: 3,
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
          labelText:
              " Please briefly describe the specific\n reason for this loan request *",
          labelStyle: GoogleFonts.poppins(
            // height: 14,
            fontSize: 14,
          ),
        ),
      ),
    );
    final loanInterest = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: loanInterestController,
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
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
      ),
    );
    final repaymentPlan = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        validator: _validateField,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Repayment plan *",
          // hintText: "Choose zone/subcity",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
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
            value: "1000",
            child: Center(
              child: Text('2 Weeks',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('1 Month',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('3 Months',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1400",
            child: Center(
              child: Text('5 Months',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedPlan = value!;
          });
        },
        //   hint: Text("Select zone",
        //       style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520))),
      ),
    );
    final fullName = Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: DropdownButtonFormField<String>(
              hint: Text(
                "Select a Member",
                style: GoogleFonts.poppins(),
              ),
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
              loanDescription,
              Row(
                children: [
                  Expanded(
                    child: repaymentPlan,
                  ),
                  const SizedBox(
                    width:
                        1.0, // Adjust this value as needed for the gap between the widgets
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.068,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        apply();
                      },
                      child: Text(
                        "Apply",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ))),
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
