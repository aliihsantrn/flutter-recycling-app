import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class customAppbar extends StatelessWidget implements PreferredSizeWidget {
  customAppbar({
    super.key,
    this.backButtonVisibility = false,
  });

  bool backButtonVisibility;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      backgroundColor: const Color.fromARGB(255, 23, 89, 74),
      automaticallyImplyLeading: false,
      toolbarHeight: 136,
      actions: [],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.0)),
      ),
      title: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 80.0),
                child: Visibility(
                  visible: backButtonVisibility,
                  child: IconButton(
                     onPressed: () {
                      Navigator.pop(context); // Bir önceki sayfaya dönmek için
                     },
                     icon: SvgPicture.asset("assets/icons/back_arrow.svg")
                     ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  customSizedBox(80),
                  Text("Atık Yeri",
                      style:
                          customTextStyle(FontWeight.bold, 20, Colors.white)
                  ),
                  customSizedBox(8),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/logo.svg',
                    ),
                  )
                ],
              ),
            ),
        ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);

  customTextStyle(FontWeight weight, double size, Color color) {
  return GoogleFonts.nunito(
      fontWeight: weight, fontSize: size, color: Colors.white);
  }

  customSizedBox(double num) => SizedBox(height: num);

}