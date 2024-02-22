import 'package:flutter/material.dart';
import 'package:vsla/Pages/inner/all_payments/attendance.dart';
import 'package:vsla/Pages/inner/all_payments/disburse_social_fund.dart';
import 'package:vsla/Pages/inner/all_payments/penalty_payment.dart';
import 'package:vsla/Pages/inner/all_payments/round_payment.dart';
import 'package:vsla/Pages/inner/all_payments/social_funds.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 0; // Variable to store the selected index

  final List<Tab> _tabs = const [
    Tab(text: "Attendance"),
    Tab(text: "Round Payment"),
    Tab(text: "Social funds"),
    Tab(text: "Penalty payments"),
  ];
  final List<Widget> _pages = const [
    Attendance(),
    RoundPayments(),
    SocialFundsPayment(),
    PenaltyPayment(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController!.addListener(
        _handleTabSelection); // Add listener to handle tab selection
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController!.index; // Update selected index variable
    });
  }

  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            child: const Icon(Icons.arrow_back_ios_new_sharp),
                          ),
                          if (_selectedIndex == 2)
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DisburseSocialFunds()));
                                },
                                child: Text(
                                  "Pay-Social Fund",
                                  style: TextStyle(color: Colors.black),
                                )),
                          Image(
                            height: MediaQuery.of(context).size.height * 0.05,
                            image: const AssetImage("assets/images/vsla.png"),
                          ),
                        ],
                      ),
                    ),
                    TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.orange,
                      labelColor: Colors.orange,
                      controller: _tabController,
                      tabs: _tabs,
                    ),
                    SizedBox(
                      height: sHeight * 0.85,
                      child: TabBarView(
                        controller: _tabController,
                        children: _pages,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
