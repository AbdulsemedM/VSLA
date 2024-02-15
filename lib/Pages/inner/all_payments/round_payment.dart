import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vsla/utils/api_config.dart';
import 'package:http/http.dart' as http;

class RoundPayments extends StatefulWidget {
  const RoundPayments({super.key});

  @override
  State<RoundPayments> createState() => _RoundPaymentsState();
}

class _RoundPaymentsState extends State<RoundPayments> {
  @override
  void initState() {
    super.initState();
    fetchLoanableFund();
  }

  double loanableFund = 0;
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text('$loanableFund'),
    );
  }

  Future<void> fetchLoanableFund() async {
    try {
      // var user = await SimplePreferences().getUser();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var accessToken = prefs.getStringList("_keyUser");
      final String authToken = accessToken![0];
      final response = await http.get(
        Uri.https(baseUrl, '/api/v1/groups/getShareAmount'),
        headers: <String, String>{
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // transactions = parseTransactions(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        loanableFund = double.parse(data['shareAmount']);
      });

      print(data);

      print("meetingTypes");
    } catch (e) {
      print(e.toString());
      var message =
          'Something went wrong. Please check your internet connection.';
      Fluttertoast.showToast(msg: message, fontSize: 18);
    }
  }
}
