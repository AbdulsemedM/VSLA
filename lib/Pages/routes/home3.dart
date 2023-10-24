import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Container(
                    height: screenWidth * 0.13,
                    width: screenWidth * 0.13,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(),
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.13)),
                  ),
                  Container(
                    height: 1,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: screenWidth * 0.13,
                    width: screenWidth * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.13)),
                  ),
                  Container(
                    height: screenWidth * 0.13,
                    width: screenWidth * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.13)),
                  ),
                  Container(
                    height: screenWidth * 0.13,
                    width: screenWidth * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.13)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
