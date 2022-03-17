import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const ExampleApp());
}

const primaryColor = Color(0xFFE0E0E0);

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: primaryColor,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-20, -20),
                  blurRadius: 60,
                  color: Colors.white,
                  inset: true,
                ),
                BoxShadow(
                  offset: Offset(20, 20),
                  blurRadius: 60,
                  color: Color(0xFFBEBEBE),
                  inset: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
