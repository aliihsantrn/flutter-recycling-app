import 'package:flutter/material.dart';
import 'package:flutter_auth/pages/education_page.dart';
import 'package:flutter_auth/pages/home_page.dart';
import 'package:flutter_auth/pages/process_page.dart';
import 'package:flutter_auth/pages/profile_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final pageList = [HomePage(), EducationPage(), ProcessPage(), ProfilePage()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: "Eğitim"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: "Dönüştür"
          ),
        ],
        type: BottomNavigationBarType.fixed,
        iconSize: 32,
        selectedLabelStyle: const TextStyle(
          backgroundColor: Color.fromARGB(255, 211, 209, 78),
          
        ),
        selectedIconTheme: const IconThemeData(color: Colors.black),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}