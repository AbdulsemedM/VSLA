// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/login.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void valuechanged(value) {}
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
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
                    child: const Icon(Icons.arrow_back_ios_new_sharp)),
                Image(
                    height: MediaQuery.of(context).size.height * 0.05,
                    image: const AssetImage("assets/images/vsla.png"))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 6),
                child: Text(
                  "Social Funds",
                  style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.handHoldingHeart,
                      color: Colors.white,
                    )),
                  ),
                  const Text("Wedding")
                ],
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.graduationCap,
                      color: Colors.white,
                    )),
                  ),
                  const Text("Graduation")
                ],
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.kitMedical,
                      color: Colors.white,
                    )),
                  ),
                  const Text("Emergency")
                ],
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.lime[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Icon(
                      FontAwesomeIcons.faceSadTear,
                      color: Colors.white,
                    )),
                  ),
                  const Text("Mourning")
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange[50],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          "A problem shared\n is a problem halved",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 6),
                          child: Text(
                            "Let’s collaborate and make the \nimpossible possible.",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: screenWidth * 0.035,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "Add Your Contribution",
                              style: GoogleFonts.poppins(
                                  color: Colors.orange,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.orange,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  FontAwesomeIcons.handshakeAngle,
                  size: screenWidth * 0.18,
                  color: Colors.orange,
                )
              ],
            ),
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
                          contentPadding:
                              const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
                          labelText: "sort by",
                          // hintText: "Choose zone/subcity",
                          // labelStyle: GoogleFonts.poppins(
                          //     fontSize: 14, color: Color(0xFFF89520)),
                          // hintStyle: GoogleFonts.poppins(
                          //     fontSize: 14, color: Color(0xFFF89520)),
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
                            value: "1000",
                            child: Center(
                              child: Text('Recent',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "1200",
                            child: Center(
                              child: Text('Amount',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "1300",
                            child: Center(
                              child: Text('Done',
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: screenWidth * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.green[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Text(
                                                "Recieved",
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: screenWidth * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.green[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Text(
                                                "Recieved",
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: screenWidth * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.green[200],
                                          borderRadius:
                                              BorderRadius.circular(15)),
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                              child: Text(
                                                "Recieved",
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
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
}
