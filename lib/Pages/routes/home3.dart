import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/Pages/inner/transactions.dart';
import 'package:vsla/Pages/inner/members.dart';
import 'package:vsla/Pages/inner/awarness.dart';
import 'package:vsla/login.dart';
import 'package:http/http.dart' as http;

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class ContributionData {
  final double amount;
  final String contributor;
  final String date;

  ContributionData({
    required this.amount,
    required this.contributor,
    required this.date,
  });
}

class _Home3State extends State<Home3> {
  final PageController _pageController = PageController();
  var members = false;
  var awareness = false;
  var loan = false;
  var loading = true;
  @override
  void initState() {
    super.initState();
    fetchDashBoardData();
  }

  String groupName = "";
  double totalAmount = 0;
  List<int> mileStone = [];
  List<String> tipOfTheDay = [];
  List<ContributionData> allContribution = [];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return members == true
        ? const Members()
        : awareness == true
            ? const Awarness()
            : loan == true
                ? const Loan()
                : SingleChildScrollView(
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
                                    _onBackButtonPressed(context);
                                  },
                                  child: const Icon(
                                      Icons.arrow_back_ios_new_sharp)),
                              Image(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  image: const AssetImage(
                                      "assets/images/vsla.png"))
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  groupName,
                                  style: GoogleFonts.poppins(
                                      fontSize: screenWidth * 0.06,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Amount",
                                style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${totalAmount.toString()} ETB",
                                style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  children: [
                                    Container(
                                      height: screenWidth * 0.115,
                                      width: screenWidth * 0.115,
                                      decoration: BoxDecoration(
                                          color: loading
                                              ? Colors.grey[200]
                                              : mileStone[0] == 2
                                                  ? const Color.fromARGB(
                                                      255, 138, 46, 46)
                                                  : Colors.grey[200],
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromARGB(
                                                  255, 138, 46, 46)),
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.115)),
                                      child: Center(
                                          child: loading
                                              ? Container()
                                              : mileStone[0] == 2
                                                  ? const Icon(
                                                      Icons.done,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(Icons.adjust,
                                                      color: Color.fromARGB(
                                                          255, 138, 46, 46))),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      height: screenWidth * 0.115,
                                      width: screenWidth * 0.115,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromARGB(
                                                  255, 100, 98, 98)),
                                          color: loading
                                              ? Colors.grey[200]
                                              : mileStone[1] == 2
                                                  ? const Color.fromARGB(
                                                      255, 100, 98, 98)
                                                  : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.115)),
                                      child: Center(
                                        child: loading
                                            ? Container()
                                            : mileStone[1] == 2
                                                ? const Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(Icons.adjust,
                                                    color: Color.fromARGB(
                                                        255, 100, 98, 98)),
                                      ),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      height: screenWidth * 0.115,
                                      width: screenWidth * 0.115,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromARGB(
                                                  255, 164, 125, 8)),
                                          color: loading
                                              ? Colors.grey[200]
                                              : mileStone[2] == 2
                                                  ? const Color.fromARGB(
                                                      255, 164, 125, 8)
                                                  : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.115)),
                                      child: Center(
                                          child: loading
                                              ? Container()
                                              : mileStone[2] == 2
                                                  ? const Icon(
                                                      Icons.done,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(Icons.adjust,
                                                      color: Color.fromARGB(
                                                          255, 164, 125, 8))),
                                    ),
                                    Container(
                                      height: 3,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      height: screenWidth * 0.115,
                                      width: screenWidth * 0.115,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: const Color.fromARGB(
                                                  255, 8, 40, 250)),
                                          color: loading
                                              ? Colors.grey[200]
                                              : mileStone[3] == 2
                                                  ? const Color.fromARGB(
                                                      255, 8, 40, 250)
                                                  : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.115)),
                                      child: Center(
                                          child: loading
                                              ? Container()
                                              : mileStone[3] == 2
                                                  ? const Icon(
                                                      Icons.done,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(Icons.adjust,
                                                      color: Color.fromARGB(
                                                          255, 8, 40, 250))),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.,
                                  children: [
                                    Container(
                                      height: 0,
                                      width: screenWidth * 0.04,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.04,
                                      width: screenWidth * 0.115,
                                      child: Center(
                                        child: Text(
                                          "Bronze",
                                          style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.03),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.04,
                                      width: screenWidth * 0.115,
                                      child: Center(
                                        child: Text(
                                          "Silver",
                                          style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.03),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.04,
                                      width: screenWidth * 0.115,
                                      child: Center(
                                        child: Text(
                                          "Gold",
                                          style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.03),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenWidth * 0.115,
                                      width: screenWidth * 0.15,
                                      child: Center(
                                        child: Text(
                                          "Premium",
                                          style: GoogleFonts.poppins(
                                              fontSize: screenWidth * 0.03),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        members = true;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.userGroup,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Members",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      loan = true;
                                    });
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                    child: Column(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.rightLeft,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Transactions",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: GestureDetector(
                                    child: Column(
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.circleDollarToSlot,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Loans",
                                          style: GoogleFonts.poppins(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: screenWidth * 0.22,
                                // color: Colors.amber,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      awareness = true;
                                    });
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Awarness()));
                                  },
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Image(
                                          image: const AssetImage(
                                            "assets/images/Awareness.png",
                                          ),
                                          width: screenWidth * 0.19,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                      ),
                                      Text(
                                        "Awareness",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: screenWidth * 0.22,
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image(
                                        image: const AssetImage(
                                          "assets/images/Business.png",
                                        ),
                                        width: screenWidth * 0.19,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                    ),
                                    Text(
                                      "Business",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: screenWidth * 0.22,
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image(
                                        image: const AssetImage(
                                          "assets/images/Meeting.png",
                                        ),
                                        width: screenWidth * 0.19,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                    ),
                                    Text(
                                      "Meetings",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: screenWidth * 0.22,
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image(
                                        image: const AssetImage(
                                          "assets/images/More.png",
                                        ),
                                        width: screenWidth * 0.19,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                    ),
                                    Text(
                                      "More",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: screenWidth * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          "Tip of the day",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: screenWidth * 0.07,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ]),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 6),
                                          child: Text(
                                            loading ? "" : tipOfTheDay[0],
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.035,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 0),
                                          child: Text(
                                            loading
                                                ? ""
                                                : insertNewLines(
                                                    tipOfTheDay[1]),
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.03,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  FontAwesomeIcons.lightbulb,
                                  size: screenWidth * 0.25,
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Recent Contributions",
                              style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "See All",
                              style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller: _pageController,
                              itemCount: allContribution.length,
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
                                                const CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                      FontAwesomeIcons.rotate),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      loading
                                                          ? ""
                                                          : allContribution[
                                                                  index]
                                                              .contributor,
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      loading
                                                          ? ""
                                                          : DateFormat(
                                                                  'MMM d-yyyy')
                                                              .format(DateTime.parse(
                                                                  allContribution[
                                                                          index]
                                                                      .date)),
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
                                                    Text(loading
                                                        ? ""
                                                        : allContribution[index]
                                                            .amount
                                                            .toString()),
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
                        ),
                      ],
                    ),
                  );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Confirm Exit"),
            content: const Text("Do you want to Logout?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () async {
                    List<String> user = [];
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    prefs.setStringList("_keyUser", user);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  Future<void> fetchDashBoardData() async {
    try {
      // var user = await SimplePreferences().getUser();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];

      final response = await http.get(
        Uri.http('10.1.177.121:8111', '/api/v1/home-page'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(response.body);
      for (var recentContributions in data['recentContributions']) {
        allContribution.add(ContributionData(
          amount: recentContributions['amount'],
          contributor: recentContributions['contributor'],
          date: recentContributions['date'],
        ));
      }
      print("hereeeeee");
      print(allContribution.length);

      setState(() {
        totalAmount = data['totalAmount'];
        groupName = data['groupName'];
        // print(totalAmount);
        // print(groupName);
        mileStone.add(data['milestone']['bronze']);
        mileStone.add(data['milestone']['silver']);
        mileStone.add(data['milestone']['gold']);
        mileStone.add(data['milestone']['premium']);
        tipOfTheDay.add(data['tipOfTheDay']["title"]);
        tipOfTheDay.add(data['tipOfTheDay']["description"]);
        loading = false;
      });
      // print(mileStone);
    } catch (e) {
      var message = e.toString();
      'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }

  String insertNewLines(String input) {
    const int maxLength = 36;
    List<String> lines = [];
    for (int i = 0; i < input.length; i += maxLength) {
      lines.add(input.substring(
          i, i + maxLength > input.length ? input.length : i + maxLength));
    }
    return lines.join('\n');
  }
}
