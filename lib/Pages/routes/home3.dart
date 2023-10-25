import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
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
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                  Image(
                      height: MediaQuery.of(context).size.height * 0.05,
                      image: AssetImage("assets/images/vsla.png"))
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Group A",
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
                    "45,000ETB",
                    style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Container(
                        height: screenWidth * 0.115,
                        width: screenWidth * 0.115,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 138, 46, 46),
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 138, 46, 46)),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.115)),
                        child: Center(
                            child: Icon(
                          Icons.done,
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: screenWidth * 0.115,
                        width: screenWidth * 0.115,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 100, 98, 98)),
                            color: Color.fromARGB(255, 100, 98, 98),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.115)),
                        child: Center(
                          child: Icon(Icons.done, color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: screenWidth * 0.115,
                        width: screenWidth * 0.115,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 164, 125, 8)),
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.115)),
                        child: Center(
                          child: Icon(
                            Icons.adjust,
                            color: const Color.fromARGB(255, 164, 125, 8),
                          ),
                        ),
                      ),
                      Container(
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: screenWidth * 0.115,
                        width: screenWidth * 0.115,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 8, 40, 250)),
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.115)),
                        child: Center(
                          child: Icon(Icons.adjust,
                              color: Color.fromARGB(255, 8, 40, 250)),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Container(
                        height: 0,
                        width: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Container(
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
                ),
              ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.userGroup,
                          color: Colors.white,
                        ),
                        Text(
                          "Members",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.rightLeft,
                          color: Colors.white,
                        ),
                        Text(
                          "Transactions",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.circleDollarToSlot,
                          color: Colors.white,
                        ),
                        Text(
                          "Loans",
                          style: GoogleFonts.poppins(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: screenWidth * 0.22,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            "assets/images/Awareness.png",
                          ),
                          width: screenWidth * 0.19,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                      Text(
                        "Awareness",
                        style: GoogleFonts.poppins(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: screenWidth * 0.22,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            "assets/images/Business.png",
                          ),
                          width: screenWidth * 0.19,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                      Text(
                        "Business",
                        style: GoogleFonts.poppins(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: screenWidth * 0.22,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            "assets/images/Meeting.png",
                          ),
                          width: screenWidth * 0.19,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                      Text(
                        "Meetings",
                        style: GoogleFonts.poppins(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: screenWidth * 0.22,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage(
                            "assets/images/More.png",
                          ),
                          width: screenWidth * 0.19,
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ),
                      Text(
                        "More",
                        style: GoogleFonts.poppins(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
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
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 6),
                            child: Text(
                              "A penny saved is a penny earned",
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
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Practice thrift and save wisely. Every \npenny you save is like earning an \nextra penny, adding to your \nfinancial well-being.",
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
            Card(
              child: Container(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.rotate),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Abdu M.",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Oct 10,2023",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("240.00"),
                                Text(
                                  " Etb",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400], fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Card(
              child: Container(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.rotate),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Abdu M.",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Oct 10,2023",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("240.00"),
                                Text(
                                  " Etb",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400], fontSize: 10),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Card(
              child: Container(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(FontAwesomeIcons.rotate),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Abdu M.",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "Oct 10,2023",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("240.00"),
                                Text(
                                  " Etb",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[400], fontSize: 10),
                                )
                              ],
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
