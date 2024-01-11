import 'package:flutter/material.dart';

class InstallationCustomer extends StatefulWidget {
  const InstallationCustomer({super.key});

  @override
  State<InstallationCustomer> createState() => _InstallationCustomerState();
}

class _InstallationCustomerState extends State<InstallationCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Installation customer"),
      ),
    );
  }
}
