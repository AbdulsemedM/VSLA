import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/Pages/inner/applyLoan.dart';
import 'package:vsla/Pages/routes/home3.dart';
import 'package:vsla/utils/circleWidget.dart';
import 'package:http/http.dart' as http;

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class LoanData {
  final String amount;
  final String updatedDate;
  final String? status;
  final String? requester;
  final String? gender;

  LoanData({
    required this.amount,
    required this.requester,
    required this.updatedDate,
    required this.status,
    required this.gender,
  });
}

class _LoanState extends State<Loan> {
  var loading = false;
  var total;
  var pending = [];
  var active = [];
  var lost = [];
  var repaid = [];
  List<LoanData> allLoans = [];
  List<LoanData> filteredLoans = [];
  final PageController _pageController = PageController();
  var loan = true;
  void valuechanged(value) {
    setState(() {
      value == "all"
          ? filteredLoans = allLoans
          : value == "active"
              ? filteredLoans =
                  allLoans.where((loans) => loans.status == "active").toList()
              : value == "pending"
                  ? filteredLoans = allLoans
                      .where((loans) => loans.status == "pending")
                      .toList()
                  : value == "repaid"
                      ? filteredLoans = allLoans
                          .where((loans) => loans.status == "repaid")
                          .toList()
                      : value == "lost"
                          ? filteredLoans = allLoans
                              .where((loans) => loans.status == "lost")
                              .toList()
                          : filteredLoans = allLoans;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLoans();
    ();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return loan == false
        ? const Home3()
        : WillPopScope(
            onWillPop: () async {
              if (loan) {
                // Set the new state outside onWillPop
                setState(() {
                  loan = false;
                });
                // Allow back navigation
                return false;
              } else {
                // Set the new state outside onWillPop
                loan = true;
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
                                loan = false;
                              });
                            },
                            child: const Icon(Icons.arrow_back_ios_new_sharp)),
                        Image(
                            height: MediaQuery.of(context).size.height * 0.05,
                            image: const AssetImage("assets/images/vsla.png"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 8),
                        child: Text(
                          "Loans",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentageWidget(
                        percentages: [
                          loading ? 0 : double.parse(pending[0]),
                          loading ? 0 : double.parse(active[0]),
                          loading ? 0 : double.parse(repaid[0]),
                          loading ? 0 : double.parse(lost[0])
                        ], // Change these to your desired percentages
                        colors: [
                          Colors.green,
                          Colors.purple,
                          Colors.orange,
                          Colors.blue
                        ], // Change the colors as needed
                        text:
                            '${loading ? 0 : total}\n   ETB', // Change this to your desired text
                      ),
                      Column(
                        children: [
                          Text(
                            "Pending ${loading ? 0 : pending[0]}%",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.rectangle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "${loading ? 0 : pending[1]} ETB",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Active ${loading ? 0 : active[0]}%",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.rectangle,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "${loading ? 0 : active[1]} ETB",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Repaid ${loading ? 0 : repaid[0]}%",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.rectangle,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "${loading ? 0 : repaid[1]} ETB",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "Lost ${loading ? 0 : lost[0]}%",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.rectangle,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "${loading ? 0 : lost[1]} ETB",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.068,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ApplyLoan()),
                            );
                          },
                          child: Text(
                            "Apply for Loan",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ))),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: screenWidth * 0.32,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  12.0, 10.0, 12.0, 10.0),
                              labelText: "Filter by",
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
                                  child: Text('All',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black)),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "active",
                                child: Center(
                                  child: Text('Active',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black)),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "pending",
                                child: Center(
                                  child: Text('Pending',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black)),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: "repaid",
                                child: Center(
                                  child: Text('Repaid',
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
                            onChanged: (value) => valuechanged(value),
                            // hint: Text("Select zone",
                            //     style: GoogleFonts.poppins(
                            //         fontSize: 14, color: Color(0xFFF89520))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  loading
                      ? const CircularProgressIndicator(
                          color: Colors.orange,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.36,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: _pageController,
                              itemCount: filteredLoans.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: SizedBox(
                                    height: 60,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CircleAvatar(
                                                  radius: screenWidth * 0.05,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: filteredLoans[
                                                                  index]
                                                              .gender!
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
                                                    Text(
                                                      filteredLoans[index]
                                                          .requester
                                                          .toString(),
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat('MMM d-yyyy')
                                                          .format(DateTime.parse(
                                                              filteredLoans[
                                                                      index]
                                                                  .updatedDate)),
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.grey[400],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(filteredLoans[index]
                                                        .amount),
                                                    Text(
                                                      " ETB",
                                                      style: GoogleFonts.roboto(
                                                          color:
                                                              Colors.grey[400],
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ]),
                                  ),
                                );
                              }),
                        )
                ],
              ),
            ),
          );
  }

  Future<void> fetchLoans() async {
    setState(() {
      loading = true;
    });
    try {
      // var user = await SimplePreferences().getUser();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      // final String groupId = accessToken[2];

      final response = await http.get(
        Uri.http('10.1.177.121:8111', '/api/v1/Loan/LoanPage'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);

      // print(data);
      List<LoanData> newTransaction = [];
      for (var loan in data['loanListDtos']) {
        newTransaction.add(LoanData(
          requester: loan['requester'],
          gender: loan['gender'],
          amount: loan['amount'],
          updatedDate: loan['updatedDate'],
          status: loan['status'],
        ));
      }

      setState(() {
        total = data['totalValue'];
        pending.add(data['pendingPercent']);
        pending.add(data['pendingValue']);
        active.add(data['activePercent']);
        active.add(data['activeValue']);
        repaid.add(data['repaidPercent']);
        repaid.add(data['repaidValue']);
        lost.add(data['lostPercent']);
        lost.add(data['lostValue']);
      });
      allLoans.addAll(newTransaction);
      filteredLoans = allLoans;
      print(allLoans.length);

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
}
