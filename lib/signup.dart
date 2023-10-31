import 'dart:convert';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsla/otp.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class CompanyData {
  final int companyId;
  final String companyName;

  CompanyData({
    required this.companyId,
    required this.companyName,
  });
}

class _SignupState extends State<Signup> {
  // FocusNode phoneFocus = FocusNode();
  late SingleValueDropDownController _cnt;
  List<CompanyData> company = [];
  String? selectedCompany;

// Function to handle dropdown value changes
  void onChanged(String? value) {
    print(value);
    setState(() {
      selectedCompany = value;
    });
  }

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    super.initState();
    fetchCompany();
  }

  @override
  void dispose() {
    _cnt.dispose();
    super.dispose();
  }

  TextEditingController fname = TextEditingController();
  TextEditingController pnumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool _passwordVisible1 = false;
  bool _passwordVisible = false;
  bool loading = false;
  signup() async {
    // print(pnumber);
    if (fname.text.isEmpty) {
      const message = 'Full name is mandatory';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (pnumber.text.length != 10 || pnumber.text == "") {
      const message = 'Invalid phone number format';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else if (password.text != cpassword.text || password.text.length < 6) {
      const message = 'Invalid password';
      Future.delayed(const Duration(milliseconds: 100), () {
        Fluttertoast.showToast(msg: message, fontSize: 18);
      });
    } else {
      setState(() {
        loading = true;
      });
      final body = {
        "phoneNumber": pnumber.text,
        "password": password.text,
        "fullName": fname.text,
        "roleName": "GROUP_ADMIN",
        "companyId": selectedCompany
      };
      print(body);
      try {
        var response = await http.post(
          Uri.http("10.1.177.121:8111", "api/v1/users"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body),
        );
        print("here" + "${response.statusCode}");
        print(response.body);
        if (response.statusCode == 201) {
          setState(() {
            loading = false;
          });
          const message = 'Account Created Successfuly!';
          Future.delayed(const Duration(milliseconds: 100), () {
            Fluttertoast.showToast(msg: message, fontSize: 18);
          });

          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Otp()));
          setState(() {
            loading = false;
          });
        } else if (response.statusCode != 201) {
          final responseBody = json.decode(response.body);
          final description =
              responseBody['message']; // Extract 'description' field
          if (description == "user already exists") {
            Fluttertoast.showToast(
                msg: "This phone number is already registered", fontSize: 18);
          } else {
            const message = 'Account Creation Faild! Try again';
            Fluttertoast.showToast(msg: message, fontSize: 18);
          }
          setState(() {
            loading = false;
          });
        }
      } catch (e) {
        const message = 'Please check your network connection';
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
                        controller: fname,
                        // focusNode: phoneFocus,
                        // onTapOutside: (event) {
                        //   phoneFocus.unfocus();
                        // },
                        keyboardType: TextInputType.text,
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
                        controller: pnumber,
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
                        // onChanged: (value) {
                        //   // Handle the phone number input here
                        //   print('Phone Number: $value');
                        // },
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
                          controller: password,
                          obscuringCharacter: "*",
                          // focusNode: pinFocus,
                          // onTapOutside: (event) {
                          //   pinFocus.unfocus();
                          // },
                          obscureText: !_passwordVisible,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "******",
                            hintStyle:
                                GoogleFonts.poppins(color: Colors.grey[400]),
                            suffixIcon: IconButton(
                              // tooltip: "show password",
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          // onChanged: (value) {
                          //   // Handle the phone number input here
                          //   print('Phone Number: $value');
                          // },
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
                            controller: cpassword,
                            obscuringCharacter: "*",
                            // focusNode: pinFocus,
                            // onTapOutside: (event) {
                            //   pinFocus.unfocus();
                            // },
                            obscureText: !_passwordVisible1,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "******",
                              hintStyle:
                                  GoogleFonts.poppins(color: Colors.grey[400]),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible1 = !_passwordVisible1;
                                  });
                                },
                              ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select a Comapny",
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
                          padding: const EdgeInsets.only(left: 0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  12, 10.0, 12.0, 10.0),
                              // labelText: "select company",
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
                            value:
                                selectedCompany, // Initially selected value (can be null)
                            onChanged:
                                onChanged, // Function to handle value changes

                            items: company.map((CompanyData companies) {
                              return DropdownMenuItem<String>(
                                value: companies.companyId.toString(),
                                child: Text(
                                  companies.companyName,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.black,
                  activeColor: Colors.grey[200],
                  value: true, // Initial value of the checkbox
                  onChanged: (newValue) {
                    newValue = false;
                    // Handle checkbox state changes here
                  },
                ),
                Text(
                  'I understood the terms and policies.',
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
              ],
            ),
            loading
                ? const CircularProgressIndicator(
                    color: Colors.orange,
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: MediaQuery.of(context).size.height * 0.015,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        signup();
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
                            "SING UP",
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

  Future<void> fetchCompany() async {
    try {
      // var user = await SimplePreferences().getUser();

      final response = await http.get(
        Uri.http('10.1.177.121:8111', '/api/v1/companies'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);

      print(data);
      List<CompanyData> newCompany = [];

      for (var comapany in data) {
        // print(transaction.date);
        var companyData = CompanyData(
          companyId: comapany['companyId'],
          companyName: comapany['companyName'],
        );
        newCompany.add(companyData);
        print(company);
      }
      company.addAll(newCompany);
      print(company.length);

      // print(transactions[0]);

      // setState(() {
      //   loading = false;
      // }
      // );
    } catch (e) {
      var message = e.toString();
      'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }
}
