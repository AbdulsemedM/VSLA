import 'package:flutter/material.dart';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vsla/Pages/routes/bank_links.dart';
import 'package:vsla/Pages/routes/home3.dart';
import 'package:vsla/Pages/routes/profile.dart';
import 'package:vsla/Pages/routes/settings.dart';
import 'package:vsla/Pages/routes/transactions.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  static const List<TabItem> items = [
    TabItem(
      icon: FontAwesomeIcons.house,
      // title: 'Home',
    ),
    TabItem(
      icon: FontAwesomeIcons.fileLines,
      // title: 'Shop',
    ),
    TabItem(
      icon: FontAwesomeIcons.link,
      // title: 'Wishlist',
    ),
    TabItem(
      icon: FontAwesomeIcons.gear,
      // title: 'Cart',
    ),
    TabItem(
      icon: FontAwesomeIcons.user,
      // title: 'profile',
    ),
  ];
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: visit == 0
              ? const Home3()
              : visit == 1
                  ? const Transactions()
                  : visit == 2
                      ? const Bank_links()
                      : visit == 3
                          ? const Settings()
                          : const Profile()),
      bottomNavigationBar: BottomBarInspiredFancy(
          iconSize: 20,
          indexSelected: visit,
          onTap: (int index) => setState(() {
                visit = index;
              }),
          items: items,
          backgroundColor: Colors.white,
          color: Colors.black,
          colorSelected: Colors.orange),
      // body: SingleChildScrollView(child: SafeArea(child: Container(child: ,)),),
    );
  }
}