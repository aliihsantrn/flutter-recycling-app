import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/customAppbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}