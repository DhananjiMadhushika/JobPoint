import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobpoint/src/common_widgets/first_screen/navigate1.dart';
import 'package:jobpoint/src/utils/custom_navigator.dart';

class FirstWindow extends StatefulWidget {
  const FirstWindow({super.key});

  @override
  State<FirstWindow> createState() => _FirstWindowState();
}

class _FirstWindowState extends State<FirstWindow> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      CustomNavigator.pushReplacement(context, Nevg1());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/logo/app_logo.png",
                    width: size.width,
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CupertinoActivityIndicator(
                      color: Colors.black,
                    ),
                    Text("From JobPoint")
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
