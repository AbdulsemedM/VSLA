import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // FocusNode phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double fontSize = screenWidth * 0.07;
    return Scaffold(
      body: SafeArea(
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
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                  Image(
                      height: MediaQuery.of(context).size.height * 0.05,
                      image: AssetImage("assets/images/vsla.png"))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              "Create your account",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.07,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        // focusNode: phoneFocus,
                        // onTapOutside: (event) {
                        //   phoneFocus.unfocus();
                        // },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // prefixIcon: Icon(
                          //   Icons.phone_android,
                          // ),
                          hintText: "ex: John Doe",
                          hintStyle:
                              GoogleFonts.poppins(color: Colors.grey[400]),
                        ),
                        onChanged: (value) {
                          // Handle the phone number input here
                          print('Phone Number: $value');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        // focusNode: phoneFocus,
                        // onTapOutside: (event) {
                        //   phoneFocus.unfocus();
                        // },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // prefixIcon: Icon(
                          //   Icons.phone_android,
                          // ),
                          hintText: "ex: 0987654321",
                          hintStyle:
                              GoogleFonts.poppins(color: Colors.grey[400]),
                        ),
                        onChanged: (value) {
                          // Handle the phone number input here
                          print('Phone Number: $value');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pin",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          obscuringCharacter: "*",
                          // focusNode: pinFocus,
                          // onTapOutside: (event) {
                          //   pinFocus.unfocus();
                          // },
                          obscureText: true,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "******",
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.grey[400]),
                          ),
                          onChanged: (value) {
                            // Handle the phone number input here
                            print('Phone Number: $value');
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Pin",
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscuringCharacter: "*",
                            // focusNode: pinFocus,
                            // onTapOutside: (event) {
                            //   pinFocus.unfocus();
                            // },
                            obscureText: true,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "******",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.grey[400]),
                            ),
                            onChanged: (value) {
                              // Handle the phone number input here
                              print('Phone Number: $value');
                            },
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.orange,
                  value: false, // Initial value of the checkbox
                  onChanged: (newValue) {
                    // Handle checkbox state changes here
                  },
                ),
                Text(
                  'I understood the terms and policy.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: GestureDetector(
                onTap: () {
                  // login();
                },
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.orange, // You can use your color here
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "SING UP",
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white, // You can use your color here
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "or sign in with",
                style:
                    GoogleFonts.poppins(color: Colors.grey[500], fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Image(
                      image: AssetImage(
                    "assets/images/google.png",
                  )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Image(
                      fit: BoxFit.contain,
                      height: 60,
                      width: 50,
                      image: AssetImage(
                        "assets/images/facebook.png",
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Image(
                      image: AssetImage(
                    "assets/images/twitter.png",
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Have an account?",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.grey[700])),
                  TextSpan(
                      text: " SIGN IN",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.orange))
                ])),
              ),
            ),
          ],
        ),
      )),
    );
  }
}