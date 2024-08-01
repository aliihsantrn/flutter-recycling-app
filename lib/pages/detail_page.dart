import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;

  const DetailPage({Key? key, required this.title, required this.content,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Text(
                content,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}