import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsla/Pages/routes/home3.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  var loan = true;
  @override
  Widget build(BuildContext context) {
    void valuechanged(value) {}
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            // Larger rectangle (blue)
                            Container(
                                width: screenWidth * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width: screenWidth * 0.15,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.18)),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.dollarSign,
                                            color: Colors.green[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 16),
                                      child: Text(
                                        "Round Payement",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 10),
                                      child: Text(
                                        "6000 ETB",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: screenWidth * 0.2,
                              top: screenWidth * 0,
                              right: screenWidth * -0.03,
                              left: screenWidth * 0.2,
                              child: Container(
                                width: screenWidth * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            Positioned(
                              bottom: screenWidth * 0.14,
                              top: screenWidth * 0.1,
                              right: screenWidth * -0.06,
                              left: screenWidth * 0.29,
                              child: Container(
                                width: screenWidth * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            // Larger rectangle (blue)
                            Container(
                                width: screenWidth * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width: screenWidth * 0.15,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.18)),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.handHoldingDollar,
                                            color: Colors.red[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 16),
                                      child: Text(
                                        "Loan Despersal",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 10),
                                      child: Text(
                                        "20,500 ETB",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: screenWidth * 0.2,
                              top: screenWidth * 0,
                              right: screenWidth * -0.03,
                              left: screenWidth * 0.2,
                              child: Container(
                                width: screenWidth * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            Positioned(
                              bottom: screenWidth * 0.14,
                              top: screenWidth * 0.1,
                              right: screenWidth * -0.06,
                              left: screenWidth * 0.29,
                              child: Container(
                                width: screenWidth * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            // Larger rectangle (blue)
                            Container(
                                width: screenWidth * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.amber[700],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width: screenWidth * 0.15,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.18)),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.handHoldingHand,
                                            color: Colors.amber[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 16),
                                      child: Text(
                                        "Lona Repayement",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 10),
                                      child: Text(
                                        "17,500 ETB",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: screenWidth * 0.2,
                              top: screenWidth * 0,
                              right: screenWidth * -0.03,
                              left: screenWidth * 0.2,
                              child: Container(
                                width: screenWidth * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            Positioned(
                              bottom: screenWidth * 0.14,
                              top: screenWidth * 0.1,
                              right: screenWidth * -0.06,
                              left: screenWidth * 0.29,
                              child: Container(
                                width: screenWidth * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            // Larger rectangle (blue)
                            Container(
                                width: screenWidth * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width: screenWidth * 0.15,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                screenWidth * 0.18)),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.calculator,
                                            color: Colors.blue[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 16),
                                      child: Text(
                                        "Total",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 10),
                                      child: Text(
                                        "44,000 ETB",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              bottom: screenWidth * 0.2,
                              top: screenWidth * 0,
                              right: screenWidth * -0.03,
                              left: screenWidth * 0.2,
                              child: Container(
                                width: screenWidth * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                            Positioned(
                              bottom: screenWidth * 0.14,
                              top: screenWidth * 0.1,
                              right: screenWidth * -0.06,
                              left: screenWidth * 0.29,
                              child: Container(
                                width: screenWidth * 0.1,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          "All Contributions",
                          style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          // Text("View by", style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: screenWidth * 0.32,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      12.0, 10.0, 12.0, 10.0),
                                  labelText: "sort by",
                                  // hintText: "Choose zone/subcity",
                                  // labelStyle: GoogleFonts.poppins(
                                  //     fontSize: 14, color: Color(0xFFF89520)),
                                  // hintStyle: GoogleFonts.poppins(
                                  //     fontSize: 14, color: Color(0xFFF89520)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF89520)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF89520)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF89520)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "1000",
                                    child: Center(
                                      child: Text('Recent',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black)),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "1200",
                                    child: Center(
                                      child: Text('Amount',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black)),
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "1300",
                                    child: Center(
                                      child: Text('Done',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.black)),
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
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: screenWidth * 0.05,
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                        "assets/images/mProfilePic.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 00, 0, 8.0),
                                            child: Text(
                                              "Abdulsemed Mussema",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              width: screenWidth * 0.3,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      FontAwesomeIcons.userPlus,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        "Recieved",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                  Text(
                                    " 270 Etb",
                                    style: GoogleFonts.poppins(
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: screenWidth * 0.05,
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                        "assets/images/fProfilePic.jpg"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 00, 0, 8.0),
                                            child: Text(
                                              "Lina Jacob",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              width: screenWidth * 0.3,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      FontAwesomeIcons.userPlus,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        "Recieved",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                  Text(
                                    " 270 Etb",
                                    style: GoogleFonts.poppins(
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: screenWidth * 0.05,
                                    backgroundColor: Colors.white,
                                    backgroundImage: const AssetImage(
                                        "assets/images/fProfilePic.jpg"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 00, 0, 8.0),
                                            child: Text(
                                              "Mahlet Demeke",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              width: screenWidth * 0.3,
                                              decoration: BoxDecoration(
                                                  color: Colors.green[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      FontAwesomeIcons.userPlus,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 0),
                                                      child: Text(
                                                        "Recieved",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
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
                                  Text(
                                    " 270 Etb",
                                    style: GoogleFonts.poppins(
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
