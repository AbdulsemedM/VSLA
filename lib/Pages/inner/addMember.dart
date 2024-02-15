// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/utils/api_config.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  TextEditingController fullNameController = TextEditingController();
  // TextEditingController woredaController = TextEditingController();
  // TextEditingController kebeleController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController initialContributionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String? selectedRegion;
  // String? selectedZone;
  String? selectedGender;
  bool? selectedProxy;
  var loading = false;
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      final String fullName = fullNameController.text;
      // final Double initialContribution =
      // initialContributionController.text as Double;
      // final String woreda = woredaController.text;
      final String phonNumber = phoneNumberController.text;
      // final String kebele = kebeleController.text;
      final String passWord = passwordController.text;
      final Map<String, dynamic> requestBody = {
        "fullName": fullName,
        "password": passWord,
        "phoneNumber": phonNumber,
        "roleName": "USER",
        "proxyEnabled": selectedProxy,
        "gender": selectedGender,
        // "address": {
        //   "region": selectedRegion,
        //   "zone": selectedZone,
        //   "woreda": woreda,
        //   "kebele": kebele
        // }
      };

      const String apiUrl = 'https://$baseUrl/api/v1/groups/add-member';
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        fullNameController.clear();
        // woredaController.clear();
        // kebeleController.clear();
        phoneNumberController.clear();
        // initialContributionController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        // Reset dropdown selections and boolean value
        // selectedRegion = null;
        // selectedZone = null;
        selectedProxy = null;
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => const Home1()));
        print("saved");
        var message = 'Member added successfully!';
        Fluttertoast.showToast(msg: message, fontSize: 18);
        // Successful response, handle it as needed
        // You can navigate to a success screen or perform other actions.
        setState(() {
          loading = false;
        });
      } else {
        var message = 'Something went wrong please try again.';
        Fluttertoast.showToast(msg: message, fontSize: 18);
        setState(() {
          loading = false;
        });
        print(response.body);
        // Handle errors or failed requests
        // You can show an error message or perform error-specific actions.
      }
    }
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (passwordController.text != confirmPasswordController.text) {
      return 'Password unmatched';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void valuechanged(_value) {}
    final fullName = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: fullNameController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Full name *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
        ),
      ),
    );
    // final region = Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: DropdownButtonFormField<String>(
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
    //       labelText: "Region *",
    //       hintText: "Choose Region",
    //       labelStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //       hintStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedErrorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       filled: true,
    //       fillColor: Colors.transparent,
    //     ),
    //     items: [
    //       DropdownMenuItem<String>(
    //         value: "1000",
    //         child: Center(
    //           child: Text('Oromia',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //       DropdownMenuItem<String>(
    //         value: "1200",
    //         child: Center(
    //           child: Text('Amhara',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //       DropdownMenuItem<String>(
    //         value: "1300",
    //         child: Center(
    //           child: Text('Addis Ababa',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //     ],
    //     onChanged: (value) {
    //       setState(() {
    //         selectedRegion = value;
    //       });
    //     },
    //     hint: Text("Select Region",
    //         style: GoogleFonts.poppins(
    //             fontSize: 14, color: const Color(0xFFF89520))),
    //   ),
    // );
    // final zone = Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: DropdownButtonFormField<String>(
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
    //       labelText: "Zone/ Subcity *",
    //       hintText: "Choose zone/subcity",
    //       labelStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //       hintStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedErrorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       filled: true,
    //       fillColor: Colors.transparent,
    //     ),
    //     items: [
    //       DropdownMenuItem<String>(
    //         value: "1000",
    //         child: Center(
    //           child: Text('Arsi',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //       DropdownMenuItem<String>(
    //         value: "1200",
    //         child: Center(
    //           child: Text('Adama',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //       DropdownMenuItem<String>(
    //         value: "1300",
    //         child: Center(
    //           child: Text('Jimma',
    //               style:
    //                   GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
    //         ),
    //       ),
    //     ],
    //     onChanged: (value) {
    //       setState(() {
    //         selectedZone = value;
    //       });
    //     },
    //     hint: Text("Select zone",
    //         style: GoogleFonts.poppins(
    //             fontSize: 14, color: const Color(0xFFF89520))),
    //   ),
    // );
    final gender = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Gender *",
          hintText: "Choose gender",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: [
          DropdownMenuItem<String>(
            value: "MALE",
            child: Center(
              child: Text('Male',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "FEMALE",
            child: Center(
              child: Text('Female',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        },
        hint: Text("Select Gender",
            style: GoogleFonts.poppins(
                fontSize: 14, color: const Color(0xFFF89520))),
      ),
    );

    // final woreda = Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: TextFormField(
    //     validator: _validateField,
    //     controller: woredaController,
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       labelText: "Woreda *",
    //       labelStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //     ),
    //   ),
    // );

    // final kebele = Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: TextFormField(
    //     validator: _validateField,
    //     controller: kebeleController,
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       labelText: "Kebele *",
    //       labelStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //     ),
    //   ),
    // );

    final phoneNumber = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: _validateField,
        controller: phoneNumberController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Phone number / Username *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
        ),
      ),
    );
    final proxy = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Proxy enabled *",
          hintText: "yes / no",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: [
          DropdownMenuItem<String>(
            value: 'true',
            child: Center(
              child: Text('Yes',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "false",
            child: Center(
              child: Text('No',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedProxy = value as bool?;
          });
        },
        hint: Text("yes / no",
            style: GoogleFonts.poppins(
                fontSize: 14, color: const Color(0xFFF89520))),
      ),
    );

    // final initialContribution = Padding(
    //   padding: const EdgeInsets.all(16),
    //   child: TextFormField(
    //     validator: _validateField,
    //     controller: initialContributionController,
    //     decoration: InputDecoration(
    //       contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10.0),
    //         borderSide: const BorderSide(color: Color(0xFFF89520)),
    //       ),
    //       labelText: "Initial contribution",
    //       labelStyle:
    //           GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
    //     ),
    //   ),
    // );

    final password = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required.';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters long.';
          }
          return null;
        },
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Password *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
        ),
      ),
    );

    final confirmpassword = Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
        validator: _validateConfirmPassword,
        controller: confirmPasswordController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "confirm password *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: const Color(0xFFF89520)),
        ),
      ),
    );
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: const Icon(Icons.arrow_back_ios_new_sharp)),
                    Image(
                        height: MediaQuery.of(context).size.height * 0.05,
                        image: const AssetImage("assets/images/vsla.png"))
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                    child: Text(
                      "Add Member",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              fullName,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              gender,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: region,
              //     ),
              //     const SizedBox(
              //       width:
              //           1.0, // Adjust this value as needed for the gap between the widgets
              //     ),
              //     Expanded(
              //       child: zone,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: woreda,
              //     ),
              //     const SizedBox(
              //       width:
              //           16.0, // Adjust this value as needed for the gap between the widgets
              //     ),
              //     Expanded(
              //       child: kebele,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: proxy,
                  ),
                  const SizedBox(
                    width:
                        1.0, // Adjust this value as needed for the gap between the widgets
                  ),
                  // Expanded(
                  //   child: initialContribution,
                  // ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              phoneNumber,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              password,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              confirmpassword,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        // Handle form submission
                        _submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFFF89520), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white),
                      ), // Button text
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ]),
          ),
        )),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    // Attempt to pop the current route
    Navigator.pop(context, true);

    // Return true if the route was popped, or false otherwise
    return true;
  }
}
