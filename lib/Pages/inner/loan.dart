import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/Pages/inner/applyLoan.dart';
import 'package:vsla/Pages/routes/home3.dart';
import 'package:vsla/utils/api_config.dart';
import 'package:vsla/utils/circleWidget.dart';
import 'package:http/http.dart' as http;
import 'package:vsla/utils/role.dart';

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
  final String? loanId;
  final String? amountToBePaid;
  final String? dueDate;

  LoanData({
    required this.amount,
    required this.requester,
    required this.updatedDate,
    required this.status,
    required this.gender,
    required this.dueDate,
    required this.amountToBePaid,
    required this.loanId,
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
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
                        colors: const [
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
                              const Icon(
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
                              const Icon(
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
                              const Icon(
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
                              const Icon(
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
                  if (GlobalStrings.getGlobalString() == "GROUP_ADMIN")
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: GestureDetector(
                            onTap: () {
                              fetchLoans();
                            },
                            child: const Icon(Icons.refresh)),
                      )
                    ],
                  ),
                  loading
                      ? const CircularProgressIndicator(
                          color: Colors.orange,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.27,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: _pageController,
                              itemCount: filteredLoans.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: GlobalStrings.getGlobalString() ==
                                          "GROUP_ADMIN"
                                      ? () {
                                          viewModal(filteredLoans[index]);
                                        }
                                      : null,
                                  child: Card(
                                    child: SizedBox(
                                      height: 60,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CircleAvatar(
                                                    radius: screenWidth * 0.05,
                                                    backgroundColor:
                                                        Colors.white,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        filteredLoans[index]
                                                            .requester
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.roboto(
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
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color: Colors
                                                                    .grey[400],
                                                                fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
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
        Uri.https(baseUrl, '/api/v1/Loan/LoanPage'),
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
          dueDate: loan['dueDate'],
          loanId: loan['loanId'],
          amountToBePaid: loan['amountToBePaid'],
          requester: loan['requester'],
          gender: loan['gender'],
          amount: loan['amount'],
          updatedDate: loan['updatedDate'],
          status: loan['status'],
        ));
      }

      setState(() {
        total = data['totalValue'];
        pending.clear();
        pending.add(data['pendingPercent']);
        pending.add(data['pendingValue']);
        active.clear();
        active.add(data['activePercent']);
        active.add(data['activeValue']);
        repaid.clear();
        repaid.add(data['repaidPercent']);
        repaid.add(data['repaidValue']);
        lost.clear();
        lost.add(data['lostPercent']);
        lost.add(data['lostValue']);
      });
      allLoans.clear();
      allLoans.addAll(newTransaction);
      filteredLoans.clear();
      filteredLoans.addAll(allLoans);
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

  void viewModal(LoanData loanDetail) {
    showDialog(
      context: context, // Pass the BuildContext to showDialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'View Loan Details',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ), // Set your dialog title
          // content: Text(allMember.fullName), // Set your dialog content
          actions: <Widget>[
            Row(
              children: [
                Text(
                  "Requester:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  loanDetail.requester.toString(),
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Amount:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  "${loanDetail.amount.toString()} ETB",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Status:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  loanDetail.status.toString(),
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Repayment Amount:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  "${loanDetail.amountToBePaid} ETB",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Due Date:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(parseDate(loanDetail.dueDate.toString()),
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w800)),
              ],
            ),
            Row(
              children: [
                Text(
                  "As of:  ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                Text(
                  parseDate(loanDetail.updatedDate),
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {},
                  child: Text('Done',
                      style: GoogleFonts.poppins(color: Colors.orange)),
                ),
                loanDetail.status == "pending"
                    ? TextButton(
                        onPressed: () async {
                          bool approveLoan = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Payment'),
                                content: Text(
                                    "Are you sure you want to approve ${loanDetail.requester}'s loan?"),
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
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (approveLoan) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              var response = await http.put(
                                Uri.https(baseUrl,
                                    "/api/v1/Loan/edit/${loanDetail.loanId}"),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                              );
                              if (response.statusCode == 200) {
                                setState(() {
                                  loading = false;
                                });
                                const message = 'Loan approved Successfuly!';
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  Fluttertoast.showToast(
                                      msg: message, fontSize: 18);
                                });
                                Navigator.of(context).pop();
                              } else {
                                final responseBody = json.decode(response.body);
                                final description = responseBody?['message'];
                                var message = description ??
                                    "Loan approval failed; please try again";
                                Fluttertoast.showToast(
                                    msg: message, fontSize: 18);
                                setState(() {
                                  loading = false;
                                });
                              }
                            } catch (e) {
                              var message =
                                  'Please check your network connection';
                              Fluttertoast.showToast(
                                  msg: message, fontSize: 18);
                            } finally {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Approve',
                          style: GoogleFonts.poppins(color: Colors.green),
                        ),
                      )
                    : loanDetail.status!.toLowerCase() == "active"
                        ? TextButton(
                            onPressed: () async {
                              bool approveRepayment = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirm Payment'),
                                    content: Text(
                                        "Are you sure you want to repay ${loanDetail.requester}'s loan?"),
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
                                          Navigator.of(context).pop(
                                              true); // User confirms deletion
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (approveRepayment) {
                                setState(() {
                                  loading = true;
                                });
                                try {
                                  var response = await http.put(
                                    Uri.https(baseUrl,
                                        "/api/v1/Loan/edit/repay/${loanDetail.loanId}"),
                                    headers: <String, String>{
                                      'Content-Type':
                                          'application/json; charset=UTF-8',
                                    },
                                  );
                                  if (response.statusCode == 200) {
                                    setState(() {
                                      loading = false;
                                    });
                                    const message = 'Loan repaid Successfuly!';
                                    Future.delayed(
                                        const Duration(milliseconds: 100), () {
                                      Fluttertoast.showToast(
                                          msg: message, fontSize: 18);
                                    });
                                    Navigator.of(context).pop();
                                  } else {
                                    final responseBody =
                                        json.decode(response.body);
                                    final description =
                                        responseBody?['message'];
                                    var message = description ??
                                        "Loan repayment failed; please try again";
                                    Fluttertoast.showToast(
                                        msg: message, fontSize: 18);
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                } catch (e) {
                                  var message =
                                      'Please check your network connection';
                                  Fluttertoast.showToast(
                                      msg: message, fontSize: 18);
                                } finally {
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              'Repay',
                              style: GoogleFonts.poppins(color: Colors.green),
                            ),
                          )
                        : Container(),
              ],
            ),
          ],
        );
      },
    );
  }

  parseDate(dateToBeCahnged) {
    try {
      String formattedDate = DateFormat('MMM d-yyyy').format(
        DateTime.parse(dateToBeCahnged),
      );
      return formattedDate;
    } catch (e) {
      // Handle the exception (e.g., log the error, set a default date)
      print('Error parsing date: $e');
      String formattedDate =
          '-'; // Set a default value or handle the error in another way
      return formattedDate;
    }
  }
}
