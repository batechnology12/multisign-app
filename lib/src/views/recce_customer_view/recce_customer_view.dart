import 'package:flutter/material.dart';

class RecceCustomer extends StatefulWidget {
  const RecceCustomer({super.key});

  @override
  State<RecceCustomer> createState() => _RecceCustomerState();
}

class _RecceCustomerState extends State<RecceCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("recce customer"),
      ),
    );
  }
}