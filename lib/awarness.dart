import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Awarness extends StatefulWidget {
  const Awarness({super.key});

  @override
  State<Awarness> createState() => _AwarnessState();
}

class _AwarnessState extends State<Awarness> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF89520), // Background color
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Adjust padding as needed
                  hintText: "Health, Tips & Tricks...",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ), // Text color
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(7), // Border radius for curvature
                  ),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.black), // Search icon
                ),
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
                    "Be aware of...",
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
            CarouselSlider(
                items: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF89520), // Background color
                          borderRadius: BorderRadius.circular(
                              20), // Border radius for the curved effect
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius as needed
                                  child: Image.asset(
                                    'assets/images/Locust.jpg',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 300,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'How to effectively control desert Locust swarms',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width:
                                  //       0.1, // Adjust this value as needed for the gap between the widgets
                                  // ),
                                  Expanded(
                                      child: Icon(
                                    Icons.play_circle_filled_rounded,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF89520), // Background color
                          borderRadius: BorderRadius.circular(
                              20), // Border radius for the curved effect
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      20), // Adjust the radius as needed
                                  child: Image.asset(
                                    'assets/images/covid-19.jpg',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 300,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'How to effectively control desert Locust swarms',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width:
                                  //       0.1, // Adjust this value as needed for the gap between the widgets
                                  // ),
                                  Expanded(
                                      child: Icon(
                                    Icons.play_circle_filled_rounded,
                                    color: Colors.black,
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
                options: CarouselOptions(
                  height: 305,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  padEnds: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "All Videos",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CarouselSlider(
                items: [
                  Column(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                child: Image.asset(
                                  'assets/images/livestock.jpg',
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: 150,
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                          child: Text(
                        "Coffee shope tips...",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Color(0xFFF89520)),
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                child: Image.asset(
                                  'assets/images/business.jpg',
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: 150,
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                          child: Text(
                        "Coffee shope tips...",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Color(0xFFF89520)),
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                child: Image.asset(
                                  'assets/images/coffee.jpg',
                                  fit: BoxFit.cover,
                                  height: 170,
                                  width: 150,
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                          child: Text(
                        "Coffee shope tips...",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Color(0xFFF89520)),
                      )),
                    ],
                  )
                ],
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.4,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  padEnds: true,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          ],
        ),
      )),
    );
  }
}
