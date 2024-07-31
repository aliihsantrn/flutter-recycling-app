import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/customAppbar.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Center(
        child: Text("Education Page"),
      ),
    );
  }
}