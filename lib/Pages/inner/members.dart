import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsla/Pages/routes/home3.dart';
import 'package:vsla/addMember.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  var members = true;
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
                          "6",
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
                                  "Male: 2",
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
                                  "Female: 4",
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
                                          Text(
                                            "Abdulsemed Mussema",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
                                        "assets/images/mProfilePic.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Elshaday Tamire",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
                                          Text(
                                            "Mahlet Demake",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
                                        "assets/images/mProfilePic.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Temam Hashim",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
                                          Text(
                                            "Whitney Houston",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
                                        "assets/images/mProfilePic.png"),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Abdi Tiruneh",
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
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              "Loan balance",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.red[400]),
                                            ),
                                          ),
                                          Text(
                                            "175",
                                            style: GoogleFonts.roboto(
                                                color: Colors.red[400]),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              " Paid",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.blue[400]),
                                            ),
                                          ),
                                          Text(
                                            "50",
                                            style: GoogleFonts.roboto(
                                                color: Colors.blue[400]),
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
                                        child: Text("Total Owing",
                                            style: GoogleFonts.poppins(
                                                color: Colors.orange[900])),
                                      ),
                                      Text(
                                        " 270 Etb",
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
                                      FontAwesomeIcons.plus,
                                      size: screenWidth * 0.04,
                                    ),
                                  )
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
