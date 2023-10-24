import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(8.0),
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
          labelStyle: TextStyle(color: Color(0xFFF89520)),
        ),
      ),
    );
    final region = Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Region *",
          hintText: "Choose Region",
          labelStyle: TextStyle(color: Color(0xFFF89520)),
          hintStyle: TextStyle(color: Color(0xFFF89520)),
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
        items: const [
          DropdownMenuItem<String>(
            value: "1000",
            child: Center(
              child: Text('Oromia', style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('Amhara', style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('Addis Ababa',
                  style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("Select Region", style: TextStyle(color: Color(0xFFF89520))),
      ),
    );
    final zone = Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          labelText: "Zone/ Subcity *",
          hintText: "Choose zone/subcity",
          labelStyle: TextStyle(color: Color(0xFFF89520)),
          hintStyle: TextStyle(color: Color(0xFFF89520)),
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
        items: const [
          DropdownMenuItem<String>(
            value: "1000",
            child: Center(
              child: Text('Arsi', style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1200",
            child: Center(
              child: Text('Adama', style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
          DropdownMenuItem<String>(
            value: "1300",
            child: Center(
              child: Text('Jimma', style: TextStyle(color: Color(0xFFF89520))),
            ),
          ),
        ],
        onChanged: (_value) => valuechanged(_value),
        hint: Text("Select zone", style: TextStyle(color: Color(0xFFF89520))),
      ),
    );
    TextEditingController woredaController = new TextEditingController();
    final woreda = Padding(
      padding: const EdgeInsets.all(8.0),
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
          labelStyle: TextStyle(color: Color(0xFFF89520)),
        ),
      ),
    );
    TextEditingController kebeleController = new TextEditingController();
    final kebele = Padding(
      padding: const EdgeInsets.all(8.0),
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
          labelStyle: TextStyle(color: Color(0xFFF89520)),
        ),
      ),
    );
    final groupSizeController = TextEditingController();
    int groupSize = 5; // Initial group size

    final groupSizeWidget = Padding(
      padding: const EdgeInsets.all(8.0),
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
          labelText: "Group Size *",
          labelStyle: TextStyle(color: Color(0xFFF89520)),
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
      padding: const EdgeInsets.all(8.0),
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
          labelStyle: const TextStyle(color: Color(0xFFF89520)),
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
                    16.0, // Adjust this value as needed for the gap between the widgets
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
          )
        ]),
      )),
    );
  }
}
