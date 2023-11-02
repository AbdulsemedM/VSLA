import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  @override
  Widget build(BuildContext context) {
    void valuechanged(_value) {}
    TextEditingController groupNameController = new TextEditingController();
    final groupName = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: groupNameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Full name *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    final region = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Region *",
          hintText: "Choose Region",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: [
          DropdownMenuItem<String>(
            value: "1000",
            child: Center(
              child: Text('Oromia',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('Amhara',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('Addis Ababa',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("Select Region",
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520))),
      ),
    );
    final zone = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Zone/ Subcity *",
          hintText: "Choose zone/subcity",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: [
          DropdownMenuItem<String>(
            value: "1000",
            child: Center(
              child: Text('Arsi',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('Adama',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('Jimma',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("Select zone",
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520))),
      ),
    );
    TextEditingController woredaController = new TextEditingController();
    final woreda = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: woredaController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Woreda *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController kebeleController = new TextEditingController();
    final kebele = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: kebeleController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Kebele *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController phoneNumberController = new TextEditingController();
    final phoneNumber = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: phoneNumberController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "Phone number *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    final proxy = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Proxy enabled *",
          hintText: "yes / no",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        items: [
          DropdownMenuItem<String>(
            value: "1000",
            child: Center(
              child: Text('Yes',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('No',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("yes / no",
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520))),
      ),
    );
    TextEditingController initialContributionController =
        new TextEditingController();
    final initialContribution = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: initialContributionController,
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
          labelText: "Initial contribution",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController usernameController = new TextEditingController();
    final username = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: usernameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "username *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController passwordController = new TextEditingController();
    final password = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "password *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController confirmPasswordController =
        new TextEditingController();
    final confirmpassword = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: confirmPasswordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFF89520)),
          ),
          labelText: "confirm password *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
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
                padding: EdgeInsets.fromLTRB(20, 8, 0, 8),
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
          groupName,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: region,
              ),
              const SizedBox(
                width:
                    1.0, // Adjust this value as needed for the gap between the widgets
              ),
              Expanded(
                child: zone,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                child: woreda,
              ),
              const SizedBox(
                width:
                    16.0, // Adjust this value as needed for the gap between the widgets
              ),
              Expanded(
                child: kebele,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          phoneNumber,
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
              Expanded(
                child: initialContribution,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          username,
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
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFFF89520), // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
            ),
            child: Text(
              "Save",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
            ), // Button text
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ]),
      )),
    );
  }
}
