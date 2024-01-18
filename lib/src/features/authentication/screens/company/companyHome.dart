import 'package:flutter/material.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CompanyHome> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: MaterialApp(
      home: Scaffold(
        body: Text("Home"),
      ),
    ));
  }
}
