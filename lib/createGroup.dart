import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsla/Pages/home1.dart';

class CreatGroup extends StatefulWidget {
  const CreatGroup({super.key});

  @override
  State<CreatGroup> createState() => _CreatGroupState();
}

class _CreatGroupState extends State<CreatGroup> {
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
          labelText: "Group Name *",
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
    TextEditingController groupSizeController = TextEditingController();
    int groupSize = 5; // Initial group size

    final groupSizeWidget = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: groupSizeController,
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
          //labelText: groupSize.toString(),
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_drop_up),
                onPressed: () {
                  // Increase group size
                  setState(() {
                    groupSize++;
                    groupSizeController.text = groupSize.toString();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  // Decrease group size, but not below 5
                  if (groupSize > 5) {
                    setState(() {
                      groupSize--;
                      groupSizeController.text = groupSize.toString();
                    });
                  }
                },
              ),
            ],
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
    TextEditingController entryFeeController = new TextEditingController();
    final entryFee = Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: entryFeeController,
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
          labelText: "Entry Fee",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
        ),
      ),
    );
    final firstMeetingDate = Padding(
      padding: const EdgeInsets.all(16.0),
      child: DateTimeFormField(
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
          labelText: "First Meeting Date *",
          labelStyle:
              GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520)),
          hintText: "Select First Meeting Date",
        ),
        mode: DateTimeFieldPickerMode.date,
        onDateSelected: (DateTime value) {
          // Handle the selected date
        },
      ),
    );
    final meetingInterval = Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Meeting Interval *",
          hintText: "Choose meeting interval",
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
              child: Text('Monthly',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('Weekly',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('By Weekly',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("Select meeting interval",
            style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFF89520))),
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
                  "Create Group",
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
          Row(
            children: [
              Expanded(
                child: groupSizeWidget,
              ),
              const SizedBox(
                width:
                    16.0, // Adjust this value as needed for the gap between the widgets
              ),
              Expanded(
                child: entryFee,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          firstMeetingDate,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          meetingInterval,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home1()));
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
          )
        ]),
      )),
    );
  }
}
