import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsla/createGroup.dart';
import 'package:vsla/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode pinFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "English",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    const Icon(Icons.arrow_drop_down, size: 30)
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image(image: AssetImage("assets/images/vsla.png")),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Sign in to your account",
                    style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w700),
                  ),
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
                      child: TextField(
                        focusNode: phoneFocus,
                        onTapOutside: (event) {
                          phoneFocus.unfocus();
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone_android,
                          ),
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                      child: TextField(
                        obscuringCharacter: "*",
                        focusNode: pinFocus,
                        onTapOutside: (event) {
                          pinFocus.unfocus();
                        },
                        obscureText: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // login();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreatGroup()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.01),
                          decoration: BoxDecoration(
                            color: Colors.orange, // You can use your color here
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.playfairDisplay(
                                color:
                                    Colors.white, // You can use your color here
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
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Image(
                        image: AssetImage(
                      "assets/images/google.png",
                    )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
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
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Don't have an account?",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.grey[700])),
                    TextSpan(
                        text: " SIGN UP ",
                        style: GoogleFonts.poppins(
                            fontSize: 15, color: Colors.orange))
                  ])),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
