import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomsheetPage extends StatelessWidget {
  const BottomsheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customSizedBox(16),
          Container(
            width: 64,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromRGBO(121, 116, 126, 1)),
          ),
          customSizedBox(16),
          GestureDetector(
              onTap: () {
                sendToGoogleMaps();
              },
              child: bottomSheetText("Google Haritalar ile aç")),
          customSizedBox(8),
          Container(
            width: 250,
            height: 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const  Color.fromARGB(255, 184, 174, 194)),
          ),
          customSizedBox(8),
          GestureDetector(
            onTap: () {
              sendToAppleMaps();
            },
            child: bottomSheetText("Apple Haritalar ile aç"),
          ),
          customSizedBox(16)
        ],
      ),
    );
  }

  void sendToGoogleMaps() {

  }

  void sendToAppleMaps() {

  }

}

Text bottomSheetText(String text) {
  return Text(
    text,
    style: customTextStyle(FontWeight.normal, 16, Colors.black),
  );
}

customTextStyle(FontWeight weight, double size, Color color) {
  return GoogleFonts.nunito(fontWeight: weight, fontSize: size, color: color);
}

customSizedBox(double num) => SizedBox(height: num);
